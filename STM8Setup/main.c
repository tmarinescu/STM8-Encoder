//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

#include "main.h"
#include "HAL_GPIO.h"
#include "HAL_TIM4.h"
#include "HAL_CLK.h"
#include "interrupts.h"
#include "dev.h"
#include "HAL_UART1.h"
#include "HAL_CAN.h"
#include "HAL_I2C.h"

//Used for a makeshift SysTick timer for a delay function
#define TIM4_PERIOD 124

//Delay in milliseconds
void Delay(uint32_t n)
{
	SetTimerTick(n);
	while(GetTimerTick() != 0);
}

uint32_t main(void)
{
	/*CLK Config*/
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 0, CLK_CURRENTCLOCKSTATE_DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, 1);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, 1);

	/*TIM4 Config*/
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, 1);
	TIM4_Cmd(1);

	GPIO_DeInit(GPIOB);
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);

	/*I2C Config*/
	I2C_DeInit();
	uint8_t clock = 0x0;
	clock = CLK_GetClockFreq() / 1000000;
	I2C_Cmd(1);

	I2C_Init(I2C_MAX_STANDARD_FREQ, 0x3C, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, clock);

	//Enable all interrupts
	enableInterrupts();

	while(1)
	{
		I2C_GenerateSTART(1);
		while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
		I2C_Send7bitAddress(0x3C, I2C_DIRECTION_TX);
		while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
		I2C_SendData(0x06);
		while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
		I2C_GenerateSTOP(1);
		Delay(500);
	}
}
