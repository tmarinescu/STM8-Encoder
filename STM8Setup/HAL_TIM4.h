//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _HAL_TIM4_H
#define _HAL_TIM4_H

#include "main.h"

#define TIM4_CR1_RESET_VALUE  ((uint8_t)0x00)
#define TIM4_IER_RESET_VALUE  ((uint8_t)0x00)
#define TIM4_SR1_RESET_VALUE  ((uint8_t)0x00)
#define TIM4_EGR_RESET_VALUE  ((uint8_t)0x00)
#define TIM4_CNTR_RESET_VALUE ((uint8_t)0x00)
#define TIM4_PSCR_RESET_VALUE ((uint8_t)0x00)
#define TIM4_ARR_RESET_VALUE  ((uint8_t)0xFF)

#define CLK_PCKENR1_TIM4     ((uint8_t)0x10) /*!< Timer 4 clock enable */

/*CR1*/
#define TIM4_CR1_ARPE ((uint8_t)0x80) /*!< Auto-Reload Preload Enable mask. */
#define TIM4_CR1_OPM  ((uint8_t)0x08) /*!< One Pulse Mode mask. */
#define TIM4_CR1_URS  ((uint8_t)0x04) /*!< Update Request Source mask. */
#define TIM4_CR1_UDIS ((uint8_t)0x02) /*!< Update DIsable mask. */
#define TIM4_CR1_CEN  ((uint8_t)0x01) /*!< Counter Enable mask. */
/*IER*/
#define TIM4_IER_UIE  ((uint8_t)0x01) /*!< Update Interrupt Enable mask. */
/*SR1*/
#define TIM4_SR1_UIF  ((uint8_t)0x01) /*!< Update Interrupt Flag mask. */
/*EGR*/
#define TIM4_EGR_UG   ((uint8_t)0x01) /*!< Update Generation mask. */
/*CNTR*/
#define TIM4_CNTR_CNT ((uint8_t)0xFF) /*!< Counter Value (LSB) mask. */
/*PSCR*/
#define TIM4_PSCR_PSC ((uint8_t)0x07) /*!< Prescaler Value  mask. */
/*ARR*/
#define TIM4_ARR_ARR  ((uint8_t)0xFF) /*!< Autoreload Value mask. */

typedef struct TIM4_struct
{
  volatile uint8_t CR1;  /*!< control register 1 */
#if defined(STM8S103) || defined(STM8S003)
	uint8_t RESERVED1; /*!< Reserved register */
	uint8_t RESERVED2; /*!< Reserved register */
#endif
  volatile uint8_t IER;  /*!< interrupt enable register */
  volatile uint8_t SR1;  /*!< status register 1 */
  volatile uint8_t EGR;  /*!< event generation register */
  volatile uint8_t CNTR; /*!< counter register */
  volatile uint8_t PSCR; /*!< prescaler register */
  volatile uint8_t ARR;  /*!< auto-reload register */
} TIM4_TypeDef;

#define TIM4 ((TIM4_TypeDef *) TIM4_BaseAddress)

typedef enum
{
  TIM4_PRESCALER_1  = ((uint8_t)0x00),
  TIM4_PRESCALER_2    = ((uint8_t)0x01),
  TIM4_PRESCALER_4    = ((uint8_t)0x02),
  TIM4_PRESCALER_8     = ((uint8_t)0x03),
  TIM4_PRESCALER_16   = ((uint8_t)0x04),
  TIM4_PRESCALER_32     = ((uint8_t)0x05),
  TIM4_PRESCALER_64    = ((uint8_t)0x06),
  TIM4_PRESCALER_128   = ((uint8_t)0x07)
} TIM4_Prescaler_TypeDef;

typedef enum
{
  TIM4_OPMODE_SINGLE                 = ((uint8_t)0x01),
  TIM4_OPMODE_REPETITIVE             = ((uint8_t)0x00)
} TIM4_OPMode_TypeDef;

typedef enum
{
  TIM4_PSCRELOADMODE_UPDATE          = ((uint8_t)0x00),
  TIM4_PSCRELOADMODE_IMMEDIATE       = ((uint8_t)0x01)
} TIM4_PSCReloadMode_TypeDef;

typedef enum
{
  TIM4_UPDATESOURCE_GLOBAL           = ((uint8_t)0x00),
  TIM4_UPDATESOURCE_REGULAR          = ((uint8_t)0x01)
} TIM4_UpdateSource_TypeDef;

typedef enum
{
  TIM4_EVENTSOURCE_UPDATE            = ((uint8_t)0x01)
}TIM4_EventSource_TypeDef;

typedef enum
{
  TIM4_FLAG_UPDATE                   = ((uint8_t)0x01)
}TIM4_FLAG_TypeDef;

typedef enum
{
  TIM4_IT_UPDATE                     = ((uint8_t)0x01)
}TIM4_IT_TypeDef;

void TIM4_DeInit(void);
void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period);
void TIM4_Cmd(uint8_t NewState);
void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, uint8_t NewState);
void TIM4_UpdateDisableConfig(uint8_t NewState);
void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource);
void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode);
void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode);
void TIM4_ARRPreloadConfig(uint8_t NewState);
void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource);
void TIM4_SetCounter(uint8_t Counter);
void TIM4_SetAutoreload(uint8_t Autoreload);
uint8_t TIM4_GetCounter(void);
TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void);
uint8_t TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG);
void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG);
uint8_t TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT);
void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT);

#endif
