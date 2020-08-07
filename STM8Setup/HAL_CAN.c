//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: July 10th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#include "HAL_CAN.h"

#define CAN_IDLIST_IDMASK_MASK ((uint8_t) 0x55)
#define CAN_IDMASK_IDLIST_MASK ((uint8_t) 0xAA)
#define CAN_MODE_MASK ((uint8_t) 0x03)
#define CAN_ACKNOWLEDGE_TIMEOUT ((uint16_t)0xFFFF)

volatile uint32_t _Id = 0;
volatile uint8_t _IDE = 0;
volatile uint8_t _RTR = 0;
volatile uint8_t _DLC = 0;
volatile uint8_t _Data[8] = { 0 };
volatile uint8_t _FMI = 0;

static uint8_t CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit);

void CAN_DeInit(void)
{
    /* Request initialisation */
    CAN->MCR = CAN_MCR_INRQ;
    CAN->PSR = CAN_Page_Config;
    CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
    CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
    CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
    CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
    CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
    CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
    CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
    CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
    CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
    CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
    CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
    CAN->PSR = CAN_Page_RxFifo;
    CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
    CAN->PSR = CAN_Page_TxMailBox0;
    CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
    CAN->PSR = CAN_Page_TxMailBox1;
    CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
    CAN->PSR = CAN_Page_TxMailBox2;
    CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;

    CAN->MCR = CAN_MCR_RESET_VALUE;
    CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
    CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
    CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
    CAN->IER = CAN_IER_RESET_VALUE;
    CAN->DGR = CAN_DGR_RESET_VALUE;
    CAN->PSR = CAN_PSR_RESET_VALUE;
}

CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
    CAN_Mode_TypeDef CAN_Mode,
    CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
    CAN_BitSeg1_TypeDef CAN_BitSeg1,
    CAN_BitSeg2_TypeDef CAN_BitSeg2,
    uint8_t CAN_Prescaler)
{
    CAN_InitStatus_TypeDef InitStatus = CAN_InitStatus_Failed;
    uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    /* Request initialisation */
    CAN->MCR = CAN_MCR_INRQ;
    /* Wait the acknowledge */
    while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
    {
        timeout--;
    }

    /* Check acknowledged */
    if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
    {

        InitStatus = CAN_InitStatus_Failed;

    }
    else
    {
        /* Set the time triggered communication mode  &  Set the automatic bus-off management  &   Set the automatic wake-up mode
        &     Set the no automatic retransmission & Set the receive FIFO locked mode & Set the transmit FIFO priority */
        CAN->MCR |= (uint8_t)CAN_MasterCtrl;

        /* Set the bit timing register */
        CAN->DGR |= (uint8_t)CAN_Mode;
        CAN->PSR = CAN_Page_Config;
        CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
        CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);

        /* Request leave initialisation */
        CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
        /* Wait the acknowledge */
        timeout = 0xFFFF;
        while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01)) && (timeout != 0))
        {
            timeout--;
        }
        /* Check acknowledged */
        if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
        {
            InitStatus = CAN_InitStatus_Failed;
        }
        else
        {
            InitStatus = CAN_InitStatus_Success;
        }
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);

    /* Return the status of initialization */
    return (CAN_InitStatus_TypeDef)InitStatus;
}

void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
    uint8_t CAN_FilterActivation,
    CAN_FilterMode_TypeDef CAN_FilterMode,
    CAN_FilterScale_TypeDef CAN_FilterScale,
    uint8_t CAN_FilterID1,
    uint8_t CAN_FilterID2,
    uint8_t CAN_FilterID3,
    uint8_t CAN_FilterID4,
    uint8_t CAN_FilterIDMask1,
    uint8_t CAN_FilterIDMask2,
    uint8_t CAN_FilterIDMask3,
    uint8_t CAN_FilterIDMask4)
{
    uint8_t fact = 0;
    uint8_t fsc = 0;
    uint8_t fmhl = 0;

    CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    if (CAN_FilterNumber == CAN_FilterNumber_0)
    {
        fact = 0x01;
        fsc = 0x00;
        fmhl = 0x03;

        can_page_filter = CAN_Page_Filter01;
    }
    else if (CAN_FilterNumber == CAN_FilterNumber_1)
    {
        fact = 0x10;
        fsc = 0x04;
        fmhl = 0x0C;

        can_page_filter = CAN_Page_Filter01;
    }
    else if (CAN_FilterNumber == CAN_FilterNumber_2)
    {
        fact = 0x01;
        fsc = 0x00;
        fmhl = 0x30;

        can_page_filter = CAN_Page_Filter23;
    }
    else if (CAN_FilterNumber == CAN_FilterNumber_3)
    {
        fact = 0x10;
        fsc = 0x04;
        fmhl = 0xC0;

        can_page_filter = CAN_Page_Filter23;
    }
    else if (CAN_FilterNumber == CAN_FilterNumber_4)
    {
        fact = 0x01;
        fsc = 0x00;
        fmhl = 0x03;

        can_page_filter = CAN_Page_Filter45;
    }
    else /*if (CAN_FilterNumber == CAN_FilterNumber_5)*/
    {
        fact = 0x10;
        fsc = 0x04;
        fmhl = 0x0C;

        can_page_filter = CAN_Page_Filter45;
    }


    CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);

    CAN->PSR = CAN_Page_Config;
    /*---------------------------------------------------------*/
    /*Configuration of Filter Scale                            */
    /*---------------------------------------------------------*/

    if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
    {
        /* Filter Deactivation  & Reset the Filter Scale */
        CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
        /* Set the new Filter Scale */
        CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
    }
    else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
    {
        /* Filter Deactivation  & Reset the Filter Scale */
        CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));

        /* Set the new Filter Scale */
        CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);

    }
    else /*if(can_page_filter == CAN_Page_Filter45)*/ /* FCR3*/
    {
        /* Filter Deactivation  & Reset the Filter Scale */
        CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));

        /* Set the new Filter Scale */
        CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
    }

    /*---------------------------------------------------------*/
    /*Configuration of Filter Mode                             */
    /*---------------------------------------------------------*/
    if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
    {
        /* Filter Mode */
        if (CAN_FilterMode == CAN_FilterMode_IdMask)
        {
            /*Id/Mask mode for the filter*/
            CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
        }
        else if (CAN_FilterMode == CAN_FilterMode_IdList)
        {
            /*Identifier list mode for the filter*/
            CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
        }
        else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
        {
            /*Identifier list mode is first  for the filter*/
            CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
        }
        else /* ( CAN_FilterMode == CAN_FilterMode_IdMask_IdList)*/
        {
            /*Id Mask mode is first  for the filter*/
            CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
        }


    }
    else /* FMR2 */
    {

        /* Filter Mode */
        if (CAN_FilterMode == CAN_FilterMode_IdMask)
        {
            /*Id/Mask mode for the filter*/
            CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
        }
        else if (CAN_FilterMode == CAN_FilterMode_IdList)
        {
            /*Identifier list mode for the filter*/
            CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
        }
        else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
        {
            /*Identifier list mode is first  for the filter*/
            CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
        }
        else /* ( CAN_FilterMode == CAN_FilterMode_IdMask_IdList)*/
        {
            /*Id Mask mode is first  for the filter*/
            CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
        }
    }
    /*---------------------------------------------------------*/
    /*Configuration of Filter IDs                              */
    /*---------------------------------------------------------*/
    CAN->PSR = (uint8_t)can_page_filter;
    if (fsc != 0)
    {
        /* Filter Scale */
        if (CAN_FilterScale == CAN_FilterScale_8Bit)
        {
            CAN->Page.Filter.FR09 = CAN_FilterID1;
            CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR11 = CAN_FilterID2;
            CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR13 = CAN_FilterID3;
            CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR15 = CAN_FilterID4;
            CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
        {
            CAN->Page.Filter.FR09 = CAN_FilterID1;
            CAN->Page.Filter.FR10 = CAN_FilterID2;
            CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR13 = CAN_FilterID3;
            CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR15 = CAN_FilterID4;
            CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_16Bit)
        {
            CAN->Page.Filter.FR09 = CAN_FilterID1;
            CAN->Page.Filter.FR10 = CAN_FilterID2;
            CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR13 = CAN_FilterID3;
            CAN->Page.Filter.FR14 = CAN_FilterID4;
            CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_32Bit)
        {
            CAN->Page.Filter.FR09 = CAN_FilterID1;
            CAN->Page.Filter.FR10 = CAN_FilterID2;
            CAN->Page.Filter.FR11 = CAN_FilterID3;
            CAN->Page.Filter.FR12 = CAN_FilterID4;
            CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
        }
    }
    else
    {
        /* Filter Scale */
        if (CAN_FilterScale == CAN_FilterScale_8Bit)
        {
            CAN->Page.Filter.FR01 = CAN_FilterID1;
            CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR03 = CAN_FilterID2;
            CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR05 = CAN_FilterID3;
            CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR07 = CAN_FilterID4;
            CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
        {
            CAN->Page.Filter.FR01 = CAN_FilterID1;
            CAN->Page.Filter.FR02 = CAN_FilterID2;
            CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR05 = CAN_FilterID3;
            CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR07 = CAN_FilterID4;
            CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_16Bit)
        {
            CAN->Page.Filter.FR01 = CAN_FilterID1;
            CAN->Page.Filter.FR02 = CAN_FilterID2;
            CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR05 = CAN_FilterID3;
            CAN->Page.Filter.FR06 = CAN_FilterID4;
            CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
        }
        else if (CAN_FilterScale == CAN_FilterScale_32Bit)
        {
            CAN->Page.Filter.FR01 = CAN_FilterID1;
            CAN->Page.Filter.FR02 = CAN_FilterID2;
            CAN->Page.Filter.FR03 = CAN_FilterID3;
            CAN->Page.Filter.FR04 = CAN_FilterID4;
            CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
            CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
            CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
            CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
        }
    }


    /*---------------------------------------------------------*/
    /*Configuration of Filter Activation                       */
    /*---------------------------------------------------------*/
    /* Filter activation */
    CAN->PSR = CAN_Page_Config;
    if (CAN_FilterActivation != 0)
    {
        if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
        {
            CAN->Page.Config.FCR1 |= (uint8_t)fact;
        }
        else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
        {
            CAN->Page.Config.FCR2 |= (uint8_t)fact;
        }
        else /*if((CAN_FilterNumber & 0x06) == 0x04)*/ /*FCR3*/
        {
            CAN->Page.Config.FCR3 |= (uint8_t)fact;
        }
    }
    CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, uint8_t NewState)
{
    uint8_t tmperrorinterrupt = 0;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >> 7);
    tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) |
        (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >> 1));

    CAN->PSR = CAN_Page_Config;
    if (NewState != 0)
    {
        /* Enable the selected CAN interrupt */
        CAN->IER |= (uint8_t)(CAN_IT);
        CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
    }
    else
    {
        /* Disable the selected CAN interrupt */
        CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
        CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
{
    /*Reset the old configuration of TXM2E */
    CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);

    /*Set the old configuration of TXM2E */
    CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
}

void CAN_TTComModeCmd(uint8_t NewState)
{
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
    if (NewState != 0)
    {
        /*Enable the TTCM mode */
        CAN->MCR |= CAN_MCR_TTCM;
        /*Set TGT bits setting in Tx and FIFO pages*/
        CAN->PSR = CAN_Page_TxMailBox0;
        CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
        CAN->PSR = CAN_Page_TxMailBox1;
        CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
        CAN->PSR = CAN_Page_TxMailBox2;
        CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
        CAN->PSR = CAN_Page_RxFifo;
        CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
    }
    else
    {
        /*Disable the TTCM mode */
        CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
        /*Reset TGT bits setting in Tx and FIFO pages*/
        CAN->PSR = CAN_Page_TxMailBox0;
        CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
        CAN->PSR = CAN_Page_TxMailBox1;
        CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
        CAN->PSR = CAN_Page_TxMailBox2;
        CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
        CAN->PSR = CAN_Page_RxFifo;
        CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
    CAN_Id_TypeDef CAN_IDE,
    CAN_RTR_TypeDef CAN_RTR,
    uint8_t CAN_DLC,
    uint8_t* CAN_Data)
{
    CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
    /* Select one empty transmit mailbox */
    if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
    {
        CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
    }
    else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
    {
        CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
    }
    else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
    {
        CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
    }
    else
    {
        CAN_TxStatus = CAN_TxStatus_NoMailBox;
    }
    if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
    {
        CAN->PSR = (uint8_t)CAN_TxStatus;
        /* Set up the Id */
        if (CAN_IDE != CAN_Id_Standard)
        {
            CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
            CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
            CAN_Id = CAN_Id >> 8;
            CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
            CAN_Id = CAN_Id >> 8;
            CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
            CAN_Id = CAN_Id >> 8;
            CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id | CAN_IDE | CAN_RTR);
        }
        else
        {
            CAN_Id &= (uint16_t)CAN_STDID_SIZE;
            CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id >> 6) | (CAN_RTR));
            CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id << 2);
        }
        /* Set up the DLC                 */
        /*clear old DLC value*/
        CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
        /*set the new value of DLC*/
        CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
        /* Set up the data field */
        CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
        CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
        CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
        CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
        CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
        CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
        CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
        CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
        /* Request transmission */
        CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
    return (CAN_TxStatus_TypeDef)CAN_TxStatus;
}

CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
{
    /* RQCP, TXOK and TME bits */
    CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
    uint8_t tmpstate = 0;

    switch (CAN_TransmitMailbox)
    {
    case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0 | CAN_TSR_TXOK0)));
        tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
        break;
    case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1 | CAN_TSR_TXOK1)) >> 1);
        tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
        break;
    case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2 | CAN_TSR_TXOK2)) >> 2);
        tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
        break;
    default:
        tstate = CAN_TxStatus_Failed;
        break;
    }

    switch (tmpstate)
    {
        /*transmit pending  */
    case (0x00): tstate = CAN_TxStatus_Pending;
        break;
        /* transmit failed  */
    case (0x05): tstate = CAN_TxStatus_Failed;
        break;
        /* transmit succeeded */
    case (0x15): tstate = CAN_TxStatus_Ok;
        break;
        /* transmit mailbox is empty : no activity on this TX mail box */
    case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
        break;
    default:
        tstate = CAN_TxStatus_Failed;
        break;
    }

    return (CAN_TxStatus_TypeDef)tstate;
}

void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
{
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
    /*switch to the specific page */
    CAN->PSR = (uint8_t)CAN_TransmitMailbox;
    /* abort transmission */
    CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

void CAN_FIFORelease(void)
{
    /* Release FIFO*/
    CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
}

CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
{
    CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
    msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
    return (CAN_NbrPendingMessage_TypeDef)msgpending;
}

void CAN_Receive(void)
{
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
    uint32_t temp1 = 0, temp2 = 0, temp3 = 0;

    /* select Fifo page*/
    CAN->PSR = CAN_Page_RxFifo;

    /* Get the Id */
    _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
    if (_IDE != CAN_Id_Standard)
    {
        temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
        temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);
        temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);

        _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3);
    }
    else
    {
        temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
        temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2) & 0x3F);

        _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2);
    }

    _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);

    /* Get the DLC */
    _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);

    /* Get the FMI */
    _FMI = CAN->Page.RxFIFO.MFMI;

    /* Get the data field */
    _Data[0] = CAN->Page.RxFIFO.MDAR1;
    _Data[1] = CAN->Page.RxFIFO.MDAR2;
    _Data[2] = CAN->Page.RxFIFO.MDAR3;
    _Data[3] = CAN->Page.RxFIFO.MDAR4;
    _Data[4] = CAN->Page.RxFIFO.MDAR5;
    _Data[5] = CAN->Page.RxFIFO.MDAR6;
    _Data[6] = CAN->Page.RxFIFO.MDAR7;
    _Data[7] = CAN->Page.RxFIFO.MDAR8;

    /* Release the FIFO */
    CAN_FIFORelease();
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

uint32_t CAN_GetReceivedId(void)
{
    return (_Id);
}

CAN_Id_TypeDef CAN_GetReceivedIDE(void)
{
    return (CAN_Id_TypeDef)(_IDE);
}

CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
{
    return (CAN_RTR_TypeDef)(_RTR);
}

uint8_t CAN_GetReceivedDLC(void)
{
    return (_DLC);
}

uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
{
    return (_Data[CAN_DataIndex]);
}

uint8_t CAN_GetReceivedFMI(void)
{
    return (_FMI);
}

uint16_t CAN_GetMessageTimeStamp(void)
{
    uint16_t timestamp = 0;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    /*switch to the specific page */
    CAN->PSR = CAN_Page_RxFifo;
    /* Get the Received Time stamp */
    timestamp = CAN->Page.RxFIFO.MTSRL;
    timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH) << 8);

    /*Restore Last Page*/
    CAN_SelectPage(can_page);

    return (uint16_t)(timestamp);
}

CAN_Sleep_TypeDef CAN_Sleep(void)
{

    CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;

    /* Request Sleep mode */
    CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);

    /* Sleep mode status */
    if ((CAN->MSR & (CAN_MSR_SLAK | CAN_MSR_INAK)) == CAN_MSR_SLAK)
    {
        /* Sleep mode not entered */
        sleepstatus = CAN_Sleep_Ok;
    }

    /* At this step, sleep mode status */
    return (CAN_Sleep_TypeDef)sleepstatus;
}

/**
  * @brief  Wakes the CAN up.
  * @param  None
  * @retval CAN_WakeUp_Ok if sleep mode left, CAN_WakeUp_Failed in an other  case.
  */
CAN_WakeUp_TypeDef CAN_WakeUp(void)
{
    CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;

    /* Wake up request */
    CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);

    /* Sleep mode status */
    if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
    {
        /* Sleep mode exited */
        wakeupstatus = CAN_WakeUp_Ok;
    }

    /* At this step, sleep mode status */
    return (CAN_WakeUp_TypeDef)wakeupstatus;
}

CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
{

    uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
    uint8_t modestatus = 0;

    if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
    {
        /* Request initialisation */
        CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);

        /* Wait the acknowledge */
        while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
        {
            timeout--;
        }
        if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
        {
            modestatus = CAN_ModeStatus_Failed;
        }
        else
        {
            modestatus = CAN_ModeStatus_Success;
        }

    }
    else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
    {
        /* Request leave initialisation and sleep mode  and enter Normal mode */
        CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP | CAN_MCR_INRQ));

        /* Wait the acknowledge */
        while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout != 0))
        {
            timeout--;
        }
        if ((CAN->MSR & CAN_MODE_MASK) != 0)
        {
            modestatus = CAN_ModeStatus_Failed;
        }
        else
        {
            modestatus = CAN_ModeStatus_Success;
        }
    }
    else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
    {
        /* Request Sleep mode */
        CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);

        /* Wait the acknowledge */
        while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout != 0))
        {
            timeout--;
        }
        if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
        {
            modestatus = CAN_ModeStatus_Failed;
        }
        else
        {
            modestatus = CAN_ModeStatus_Success;
        }
    }
    else
    {
        modestatus = CAN_ModeStatus_Failed;
    }
    return (CAN_ModeStatus_TypeDef)(modestatus);
}

CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
{
    CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    CAN->PSR = CAN_Page_Config;
    errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));

    /*Restore Last Page*/
    CAN_SelectPage(can_page);

    return (CAN_ErrorCode_TypeDef)(errcode);
}

void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
{
    CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
    if (((uint16_t)CAN_Flag & 0x0700) != 0)
    {
        if (((uint16_t)CAN_Flag & 0x020B) != 0)
        {
            /*Receive Flags*/
            CAN->RFR = (uint8_t)(CAN_Flag);
        }
        else if (((uint16_t)CAN_Flag & 0x0403) != 0)
        {
            /*Transmit Flags*/
            CAN->TSR = (uint8_t)(CAN_Flag);
        }
        else /*if((CAN_Flag & 0x0108)!=(uint16_t)RESET)*/
        {
            /*wake up Flags*/
            CAN->MSR = (uint8_t)(CAN_Flag);
        }
    }
    else
    {
        /*Error Flags*/
        can_page = CAN_GetSelectedPage();

        /* Clear the selected CAN flags */
        CAN->PSR = CAN_Page_Config;
        CAN->Page.Config.ESR = (uint8_t)0;

        /*Restore Last Page*/
        CAN_SelectPage(can_page);
    }
}

uint8_t CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
{
    uint8_t bitstatus = 0;
    CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;

    if (((uint16_t)CAN_Flag & 0x0700) != 0)
    {
        if (((uint16_t)CAN_Flag & 0x020B) != 0)
        {
            /*Receive Flags*/
            if ((CAN->RFR & (uint16_t)CAN_Flag) != 0)
            {
                /* CAN_FLAG is set */
                bitstatus = 1;
            }
            else
            {
                /* CAN_FLAG is reset */
                bitstatus = 0;
            }

        }
        else if (((uint16_t)CAN_Flag & 0x0403) != 0)
        {
            /*Transmit Flags*/
            if ((CAN->TSR & (uint16_t)CAN_Flag) != 0)
            {
                /* CAN_FLAG is set */
                bitstatus = 1;
            }
            else
            {
                /* CAN_FLAG is reset */
                bitstatus = 0;
            }
        }
        else /*if((CAN_Flag & 0x0108)!=(uint16_t)RESET)*/
        {
            /*wake up Flags*/
            if ((CAN->MSR & (uint16_t)CAN_Flag) != 0)
            {
                /* CAN_FLAG is set */
                bitstatus = 1;
            }
            else
            {
                /* CAN_FLAG is reset */
                bitstatus = 0;
            }
        }
    }
    else
    {
        /*Error Flags*/
        can_page = CAN_GetSelectedPage();

        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != 0)
        {
            /* CAN_FLAG is set */
            bitstatus = 1;
        }
        else
        {
            /* CAN_FLAG is reset */
            bitstatus = 0;
        }
        /*Restore Last Page*/
        CAN_SelectPage(can_page);
    }


    /* Return the CAN_FLAG status */
    return  (uint8_t)bitstatus;
}

uint8_t CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
{
    uint8_t pendingbitstatus = 0;
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    switch (CAN_IT)
    {
    case CAN_IT_TME:
        if ((CAN->IER & CAN_IER_TMEIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;

    case CAN_IT_FMP:
        if ((CAN->IER & CAN_IER_FMPIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    case CAN_IT_FF:
        if ((CAN->IER & CAN_IER_FFIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    case CAN_IT_FOV:
        if ((CAN->IER & CAN_IER_FOVIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    case CAN_IT_WKU:
        if ((CAN->IER & CAN_IER_WKUIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;

    case CAN_IT_ERR:
        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF | CAN_ESR_EPVF | CAN_ESR_BOFF | CAN_ESR_LEC);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;

    case CAN_IT_EWG:
        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;

    case CAN_IT_EPV:
        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    case CAN_IT_BOF:
        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    case CAN_IT_LEC:
        CAN->PSR = CAN_Page_Config;
        if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) != 0)
        {
            pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
        }
        else
        {
            pendingbitstatus = 0;
        }
        break;
    default:
        pendingbitstatus = 0;
        break;
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
    /* Return the CAN_IT status */
    return  (uint8_t)pendingbitstatus;
}

void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
{
    CAN_Page_TypeDef can_page = CAN_GetSelectedPage();

    switch (CAN_IT)
    {
    case CAN_IT_TME:
        CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
        break;

    case CAN_IT_FF:
        CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
        break;

    case CAN_IT_FOV:
        CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
        break;

    case CAN_IT_WKU:
        CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
        break;

    case CAN_IT_ERR:
        CAN->PSR = CAN_Page_Config;
        CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
        CAN->MSR = CAN_MSR_ERRI;
        break;

    case CAN_IT_EWG:
        CAN->MSR = CAN_MSR_ERRI;
        break;

    case CAN_IT_EPV:
        CAN->MSR = CAN_MSR_ERRI;
        break;

    case CAN_IT_BOF:
        CAN->MSR = CAN_MSR_ERRI;
        break;

    case CAN_IT_LEC:
        CAN->PSR = CAN_Page_Config;
        CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
        break;



    default:
        break;
    }
    /*Restore Last Page*/
    CAN_SelectPage(can_page);
}

CAN_Page_TypeDef CAN_GetSelectedPage(void)
{
    return (CAN_Page_TypeDef)(CAN->PSR);
}

void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
{
    CAN->PSR = (uint8_t)CAN_Page;
}

static uint8_t CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
{
    uint8_t pendingbitstatus = 0;
    if ((CAN_Reg & It_Bit) != (uint8_t)0)
    {
        /* CAN_IT is set */
        pendingbitstatus = 1;
    }
    else
    {
        /* CAN_IT is reset */
        pendingbitstatus = 0;
    }
    return (uint8_t)pendingbitstatus;
}