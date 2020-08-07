//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: July 10th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#ifndef _HAL_CAN_H_
#define _HAL_CAN_H_

#include "main.h"

#define CAN_STDID_SIZE ((uint16_t)0x07FF)
#define CAN_EXTID_SIZE ((uint32_t)0x1FFFFFFF)
#define CAN_DLC_MAX ((uint8_t)0x08)

typedef struct
{
    volatile uint8_t MCR;    /*!< CAN master control register */
    volatile uint8_t MSR;    /*!< CAN master status register */
    volatile uint8_t TSR;    /*!< CAN transmit status register */
    volatile uint8_t TPR;    /*!< CAN transmit priority register */
    volatile uint8_t RFR;    /*!< CAN receive FIFO register */
    volatile uint8_t IER;    /*!< CAN interrupt enable register */
    volatile uint8_t DGR;    /*!< CAN diagnosis register */
    volatile uint8_t PSR;    /*!< CAN page selection register */

    union
    {
        struct
        {
            volatile uint8_t MCSR;
            volatile uint8_t MDLCR;
            volatile uint8_t MIDR1;
            volatile uint8_t MIDR2;
            volatile uint8_t MIDR3;
            volatile uint8_t MIDR4;
            volatile uint8_t MDAR1;
            volatile uint8_t MDAR2;
            volatile uint8_t MDAR3;
            volatile uint8_t MDAR4;
            volatile uint8_t MDAR5;
            volatile uint8_t MDAR6;
            volatile uint8_t MDAR7;
            volatile uint8_t MDAR8;
            volatile uint8_t MTSRL;
            volatile uint8_t MTSRH;
        }
        TxMailbox;

        struct
        {
            volatile uint8_t FR01;
            volatile uint8_t FR02;
            volatile uint8_t FR03;
            volatile uint8_t FR04;
            volatile uint8_t FR05;
            volatile uint8_t FR06;
            volatile uint8_t FR07;
            volatile uint8_t FR08;

            volatile uint8_t FR09;
            volatile uint8_t FR10;
            volatile uint8_t FR11;
            volatile uint8_t FR12;
            volatile uint8_t FR13;
            volatile uint8_t FR14;
            volatile uint8_t FR15;
            volatile uint8_t FR16;
        }
        Filter;


        struct
        {
            volatile uint8_t F0R1;
            volatile uint8_t F0R2;
            volatile uint8_t F0R3;
            volatile uint8_t F0R4;
            volatile uint8_t F0R5;
            volatile uint8_t F0R6;
            volatile uint8_t F0R7;
            volatile uint8_t F0R8;

            volatile uint8_t F1R1;
            volatile uint8_t F1R2;
            volatile uint8_t F1R3;
            volatile uint8_t F1R4;
            volatile uint8_t F1R5;
            volatile uint8_t F1R6;
            volatile uint8_t F1R7;
            volatile uint8_t F1R8;
        }
        Filter01;

        struct
        {
            volatile uint8_t F2R1;
            volatile uint8_t F2R2;
            volatile uint8_t F2R3;
            volatile uint8_t F2R4;
            volatile uint8_t F2R5;
            volatile uint8_t F2R6;
            volatile uint8_t F2R7;
            volatile uint8_t F2R8;

            volatile uint8_t F3R1;
            volatile uint8_t F3R2;
            volatile uint8_t F3R3;
            volatile uint8_t F3R4;
            volatile uint8_t F3R5;
            volatile uint8_t F3R6;
            volatile uint8_t F3R7;
            volatile uint8_t F3R8;
        }
        Filter23;

        struct
        {
            volatile uint8_t F4R1;
            volatile uint8_t F4R2;
            volatile uint8_t F4R3;
            volatile uint8_t F4R4;
            volatile uint8_t F4R5;
            volatile uint8_t F4R6;
            volatile uint8_t F4R7;
            volatile uint8_t F4R8;

            volatile uint8_t F5R1;
            volatile uint8_t F5R2;
            volatile uint8_t F5R3;
            volatile uint8_t F5R4;
            volatile uint8_t F5R5;
            volatile uint8_t F5R6;
            volatile uint8_t F5R7;
            volatile uint8_t F5R8;
        }
        Filter45;

        struct
        {
            volatile uint8_t ESR;
            volatile uint8_t EIER;
            volatile uint8_t TECR;
            volatile uint8_t RECR;
            volatile uint8_t BTR1;
            volatile uint8_t BTR2;
            uint8_t Reserved1[2];
            volatile uint8_t FMR1;
            volatile uint8_t FMR2;
            volatile uint8_t FCR1;
            volatile uint8_t FCR2;
            volatile uint8_t FCR3;
            uint8_t Reserved2[3];
        }
        Config;

        struct
        {
            volatile uint8_t MFMI;
            volatile uint8_t MDLCR;
            volatile uint8_t MIDR1;
            volatile uint8_t MIDR2;
            volatile uint8_t MIDR3;
            volatile uint8_t MIDR4;
            volatile uint8_t MDAR1;
            volatile uint8_t MDAR2;
            volatile uint8_t MDAR3;
            volatile uint8_t MDAR4;
            volatile uint8_t MDAR5;
            volatile uint8_t MDAR6;
            volatile uint8_t MDAR7;
            volatile uint8_t MDAR8;
            volatile uint8_t MTSRL;
            volatile uint8_t MTSRH;
        }
        RxFIFO;
    }Page;
} CAN_TypeDef;

#define CAN ((CAN_TypeDef *) CAN_BaseAddress)

#define CAN_MCR_INRQ     ((uint8_t)0x01)
#define CAN_MCR_SLEEP    ((uint8_t)0x02)
#define CAN_MCR_TXFP     ((uint8_t)0x04)
#define CAN_MCR_RFLM     ((uint8_t)0x08)
#define CAN_MCR_NART     ((uint8_t)0x10)
#define CAN_MCR_AWUM     ((uint8_t)0x20)
#define CAN_MCR_ABOM     ((uint8_t)0x40)
#define CAN_MCR_TTCM     ((uint8_t)0x80)
#define CAN_MSR_INAK     ((uint8_t)0x01)
#define CAN_MSR_SLAK     ((uint8_t)0x02)
#define CAN_MSR_ERRI     ((uint8_t)0x04)
#define CAN_MSR_WKUI     ((uint8_t)0x08)
#define CAN_MSR_TX       ((uint8_t)0x10)
#define CAN_MSR_RX       ((uint8_t)0x20)
#define CAN_TSR_RQCP0    ((uint8_t)0x01)
#define CAN_TSR_RQCP1    ((uint8_t)0x02)
#define CAN_TSR_RQCP2    ((uint8_t)0x04)
#define CAN_TSR_RQCP012  ((uint8_t)0x07)
#define CAN_TSR_TXOK0    ((uint8_t)0x10)
#define CAN_TSR_TXOK1    ((uint8_t)0x20)
#define CAN_TSR_TXOK2    ((uint8_t)0x40)
#define CAN_TPR_CODE0    ((uint8_t)0x01)
#define CAN_TPR_TME0     ((uint8_t)0x04)
#define CAN_TPR_TME1     ((uint8_t)0x08)
#define CAN_TPR_TME2     ((uint8_t)0x10)
#define CAN_TPR_LOW0     ((uint8_t)0x20)
#define CAN_TPR_LOW1     ((uint8_t)0x40)
#define CAN_TPR_LOW2     ((uint8_t)0x80)
#define CAN_RFR_FMP01  ((uint8_t)0x03)
#define CAN_RFR_FULL   ((uint8_t)0x08)
#define CAN_RFR_FOVR   ((uint8_t)0x10)
#define CAN_RFR_RFOM   ((uint8_t)0x20)
#define CAN_IER_TMEIE  ((uint8_t)0x01)
#define CAN_IER_FMPIE  ((uint8_t)0x02)
#define CAN_IER_FFIE   ((uint8_t)0x04)
#define CAN_IER_FOVIE  ((uint8_t)0x08)
#define CAN_IER_WKUIE  ((uint8_t)0x80)
#define CAN_DGR_LBKM  ((uint8_t)0x01)
#define CAN_DGR_SLIM  ((uint8_t)0x02)
#define CAN_DGR_SAMP  ((uint8_t)0x04)
#define CAN_DGR_RX    ((uint8_t)0x08)
#define CAN_DGR_TXM2E ((uint8_t)0x10)
#define CAN_PSR_PS0  ((uint8_t)0x01)
#define CAN_PSR_PS1  ((uint8_t)0x02)
#define CAN_PSR_PS2  ((uint8_t)0x04)
#define CAN_MCSR_TXRQ    ((uint8_t)0x01)
#define CAN_MCSR_ABRQ    ((uint8_t)0x02)
#define CAN_MCSR_RQCP    ((uint8_t)0x04)
#define CAN_MCSR_TXOK    ((uint8_t)0x08)
#define CAN_MCSR_ALST    ((uint8_t)0x10)
#define CAN_MCSR_TERR    ((uint8_t)0x20)
#define CAN_MDLCR_DLC    ((uint8_t)0x0F)
#define CAN_MDLCR_TGT    ((uint8_t)0x80)
#define CAN_MIDR1_RTR    ((uint8_t)0x20)
#define CAN_MIDR1_IDE    ((uint8_t)0x40)
#define CAN_ESR_EWGF     ((uint8_t)0x01)
#define CAN_ESR_EPVF     ((uint8_t)0x02)
#define CAN_ESR_BOFF     ((uint8_t)0x04)
#define CAN_ESR_LEC0     ((uint8_t)0x10)
#define CAN_ESR_LEC1     ((uint8_t)0x20)
#define CAN_ESR_LEC2     ((uint8_t)0x40)
#define CAN_ESR_LEC      ((uint8_t)0x70)
#define CAN_EIER_EWGIE    ((uint8_t)0x01)
#define CAN_EIER_EPVIE    ((uint8_t)0x02)
#define CAN_EIER_BOFIE    ((uint8_t)0x04)
#define CAN_EIER_LECIE    ((uint8_t)0x10)
#define CAN_EIER_ERRIE    ((uint8_t)0x80)    
#define CAN_TECR_TEC0     ((uint8_t)0x01)    
#define CAN_TECR_TEC1     ((uint8_t)0x02)    
#define CAN_TECR_TEC2     ((uint8_t)0x04)    
#define CAN_TECR_TEC3     ((uint8_t)0x08)    
#define CAN_TECR_TEC4     ((uint8_t)0x10)    
#define CAN_TECR_TEC5     ((uint8_t)0x20)    
#define CAN_TECR_TEC6     ((uint8_t)0x40)    
#define CAN_TECR_TEC7     ((uint8_t)0x80)    
#define CAN_RECR_REC0     ((uint8_t)0x01)    
#define CAN_RECR_REC1     ((uint8_t)0x02)    
#define CAN_RECR_REC2     ((uint8_t)0x04)    
#define CAN_RECR_REC3     ((uint8_t)0x08)    
#define CAN_RECR_REC4     ((uint8_t)0x10)    
#define CAN_RECR_REC5     ((uint8_t)0x20)    
#define CAN_RECR_REC6     ((uint8_t)0x40)    
#define CAN_RECR_REC7     ((uint8_t)0x80)    
#define CAN_FMR1_FML0     ((uint8_t)0x01)    
#define CAN_FMR1_FMH0     ((uint8_t)0x02)    
#define CAN_FMR1_FML1     ((uint8_t)0x04)    
#define CAN_FMR1_FMH1     ((uint8_t)0x08)    
#define CAN_FMR1_FML2     ((uint8_t)0x10)    
#define CAN_FMR1_FMH2     ((uint8_t)0x20)    
#define CAN_FMR1_FML3     ((uint8_t)0x40)    
#define CAN_FMR1_FMH3     ((uint8_t)0x80)    
#define CAN_FMR2_FML4     ((uint8_t)0x01)    
#define CAN_FMR2_FMH4     ((uint8_t)0x02)    
#define CAN_FMR2_FML5     ((uint8_t)0x04)    
#define CAN_FMR2_FMH5     ((uint8_t)0x08)    
#define CAN_FCR1_FACT0     ((uint8_t)0x01)    
#define CAN_FCR1_FACT1     ((uint8_t)0x10)    
#define CAN_FCR2_FACT2     ((uint8_t)0x01)    
#define CAN_FCR2_FACT3     ((uint8_t)0x10)    
#define CAN_FCR3_FACT4     ((uint8_t)0x01)    
#define CAN_FCR3_FACT5     ((uint8_t)0x10)    
#define CAN_FCR1_FSC00    ((uint8_t)0x02)    
#define CAN_FCR1_FSC01    ((uint8_t)0x04)    
#define CAN_FCR1_FSC10    ((uint8_t)0x20)    
#define CAN_FCR1_FSC11    ((uint8_t)0x40)    
#define CAN_FCR2_FSC20    ((uint8_t)0x02)    
#define CAN_FCR2_FSC21    ((uint8_t)0x04)    
#define CAN_FCR2_FSC30    ((uint8_t)0x20)    
#define CAN_FCR2_FSC31    ((uint8_t)0x40)    
#define CAN_FCR3_FSC40    ((uint8_t)0x02)    
#define CAN_FCR3_FSC41    ((uint8_t)0x04)    
#define CAN_FCR3_FSC50    ((uint8_t)0x20)    
#define CAN_FCR3_FSC51    ((uint8_t)0x40)
#define CAN_MCR_RESET_VALUE		((uint8_t)0x02)
#define CAN_MSR_RESET_VALUE		((uint8_t)0x02)
#define CAN_TSR_RESET_VALUE		((uint8_t)0x00)
#define CAN_TPR_RESET_VALUE		((uint8_t)0x0C)
#define CAN_RFR_RESET_VALUE		((uint8_t)0x00)
#define CAN_IER_RESET_VALUE		((uint8_t)0x00)
#define CAN_DGR_RESET_VALUE		((uint8_t)0x0C)
#define CAN_PSR_RESET_VALUE		((uint8_t)0x00)
#define CAN_ESR_RESET_VALUE		((uint8_t)0x00)
#define CAN_EIER_RESET_VALUE	((uint8_t)0x00)
#define CAN_TECR_RESET_VALUE	((uint8_t)0x00)
#define CAN_RECR_RESET_VALUE	((uint8_t)0x00)
#define CAN_BTR1_RESET_VALUE	((uint8_t)0x40)
#define CAN_BTR2_RESET_VALUE	((uint8_t)0x23)
#define CAN_FMR1_RESET_VALUE	((uint8_t)0x00)
#define CAN_FMR2_RESET_VALUE	((uint8_t)0x00)
#define CAN_FCR_RESET_VALUE		((uint8_t)0x00)
#define CAN_MFMI_RESET_VALUE	((uint8_t)0x00)
#define CAN_MDLC_RESET_VALUE	((uint8_t)0x00)
#define CAN_MCSR_RESET_VALUE	((uint8_t)0x00)

typedef enum
{
	CAN_Page_TxMailBox0 = ((uint8_t)0), /*!< CAN TX mailbox 0 reg page */
	CAN_Page_TxMailBox1 = ((uint8_t)1), /*!< CAN TX mailbox 1 reg page */
	CAN_Page_TxMailBox2 = ((uint8_t)5), /*!< CAN TX mailbox 2 reg page */
	CAN_Page_Filter01 = ((uint8_t)2), /*!< CAN Filters 0 & 1 reg page*/
	CAN_Page_Filter23 = ((uint8_t)3), /*!< CAN Filters 2 & 3 reg page*/
	CAN_Page_Filter45 = ((uint8_t)4), /*!< CAN Filters 4 & 5 reg page*/
	CAN_Page_Config = ((uint8_t)6), /*!< CAN Configuration control/status reg page*/
	CAN_Page_RxFifo = ((uint8_t)7) /*!< CAN RX FIFO registers page */
} CAN_Page_TypeDef;

typedef enum
{
	CAN_InitStatus_Failed = 0,                        /*!< CAN initialization failed */
	CAN_InitStatus_Success = !CAN_InitStatus_Failed  /*!< CAN initialization OK*/
} CAN_InitStatus_TypeDef;

typedef enum
{
	CAN_OperatingMode_Initialization = ((uint8_t)0x00),    /*!< Initialization mode */
	CAN_OperatingMode_Normal = ((uint8_t)0x01),    /*!< Normal mode */
	CAN_OperatingMode_Sleep = ((uint8_t)0x02)    /*!< sleep mode */
} CAN_OperatingMode_TypeDef;

typedef enum
{
	CAN_ModeStatus_Failed = ((uint8_t)0x00),          /*!< CAN entring the specific mode failed */
	CAN_ModeStatus_Success = !CAN_ModeStatus_Failed   /*!< CAN entring the specific mode Succeed */
} CAN_ModeStatus_TypeDef;

typedef enum
{
    CAN_MasterCtrl_AllDisabled = ((uint8_t)0x00),  /*!<  CAN  ALL Master Control Option are DISABLED */
    CAN_MasterCtrl_AllEnabled = ((uint8_t)0xFC),  /*!<  CAN  ALL Master Control Option are DISABLED */
    CAN_MasterCtrl_TimeTriggerCOMMode = ((uint8_t)0x80),  /*!<  CAN Time Triggered Communication mode ENABLED */
    CAN_MasterCtrl_AutoBusOffManagement = ((uint8_t)0x40),  /*!<  CAN Auto Bus Off Management ENABLED */
    CAN_MasterCtrl_AutoWakeUpMode = ((uint8_t)0x20),  /*!<  CAN Automatic WakeUp Mode ENABLED , sleep mode is left automatically by hardware  */
    CAN_MasterCtrl_NoAutoReTx = ((uint8_t)0x10),  /*!<  CAN Non Automatic Retransmission ENABLED, MSG  will be transmitted only once */
    CAN_MasterCtrl_RxFifoLockedMode = ((uint8_t)0x08),  /*!<  CAN Recieve FIFO Locked  against overrun ENABLED */
    CAN_MasterCtrl_TxFifoPriority = ((uint8_t)0x04)   /*!<  CAN Transmit FIFO Priority  driven by the request order (not by the identifier of the MSG) */
}CAN_MasterCtrl_TypeDef;

/**
  * @brief   CAN  mode options */
typedef enum
{
    CAN_Mode_Normal = ((uint8_t)0x00),  /*!< normal mode */
    CAN_Mode_LoopBack = ((uint8_t)0x01),  /*!< loopback mode */
    CAN_Mode_Silent = ((uint8_t)0x02),  /*!< silent mode */
    CAN_Mode_Silent_LoopBack = ((uint8_t)0x03)  /*!< loopback combined with silent mode */
}CAN_Mode_TypeDef;

/**
  * @brief  CAN synchronisation jump width (SJW)*/
typedef enum
{
    CAN_SynJumpWidth_1TimeQuantum = ((uint8_t)0x00),  /*!< 1 time quantum */
    CAN_SynJumpWidth_2TimeQuantum = ((uint8_t)0x40),  /*!< 2 time quantum */
    CAN_SynJumpWidth_3TimeQuantum = ((uint8_t)0x80),  /*!< 3 time quantum */
    CAN_SynJumpWidth_4TimeQuantum = ((uint8_t)0xC0)  /*!< 4 time quantum */
}CAN_SynJumpWidth_TypeDef;

/**
  * @brief   time quantum in bit segment 1 */
typedef enum
{
    CAN_BitSeg1_1TimeQuantum = ((uint8_t)0x00),  /*!< 1 time quantum */
    CAN_BitSeg1_2TimeQuantum = ((uint8_t)0x01),  /*!< 2 time quantum */
    CAN_BitSeg1_3TimeQuantum = ((uint8_t)0x02),  /*!< 3 time quantum */
    CAN_BitSeg1_4TimeQuantum = ((uint8_t)0x03), /*!< 4 time quantum */
    CAN_BitSeg1_5TimeQuantum = ((uint8_t)0x04), /*!< 5 time quantum */
    CAN_BitSeg1_6TimeQuantum = ((uint8_t)0x05), /*!< 6 time quantum */
    CAN_BitSeg1_7TimeQuantum = ((uint8_t)0x06), /*!< 7 time quantum */
    CAN_BitSeg1_8TimeQuantum = ((uint8_t)0x07),  /*!< 8 time quantum */
    CAN_BitSeg1_9TimeQuantum = ((uint8_t)0x08),  /*!< 9 time quantum */
    CAN_BitSeg1_10TimeQuantum = ((uint8_t)0x09),  /*!< 10 time quantum */
    CAN_BitSeg1_11TimeQuantum = ((uint8_t)0x0A),  /*!< 11 time quantum */
    CAN_BitSeg1_12TimeQuantum = ((uint8_t)0x0B),  /*!< 12 time quantum */
    CAN_BitSeg1_13TimeQuantum = ((uint8_t)0x0C),  /*!< 13 time quantum */
    CAN_BitSeg1_14TimeQuantum = ((uint8_t)0x0D),  /*!< 14 time quantum */
    CAN_BitSeg1_15TimeQuantum = ((uint8_t)0x0E),  /*!< 15 time quantum */
    CAN_BitSeg1_16TimeQuantum = ((uint8_t)0x0F)  /*!< 16 time quantum */
}CAN_BitSeg1_TypeDef;

/**
  * @brief   time quantum in bit segment 2 */
typedef enum
{
    CAN_BitSeg2_1TimeQuantum = ((uint8_t)0x00),  /*!< 1 time quantum */
    CAN_BitSeg2_2TimeQuantum = ((uint8_t)0x10),  /*!< 2 time quantum */
    CAN_BitSeg2_3TimeQuantum = ((uint8_t)0x20),  /*!< 3 time quantum */
    CAN_BitSeg2_4TimeQuantum = ((uint8_t)0x30),  /*!< 4 time quantum */
    CAN_BitSeg2_5TimeQuantum = ((uint8_t)0x40),  /*!< 5 time quantum */
    CAN_BitSeg2_6TimeQuantum = ((uint8_t)0x50),  /*!< 6 time quantum */
    CAN_BitSeg2_7TimeQuantum = ((uint8_t)0x60),  /*!< 7 time quantum */
    CAN_BitSeg2_8TimeQuantum = ((uint8_t)0x70)   /*!< 8 time quantum */
}CAN_BitSeg2_TypeDef;


/**
  * @brief   CAN filter number */
typedef enum
{
    CAN_FilterNumber_0 = ((uint8_t)0x00),  /*!< Filter number 0 */
    CAN_FilterNumber_1 = ((uint8_t)0x01),  /*!< Filter number 1 */
    CAN_FilterNumber_2 = ((uint8_t)0x02),  /*!< Filter number 2 */
    CAN_FilterNumber_3 = ((uint8_t)0x03),  /*!< Filter number 3 */
    CAN_FilterNumber_4 = ((uint8_t)0x04),  /*!< Filter number 4 */
    CAN_FilterNumber_5 = ((uint8_t)0x05)   /*!< Filter number 5 */
}CAN_FilterNumber_TypeDef;

/**
  * @brief   CAN filter mode */
typedef enum
{
    CAN_FilterMode_IdMask = ((uint8_t)0x00),    /*!< id/mask mode */
    CAN_FilterMode_IdMask_IdList = ((uint8_t)0x10),    /*!< Id/Mask mode First and IdList mode second */
    CAN_FilterMode_IdList_IdMask = ((uint8_t)0x11),    /*!< IdList mode First and IdMask mode second */
    CAN_FilterMode_IdList = ((uint8_t)0x01)     /*!< identifier list mode */
}CAN_FilterMode_TypeDef;

/**
  * @brief   CAN filter scale */
typedef enum
{
    CAN_FilterScale_8Bit = ((uint8_t)0x00), /*!< 8-bit filter scale */
    CAN_FilterScale_16_8Bit = ((uint8_t)0x02), /*!< 16/8-bit filter scale */
    CAN_FilterScale_16Bit = ((uint8_t)0x04), /*!< 16-bit filter scale */
    CAN_FilterScale_32Bit = ((uint8_t)0x06)  /*!< 32-bit filter scale */
}CAN_FilterScale_TypeDef;


/**
  * @brief   CAN Tx mailboxes*/
typedef enum
{
    CAN_TransmitMailBox_0 = ((uint8_t)0x00),  /*!< CAN TX mailbox 0 reg page */
    CAN_TransmitMailBox_1 = ((uint8_t)0x01),  /*!< CAN TX mailbox 1 reg page */
    CAN_TransmitMailBox_2 = ((uint8_t)0x05)   /*!< CAN TX mailbox 2 reg page */
}CAN_TransmitMailBox_TypeDef;

/**
  * @brief   CAN Pending Messages number*/
typedef enum
{
    CAN_NbrPendingMessage_0 = ((uint8_t)0x00),  /*!< No Msg Pending */
    CAN_NbrPendingMessage_1 = ((uint8_t)0x01),  /*!< 1 Msg Pending */
    CAN_NbrPendingMessage_2 = ((uint8_t)0x02),  /*!< 2 Msg Pending */
    CAN_NbrPendingMessage_3 = ((uint8_t)0x03)  /*!< 3 Msg Pending */
}CAN_NbrPendingMessage_TypeDef;

/**
  * @brief   CAN identifier type */
typedef enum
{
    CAN_Id_Standard = ((uint8_t)0x00),  /*!< Standard Id */
    CAN_Id_Extended = ((uint8_t)0x40)  /*!< Extended Id */
}CAN_Id_TypeDef;

/**
  * @brief   CAN remote transmission request */
typedef enum
{
    CAN_RTR_Data = ((uint8_t)0x00),  /*!< Data frame */
    CAN_RTR_Remote = ((uint8_t)0x20)  /*!< Remote frame */
}CAN_RTR_TypeDef;

/**
  * @brief   CAN transmit Status */
typedef enum
{
    CAN_TxStatus_Failed = ((uint8_t)0xF0), /*!< CAN transmission failed */
    CAN_TxStatus_Ok = ((uint8_t)0xF1), /*!< CAN transmission succeeded */
    CAN_TxStatus_Pending = ((uint8_t)0xF2), /*!< CAN transmission pending */
    CAN_TxStatus_NoMailBox = ((uint8_t)0xF4), /*!< CAN cell did not provide an empty mailbox */
    CAN_TxStatus_MailBoxEmpty = ((uint8_t)0xF5), /*!< CAN Tx mailbox is Empty */
    CAN_TxStatus_MailBox0Ok = ((uint8_t)0x00), /*!< CAN transmission succeeded by mail box 1*/
    CAN_TxStatus_MailBox1Ok = ((uint8_t)0x01), /*!< CAN transmission succeeded by mail box 2*/
    CAN_TxStatus_MailBox2Ok = ((uint8_t)0x05) /*!< CAN transmission succeeded by mail box 3*/
}CAN_TxStatus_TypeDef;

/**
  * @brief   CAN sleep Status */
typedef enum
{
    CAN_Sleep_Failed = ((uint8_t)0x00), /*!< CAN did not enter the sleep mode */
    CAN_Sleep_Ok = ((uint8_t)0x01) /*!< CAN entered the sleep mode */
}CAN_Sleep_TypeDef;
/**
  * @brief   CAN wake up status */
typedef enum
{
    CAN_WakeUp_Failed = ((uint8_t)0x00), /*!< CAN did not leave the sleep mode */
    CAN_WakeUp_Ok = ((uint8_t)0x01) /*!< CAN leaved the sleep mode */
}CAN_WakeUp_TypeDef;

/**
  * @brief   CAN flags */
typedef enum
{
    /* if the flag is 0x3XXX, it means that it can be got (CAN_GetFlagStatus) and Cleared (CAN_ClearFlag) */
    /* if the flag is 0x1XXX, it means that it can only be got (CAN_GetFlagStatus)  */
    /*Transmit Flags*/
    CAN_FLAG_RQCP0 = ((uint16_t)0x3401), /*!< Request MailBox0  Flag */
    CAN_FLAG_RQCP1 = ((uint16_t)0x3402), /*!< Request MailBox1  Flag */
    CAN_FLAG_RQCP2 = ((uint16_t)0x3404), /*!< Request MailBox2  Flag */
    /*Receive Flags*/
    CAN_FLAG_FMP = ((uint16_t)0x1203), /*!< FIFO Message Pending Flag */
    CAN_FLAG_FF = ((uint16_t)0x3208), /*!< FIFO Full  Flag */
    CAN_FLAG_FOV = ((uint16_t)0x3210), /*!< FIFO Overrun  Flag */
    /*Wake up Flag*/
    CAN_FLAG_WKU = ((uint16_t)0x3108), /*!< wake up   Flag */
    /*Error Flags*/
    CAN_FLAG_EWG = ((uint16_t)0x1001), /*!< Error Warning Flag */
    CAN_FLAG_EPV = ((uint16_t)0x1002), /*!< Error Passive Flag */
    CAN_FLAG_BOF = ((uint16_t)0x1004), /*!< Bus-Off Flag */
    CAN_FLAG_LEC = ((uint16_t)0x3070) /*!< Last error code Flag */
}CAN_FLAG_TypeDef;

typedef enum
{
    CAN_IT_TME = ((uint16_t)0x0001),
    CAN_IT_FMP = ((uint16_t)0x0002),
    CAN_IT_FF = ((uint16_t)0x0004),
    CAN_IT_FOV = ((uint16_t)0x0008),
    CAN_IT_WKU = ((uint16_t)0x0080),
    CAN_IT_ERR = ((uint16_t)0x4000),
    CAN_IT_EWG = ((uint16_t)0x0100),
    CAN_IT_EPV = ((uint16_t)0x0200),
    CAN_IT_BOF = ((uint16_t)0x0400),
    CAN_IT_LEC = ((uint16_t)0x0800)
} CAN_IT_TypeDef;

typedef enum
{
    CAN_ST7Compatibility_Enable = ((uint8_t)0x00),
    CAN_ST7Compatibility_Disable = ((uint8_t)0x10)
}CAN_ST7Compatibility_TypeDef;

typedef enum
{
    CAN_ErrorCode_NoErr = ((uint8_t)0x00),
    CAN_ErrorCode_StuffErr = ((uint8_t)0x10),
    CAN_ErrorCode_FormErr = ((uint8_t)0x20),
    CAN_ErrorCode_ACKErr = ((uint8_t)0x30),
    CAN_ErrorCode_BitRecessiveErr = ((uint8_t)0x40),
    CAN_ErrorCode_BitDominantErr = ((uint8_t)0x50), 
    CAN_ErrorCode_CRCErr = ((uint8_t)0x60),
    CAN_ErrorCode_SoftwareSetErr = ((uint8_t)0x70) 
}CAN_ErrorCode_TypeDef;

#define IS_CAN_ST7_COMPATIBILITY_OK(STATE) (((STATE) == CAN_ST7Compatibility_Enable) || ((STATE) == CAN_ST7Compatibility_Disable))

#define IS_CAN_OPERATINGMODE_OK(MODE) (((MODE) == CAN_OperatingMode_Initialization) ||\
                                    ((MODE) == CAN_OperatingMode_Normal)|| \
                        ((MODE) == CAN_OperatingMode_Sleep))

#define IS_CAN_MASTERCTRL_OK(MODE) (((MODE) == CAN_MasterCtrl_AllDisabled) || \
                                    (((MODE) <= CAN_MasterCtrl_AllEnabled) && ((MODE) >= CAN_MasterCtrl_TxFifoPriority)))

#define IS_CAN_MODE_OK(MODE) (((MODE) == CAN_Mode_Normal) || ((MODE) == CAN_Mode_LoopBack)|| \
                           ((MODE) == CAN_Mode_Silent) || ((MODE) == CAN_Mode_Silent_LoopBack))

#define IS_CAN_SYNJUMPWIDTH_OK(SJW) (((SJW) == CAN_SynJumpWidth_1TimeQuantum) || ((SJW) == CAN_SynJumpWidth_2TimeQuantum)|| \
                         ((SJW) == CAN_SynJumpWidth_3TimeQuantum) || ((SJW) == CAN_SynJumpWidth_4TimeQuantum))

#define IS_CAN_BITSEG1_OK(BS1) ((BS1) <= CAN_BitSeg1_16TimeQuantum)

#define IS_CAN_BITSEG2_OK(BS2) ((((BS2) >= CAN_BitSeg2_2TimeQuantum) && ((BS2) <= CAN_BitSeg2_8TimeQuantum))|| ((BS2) == CAN_BitSeg2_1TimeQuantum))

#define IS_CAN_PRESCALER_OK(PRESCALER) (((PRESCALER) >= 1) && ((PRESCALER) <= 64))

#define IS_CAN_FILTER_NUMBER_OK(NUMBER) (((NUMBER) == CAN_FilterNumber_0) || \
                                       ((NUMBER) == CAN_FilterNumber_1) || \
                                       ((NUMBER) == CAN_FilterNumber_2) || \
                                       ((NUMBER) == CAN_FilterNumber_3) || \
                                       ((NUMBER) == CAN_FilterNumber_4) || \
                                       ((NUMBER) == CAN_FilterNumber_5))

#define IS_CAN_FILTER_MODE_OK(MODE) (((MODE) == CAN_FilterMode_IdMask) || \
                                     ((MODE) == CAN_FilterMode_IdMask_IdList) || \
                                     ((MODE) == CAN_FilterMode_IdList_IdMask) || \
                                  ((MODE) == CAN_FilterMode_IdList))

#define IS_CAN_FILTER_SCALE_OK(SCALE) (((SCALE) == CAN_FilterScale_8Bit)|| \
                                    ((SCALE) == CAN_FilterScale_16_8Bit) ||\
                                    ((SCALE) == CAN_FilterScale_16Bit  )||\
                                    ((SCALE) == CAN_FilterScale_32Bit))

#define IS_CAN_TRANSMITMAILBOX_OK(TRANSMITMAILBOX) (((TRANSMITMAILBOX) == CAN_TransmitMailBox_0) || \
                                                 ((TRANSMITMAILBOX) == CAN_TransmitMailBox_1) || \
                                                 ((TRANSMITMAILBOX) == CAN_TransmitMailBox_2))

#define IS_CAN_STDID_OK(STDID)   ((STDID) <= ((uint16_t)CAN_STDID_SIZE))

#define IS_CAN_EXTID_OK(EXTID)   ((EXTID) <= ((uint32_t)CAN_EXTID_SIZE))

#define IS_CAN_DLC_OK(DLC)       ((DLC) <= CAN_DLC_MAX)

#define IS_CAN_IDTYPE_OK(IDTYPE) (((IDTYPE) == CAN_Id_Standard) || ((IDTYPE) == CAN_Id_Extended))

#define IS_CAN_RTR_OK(RTR) (((RTR) == CAN_RTR_Data) || ((RTR) == CAN_RTR_Remote))

#define IS_CAN_FLAG_STATUS_OK(FLAG) (((FLAG) == CAN_FLAG_RQCP0) || ((FLAG) == CAN_FLAG_RQCP1) ||\
                                  ((FLAG) == CAN_FLAG_RQCP2) || ((FLAG) == CAN_FLAG_FMP) ||\
                                  ((FLAG) == CAN_FLAG_FF) || ((FLAG) == CAN_FLAG_FOV) ||\
                                  ((FLAG) == CAN_FLAG_WKU) || ((FLAG) == CAN_FLAG_EWG) ||\
                                  ((FLAG) == CAN_FLAG_EPV) || ((FLAG) == CAN_FLAG_BOF) ||\
                                  ((FLAG) == CAN_FLAG_LEC))

#define IS_CAN_FLAG_CLEAR_OK(FLAG) (((FLAG) == CAN_FLAG_RQCP0) || ((FLAG) == CAN_FLAG_RQCP1) ||\
                                    ((FLAG) == CAN_FLAG_RQCP2) ||  ((FLAG) == CAN_FLAG_FF)   ||\
                                    ((FLAG) == CAN_FLAG_FOV)  ||  ((FLAG) == CAN_FLAG_WKU) ||\
                                    ((FLAG) == CAN_FLAG_LEC))

#define CAN_IT_CONFIG_MASK  ~(uint16_t)(CAN_IT_TME|CAN_IT_FMP|CAN_IT_FF|CAN_IT_FOV|CAN_IT_WKU|CAN_IT_EWG|CAN_IT_EPV|CAN_IT_BOF|CAN_IT_LEC|CAN_IT_ERR)
#define IS_CAN_IT_CONFIG_OK(IT) (((IT) != 0x0000) && ((uint16_t)((uint16_t)(IT) & (uint16_t)CAN_IT_CONFIG_MASK) == 0x0000))

#define IS_CAN_IT_STATUS_OK(IT) (((IT) == CAN_IT_TME)   || ((IT) == CAN_IT_FMP) ||\
                             ((IT) == CAN_IT_FF)    || ((IT) == CAN_IT_FOV) || \
                             ((IT) == CAN_IT_WKU)   || ((IT) == CAN_IT_ERR)  || \
                             ((IT) == CAN_IT_EWG)   || ((IT) == CAN_IT_EPV)  || \
                             ((IT) == CAN_IT_BOF)   || ((IT) == CAN_IT_LEC)  )
 
#define IS_CAN_IT_PENDING_BIT_OK(IT) (((IT) == CAN_IT_TME) || ((IT) == CAN_IT_FF)  ||\
                                      ((IT) == CAN_IT_FOV)  || ((IT) == CAN_IT_WKU) ||\
                                      ((IT) == CAN_IT_ERR)  || ((IT) == CAN_IT_EWG) ||\
                                      ((IT) == CAN_IT_EPV) || ((IT) == CAN_IT_BOF)||\
                                      ((IT) == CAN_IT_LEC))

#define IS_CAN_LAST_ERROR_CODE_OK(CODE)  (((CODE) & 0x8F) == 0x00)

void CAN_DeInit(void);
CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl, CAN_Mode_TypeDef CAN_Mode,
                                CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth, CAN_BitSeg1_TypeDef CAN_BitSeg1, 
                                CAN_BitSeg2_TypeDef CAN_BitSeg2,  uint8_t CAN_Prescaler);

void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber, uint8_t CAN_FilterActivation, CAN_FilterMode_TypeDef CAN_FilterMode, CAN_FilterScale_TypeDef CAN_FilterScale,
                    uint8_t CAN_FilterID1, uint8_t CAN_FilterID2, uint8_t CAN_FilterID3, uint8_t CAN_FilterID4, uint8_t CAN_FilterIDMask1, uint8_t CAN_FilterIDMask2, 
                    uint8_t CAN_FilterIDMask3, uint8_t CAN_FilterIDMask4);
void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, uint8_t NewState);
void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility);
CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id, CAN_Id_TypeDef CAN_IDE, CAN_RTR_TypeDef CAN_RTR, uint8_t CAN_DLC, uint8_t* CAN_Data);
void CAN_TTComModeCmd(uint8_t NewState);
CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox);
void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox);
void CAN_FIFORelease(void);
CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void);
void CAN_Receive(void);
uint32_t CAN_GetReceivedId(void);
CAN_Id_TypeDef CAN_GetReceivedIDE(void);
CAN_RTR_TypeDef CAN_GetReceivedRTR(void);
uint8_t CAN_GetReceivedDLC(void);
uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex);
uint8_t CAN_GetReceivedFMI(void);
uint16_t CAN_GetMessageTimeStamp(void);
CAN_Sleep_TypeDef CAN_Sleep(void);
CAN_WakeUp_TypeDef CAN_WakeUp(void);
CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode);
CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void);
CAN_Page_TypeDef CAN_GetSelectedPage(void);
void CAN_SelectPage(CAN_Page_TypeDef CAN_Page);
uint8_t CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag);
void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag);
uint8_t CAN_GetITStatus(CAN_IT_TypeDef CAN_IT);
void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT);

#endif
