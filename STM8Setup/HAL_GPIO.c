//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#include "HAL_GPIO.h"

void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
{
	GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
	{
		if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00)
		{
			GPIOx->ODR |= (uint8_t)GPIO_Pin;
		} 
		else
		{
			GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
		}
		GPIOx->DDR |= (uint8_t)GPIO_Pin;
	} 
	else
	{
		GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
	}

	if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00)
	{
		GPIOx->CR1 |= (uint8_t)GPIO_Pin;
	} 
	else
	{
		GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
	}

	if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00)
	{
		GPIOx->CR2 |= (uint8_t)GPIO_Pin;
	} 
	else
	{
		GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
	}
}

void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
{
	GPIOx->ODR = PortVal;
}

void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
	GPIOx->ODR |= (uint8_t)PortPins;
}

void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
	GPIOx->ODR &= (uint8_t)(~PortPins);
}

void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
	GPIOx->ODR ^= (uint8_t)PortPins;
}

uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
{
	return ((uint8_t)GPIOx->ODR);
}

uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
{
  return ((uint8_t)GPIOx->IDR);
}

uint8_t GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
{
	uint8_t state = (uint8_t)(GPIOx->IDR & (uint8_t)GPIO_Pin);
	if(state == GPIO_Pin)
		return 0x1;
	else
		return 0x0;
}