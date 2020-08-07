//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _HAL_CLK_H
#define _HAL_CLK_H

#include "main.h"

typedef struct CLK_struct
{
  volatile uint8_t ICKR;     /*!< Internal Clocks Control Register */
  volatile uint8_t ECKR;     /*!< External Clocks Control Register */
  uint8_t RESERVED;      /*!< Reserved byte */
  volatile uint8_t CMSR;     /*!< Clock Master Status Register */
  volatile uint8_t SWR;      /*!< Clock Master Switch Register */
  volatile uint8_t SWCR;     /*!< Switch Control Register */
  volatile uint8_t CKDIVR;   /*!< Clock Divider Register */
  volatile uint8_t PCKENR1;  /*!< Peripheral Clock Gating Register 1 */
  volatile uint8_t CSSR;     /*!< Clock Security System Register */
  volatile uint8_t CCOR;     /*!< Configurable Clock Output Register */
  volatile uint8_t PCKENR2;  /*!< Peripheral Clock Gating Register 2 */
  uint8_t RESERVED1;     /*!< Reserved byte */
  volatile uint8_t HSITRIMR; /*!< HSI Calibration Trimmer Register */
  volatile uint8_t SWIMCCR;  /*!< SWIM clock control register */
} CLK_TypeDef;

#define CLK ((CLK_TypeDef *) CLK_BaseAddress)

#define CLK_ICKR_RESET_VALUE     ((uint8_t)0x01)
#define CLK_ECKR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CMSR_RESET_VALUE     ((uint8_t)0xE1)
#define CLK_SWR_RESET_VALUE      ((uint8_t)0xE1)
#define CLK_SWCR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CKDIVR_RESET_VALUE   ((uint8_t)0x18)
#define CLK_PCKENR1_RESET_VALUE  ((uint8_t)0xFF)
#define CLK_PCKENR2_RESET_VALUE  ((uint8_t)0xFF)
#define CLK_CSSR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_CCOR_RESET_VALUE     ((uint8_t)0x00)
#define CLK_HSITRIMR_RESET_VALUE ((uint8_t)0x00)
#define CLK_SWIMCCR_RESET_VALUE  ((uint8_t)0x00)

#define CLK_ICKR_SWUAH       ((uint8_t)0x20) /*!< Slow Wake-up from Active Halt/Halt modes */
#define CLK_ICKR_LSIRDY      ((uint8_t)0x10) /*!< Low speed internal oscillator ready */
#define CLK_ICKR_LSIEN       ((uint8_t)0x08) /*!< Low speed internal RC oscillator enable */
#define CLK_ICKR_FHWU        ((uint8_t)0x04) /*!< Fast Wake-up from Active Halt/Halt mode */
#define CLK_ICKR_HSIRDY      ((uint8_t)0x02) /*!< High speed internal RC oscillator ready */
#define CLK_ICKR_HSIEN       ((uint8_t)0x01) /*!< High speed internal RC oscillator enable */

#define CLK_ECKR_HSERDY      ((uint8_t)0x02) /*!< High speed external crystal oscillator ready */
#define CLK_ECKR_HSEEN       ((uint8_t)0x01) /*!< High speed external crystal oscillator enable */

#define CLK_CMSR_CKM         ((uint8_t)0xFF) /*!< Clock master status bits */

#define CLK_SWR_SWI          ((uint8_t)0xFF) /*!< Clock master selection bits */

#define CLK_SWCR_SWIF        ((uint8_t)0x08) /*!< Clock switch interrupt flag */
#define CLK_SWCR_SWIEN       ((uint8_t)0x04) /*!< Clock switch interrupt enable */
#define CLK_SWCR_SWEN        ((uint8_t)0x02) /*!< Switch start/stop */
#define CLK_SWCR_SWBSY       ((uint8_t)0x01) /*!< Switch busy flag*/

#define CLK_CKDIVR_HSIDIV    ((uint8_t)0x18) /*!< High speed internal clock prescaler */
#define CLK_CKDIVR_CPUDIV    ((uint8_t)0x07) /*!< CPU clock prescaler */

#define CLK_PCKENR1_TIM1     ((uint8_t)0x80) /*!< Timer 1 clock enable */ 
#define CLK_PCKENR1_TIM3     ((uint8_t)0x40) /*!< Timer 3 clock enable */
#define CLK_PCKENR1_TIM2     ((uint8_t)0x20) /*!< Timer 2 clock enable */
#define CLK_PCKENR1_TIM5     ((uint8_t)0x20) /*!< Timer 5 clock enable */
#define CLK_PCKENR1_TIM4     ((uint8_t)0x10) /*!< Timer 4 clock enable */
#define CLK_PCKENR1_TIM6     ((uint8_t)0x10) /*!< Timer 6 clock enable */
#define CLK_PCKENR1_UART3    ((uint8_t)0x08) /*!< UART3 clock enable */
#define CLK_PCKENR1_UART2    ((uint8_t)0x08) /*!< UART2 clock enable */
#define CLK_PCKENR1_UART1    ((uint8_t)0x04) /*!< UART1 clock enable */
#define CLK_PCKENR1_SPI      ((uint8_t)0x02) /*!< SPI clock enable */
#define CLK_PCKENR1_I2C      ((uint8_t)0x01) /*!< I2C clock enable */

#define CLK_PCKENR2_CAN      ((uint8_t)0x80) /*!< CAN clock enable */
#define CLK_PCKENR2_ADC      ((uint8_t)0x08) /*!< ADC clock enable */
#define CLK_PCKENR2_AWU      ((uint8_t)0x04) /*!< AWU clock enable */

#define CLK_CSSR_CSSD        ((uint8_t)0x08) /*!< Clock security system detection */
#define CLK_CSSR_CSSDIE      ((uint8_t)0x04) /*!< Clock security system detection interrupt enable */
#define CLK_CSSR_AUX         ((uint8_t)0x02) /*!< Auxiliary oscillator connected to master clock */
#define CLK_CSSR_CSSEN       ((uint8_t)0x01) /*!< Clock security system enable */

#define CLK_CCOR_CCOBSY      ((uint8_t)0x40) /*!< Configurable clock output busy */
#define CLK_CCOR_CCORDY      ((uint8_t)0x20) /*!< Configurable clock output ready */
#define CLK_CCOR_CCOSEL      ((uint8_t)0x1E) /*!< Configurable clock output selection */
#define CLK_CCOR_CCOEN       ((uint8_t)0x01) /*!< Configurable clock output enable */

#define CLK_HSITRIMR_HSITRIM ((uint8_t)0x07) /*!< High speed internal oscillator trimmer */

#define CLK_SWIMCCR_SWIMDIV  ((uint8_t)0x01) /*!< SWIM Clock Dividing Factor */

#define CLK_TIMEOUT ((uint16_t)0x491) 

typedef enum {
  CLK_SWITCHMODE_MANUAL = (uint8_t)0x00, /*!< Enable the manual clock switching mode */
  CLK_SWITCHMODE_AUTO   = (uint8_t)0x01  /*!< Enable the automatic clock switching mode */
} CLK_SwitchMode_TypeDef;

typedef enum {
  CLK_CURRENTCLOCKSTATE_DISABLE = (uint8_t)0x00, /*!< Current clock disable */
  CLK_CURRENTCLOCKSTATE_ENABLE  = (uint8_t)0x01  /*!< Current clock enable */
} CLK_CurrentClockState_TypeDef;

typedef enum {
  CLK_CSSCONFIG_ENABLEWITHIT = (uint8_t)0x05, /*!< Enable CSS with detection interrupt */
  CLK_CSSCONFIG_ENABLE    = (uint8_t)0x01, /*!< Enable CSS without detection interrupt */
  CLK_CSSCONFIG_DISABLE      = (uint8_t)0x00  /*!< Leave CSS desactivated (to be used in CLK_Init() function) */
} CLK_CSSConfig_TypeDef;

typedef enum {
  CLK_SOURCE_HSI    = (uint8_t)0xE1, /*!< Clock Source HSI. */
  CLK_SOURCE_LSI    = (uint8_t)0xD2, /*!< Clock Source LSI. */
  CLK_SOURCE_HSE    = (uint8_t)0xB4 /*!< Clock Source HSE. */
} CLK_Source_TypeDef;

typedef enum {
  CLK_HSITRIMVALUE_0   = (uint8_t)0x00, /*!< HSI Calibtation Value 0 */
  CLK_HSITRIMVALUE_1   = (uint8_t)0x01, /*!< HSI Calibtation Value 1 */
  CLK_HSITRIMVALUE_2   = (uint8_t)0x02, /*!< HSI Calibtation Value 2 */
  CLK_HSITRIMVALUE_3   = (uint8_t)0x03, /*!< HSI Calibtation Value 3 */
  CLK_HSITRIMVALUE_4   = (uint8_t)0x04, /*!< HSI Calibtation Value 4 */
  CLK_HSITRIMVALUE_5   = (uint8_t)0x05, /*!< HSI Calibtation Value 5 */
  CLK_HSITRIMVALUE_6   = (uint8_t)0x06, /*!< HSI Calibtation Value 6 */
  CLK_HSITRIMVALUE_7   = (uint8_t)0x07  /*!< HSI Calibtation Value 7 */
} CLK_HSITrimValue_TypeDef;

typedef enum {
  CLK_OUTPUT_HSI      = (uint8_t)0x00, /*!< Clock Output HSI */
  CLK_OUTPUT_LSI      = (uint8_t)0x02, /*!< Clock Output LSI */
  CLK_OUTPUT_HSE      = (uint8_t)0x04, /*!< Clock Output HSE */
  CLK_OUTPUT_CPU      = (uint8_t)0x08, /*!< Clock Output CPU */
  CLK_OUTPUT_CPUDIV2  = (uint8_t)0x0A, /*!< Clock Output CPU/2 */
  CLK_OUTPUT_CPUDIV4  = (uint8_t)0x0C, /*!< Clock Output CPU/4 */
  CLK_OUTPUT_CPUDIV8  = (uint8_t)0x0E, /*!< Clock Output CPU/8 */
  CLK_OUTPUT_CPUDIV16 = (uint8_t)0x10, /*!< Clock Output CPU/16 */
  CLK_OUTPUT_CPUDIV32 = (uint8_t)0x12, /*!< Clock Output CPU/32 */
  CLK_OUTPUT_CPUDIV64 = (uint8_t)0x14, /*!< Clock Output CPU/64 */
  CLK_OUTPUT_HSIRC    = (uint8_t)0x16, /*!< Clock Output HSI RC */
  CLK_OUTPUT_MASTER   = (uint8_t)0x18, /*!< Clock Output Master */
  CLK_OUTPUT_OTHERS   = (uint8_t)0x1A  /*!< Clock Output OTHER */
} CLK_Output_TypeDef;

typedef enum {
  CLK_PERIPHERAL_I2C     = (uint8_t)0x00, /*!< Peripheral Clock Enable 1, I2C */
  CLK_PERIPHERAL_SPI     = (uint8_t)0x01, /*!< Peripheral Clock Enable 1, SPI */
  CLK_PERIPHERAL_UART1   = (uint8_t)0x02, /*!< Peripheral Clock Enable 1, UART1 */
  CLK_PERIPHERAL_UART2   = (uint8_t)0x03, /*!< Peripheral Clock Enable 1, UART2 */
  CLK_PERIPHERAL_UART3   = (uint8_t)0x03, /*!< Peripheral Clock Enable 1, UART3 */
  CLK_PERIPHERAL_TIMER6  = (uint8_t)0x04, /*!< Peripheral Clock Enable 1, Timer6 */
  CLK_PERIPHERAL_TIMER4  = (uint8_t)0x04, /*!< Peripheral Clock Enable 1, Timer4 */
  CLK_PERIPHERAL_TIMER5  = (uint8_t)0x05, /*!< Peripheral Clock Enable 1, Timer5 */
  CLK_PERIPHERAL_TIMER2  = (uint8_t)0x05, /*!< Peripheral Clock Enable 1, Timer2 */
  CLK_PERIPHERAL_TIMER3  = (uint8_t)0x06, /*!< Peripheral Clock Enable 1, Timer3 */
  CLK_PERIPHERAL_TIMER1  = (uint8_t)0x07, /*!< Peripheral Clock Enable 1, Timer1 */
  CLK_PERIPHERAL_AWU     = (uint8_t)0x12, /*!< Peripheral Clock Enable 2, AWU */
  CLK_PERIPHERAL_ADC     = (uint8_t)0x13, /*!< Peripheral Clock Enable 2, ADC */
  CLK_PERIPHERAL_CAN     = (uint8_t)0x17 /*!< Peripheral Clock Enable 2, CAN */
} CLK_Peripheral_TypeDef;

typedef enum {
  CLK_FLAG_LSIRDY  = (uint16_t)0x0110, /*!< Low speed internal oscillator ready Flag */
  CLK_FLAG_HSIRDY  = (uint16_t)0x0102, /*!< High speed internal oscillator ready Flag */
  CLK_FLAG_HSERDY  = (uint16_t)0x0202, /*!< High speed external oscillator ready Flag */
  CLK_FLAG_SWIF    = (uint16_t)0x0308, /*!< Clock switch interrupt Flag */
  CLK_FLAG_SWBSY   = (uint16_t)0x0301, /*!< Switch busy Flag */
  CLK_FLAG_CSSD    = (uint16_t)0x0408, /*!< Clock security system detection Flag */
  CLK_FLAG_AUX     = (uint16_t)0x0402, /*!< Auxiliary oscillator connected to master clock */
  CLK_FLAG_CCOBSY  = (uint16_t)0x0504, /*!< Configurable clock output busy */
  CLK_FLAG_CCORDY  = (uint16_t)0x0502 /*!< Configurable clock output ready */

}CLK_Flag_TypeDef;

typedef enum {
  CLK_IT_CSSD   = (uint8_t)0x0C, /*!< Clock security system detection Flag */
  CLK_IT_SWIF   = (uint8_t)0x1C /*!< Clock switch interrupt Flag */
}CLK_IT_TypeDef;

typedef enum {
  CLK_PRESCALER_HSIDIV1   = (uint8_t)0x00, /*!< High speed internal clock prescaler: 1 */
  CLK_PRESCALER_HSIDIV2   = (uint8_t)0x08, /*!< High speed internal clock prescaler: 2 */
  CLK_PRESCALER_HSIDIV4   = (uint8_t)0x10, /*!< High speed internal clock prescaler: 4 */
  CLK_PRESCALER_HSIDIV8   = (uint8_t)0x18, /*!< High speed internal clock prescaler: 8 */
  CLK_PRESCALER_CPUDIV1   = (uint8_t)0x80, /*!< CPU clock division factors 1 */
  CLK_PRESCALER_CPUDIV2   = (uint8_t)0x81, /*!< CPU clock division factors 2 */
  CLK_PRESCALER_CPUDIV4   = (uint8_t)0x82, /*!< CPU clock division factors 4 */
  CLK_PRESCALER_CPUDIV8   = (uint8_t)0x83, /*!< CPU clock division factors 8 */
  CLK_PRESCALER_CPUDIV16  = (uint8_t)0x84, /*!< CPU clock division factors 16 */
  CLK_PRESCALER_CPUDIV32  = (uint8_t)0x85, /*!< CPU clock division factors 32 */
  CLK_PRESCALER_CPUDIV64  = (uint8_t)0x86, /*!< CPU clock division factors 64 */
  CLK_PRESCALER_CPUDIV128 = (uint8_t)0x87  /*!< CPU clock division factors 128 */
} CLK_Prescaler_TypeDef;

typedef enum {
  CLK_SWIMDIVIDER_2 = (uint8_t)0x00, /*!< SWIM clock is divided by 2 */
  CLK_SWIMDIVIDER_OTHER = (uint8_t)0x01 /*!< SWIM clock is not divided by 2 */
}CLK_SWIMDivider_TypeDef;

void CLK_DeInit(void);
void CLK_HSECmd(uint8_t NewState);
void CLK_HSICmd(uint8_t NewState);
void CLK_LSICmd(uint8_t NewState);
void CLK_CCOCmd(uint8_t NewState);
void CLK_ClockSwitchCmd(uint8_t NewState);
void CLK_FastHaltWakeUpCmd(uint8_t NewState);
void CLK_SlowActiveHaltWakeUpCmd(uint8_t NewState);
void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, uint8_t NewState);
uint8_t CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, uint8_t ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState);
void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler);
void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO);
void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, uint8_t NewState);
void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler);
void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider);
void CLK_ClockSecuritySystemEnable(void);
void CLK_SYSCLKEmergencyClear(void);
void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue);
uint32_t CLK_GetClockFreq(void);
CLK_Source_TypeDef CLK_GetSYSCLKSource(void);
uint8_t CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG);
uint8_t CLK_GetITStatus(CLK_IT_TypeDef CLK_IT);
void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT);

#endif
