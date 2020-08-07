//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: July 10th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _HAL_I2C_H_
#define _HAL_I2C_H_

#include "main.h"

typedef struct I2C_struct
{
    volatile uint8_t CR1;       /*!< I2C control register 1 */
    volatile uint8_t CR2;       /*!< I2C control register 2 */
    volatile uint8_t FREQR;     /*!< I2C frequency register */
    volatile uint8_t OARL;      /*!< I2C own address register LSB */
    volatile uint8_t OARH;      /*!< I2C own address register MSB */
    uint8_t RESERVED1;      /*!< Reserved byte */
    volatile uint8_t DR;        /*!< I2C data register */
    volatile uint8_t SR1;       /*!< I2C status register 1 */
    volatile uint8_t SR2;       /*!< I2C status register 2 */
    volatile uint8_t SR3;       /*!< I2C status register 3 */
    volatile uint8_t ITR;       /*!< I2C interrupt register */
    volatile uint8_t CCRL;      /*!< I2C clock control register low */
    volatile uint8_t CCRH;      /*!< I2C clock control register high */
    volatile uint8_t TRISER;    /*!< I2C maximum rise time register */
    uint8_t RESERVED2;      /*!< Reserved byte */
} I2C_TypeDef;

#define I2C_CR1_RESET_VALUE    ((uint8_t)0x00)
#define I2C_CR2_RESET_VALUE    ((uint8_t)0x00)
#define I2C_FREQR_RESET_VALUE  ((uint8_t)0x00)
#define I2C_OARL_RESET_VALUE   ((uint8_t)0x00)
#define I2C_OARH_RESET_VALUE   ((uint8_t)0x00)
#define I2C_DR_RESET_VALUE     ((uint8_t)0x00)
#define I2C_SR1_RESET_VALUE    ((uint8_t)0x00)
#define I2C_SR2_RESET_VALUE    ((uint8_t)0x00)
#define I2C_SR3_RESET_VALUE    ((uint8_t)0x00)
#define I2C_ITR_RESET_VALUE    ((uint8_t)0x00)
#define I2C_CCRL_RESET_VALUE   ((uint8_t)0x00)
#define I2C_CCRH_RESET_VALUE   ((uint8_t)0x00)
#define I2C_TRISER_RESET_VALUE ((uint8_t)0x02)
#define I2C_CR1_NOSTRETCH ((uint8_t)0x80) /*!< Clock Stretching Disable (Slave mode) */
#define I2C_CR1_ENGC      ((uint8_t)0x40) /*!< General Call Enable */
#define I2C_CR1_PE        ((uint8_t)0x01) /*!< Peripheral Enable */
#define I2C_CR2_SWRST ((uint8_t)0x80)     /*!< Software Reset */
#define I2C_CR2_POS   ((uint8_t)0x08)     /*!< Acknowledge */
#define I2C_CR2_ACK   ((uint8_t)0x04)     /*!< Acknowledge Enable */
#define I2C_CR2_STOP  ((uint8_t)0x02)     /*!< Stop Generation */
#define I2C_CR2_START ((uint8_t)0x01)     /*!< Start Generation */
#define I2C_FREQR_FREQ ((uint8_t)0x3F)    /*!< Peripheral Clock Frequency */
#define I2C_OARL_ADD  ((uint8_t)0xFE)     /*!< Interface Address bits [7..1] */
#define I2C_OARL_ADD0 ((uint8_t)0x01)     /*!< Interface Address bit0 */
#define I2C_OARH_ADDMODE ((uint8_t)0x80)  /*!< Addressing Mode (Slave mode) */
#define I2C_OARH_ADDCONF ((uint8_t)0x40)  /*!< Address Mode Configuration */
#define I2C_OARH_ADD     ((uint8_t)0x06)  /*!< Interface Address bits [9..8] */
#define I2C_DR_DR        ((uint8_t)0xFF)  /*!< Data Register */
#define I2C_SR1_TXE      ((uint8_t)0x80)  /*!< Data Register Empty (transmitters) */
#define I2C_SR1_RXNE     ((uint8_t)0x40)  /*!< Data Register not Empty (receivers) */
#define I2C_SR1_STOPF    ((uint8_t)0x10)  /*!< Stop detection (Slave mode) */
#define I2C_SR1_ADD10    ((uint8_t)0x08)  /*!< 10-bit header sent (Master mode) */
#define I2C_SR1_BTF      ((uint8_t)0x04)  /*!< Byte Transfer Finished */
#define I2C_SR1_ADDR     ((uint8_t)0x02)  /*!< Address sent (master mode)/matched (slave mode) */
#define I2C_SR1_SB       ((uint8_t)0x01)  /*!< Start Bit (Master mode) */
#define I2C_SR2_WUFH     ((uint8_t)0x20)  /*!< Wake-up from Halt */
#define I2C_SR2_OVR      ((uint8_t)0x08)  /*!< Overrun/Underrun */
#define I2C_SR2_AF       ((uint8_t)0x04)  /*!< Acknowledge Failure */
#define I2C_SR2_ARLO     ((uint8_t)0x02)  /*!< Arbitration Lost (master mode) */
#define I2C_SR2_BERR     ((uint8_t)0x01)  /*!< Bus Error */
#define I2C_SR3_GENCALL  ((uint8_t)0x10)  /*!< General Call Header (Slave mode) */
#define I2C_SR3_TRA      ((uint8_t)0x04)  /*!< Transmitter/Receiver */
#define I2C_SR3_BUSY     ((uint8_t)0x02)  /*!< Bus Busy */
#define I2C_SR3_MSL      ((uint8_t)0x01)  /*!< Master/Slave */
#define I2C_ITR_ITBUFEN  ((uint8_t)0x04)  /*!< Buffer Interrupt Enable */
#define I2C_ITR_ITEVTEN  ((uint8_t)0x02)  /*!< Event Interrupt Enable */
#define I2C_ITR_ITERREN  ((uint8_t)0x01)  /*!< Error Interrupt Enable */
#define I2C_CCRL_CCR     ((uint8_t)0xFF)  /*!< Clock Control Register (Master mode) */
#define I2C_CCRH_FS      ((uint8_t)0x80)  /*!< Master Mode Selection */
#define I2C_CCRH_DUTY    ((uint8_t)0x40)  /*!< Fast Mode Duty Cycle */
#define I2C_CCRH_CCR     ((uint8_t)0x0F)  /*!< Clock Control Register in Fast/Standard mode (Master mode) bits [11..8] */
#define I2C_TRISER_TRISE ((uint8_t)0x3F)  /*!< Maximum Rise Time in Fast/Standard mode (Master mode) */

#define I2C ((I2C_TypeDef *) I2C_BaseAddress)

typedef enum
{
    I2C_DUTYCYCLE_2 = (uint8_t)0x00,  /*!< Fast mode Tlow/THigh = 2 */
    I2C_DUTYCYCLE_16_9 = (uint8_t)0x40   /*!< Fast mode Tlow/Thigh = 16/9 */
} I2C_DutyCycle_TypeDef;

typedef enum
{
    I2C_ACK_NONE = (uint8_t)0x00,  /*!< No acknowledge */
    I2C_ACK_CURR = (uint8_t)0x01,  /*!< Acknowledge on the current byte */
    I2C_ACK_NEXT = (uint8_t)0x02   /*!< Acknowledge on the next byte */
} I2C_Ack_TypeDef;

typedef enum
{
    I2C_ADDMODE_7BIT = (uint8_t)0x00,  /*!< 7-bit slave address (10-bit address not acknowledged) */
    I2C_ADDMODE_10BIT = (uint8_t)0x80   /*!< 10-bit slave address (7-bit address not acknowledged) */
} I2C_AddMode_TypeDef;

typedef enum
{
    I2C_IT_ERR = (uint8_t)0x01, 	/*!< Error Interruption */
    I2C_IT_EVT = (uint8_t)0x02, 	/*!< Event Interruption */
    I2C_IT_BUF = (uint8_t)0x04 	/*!< Buffer Interruption */
} I2C_IT_TypeDef;

typedef enum
{
    I2C_DIRECTION_TX = (uint8_t)0x00,  /*!< Transmission direction */
    I2C_DIRECTION_RX = (uint8_t)0x01   /*!< Reception direction */
} I2C_Direction_TypeDef;

typedef enum
{
    /* SR1 register flags */
    I2C_FLAG_TXEMPTY = (uint16_t)0x0180,  /*!< Transmit Data Register Empty flag */
    I2C_FLAG_RXNOTEMPTY = (uint16_t)0x0140,  /*!< Read Data Register Not Empty flag */
    I2C_FLAG_STOPDETECTION = (uint16_t)0x0110,  /*!< Stop detected flag */
    I2C_FLAG_HEADERSENT = (uint16_t)0x0108,  /*!< 10-bit Header sent flag */
    I2C_FLAG_TRANSFERFINISHED = (uint16_t)0x0104,  /*!< Data Byte Transfer Finished flag */
    I2C_FLAG_ADDRESSSENTMATCHED = (uint16_t)0x0102,  /*!< Address Sent/Matched (master/slave) flag */
    I2C_FLAG_STARTDETECTION = (uint16_t)0x0101,  /*!< Start bit sent flag */

    /* SR2 register flags */
    I2C_FLAG_WAKEUPFROMHALT = (uint16_t)0x0220,  /*!< Wake Up From Halt Flag */
    I2C_FLAG_OVERRUNUNDERRUN = (uint16_t)0x0208,  /*!< Overrun/Underrun flag */
    I2C_FLAG_ACKNOWLEDGEFAILURE = (uint16_t)0x0204,  /*!< Acknowledge Failure Flag */
    I2C_FLAG_ARBITRATIONLOSS = (uint16_t)0x0202,  /*!< Arbitration Loss Flag */
    I2C_FLAG_BUSERROR = (uint16_t)0x0201,  /*!< Misplaced Start or Stop condition */

    /* SR3 register flags */
    I2C_FLAG_GENERALCALL = (uint16_t)0x0310,  /*!< General Call header received Flag */
    I2C_FLAG_TRANSMITTERRECEIVER = (uint16_t)0x0304,  /*!< Transmitter Receiver Flag */
    I2C_FLAG_BUSBUSY = (uint16_t)0x0302,  /*!< Bus Busy Flag */
    I2C_FLAG_MASTERSLAVE = (uint16_t)0x0301   /*!< Master Slave Flag */
} I2C_Flag_TypeDef;

typedef enum
{
    /* SR1 register flags */
    I2C_ITPENDINGBIT_TXEMPTY = (uint16_t)0x1680, 	/*!< Transmit Data Register Empty  */
    I2C_ITPENDINGBIT_RXNOTEMPTY = (uint16_t)0x1640, 	/*!< Read Data Register Not Empty  */
    I2C_ITPENDINGBIT_STOPDETECTION = (uint16_t)0x1210, 	/*!< Stop detected  */
    I2C_ITPENDINGBIT_HEADERSENT = (uint16_t)0x1208, 	/*!< 10-bit Header sent */
    I2C_ITPENDINGBIT_TRANSFERFINISHED = (uint16_t)0x1204, 	/*!< Data Byte Transfer Finished  */
    I2C_ITPENDINGBIT_ADDRESSSENTMATCHED = (uint16_t)0x1202, 	/*!< Address Sent/Matched (master/slave)  */
    I2C_ITPENDINGBIT_STARTDETECTION = (uint16_t)0x1201, 	/*!< Start bit sent  */

    /* SR2 register flags */
    I2C_ITPENDINGBIT_WAKEUPFROMHALT = (uint16_t)0x2220, 	/*!< Wake Up From Halt  */
    I2C_ITPENDINGBIT_OVERRUNUNDERRUN = (uint16_t)0x2108, 	/*!< Overrun/Underrun  */
    I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE = (uint16_t)0x2104, 	/*!< Acknowledge Failure  */
    I2C_ITPENDINGBIT_ARBITRATIONLOSS = (uint16_t)0x2102, 	/*!< Arbitration Loss  */
    I2C_ITPENDINGBIT_BUSERROR = (uint16_t)0x2101  	/*!< Misplaced Start or Stop condition */
} I2C_ITPendingBit_TypeDef;

typedef enum
{
    I2C_EVENT_MASTER_MODE_SELECT = (uint16_t)0x0301,  /*!< BUSY, MSL and SB flag */
    /* --EV6 */
    I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED = (uint16_t)0x0782,  /*!< BUSY, MSL, ADDR, TXE and TRA flags */
    I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED = (uint16_t)0x0302,  /*!< BUSY, MSL and ADDR flags */
    /* --EV9 */
    I2C_EVENT_MASTER_MODE_ADDRESS10 = (uint16_t)0x0308,  /*!< BUSY, MSL and ADD10 flags */
    /* Master RECEIVER mode -----------------------------*/
    /* --EV7 */
    I2C_EVENT_MASTER_BYTE_RECEIVED = (uint16_t)0x0340,  /*!< BUSY, MSL and RXNE flags */
    /* Master TRANSMITTER mode --------------------------*/
    /* --EV8 */
    I2C_EVENT_MASTER_BYTE_TRANSMITTING = (uint16_t)0x0780,  /*!< TRA, BUSY, MSL, TXE flags */
    /* --EV8_2 */
    I2C_EVENT_MASTER_BYTE_TRANSMITTED = (uint16_t)0x0784,  /*!< EV8_2: TRA, BUSY, MSL, TXE and BTF flags */
    I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED = (uint16_t)0x0202,  /*!< BUSY and ADDR flags */
    I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED = (uint16_t)0x0682,  /*!< TRA, BUSY, TXE and ADDR flags */
    /* 2) Case of General Call enabled for the slave */
    I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED = (uint16_t)0x1200,  /*!< EV2: GENCALL and BUSY flags */
    /* Slave RECEIVER mode --------------------------*/
    /* --EV2 */
    I2C_EVENT_SLAVE_BYTE_RECEIVED = (uint16_t)0x0240,  /*!< BUSY and RXNE flags */
    /* --EV4  */
    I2C_EVENT_SLAVE_STOP_DETECTED = (uint16_t)0x0010,  /*!< STOPF flag */

    /* Slave TRANSMITTER mode -----------------------*/
    /* --EV3 */
    I2C_EVENT_SLAVE_BYTE_TRANSMITTED = (uint16_t)0x0684,  /*!< TRA, BUSY, TXE and BTF flags */
    I2C_EVENT_SLAVE_BYTE_TRANSMITTING = (uint16_t)0x0680,  /*!< TRA, BUSY and TXE flags */
    /* --EV3_2 */
    I2C_EVENT_SLAVE_ACK_FAILURE = (uint16_t)0x0004  /*!< AF flag */
} I2C_Event_TypeDef;

#define I2C_MAX_STANDARD_FREQ ((uint32_t)100000)
#define I2C_MAX_FAST_FREQ     ((uint32_t)400000)
#if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) 
#define I2C_MAX_INPUT_FREQ     ((uint8_t)24)
#else
#define I2C_MAX_INPUT_FREQ     ((uint8_t)16)
#endif

#define IS_I2C_DUTYCYCLE_OK(DUTY) \
  (((DUTY) == I2C_DUTYCYCLE_2) || \
   ((DUTY) == I2C_DUTYCYCLE_16_9))
#define IS_I2C_ACK_OK(ACK) \
  (((ACK) == I2C_ACK_NONE) || \
   ((ACK) == I2C_ACK_CURR) || \
   ((ACK) == I2C_ACK_NEXT))
#define IS_I2C_ADDMODE_OK(ADDMODE) \
  (((ADDMODE) == I2C_ADDMODE_7BIT) || \
   ((ADDMODE) == I2C_ADDMODE_10BIT))
#define IS_I2C_INTERRUPT_OK(IT) \
  (((IT) == I2C_IT_ERR)     || \
   ((IT) == I2C_IT_EVT)     || \
   ((IT) == I2C_IT_BUF)     || \
   ((IT) == (I2C_IT_ERR | I2C_IT_EVT)) || \
   ((IT) == (I2C_IT_ERR | I2C_IT_BUF)) || \
   ((IT) == (I2C_IT_EVT | I2C_IT_BUF)) || \
   ((IT) == (I2C_IT_EVT | I2C_IT_BUF | I2C_IT_ERR)))
#define IS_I2C_DIRECTION_OK(DIR) \
  (((DIR) == I2C_DIRECTION_TX) || \
   ((DIR) == I2C_DIRECTION_RX))
#define IS_I2C_FLAG_OK(FLAG) \
  (((FLAG) == I2C_FLAG_TXEMPTY)         || \
   ((FLAG) == I2C_FLAG_RXNOTEMPTY)       || \
   ((FLAG) == I2C_FLAG_STOPDETECTION)      || \
   ((FLAG) == I2C_FLAG_HEADERSENT)       || \
   ((FLAG) == I2C_FLAG_TRANSFERFINISHED)   || \
   ((FLAG) == I2C_FLAG_ADDRESSSENTMATCHED)  || \
   ((FLAG) == I2C_FLAG_STARTDETECTION)    || \
   ((FLAG) == I2C_FLAG_WAKEUPFROMHALT)    || \
   ((FLAG) == I2C_FLAG_OVERRUNUNDERRUN)    || \
   ((FLAG) == I2C_FLAG_ACKNOWLEDGEFAILURE)  || \
   ((FLAG) == I2C_FLAG_ARBITRATIONLOSS)    || \
   ((FLAG) == I2C_FLAG_BUSERROR)       || \
   ((FLAG) == I2C_FLAG_GENERALCALL)      || \
   ((FLAG) == I2C_FLAG_TRANSMITTERRECEIVER) || \
   ((FLAG) == I2C_FLAG_BUSBUSY) || \
   ((FLAG) == I2C_FLAG_MASTERSLAVE))
#define IS_I2C_CLEAR_FLAG_OK(FLAG) ((((uint16_t)(FLAG) & (uint16_t)0xFD00) == 0x00) \
                                     && ((uint16_t)(FLAG) != 0x00))
#define IS_I2C_ITPENDINGBIT_OK(ITPENDINGBIT) \
   (((ITPENDINGBIT) == I2C_ITPENDINGBIT_TXEMPTY)   					|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_RXNOTEMPTY) 				|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_STOPDETECTION) 			|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_HEADERSENT) 				|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_TRANSFERFINISHED) 	|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_ADDRESSSENTMATCHED) || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_STARTDETECTION) 		|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_WAKEUPFROMHALT)		 	|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_OVERRUNUNDERRUN) 		|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_ARBITRATIONLOSS) 		|| \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_BUSERROR))
#define IS_I2C_CLEAR_ITPENDINGBIT_OK(ITPENDINGBIT) \
   (((ITPENDINGBIT) == I2C_ITPENDINGBIT_WAKEUPFROMHALT)     || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_OVERRUNUNDERRUN)    || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE) || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_ARBITRATIONLOSS)    || \
    ((ITPENDINGBIT) == I2C_ITPENDINGBIT_BUSERROR))
#define IS_I2C_EVENT_OK(EVENT) (((EVENT) == I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED) || \
                             ((EVENT) == I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED) || \
                             ((EVENT) == I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED) || \
                             ((EVENT) == I2C_EVENT_SLAVE_BYTE_RECEIVED) || \
                             ((EVENT) == (I2C_EVENT_SLAVE_BYTE_RECEIVED | (uint16_t)I2C_FLAG_GENERALCALL)) || \
                             ((EVENT) == I2C_EVENT_SLAVE_BYTE_TRANSMITTED) || \
                             ((EVENT) == (I2C_EVENT_SLAVE_BYTE_TRANSMITTED | (uint16_t)I2C_FLAG_GENERALCALL)) || \
                             ((EVENT) == I2C_EVENT_SLAVE_ACK_FAILURE) || \
                             ((EVENT) == I2C_EVENT_SLAVE_STOP_DETECTED) || \
                             ((EVENT) == I2C_EVENT_MASTER_MODE_SELECT) || \
                             ((EVENT) == I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED) || \
                             ((EVENT) == I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED) || \
                             ((EVENT) == I2C_EVENT_MASTER_BYTE_RECEIVED) || \
                             ((EVENT) == I2C_EVENT_MASTER_BYTE_TRANSMITTED) || \
                             ((EVENT) == I2C_EVENT_MASTER_BYTE_TRANSMITTING) || \
                             ((EVENT) == I2C_EVENT_MASTER_MODE_ADDRESS10))
#define IS_I2C_OWN_ADDRESS_OK(ADDRESS) \
  ((ADDRESS) <= (uint16_t)0x03FF)
#define IS_I2C_ADDRESS_OK(ADD) \
  (((ADD) & (uint8_t)0x01) == (uint8_t)0x00)
#define IS_I2C_INPUT_CLOCK_FREQ_OK(FREQ) \
  (((FREQ) >= (uint8_t)1) && ((FREQ) <= I2C_MAX_INPUT_FREQ))
#define IS_I2C_OUTPUT_CLOCK_FREQ_OK(FREQ) \
  (((FREQ) >= (uint8_t)1) && ((FREQ) <= I2C_MAX_FAST_FREQ))

void I2C_DeInit(void);
void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress,
    I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack,
    I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz);
void I2C_Cmd(uint8_t NewState);
void I2C_GeneralCallCmd(uint8_t NewState);
void I2C_GenerateSTART(uint8_t NewState);
void I2C_GenerateSTOP(uint8_t NewState);
void I2C_SoftwareResetCmd(uint8_t NewState);
void I2C_StretchClockCmd(uint8_t NewState);
void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack);
void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle);
void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, uint8_t NewState);
uint8_t I2C_ReceiveData(void);
void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction);
void I2C_SendData(uint8_t Data);
uint8_t I2C_CheckEvent(I2C_Event_TypeDef I2C_Event);
I2C_Event_TypeDef I2C_GetLastEvent(void);
uint8_t I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag);
void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG);
uint8_t I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit);
void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit);

#endif
