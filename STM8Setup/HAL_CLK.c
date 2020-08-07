//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#include "HAL_CLK.h"

const uint8_t HSIDivFactor[4] = {1, 2, 4, 8}; /*!< Holds the different HSI Divider factors */
const uint8_t CLKPrescTable[8] = {1, 2, 4, 8, 10, 16, 20, 40}; /*!< Holds the different CLK prescaler values */

void CLK_DeInit(void)
{

    CLK->ICKR = CLK_ICKR_RESET_VALUE;
    CLK->ECKR = CLK_ECKR_RESET_VALUE;
    CLK->SWR  = CLK_SWR_RESET_VALUE;
    CLK->SWCR = CLK_SWCR_RESET_VALUE;
    CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
    CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
    CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
    CLK->CSSR = CLK_CSSR_RESET_VALUE;
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
    {}
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
    CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;

}

void CLK_FastHaltWakeUpCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set FHWU bit (HSI oscillator is automatically switched-on) */
        CLK->ICKR |= CLK_ICKR_FHWU;
    }
    else  /* FastHaltWakeup = DISABLE */
    {
        /* Reset FHWU bit */
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
    }

}

void CLK_HSECmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set HSEEN bit */
        CLK->ECKR |= CLK_ECKR_HSEEN;
    }
    else
    {
        /* Reset HSEEN bit */
        CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
    }

}

void CLK_HSICmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set HSIEN bit */
        CLK->ICKR |= CLK_ICKR_HSIEN;
    }
    else
    {
        /* Reset HSIEN bit */
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
    }

}


void CLK_LSICmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set LSIEN bit */
        CLK->ICKR |= CLK_ICKR_LSIEN;
    }
    else
    {
        /* Reset LSIEN bit */
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
    }

}

void CLK_CCOCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set CCOEN bit */
        CLK->CCOR |= CLK_CCOR_CCOEN;
    }
    else
    {
        /* Reset CCOEN bit */
        CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
    }

}

/**
  * @brief  Starts or Stops manually the clock switch execution.
  * @par Full description:
  * NewState parameter set the SWEN.
  * @param   NewState new state of SWEN, value accepted ENABLE, DISABLE.
  * @retval None
  */
void CLK_ClockSwitchCmd(uint8_t NewState)
{
    if (NewState != 0 )
    {
        /* Enable the Clock Switch */
        CLK->SWCR |= CLK_SWCR_SWEN;
    }
    else
    {
        /* Disable the Clock Switch */
        CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
    }

}

void CLK_SlowActiveHaltWakeUpCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Set S_ACTHALT bit */
        CLK->ICKR |= CLK_ICKR_SWUAH;
    }
    else
    {
        /* Reset S_ACTHALT bit */
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
    }

}

void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, uint8_t NewState)
{
    if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
    {
        if (NewState != 0)
        {
            /* Enable the peripheral Clock */
            CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        }
        else
        {
            /* Disable the peripheral Clock */
            CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
        }
    }
    else
    {
        if (NewState != 0)
        {
            /* Enable the peripheral Clock */
            CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        }
        else
        {
            /* Disable the peripheral Clock */
            CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
        }
    }

}

uint8_t CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, uint8_t ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
{

    CLK_Source_TypeDef clock_master;
    uint16_t DownCounter = CLK_TIMEOUT;
    uint8_t Swif = 0;
    clock_master = (CLK_Source_TypeDef)CLK->CMSR;

    /* Automatic switch mode management */
    if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
    {

        /* Enables Clock switch */
        CLK->SWCR |= CLK_SWCR_SWEN;

        /* Enables or Disables Switch interrupt */
        if (ITState != 0)
        {
            CLK->SWCR |= CLK_SWCR_SWIEN;
        }
        else
        {
            CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
        }

        /* Selection of the target clock source */
        CLK->SWR = (uint8_t)CLK_NewClock;

        while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
        {
            DownCounter--;
        }

        if (DownCounter != 0)
        {
            Swif = 1;
        }
        else
        {
            Swif = 0;
        }

    }
    else /* CLK_SwitchMode == CLK_SWITCHMODE_MANUAL */
    {

        /* Enables or Disables Switch interrupt  if required  */
        if (ITState != 0)
        {
            CLK->SWCR |= CLK_SWCR_SWIEN;
        }
        else
        {
            CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
        }

        /* Selection of the target clock source */
        CLK->SWR = (uint8_t)CLK_NewClock;

        /* In manual mode, there is no risk to be stuck in a loop, value returned
          is then always SUCCESS */
        Swif = 1;

    }

    /* Switch OFF current clock if required */
    if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
    {
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
    }
    else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
    {
        CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
    }
    else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
    {
        CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
    }

    return(Swif);

}

void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
{
    /* Clear High speed internal clock prescaler */
    CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);

    /* Set High speed internal clock prescaler */
    CLK->CKDIVR |= (uint8_t)HSIPrescaler;

}

void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
{
    CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);

    /* Selects the source provided on cco_ck output */
    CLK->CCOR |= (uint8_t)CLK_CCO;

    /* Enable the clock output */
    CLK->CCOR |= CLK_CCOR_CCOEN;

}

void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, uint8_t NewState)
{
    if (NewState != 0)
    {
        switch (CLK_IT)
        {
        case CLK_IT_SWIF: /* Enable the clock switch interrupt */
            CLK->SWCR |= CLK_SWCR_SWIEN;
            break;
        case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
            CLK->CSSR |= CLK_CSSR_CSSDIE;
            break;
        default:
            break;
        }
    }
    else  /*(NewState == DISABLE)*/
    {
        switch (CLK_IT)
        {
        case CLK_IT_SWIF: /* Disable the clock switch interrupt */
            CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
            break;
        case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
            CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
            break;
        default:
            break;
        }
    }

}


void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
{
    if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
    {
        CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
        CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
    }
    else /* Bit7 = 1 means CPU divider */
    {
        CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
        CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
    }

}

void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
{
    if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
    {
        /* SWIM clock is not divided by 2 */
        CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
    }
    else /* CLK_SWIMDivider == CLK_SWIMDIVIDER_2 */
    {
        /* SWIM clock is divided by 2 */
        CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
    }

}

void CLK_ClockSecuritySystemEnable(void)
{
    CLK->CSSR |= CLK_CSSR_CSSEN;
}

CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
{
    return((CLK_Source_TypeDef)CLK->CMSR);
}

uint32_t CLK_GetClockFreq(void)
{

    uint32_t clockfrequency = 0;
    CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
    uint8_t tmp = 0, presc = 0;

    /* Get CLK source. */
    clocksource = (CLK_Source_TypeDef)CLK->CMSR;

    if (clocksource == CLK_SOURCE_HSI)
    {
        tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
        tmp = (uint8_t)(tmp >> 3);
        presc = HSIDivFactor[tmp];
        clockfrequency = HSI_VALUE / presc;
    }
    else if ( clocksource == CLK_SOURCE_LSI)
    {
        clockfrequency = LSI_VALUE;
    }
    else
    {
        clockfrequency = HSE_VALUE;
    }

    return((uint32_t)clockfrequency);

}

void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
{
    CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
}

void CLK_SYSCLKEmergencyClear(void)
{
    CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
}

uint8_t CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
{

    uint16_t statusreg = 0;
    uint8_t tmpreg = 0;
    uint8_t bitstatus = 0;

    statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);


    if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
    {
        tmpreg = CLK->ICKR;
    }
    else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
    {
        tmpreg = CLK->ECKR;
    }
    else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
    {
        tmpreg = CLK->SWCR;
    }
    else if (statusreg == 0x0400) /* The flag to check is in CSS register */
    {
        tmpreg = CLK->CSSR;
    }
    else /* The flag to check is in CCO register */
    {
        tmpreg = CLK->CCOR;
    }

    if ((tmpreg & (uint8_t)CLK_FLAG) != 0)
    {
        bitstatus = 1;
    }
    else
    {
        bitstatus = 0;
    }

    /* Return the flag status */
    return(bitstatus);

}

uint8_t CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
{

    uint8_t bitstatus = 0;
    if (CLK_IT == CLK_IT_SWIF)
    {
        /* Check the status of the clock switch interrupt */
        if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        {
            bitstatus = 1;
        }
        else
        {
            bitstatus = 0;
        }
    }
    else /* CLK_IT == CLK_IT_CSSDIE */
    {
        /* Check the status of the security system detection interrupt */
        if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        {
            bitstatus = 1;
        }
        else
        {
            bitstatus = 0;
        }
    }

    return bitstatus;

}

void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
{
    if (CLK_IT == (uint8_t)CLK_IT_CSSD)
    {
        /* Clear the status of the security system detection interrupt */
        CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
    }
    else /* CLK_PendingBit == (uint8_t)CLK_IT_SWIF */
    {
        /* Clear the status of the clock switch interrupt */
        CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
    }

}
