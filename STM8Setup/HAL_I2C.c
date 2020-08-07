//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: July 10th, 2020

/*MODIFIED FROM STM8 LIBRARY*/

#include "HAL_I2C.h"

#define REGISTER_Mask               ((uint16_t)0x3000)
#define REGISTER_SR1_Index          ((uint16_t)0x0100)
#define REGISTER_SR2_Index          ((uint16_t)0x0200)
/* I2C Interrupt Enable mask */
#define ITEN_Mask                   ((uint16_t)0x0700)
/* I2C FLAG mask */
#define FLAG_Mask                   ((uint16_t)0x00FF)

void I2C_DeInit(void)
{
    I2C->CR1 = I2C_CR1_RESET_VALUE;
    I2C->CR2 = I2C_CR2_RESET_VALUE;
    I2C->FREQR = I2C_FREQR_RESET_VALUE;
    I2C->OARL = I2C_OARL_RESET_VALUE;
    I2C->OARH = I2C_OARH_RESET_VALUE;
    I2C->ITR = I2C_ITR_RESET_VALUE;
    I2C->CCRL = I2C_CCRL_RESET_VALUE;
    I2C->CCRH = I2C_CCRH_RESET_VALUE;
    I2C->TRISER = I2C_TRISER_RESET_VALUE;
}

void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress,
    I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack,
    I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz)
{
    uint16_t result = 0x0004;
    uint16_t tmpval = 0;
    uint8_t tmpccrh = 0;

    /*------------------------- I2C FREQ Configuration ------------------------*/
    /* Clear frequency bits */
    I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
    /* Write new value */
    I2C->FREQR |= InputClockFrequencyMHz;

    /*--------------------------- I2C CCR Configuration ------------------------*/
    /* Disable I2C to configure TRISER */
    I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);

    /* Clear CCRH & CCRL */
    I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
    I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);

    /* Detect Fast or Standard mode depending on the Output clock frequency selected */
    if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
    {
        /* Set F/S bit for fast mode */
        tmpccrh = I2C_CCRH_FS;

        if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
        {
            /* Fast mode speed calculate: Tlow/Thigh = 2 */
            result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
        }
        else /* I2C_DUTYCYCLE_16_9 */
        {
            /* Fast mode speed calculate: Tlow/Thigh = 16/9 */
            result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
            /* Set DUTY bit */
            tmpccrh |= I2C_CCRH_DUTY;
        }

        /* Verify and correct CCR value if below minimum value */
        if (result < (uint16_t)0x01)
        {
            /* Set the minimum allowed value */
            result = (uint16_t)0x0001;
        }

        /* Set Maximum Rise Time: 300ns max in Fast Mode
        = [300ns/(1/InputClockFrequencyMHz.10e6)]+1
        = [(InputClockFrequencyMHz * 3)/10]+1 */
        tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
        I2C->TRISER = (uint8_t)tmpval;

    }
    else /* STANDARD MODE */
    {

        /* Calculate standard mode speed */
        result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));

        /* Verify and correct CCR value if below minimum value */
        if (result < (uint16_t)0x0004)
        {
            /* Set the minimum allowed value */
            result = (uint16_t)0x0004;
        }

        /* Set Maximum Rise Time: 1000ns max in Standard Mode
        = [1000ns/(1/InputClockFrequencyMHz.10e6)]+1
        = InputClockFrequencyMHz+1 */
        I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);

    }

    /* Write CCR with new calculated value */
    I2C->CCRL = (uint8_t)result;
    I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);

    /* Enable I2C */
    I2C->CR1 |= I2C_CR1_PE;

    /* Configure I2C acknowledgement */
    I2C_AcknowledgeConfig(Ack);

    /*--------------------------- I2C OAR Configuration ------------------------*/
    I2C->OARL = (uint8_t)(OwnAddress);
    I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
        (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
}

void I2C_Cmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Enable I2C peripheral */
        I2C->CR1 |= I2C_CR1_PE;
    }
    else /* NewState == DISABLE */
    {
        /* Disable I2C peripheral */
        I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
    }
}

void I2C_GeneralCallCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Enable General Call */
        I2C->CR1 |= I2C_CR1_ENGC;
    }
    else /* NewState == DISABLE */
    {
        /* Disable General Call */
        I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
    }
}

void I2C_GenerateSTART(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Generate a START condition */
        I2C->CR2 |= I2C_CR2_START;
    }
    else /* NewState == DISABLE */
    {
        /* Disable the START condition generation */
        I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
    }
}

void I2C_GenerateSTOP(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Generate a STOP condition */
        I2C->CR2 |= I2C_CR2_STOP;
    }
    else /* NewState == DISABLE */
    {
        /* Disable the STOP condition generation */
        I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
    }
}

void I2C_SoftwareResetCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Peripheral under reset */
        I2C->CR2 |= I2C_CR2_SWRST;
    }
    else /* NewState == DISABLE */
    {
        /* Peripheral not under reset */
        I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
    }
}

void I2C_StretchClockCmd(uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Clock Stretching Enable */
        I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);

    }
    else /* NewState == DISABLE */
    {
        /* Clock Stretching Disable (Slave mode) */
        I2C->CR1 |= I2C_CR1_NOSTRETCH;
    }
}

void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
{
    if (Ack == I2C_ACK_NONE)
    {
        /* Disable the acknowledgement */
        I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
    }
    else
    {
        /* Enable the acknowledgement */
        I2C->CR2 |= I2C_CR2_ACK;

        if (Ack == I2C_ACK_CURR)
        {
            /* Configure (N)ACK on current byte */
            I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
        }
        else
        {
            /* Configure (N)ACK on next byte */
            I2C->CR2 |= I2C_CR2_POS;
        }
    }
}

void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, uint8_t NewState)
{
    if (NewState != 0)
    {
        /* Enable the selected I2C interrupts */
        I2C->ITR |= (uint8_t)I2C_IT;
    }
    else /* NewState == DISABLE */
    {
        /* Disable the selected I2C interrupts */
        I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
    }
}

void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
{
    if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
    {
        /* I2C fast mode Tlow/Thigh = 16/9 */
        I2C->CCRH |= I2C_CCRH_DUTY;
    }
    else /* I2C_DUTYCYCLE_2 */
    {
        /* I2C fast mode Tlow/Thigh = 2 */
        I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
    }
}

uint8_t I2C_ReceiveData(void)
{
    /* Return the data present in the DR register */
    return ((uint8_t)I2C->DR);
}

void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
{
    /* Clear bit0 (direction) just in case */
    Address &= (uint8_t)0xFE;

    /* Send the Address + Direction */
    I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
}

void I2C_SendData(uint8_t Data)
{
    /* Write in the DR register the data to be sent */
    I2C->DR = Data;
}

uint8_t I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
{
    volatile uint16_t lastevent = 0x00;
    uint8_t flag1 = 0x00;
    uint8_t flag2 = 0x00;
    uint8_t status = 0;

    if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
    {
        lastevent = I2C->SR2 & I2C_SR2_AF;
    }
    else
    {
        flag1 = I2C->SR1;
        flag2 = I2C->SR3;
        lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
    }
    /* Check whether the last event is equal to I2C_EVENT */
    if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
    {
        /* SUCCESS: last event is equal to I2C_EVENT */
        status = 1;
    }
    else
    {
        /* ERROR: last event is different from I2C_EVENT */
        status = 0;
    }

    /* Return status */
    return status;
}

I2C_Event_TypeDef I2C_GetLastEvent(void)
{
    volatile uint16_t lastevent = 0;
    uint16_t flag1 = 0;
    uint16_t flag2 = 0;

    if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
    {
        lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
    }
    else
    {
        /* Read the I2C status register */
        flag1 = I2C->SR1;
        flag2 = I2C->SR3;

        /* Get the last event value from I2C status register */
        lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
    }
    /* Return status */
    return (I2C_Event_TypeDef)lastevent;
}

uint8_t I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
{
    uint8_t tempreg = 0;
    uint8_t regindex = 0;
    uint8_t bitstatus = 0;

    /* Read flag register index */
    regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
    /* Check SRx index */
    switch (regindex)
    {
        /* Returns whether the status register to check is SR1 */
    case 0x01:
        tempreg = (uint8_t)I2C->SR1;
        break;

        /* Returns whether the status register to check is SR2 */
    case 0x02:
        tempreg = (uint8_t)I2C->SR2;
        break;

        /* Returns whether the status register to check is SR3 */
    case 0x03:
        tempreg = (uint8_t)I2C->SR3;
        break;

    default:
        break;
    }

    /* Check the status of the specified I2C flag */
    if ((tempreg & (uint8_t)I2C_Flag) != 0)
    {
        /* Flag is set */
        bitstatus = 1;
    }
    else
    {
        /* Flag is reset */
        bitstatus = 0;
    }
    /* Return the flag status */
    return bitstatus;
}

void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
{
    uint16_t flagpos = 0;
    /* Get the I2C flag position */
    flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
    /* Clear the selected I2C flag */
    I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
}

uint8_t I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
{
    uint8_t bitstatus = 0;
    volatile uint8_t enablestatus = 0;
    uint16_t tempregister = 0;

    tempregister = (uint8_t)(((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);

    /* Check if the interrupt source is enabled or not */
    enablestatus = (uint8_t)(I2C->ITR & (uint8_t)tempregister);

    if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
    {
        /* Check the status of the specified I2C flag */
        if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
        {
            /* I2C_IT is set */
            bitstatus = 1;
        }
        else
        {
            /* I2C_IT is reset */
            bitstatus = 0;
        }
    }
    else
    {
        /* Check the status of the specified I2C flag */
        if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
        {
            /* I2C_IT is set */
            bitstatus = 1;
        }
        else
        {
            /* I2C_IT is reset */
            bitstatus = 0;
        }
    }
    /* Return the I2C_IT status */
    return  bitstatus;

}

void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
{
    uint16_t flagpos = 0;
    /* Get the I2C flag position */
    flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;

    /* Clear the selected I2C flag */
    I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
}