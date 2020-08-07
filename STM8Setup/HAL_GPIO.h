//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _HAL_GPIO_H_
#define _HAL_GPIO_H_

#include "main.h"

typedef struct GPIO_Struct
{
	volatile uint8_t ODR;
	volatile uint8_t IDR;
	volatile uint8_t DDR;
	volatile uint8_t CR1;
	volatile uint8_t CR2;
} GPIO_TypeDef;

#define GPIOA ((GPIO_TypeDef *) GPIOA_BaseAddress)
#define GPIOB ((GPIO_TypeDef *) GPIOB_BaseAddress)
#define GPIOC ((GPIO_TypeDef *) GPIOC_BaseAddress)
#define GPIOD ((GPIO_TypeDef *) GPIOD_BaseAddress)
#define GPIOE ((GPIO_TypeDef *) GPIOE_BaseAddress)
#define GPIOF ((GPIO_TypeDef *) GPIOF_BaseAddress)
#define GPIOG ((GPIO_TypeDef *) GPIOG_BaseAddress)
#define GPIOH ((GPIO_TypeDef *) GPIOH_BaseAddress)
#define GPIOI ((GPIO_TypeDef *) GPIOI_BaseAddress)

typedef enum
{
	GPIO_PIN_0 = ((uint8_t)0x01),
	GPIO_PIN_1 = ((uint8_t)0x02),
	GPIO_PIN_2 = ((uint8_t)0x04),
	GPIO_PIN_3 = ((uint8_t)0x08),
	GPIO_PIN_4 = ((uint8_t)0x10),
	GPIO_PIN_5 = ((uint8_t)0x20),
	GPIO_PIN_6 = ((uint8_t)0x40),
	GPIO_PIN_7 = ((uint8_t)0x80)
} GPIO_Pin_TypeDef;

typedef enum
{
	GPIO_MODE_IN_FL_NO_IT 		= (uint8_t)0x00,  /*!< Input floating, no external interrupt */
	GPIO_MODE_IN_PU_NO_IT 		= (uint8_t)0x40,  /*!< Input pull-up, no external interrupt */
	GPIO_MODE_IN_FL_IT 			= (uint8_t)0x20,  /*!< Input floating, external interrupt */
	GPIO_MODE_IN_PU_IT 			= (uint8_t)0x60,  /*!< Input pull-up, external interrupt */
	GPIO_MODE_OUT_OD_LOW_FAST 	= (uint8_t)0xA0,  /*!< Output open-drain, low level, 10MHz */
	GPIO_MODE_OUT_PP_LOW_FAST 	= (uint8_t)0xE0,  /*!< Output push-pull, low level, 10MHz */
	GPIO_MODE_OUT_OD_LOW_SLOW 	= (uint8_t)0x80,  /*!< Output open-drain, low level, 2MHz */
	GPIO_MODE_OUT_PP_LOW_SLOW 	= (uint8_t)0xC0,  /*!< Output push-pull, low level, 2MHz */
	GPIO_MODE_OUT_OD_HIZ_FAST 	= (uint8_t)0xB0,  /*!< Output open-drain, high-impedance level,10MHz */
	GPIO_MODE_OUT_PP_HIGH_FAST 	= (uint8_t)0xF0,  /*!< Output push-pull, high level, 10MHz */
	GPIO_MODE_OUT_OD_HIZ_SLOW 	= (uint8_t)0x90,  /*!< Output open-drain, high-impedance level, 2MHz */
	GPIO_MODE_OUT_PP_HIGH_SLOW 	= (uint8_t)0xD0   /*!< Output push-pull, high level, 2MHz */
} GPIO_Mode_TypeDef;

void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode);
void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal);
void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins);
void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins);
void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins);
uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx);
uint8_t GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin);

#endif