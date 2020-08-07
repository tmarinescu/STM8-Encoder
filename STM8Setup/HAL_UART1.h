//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _UART_H_
#define _UART_H_

#include "main.h"

typedef struct UART1_struct
{
    volatile uint8_t SR;   /*!< UART1 status register */
    volatile uint8_t DR;   /*!< UART1 data register */
    volatile uint8_t BRR1; /*!< UART1 baud rate register */
    volatile uint8_t BRR2; /*!< UART1 DIV mantissa[11:8] SCIDIV fraction */
    volatile uint8_t CR1;  /*!< UART1 control register 1 */
    volatile uint8_t CR2;  /*!< UART1 control register 2 */
    volatile uint8_t CR3;  /*!< UART1 control register 3 */
    volatile uint8_t CR4;  /*!< UART1 control register 4 */
    volatile uint8_t CR5;  /*!< UART1 control register 5 */
    volatile uint8_t GTR;  /*!< UART1 guard time register */
    volatile uint8_t PSCR; /*!< UART1 prescaler register */
}
UART1_TypeDef;

#define UART1 ((UART1_TypeDef *) UART1_BaseAddress)
#define UART1_SR_RESET_VALUE   ((uint8_t)0xC0)
#define UART1_BRR1_RESET_VALUE ((uint8_t)0x00)
#define UART1_BRR2_RESET_VALUE ((uint8_t)0x00)
#define UART1_CR1_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR2_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR3_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR4_RESET_VALUE  ((uint8_t)0x00)
#define UART1_CR5_RESET_VALUE  ((uint8_t)0x00)
#define UART1_GTR_RESET_VALUE  ((uint8_t)0x00)
#define UART1_PSCR_RESET_VALUE ((uint8_t)0x00)

#define UART1_SR_TXE   ((uint8_t)0x80) /*!< Transmit Data Register Empty mask */
#define UART1_SR_TC    ((uint8_t)0x40) /*!< Transmission Complete mask */
#define UART1_SR_RXNE  ((uint8_t)0x20) /*!< Read Data Register Not Empty mask */
#define UART1_SR_IDLE  ((uint8_t)0x10) /*!< IDLE line detected mask */
#define UART1_SR_OR   ((uint8_t)0x08) /*!< OverRun error mask */
#define UART1_SR_NF    ((uint8_t)0x04) /*!< Noise Flag mask */
#define UART1_SR_FE    ((uint8_t)0x02) /*!< Framing Error mask */
#define UART1_SR_PE    ((uint8_t)0x01) /*!< Parity Error mask */

#define UART1_BRR1_DIVM  ((uint8_t)0xFF) /*!< LSB mantissa of UART1DIV [7:0] mask */

#define UART1_BRR2_DIVM  ((uint8_t)0xF0) /*!< MSB mantissa of UART1DIV [11:8] mask */
#define UART1_BRR2_DIVF  ((uint8_t)0x0F) /*!< Fraction bits of UART1DIV [3:0] mask */

#define UART1_CR1_R8      ((uint8_t)0x80) /*!< Receive Data bit 8 */
#define UART1_CR1_T8      ((uint8_t)0x40) /*!< Transmit data bit 8 */
#define UART1_CR1_UARTD   ((uint8_t)0x20) /*!< UART1 Disable (for low power consumption) */
#define UART1_CR1_M       ((uint8_t)0x10) /*!< Word length mask */
#define UART1_CR1_WAKE    ((uint8_t)0x08) /*!< Wake-up method mask */
#define UART1_CR1_PCEN    ((uint8_t)0x04) /*!< Parity Control Enable mask */
#define UART1_CR1_PS      ((uint8_t)0x02) /*!< UART1 Parity Selection */
#define UART1_CR1_PIEN    ((uint8_t)0x01) /*!< UART1 Parity Interrupt Enable mask */

#define UART1_CR2_TIEN    ((uint8_t)0x80) /*!< Transmitter Interrupt Enable mask */
#define UART1_CR2_TCIEN   ((uint8_t)0x40) /*!< Transmission Complete Interrupt Enable mask */
#define UART1_CR2_RIEN    ((uint8_t)0x20) /*!< Receiver Interrupt Enable mask */
#define UART1_CR2_ILIEN   ((uint8_t)0x10) /*!< IDLE Line Interrupt Enable mask */
#define UART1_CR2_TEN     ((uint8_t)0x08) /*!< Transmitter Enable mask */
#define UART1_CR2_REN     ((uint8_t)0x04) /*!< Receiver Enable mask */
#define UART1_CR2_RWU     ((uint8_t)0x02) /*!< Receiver Wake-Up mask */
#define UART1_CR2_SBK     ((uint8_t)0x01) /*!< Send Break mask */

#define UART1_CR3_LINEN   ((uint8_t)0x40) /*!< Alternate Function output mask */
#define UART1_CR3_STOP    ((uint8_t)0x30) /*!< STOP bits [1:0] mask */
#define UART1_CR3_CKEN    ((uint8_t)0x08) /*!< Clock Enable mask */
#define UART1_CR3_CPOL    ((uint8_t)0x04) /*!< Clock Polarity mask */
#define UART1_CR3_CPHA    ((uint8_t)0x02) /*!< Clock Phase mask */
#define UART1_CR3_LBCL    ((uint8_t)0x01) /*!< Last Bit Clock pulse mask */

#define UART1_CR4_LBDIEN  ((uint8_t)0x40) /*!< LIN Break Detection Interrupt Enable mask */
#define UART1_CR4_LBDL    ((uint8_t)0x20) /*!< LIN Break Detection Length mask */
#define UART1_CR4_LBDF    ((uint8_t)0x10) /*!< LIN Break Detection Flag mask */
#define UART1_CR4_ADD     ((uint8_t)0x0F) /*!< Address of the UART1 node mask */

#define UART1_CR5_SCEN    ((uint8_t)0x20) /*!< Smart Card Enable mask */
#define UART1_CR5_NACK    ((uint8_t)0x10) /*!< Smart Card Nack Enable mask */
#define UART1_CR5_HDSEL   ((uint8_t)0x08) /*!< Half-Duplex Selection mask */
#define UART1_CR5_IRLP    ((uint8_t)0x04) /*!< Irda Low Power Selection mask */
#define UART1_CR5_IREN    ((uint8_t)0x02) /*!< Irda Enable mask */

typedef enum {
    UART1_IRDAMODE_NORMAL = (uint8_t)0x00, /**< 0x00 Irda Normal Mode   */
    UART1_IRDAMODE_LOWPOWER = (uint8_t)0x01  /**< 0x01 Irda Low Power Mode */
} UART1_IrDAMode_TypeDef;

typedef enum {
    UART1_WAKEUP_IDLELINE = (uint8_t)0x00, /**< 0x01 Idle Line wake up                */
    UART1_WAKEUP_ADDRESSMARK = (uint8_t)0x08  /**< 0x02 Address Mark wake up          */
} UART1_WakeUp_TypeDef;

typedef enum {
    UART1_LINBREAKDETECTIONLENGTH_10BITS = (uint8_t)0x00, /**< 0x01 10 bits Lin Break detection            */
    UART1_LINBREAKDETECTIONLENGTH_11BITS = (uint8_t)0x01  /**< 0x02 11 bits Lin Break detection          */
} UART1_LINBreakDetectionLength_TypeDef;

typedef enum {
    UART1_STOPBITS_1 = (uint8_t)0x00,    /**< One stop bit is  transmitted at the end of frame*/
    UART1_STOPBITS_0_5 = (uint8_t)0x10,    /**< Half stop bits is transmitted at the end of frame*/
    UART1_STOPBITS_2 = (uint8_t)0x20,    /**< Two stop bits are  transmitted at the end of frame*/
    UART1_STOPBITS_1_5 = (uint8_t)0x30     /**< One and half stop bits*/
} UART1_StopBits_TypeDef;

typedef enum {
    UART1_PARITY_NO = (uint8_t)0x00,      /**< No Parity*/
    UART1_PARITY_EVEN = (uint8_t)0x04,      /**< Even Parity*/
    UART1_PARITY_ODD = (uint8_t)0x06       /**< Odd Parity*/
} UART1_Parity_TypeDef;

typedef enum {
    UART1_SYNCMODE_CLOCK_DISABLE = (uint8_t)0x80, /**< 0x80 Sync mode Disable, SLK pin Disable */
    UART1_SYNCMODE_CLOCK_ENABLE = (uint8_t)0x08, /**< 0x08 Sync mode Enable, SLK pin Enable     */
    UART1_SYNCMODE_CPOL_LOW = (uint8_t)0x40, /**< 0x40 Steady low value on SCLK pin outside transmission window */
    UART1_SYNCMODE_CPOL_HIGH = (uint8_t)0x04, /**< 0x04 Steady high value on SCLK pin outside transmission window */
    UART1_SYNCMODE_CPHA_MIDDLE = (uint8_t)0x20, /**< 0x20 SCLK clock line activated in middle of data bit     */
    UART1_SYNCMODE_CPHA_BEGINING = (uint8_t)0x02, /**< 0x02 SCLK clock line activated at beginning of data bit  */
    UART1_SYNCMODE_LASTBIT_DISABLE = (uint8_t)0x10, /**< 0x10 The clock pulse of the last data bit is not output to the SCLK pin */
    UART1_SYNCMODE_LASTBIT_ENABLE = (uint8_t)0x01  /**< 0x01 The clock pulse of the last data bit is output to the SCLK pin */
} UART1_SyncMode_TypeDef;

typedef enum {
    UART1_WORDLENGTH_8D = (uint8_t)0x00,/**< 0x00 8 bits Data  */
    UART1_WORDLENGTH_9D = (uint8_t)0x10 /**< 0x10 9 bits Data  */
} UART1_WordLength_TypeDef;

typedef enum {
    UART1_MODE_RX_ENABLE = (uint8_t)0x08,  /**< 0x08 Receive Enable */
    UART1_MODE_TX_ENABLE = (uint8_t)0x04,  /**< 0x04 Transmit Enable */
    UART1_MODE_TX_DISABLE = (uint8_t)0x80,  /**< 0x80 Transmit Disable */
    UART1_MODE_RX_DISABLE = (uint8_t)0x40,  /**< 0x40 Single-wire Half-duplex mode */
    UART1_MODE_TXRX_ENABLE = (uint8_t)0x0C  /**< 0x0C Transmit Enable and Receive Enable */
} UART1_Mode_TypeDef;

typedef enum {
    UART1_FLAG_TXE = (uint16_t)0x0080, /*!< Transmit Data Register Empty flag */
    UART1_FLAG_TC = (uint16_t)0x0040, /*!< Transmission Complete flag */
    UART1_FLAG_RXNE = (uint16_t)0x0020, /*!< Read Data Register Not Empty flag */
    UART1_FLAG_IDLE = (uint16_t)0x0010, /*!< Idle line detected flag */
    UART1_FLAG_OR = (uint16_t)0x0008, /*!< OverRun error flag */
    UART1_FLAG_NF = (uint16_t)0x0004, /*!< Noise error flag */
    UART1_FLAG_FE = (uint16_t)0x0002, /*!< Framing Error flag */
    UART1_FLAG_PE = (uint16_t)0x0001, /*!< Parity Error flag */
    UART1_FLAG_LBDF = (uint16_t)0x0210, /*!< Line Break Detection Flag */
    UART1_FLAG_SBK = (uint16_t)0x0101  /*!< Send Break characters Flag */
} UART1_Flag_TypeDef;

typedef enum {
    UART1_IT_TXE = (uint16_t)0x0277, /*!< Transmit interrupt */
    UART1_IT_TC = (uint16_t)0x0266, /*!< Transmission Complete interrupt */
    UART1_IT_RXNE = (uint16_t)0x0255, /*!< Receive interrupt */
    UART1_IT_IDLE = (uint16_t)0x0244, /*!< IDLE line interrupt */
    UART1_IT_OR = (uint16_t)0x0235, /*!< Overrun Error interrupt */
    UART1_IT_PE = (uint16_t)0x0100, /*!< Parity Error interrupt */
    UART1_IT_LBDF = (uint16_t)0x0346, /**< LIN break detection interrupt */
    UART1_IT_RXNE_OR = (uint16_t)0x0205  /*!< Receive/Overrun interrupt */
} UART1_IT_TypeDef;

#define UART1_ADDRESS_MAX ((uint8_t)16)
#define CLK_PCKENR1_UART1    ((uint8_t)0x04) /*!< UART1 clock enable */

void UART1_DeInit(void);
void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
    UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity,
    UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode);
void UART1_Cmd(uint8_t NewState);
void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, uint8_t NewState);
void UART1_HalfDuplexCmd(uint8_t NewState);
void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode);
void UART1_IrDACmd(uint8_t NewState);
void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength);
void UART1_LINCmd(uint8_t NewState);
void UART1_SmartCardCmd(uint8_t NewState);
void UART1_SmartCardNACKCmd(uint8_t NewState);
void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp);
void UART1_ReceiverWakeUpCmd(uint8_t NewState);
uint8_t UART1_ReceiveData8(void);
uint16_t UART1_ReceiveData9(void);
void UART1_SendData8(uint8_t Data);
void UART1_SendData9(uint16_t Data);
void UART1_SendBreak(void);
void UART1_SetAddress(uint8_t UART1_Address);
void UART1_SetGuardTime(uint8_t UART1_GuardTime);
void UART1_SetPrescaler(uint8_t UART1_Prescaler);
uint8_t UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG);
void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG);
uint8_t UART1_GetITStatus(UART1_IT_TypeDef UART1_IT);
void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT);

#endif
