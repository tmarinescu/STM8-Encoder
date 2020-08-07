//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

#include "interrupts.h"
#include "HAL_TIM4.h"

static volatile uint32_t TimerTick = 0; //Tick for timer4

void SetTimerTick(uint32_t tick)
{
	TimerTick = tick;
}

uint32_t GetTimerTick()
{
	return TimerTick;
}

void TIM4_UPD_OVF_IRQHandler() __interrupt(23) //Timer 4 update interrupt
{
	if(TimerTick != 0)
	{
		TimerTick--;
	}
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
}