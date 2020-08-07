//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#include "HAL_TIM4.h"

void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
{
    TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
    TIM4->ARR = (uint8_t)(TIM4_Period);
}

void TIM4_Cmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        TIM4->CR1 |= TIM4_CR1_CEN;
    }
    else
    {
        TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
    }
}

void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, uint8_t NewState)
{
    if (NewState != 0)
    {
        TIM4->IER |= (uint8_t)TIM4_IT;
    }
    else
    {
        TIM4->IER &= (uint8_t)(~TIM4_IT);
    }
}

void TIM4_UpdateDisableConfig(uint8_t NewState)
{
    if (NewState != 0)
    {
        TIM4->CR1 |= TIM4_CR1_UDIS;
    }
    else
    {
        TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
    }
}

void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
{
    if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
    {
        TIM4->CR1 |= TIM4_CR1_URS;
    }
    else
    {
        TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
    }
}

void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
{
    if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
    {
        TIM4->CR1 |= TIM4_CR1_OPM;
    }
    else
    {
        TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
    }
}

void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
{
    TIM4->PSCR = (uint8_t)Prescaler;
    TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
}

void TIM4_ARRPreloadConfig(uint8_t NewState)
{
    if (NewState != 0)
    {
        TIM4->CR1 |= TIM4_CR1_ARPE;
    }
    else
    {
        TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
    }
}

void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
{
    TIM4->EGR = (uint8_t)(TIM4_EventSource);
}

void TIM4_SetCounter(uint8_t Counter)
{
    TIM4->CNTR = (uint8_t)(Counter);
}

void TIM4_SetAutoreload(uint8_t Autoreload)
{
    TIM4->ARR = (uint8_t)(Autoreload);
}

uint8_t TIM4_GetCounter(void)
{
    return (uint8_t)(TIM4->CNTR);
}

TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
{
    return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
}

uint8_t TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
{
    uint8_t bitstatus = 0;
	if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
	{
		bitstatus = 1;
	}
	else
	{
		bitstatus = 0;
	}
	return (bitstatus);
}

void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
{
    TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
}

uint8_t TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
{
  uint8_t bitstatus = 0;

  uint8_t itstatus = 0x0, itenable = 0x0;


  itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);

  itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);

  if ((itstatus != 0 ) && (itenable != 0))
  {
    bitstatus = 1;
  }
  else
  {
    bitstatus = 0;
  }
  return (bitstatus);
}

void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
{
    TIM4->SR1 = (uint8_t)(~TIM4_IT);
}