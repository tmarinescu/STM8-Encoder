;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module HAL_TIM4
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_TimeBaseInit
	.globl _TIM4_Cmd
	.globl _TIM4_ITConfig
	.globl _TIM4_UpdateDisableConfig
	.globl _TIM4_UpdateRequestConfig
	.globl _TIM4_SelectOnePulseMode
	.globl _TIM4_PrescalerConfig
	.globl _TIM4_ARRPreloadConfig
	.globl _TIM4_GenerateEvent
	.globl _TIM4_SetCounter
	.globl _TIM4_SetAutoreload
	.globl _TIM4_GetCounter
	.globl _TIM4_GetPrescaler
	.globl _TIM4_GetFlagStatus
	.globl _TIM4_ClearFlag
	.globl _TIM4_GetITStatus
	.globl _TIM4_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	HAL_TIM4.c: 9: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
;	-----------------------------------------
;	 function TIM4_TimeBaseInit
;	-----------------------------------------
_TIM4_TimeBaseInit:
;	HAL_TIM4.c: 11: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
	ldw	x, #0x5345
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_TIM4.c: 12: TIM4->ARR = (uint8_t)(TIM4_Period);
	ldw	x, #0x5346
	ld	a, (0x04, sp)
	ld	(x), a
;	HAL_TIM4.c: 13: }
	ret
;	HAL_TIM4.c: 15: void TIM4_Cmd(uint8_t NewState)
;	-----------------------------------------
;	 function TIM4_Cmd
;	-----------------------------------------
_TIM4_Cmd:
;	HAL_TIM4.c: 19: TIM4->CR1 |= TIM4_CR1_CEN;
	ld	a, 0x5340
;	HAL_TIM4.c: 17: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 19: TIM4->CR1 |= TIM4_CR1_CEN;
	or	a, #0x01
	ld	0x5340, a
	ret
00102$:
;	HAL_TIM4.c: 23: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
	and	a, #0xfe
	ld	0x5340, a
;	HAL_TIM4.c: 25: }
	ret
;	HAL_TIM4.c: 27: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, uint8_t NewState)
;	-----------------------------------------
;	 function TIM4_ITConfig
;	-----------------------------------------
_TIM4_ITConfig:
	push	a
;	HAL_TIM4.c: 31: TIM4->IER |= (uint8_t)TIM4_IT;
	ld	a, 0x5341
;	HAL_TIM4.c: 29: if (NewState != 0)
	tnz	(0x05, sp)
	jreq	00102$
;	HAL_TIM4.c: 31: TIM4->IER |= (uint8_t)TIM4_IT;
	or	a, (0x04, sp)
	ld	0x5341, a
	jra	00104$
00102$:
;	HAL_TIM4.c: 35: TIM4->IER &= (uint8_t)(~TIM4_IT);
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x5341, a
00104$:
;	HAL_TIM4.c: 37: }
	pop	a
	ret
;	HAL_TIM4.c: 39: void TIM4_UpdateDisableConfig(uint8_t NewState)
;	-----------------------------------------
;	 function TIM4_UpdateDisableConfig
;	-----------------------------------------
_TIM4_UpdateDisableConfig:
;	HAL_TIM4.c: 43: TIM4->CR1 |= TIM4_CR1_UDIS;
	ld	a, 0x5340
;	HAL_TIM4.c: 41: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 43: TIM4->CR1 |= TIM4_CR1_UDIS;
	or	a, #0x02
	ld	0x5340, a
	ret
00102$:
;	HAL_TIM4.c: 47: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
	and	a, #0xfd
	ld	0x5340, a
;	HAL_TIM4.c: 49: }
	ret
;	HAL_TIM4.c: 51: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
;	-----------------------------------------
;	 function TIM4_UpdateRequestConfig
;	-----------------------------------------
_TIM4_UpdateRequestConfig:
;	HAL_TIM4.c: 55: TIM4->CR1 |= TIM4_CR1_URS;
	ld	a, 0x5340
;	HAL_TIM4.c: 53: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 55: TIM4->CR1 |= TIM4_CR1_URS;
	or	a, #0x04
	ld	0x5340, a
	ret
00102$:
;	HAL_TIM4.c: 59: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
	and	a, #0xfb
	ld	0x5340, a
;	HAL_TIM4.c: 61: }
	ret
;	HAL_TIM4.c: 63: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
;	-----------------------------------------
;	 function TIM4_SelectOnePulseMode
;	-----------------------------------------
_TIM4_SelectOnePulseMode:
;	HAL_TIM4.c: 67: TIM4->CR1 |= TIM4_CR1_OPM;
	ld	a, 0x5340
;	HAL_TIM4.c: 65: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 67: TIM4->CR1 |= TIM4_CR1_OPM;
	or	a, #0x08
	ld	0x5340, a
	ret
00102$:
;	HAL_TIM4.c: 71: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
	and	a, #0xf7
	ld	0x5340, a
;	HAL_TIM4.c: 73: }
	ret
;	HAL_TIM4.c: 75: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
;	-----------------------------------------
;	 function TIM4_PrescalerConfig
;	-----------------------------------------
_TIM4_PrescalerConfig:
;	HAL_TIM4.c: 77: TIM4->PSCR = (uint8_t)Prescaler;
	ldw	x, #0x5345
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_TIM4.c: 78: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
	ldw	x, #0x5343
	ld	a, (0x04, sp)
	ld	(x), a
;	HAL_TIM4.c: 79: }
	ret
;	HAL_TIM4.c: 81: void TIM4_ARRPreloadConfig(uint8_t NewState)
;	-----------------------------------------
;	 function TIM4_ARRPreloadConfig
;	-----------------------------------------
_TIM4_ARRPreloadConfig:
;	HAL_TIM4.c: 85: TIM4->CR1 |= TIM4_CR1_ARPE;
	ld	a, 0x5340
;	HAL_TIM4.c: 83: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 85: TIM4->CR1 |= TIM4_CR1_ARPE;
	or	a, #0x80
	ld	0x5340, a
	ret
00102$:
;	HAL_TIM4.c: 89: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
	and	a, #0x7f
	ld	0x5340, a
;	HAL_TIM4.c: 91: }
	ret
;	HAL_TIM4.c: 93: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
;	-----------------------------------------
;	 function TIM4_GenerateEvent
;	-----------------------------------------
_TIM4_GenerateEvent:
;	HAL_TIM4.c: 95: TIM4->EGR = (uint8_t)(TIM4_EventSource);
	ldw	x, #0x5343
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_TIM4.c: 96: }
	ret
;	HAL_TIM4.c: 98: void TIM4_SetCounter(uint8_t Counter)
;	-----------------------------------------
;	 function TIM4_SetCounter
;	-----------------------------------------
_TIM4_SetCounter:
;	HAL_TIM4.c: 100: TIM4->CNTR = (uint8_t)(Counter);
	ldw	x, #0x5344
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_TIM4.c: 101: }
	ret
;	HAL_TIM4.c: 103: void TIM4_SetAutoreload(uint8_t Autoreload)
;	-----------------------------------------
;	 function TIM4_SetAutoreload
;	-----------------------------------------
_TIM4_SetAutoreload:
;	HAL_TIM4.c: 105: TIM4->ARR = (uint8_t)(Autoreload);
	ldw	x, #0x5346
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_TIM4.c: 106: }
	ret
;	HAL_TIM4.c: 108: uint8_t TIM4_GetCounter(void)
;	-----------------------------------------
;	 function TIM4_GetCounter
;	-----------------------------------------
_TIM4_GetCounter:
;	HAL_TIM4.c: 110: return (uint8_t)(TIM4->CNTR);
	ld	a, 0x5344
;	HAL_TIM4.c: 111: }
	ret
;	HAL_TIM4.c: 113: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
;	-----------------------------------------
;	 function TIM4_GetPrescaler
;	-----------------------------------------
_TIM4_GetPrescaler:
;	HAL_TIM4.c: 115: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
	ld	a, 0x5345
;	HAL_TIM4.c: 116: }
	ret
;	HAL_TIM4.c: 118: uint8_t TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_GetFlagStatus
;	-----------------------------------------
_TIM4_GetFlagStatus:
;	HAL_TIM4.c: 121: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
	ld	a, 0x5342
	and	a, (0x03, sp)
	jreq	00102$
;	HAL_TIM4.c: 123: bitstatus = 1;
	ld	a, #0x01
	ret
00102$:
;	HAL_TIM4.c: 127: bitstatus = 0;
	clr	a
;	HAL_TIM4.c: 129: return (bitstatus);
;	HAL_TIM4.c: 130: }
	ret
;	HAL_TIM4.c: 132: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
;	-----------------------------------------
;	 function TIM4_ClearFlag
;	-----------------------------------------
_TIM4_ClearFlag:
;	HAL_TIM4.c: 134: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
	ld	a, (0x03, sp)
	cpl	a
	ld	0x5342, a
;	HAL_TIM4.c: 135: }
	ret
;	HAL_TIM4.c: 137: uint8_t TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_GetITStatus
;	-----------------------------------------
_TIM4_GetITStatus:
	push	a
;	HAL_TIM4.c: 144: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
	ld	a, 0x5342
	and	a, (0x04, sp)
	ld	(0x01, sp), a
;	HAL_TIM4.c: 146: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
	ld	a, 0x5341
	and	a, (0x04, sp)
;	HAL_TIM4.c: 148: if ((itstatus != 0 ) && (itenable != 0))
	tnz	(0x01, sp)
	jreq	00102$
	tnz	a
	jreq	00102$
;	HAL_TIM4.c: 150: bitstatus = 1;
	ld	a, #0x01
;	HAL_TIM4.c: 154: bitstatus = 0;
	.byte 0x21
00102$:
	clr	a
00103$:
;	HAL_TIM4.c: 156: return (bitstatus);
;	HAL_TIM4.c: 157: }
	addw	sp, #1
	ret
;	HAL_TIM4.c: 159: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
;	-----------------------------------------
;	 function TIM4_ClearITPendingBit
;	-----------------------------------------
_TIM4_ClearITPendingBit:
;	HAL_TIM4.c: 161: TIM4->SR1 = (uint8_t)(~TIM4_IT);
	ld	a, (0x03, sp)
	cpl	a
	ld	0x5342, a
;	HAL_TIM4.c: 162: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
