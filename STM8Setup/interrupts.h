//Author(s): Tudor Marinescu, William Davidson, Thomas Davidson
//Capstone Encoder
//Date: June 14th, 2020

#ifndef _INTERRUPTS_H_
#define _INTERRUPTS_H_

#include "main.h"

void SetTimerTick(uint32_t tick);
uint32_t GetTimerTick();
void TIM4_UPD_OVF_IRQHandler() __interrupt(23);
#endif
