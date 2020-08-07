;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module HAL_CLK
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLKPrescTable
	.globl _HSIDivFactor
	.globl _CLK_DeInit
	.globl _CLK_FastHaltWakeUpCmd
	.globl _CLK_HSECmd
	.globl _CLK_HSICmd
	.globl _CLK_LSICmd
	.globl _CLK_CCOCmd
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_SlowActiveHaltWakeUpCmd
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_CCOConfig
	.globl _CLK_ITConfig
	.globl _CLK_SYSCLKConfig
	.globl _CLK_SWIMConfig
	.globl _CLK_ClockSecuritySystemEnable
	.globl _CLK_GetSYSCLKSource
	.globl _CLK_GetClockFreq
	.globl _CLK_AdjustHSICalibrationValue
	.globl _CLK_SYSCLKEmergencyClear
	.globl _CLK_GetFlagStatus
	.globl _CLK_GetITStatus
	.globl _CLK_ClearITPendingBit
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
;	HAL_CLK.c: 12: void CLK_DeInit(void)
;	-----------------------------------------
;	 function CLK_DeInit
;	-----------------------------------------
_CLK_DeInit:
;	HAL_CLK.c: 15: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	HAL_CLK.c: 16: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	HAL_CLK.c: 17: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	HAL_CLK.c: 18: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	HAL_CLK.c: 19: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	HAL_CLK.c: 20: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	HAL_CLK.c: 21: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	HAL_CLK.c: 22: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	HAL_CLK.c: 23: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	HAL_CLK.c: 24: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
00101$:
	ld	a, 0x50c9
	srl	a
	jrc	00101$
;	HAL_CLK.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	HAL_CLK.c: 27: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	HAL_CLK.c: 28: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
;	HAL_CLK.c: 30: }
	ret
;	HAL_CLK.c: 32: void CLK_FastHaltWakeUpCmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_FastHaltWakeUpCmd
;	-----------------------------------------
_CLK_FastHaltWakeUpCmd:
;	HAL_CLK.c: 37: CLK->ICKR |= CLK_ICKR_FHWU;
	ld	a, 0x50c0
;	HAL_CLK.c: 34: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 37: CLK->ICKR |= CLK_ICKR_FHWU;
	or	a, #0x04
	ld	0x50c0, a
	ret
00102$:
;	HAL_CLK.c: 42: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
	and	a, #0xfb
	ld	0x50c0, a
;	HAL_CLK.c: 45: }
	ret
;	HAL_CLK.c: 47: void CLK_HSECmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_HSECmd
;	-----------------------------------------
_CLK_HSECmd:
;	HAL_CLK.c: 52: CLK->ECKR |= CLK_ECKR_HSEEN;
	ld	a, 0x50c1
;	HAL_CLK.c: 49: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 52: CLK->ECKR |= CLK_ECKR_HSEEN;
	or	a, #0x01
	ld	0x50c1, a
	ret
00102$:
;	HAL_CLK.c: 57: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
	and	a, #0xfe
	ld	0x50c1, a
;	HAL_CLK.c: 60: }
	ret
;	HAL_CLK.c: 62: void CLK_HSICmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_HSICmd
;	-----------------------------------------
_CLK_HSICmd:
;	HAL_CLK.c: 67: CLK->ICKR |= CLK_ICKR_HSIEN;
	ld	a, 0x50c0
;	HAL_CLK.c: 64: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 67: CLK->ICKR |= CLK_ICKR_HSIEN;
	or	a, #0x01
	ld	0x50c0, a
	ret
00102$:
;	HAL_CLK.c: 72: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
	and	a, #0xfe
	ld	0x50c0, a
;	HAL_CLK.c: 75: }
	ret
;	HAL_CLK.c: 78: void CLK_LSICmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_LSICmd
;	-----------------------------------------
_CLK_LSICmd:
;	HAL_CLK.c: 83: CLK->ICKR |= CLK_ICKR_LSIEN;
	ld	a, 0x50c0
;	HAL_CLK.c: 80: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 83: CLK->ICKR |= CLK_ICKR_LSIEN;
	or	a, #0x08
	ld	0x50c0, a
	ret
00102$:
;	HAL_CLK.c: 88: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	and	a, #0xf7
	ld	0x50c0, a
;	HAL_CLK.c: 91: }
	ret
;	HAL_CLK.c: 93: void CLK_CCOCmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_CCOCmd
;	-----------------------------------------
_CLK_CCOCmd:
;	HAL_CLK.c: 98: CLK->CCOR |= CLK_CCOR_CCOEN;
	ld	a, 0x50c9
;	HAL_CLK.c: 95: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 98: CLK->CCOR |= CLK_CCOR_CCOEN;
	or	a, #0x01
	ld	0x50c9, a
	ret
00102$:
;	HAL_CLK.c: 103: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
	and	a, #0xfe
	ld	0x50c9, a
;	HAL_CLK.c: 106: }
	ret
;	HAL_CLK.c: 115: void CLK_ClockSwitchCmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_ClockSwitchCmd
;	-----------------------------------------
_CLK_ClockSwitchCmd:
;	HAL_CLK.c: 120: CLK->SWCR |= CLK_SWCR_SWEN;
	ld	a, 0x50c5
;	HAL_CLK.c: 117: if (NewState != 0 )
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 120: CLK->SWCR |= CLK_SWCR_SWEN;
	or	a, #0x02
	ld	0x50c5, a
	ret
00102$:
;	HAL_CLK.c: 125: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
	and	a, #0xfd
	ld	0x50c5, a
;	HAL_CLK.c: 128: }
	ret
;	HAL_CLK.c: 130: void CLK_SlowActiveHaltWakeUpCmd(uint8_t NewState)
;	-----------------------------------------
;	 function CLK_SlowActiveHaltWakeUpCmd
;	-----------------------------------------
_CLK_SlowActiveHaltWakeUpCmd:
;	HAL_CLK.c: 135: CLK->ICKR |= CLK_ICKR_SWUAH;
	ld	a, 0x50c0
;	HAL_CLK.c: 132: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 135: CLK->ICKR |= CLK_ICKR_SWUAH;
	or	a, #0x20
	ld	0x50c0, a
	ret
00102$:
;	HAL_CLK.c: 140: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
	and	a, #0xdf
	ld	0x50c0, a
;	HAL_CLK.c: 143: }
	ret
;	HAL_CLK.c: 145: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, uint8_t NewState)
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
_CLK_PeripheralClockConfig:
	sub	sp, #2
;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, (0x05, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00128$
00127$:
	sll	(0x01, sp)
	dec	a
	jrne	00127$
00128$:
;	HAL_CLK.c: 157: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x02, sp), a
;	HAL_CLK.c: 147: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
	ld	a, (0x05, sp)
	bcp	a, #0x10
	jrne	00108$
;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, 0x50c7
;	HAL_CLK.c: 149: if (NewState != 0)
	tnz	(0x06, sp)
	jreq	00102$
;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	or	a, (0x01, sp)
	ld	0x50c7, a
	jra	00110$
00102$:
;	HAL_CLK.c: 157: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	and	a, (0x02, sp)
	ld	0x50c7, a
	jra	00110$
00108$:
;	HAL_CLK.c: 165: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, 0x50ca
;	HAL_CLK.c: 162: if (NewState != 0)
	tnz	(0x06, sp)
	jreq	00105$
;	HAL_CLK.c: 165: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	or	a, (0x01, sp)
	ld	0x50ca, a
	jra	00110$
00105$:
;	HAL_CLK.c: 170: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	and	a, (0x02, sp)
	ld	0x50ca, a
00110$:
;	HAL_CLK.c: 174: }
	addw	sp, #2
	ret
;	HAL_CLK.c: 176: uint8_t CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, uint8_t ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
;	-----------------------------------------
;	 function CLK_ClockSwitchConfig
;	-----------------------------------------
_CLK_ClockSwitchConfig:
;	HAL_CLK.c: 182: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
	ld	a, 0x50c3
	ld	yl, a
;	HAL_CLK.c: 189: CLK->SWCR |= CLK_SWCR_SWEN;
	ld	a, 0x50c5
;	HAL_CLK.c: 185: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00115$
;	HAL_CLK.c: 189: CLK->SWCR |= CLK_SWCR_SWEN;
	or	a, #0x02
	ld	0x50c5, a
	ld	a, 0x50c5
;	HAL_CLK.c: 192: if (ITState != 0)
	tnz	(0x05, sp)
	jreq	00102$
;	HAL_CLK.c: 194: CLK->SWCR |= CLK_SWCR_SWIEN;
	or	a, #0x04
	ld	0x50c5, a
	jra	00103$
00102$:
;	HAL_CLK.c: 198: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	and	a, #0xfb
	ld	0x50c5, a
00103$:
;	HAL_CLK.c: 202: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
;	HAL_CLK.c: 204: while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
	ldw	x, #0x0491
00105$:
	ld	a, 0x50c5
	srl	a
	jrnc	00107$
	tnzw	x
	jreq	00107$
;	HAL_CLK.c: 206: DownCounter--;
	decw	x
	jra	00105$
00107$:
;	HAL_CLK.c: 209: if (DownCounter != 0)
	tnzw	x
	jreq	00109$
;	HAL_CLK.c: 211: Swif = 1;
	ld	a, #0x01
	ld	xl, a
	jra	00116$
00109$:
;	HAL_CLK.c: 215: Swif = 0;
	clrw	x
	jra	00116$
00115$:
;	HAL_CLK.c: 223: if (ITState != 0)
	tnz	(0x05, sp)
	jreq	00112$
;	HAL_CLK.c: 225: CLK->SWCR |= CLK_SWCR_SWIEN;
	or	a, #0x04
	ld	0x50c5, a
	jra	00113$
00112$:
;	HAL_CLK.c: 229: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	and	a, #0xfb
	ld	0x50c5, a
00113$:
;	HAL_CLK.c: 233: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x04, sp)
	ld	(x), a
;	HAL_CLK.c: 237: Swif = 1;
	ld	a, #0x01
	ld	xl, a
00116$:
;	HAL_CLK.c: 242: if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
	tnz	(0x06, sp)
	jrne	00125$
	ld	a, yl
	cp	a, #0xe1
	jrne	00125$
;	HAL_CLK.c: 244: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
	bres	20672, #0
	jra	00126$
00125$:
;	HAL_CLK.c: 246: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
	tnz	(0x06, sp)
	jrne	00121$
	ld	a, yl
	cp	a, #0xd2
	jrne	00121$
;	HAL_CLK.c: 248: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	bres	20672, #3
	jra	00126$
00121$:
;	HAL_CLK.c: 250: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
	tnz	(0x06, sp)
	jrne	00126$
	ld	a, yl
	cp	a, #0xb4
	jrne	00126$
;	HAL_CLK.c: 252: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
	bres	20673, #0
00126$:
;	HAL_CLK.c: 255: return(Swif);
	ld	a, xl
;	HAL_CLK.c: 257: }
	ret
;	HAL_CLK.c: 259: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
;	-----------------------------------------
;	 function CLK_HSIPrescalerConfig
;	-----------------------------------------
_CLK_HSIPrescalerConfig:
;	HAL_CLK.c: 262: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0xe7
	ld	0x50c6, a
;	HAL_CLK.c: 265: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
	ld	a, 0x50c6
	or	a, (0x03, sp)
	ld	0x50c6, a
;	HAL_CLK.c: 267: }
	ret
;	HAL_CLK.c: 269: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
;	-----------------------------------------
;	 function CLK_CCOConfig
;	-----------------------------------------
_CLK_CCOConfig:
;	HAL_CLK.c: 271: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
	ld	a, 0x50c9
	and	a, #0xe1
	ld	0x50c9, a
;	HAL_CLK.c: 274: CLK->CCOR |= (uint8_t)CLK_CCO;
	ld	a, 0x50c9
	or	a, (0x03, sp)
	ld	0x50c9, a
;	HAL_CLK.c: 277: CLK->CCOR |= CLK_CCOR_CCOEN;
	bset	20681, #0
;	HAL_CLK.c: 279: }
	ret
;	HAL_CLK.c: 281: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, uint8_t NewState)
;	-----------------------------------------
;	 function CLK_ITConfig
;	-----------------------------------------
_CLK_ITConfig:
	push	a
;	HAL_CLK.c: 285: switch (CLK_IT)
	ld	a, (0x04, sp)
	sub	a, #0x0c
	jrne	00140$
	inc	a
	ld	(0x01, sp), a
	.byte 0xc5
00140$:
	clr	(0x01, sp)
00141$:
	ld	a, (0x04, sp)
	sub	a, #0x1c
	jrne	00143$
	inc	a
	.byte 0x21
00143$:
	clr	a
00144$:
;	HAL_CLK.c: 283: if (NewState != 0)
	tnz	(0x05, sp)
	jreq	00110$
;	HAL_CLK.c: 285: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00102$
	tnz	a
	jreq	00112$
;	HAL_CLK.c: 288: CLK->SWCR |= CLK_SWCR_SWIEN;
	bset	20677, #2
;	HAL_CLK.c: 289: break;
	jra	00112$
;	HAL_CLK.c: 290: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
00102$:
;	HAL_CLK.c: 291: CLK->CSSR |= CLK_CSSR_CSSDIE;
	bset	20680, #2
;	HAL_CLK.c: 292: break;
	jra	00112$
;	HAL_CLK.c: 295: }
00110$:
;	HAL_CLK.c: 299: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00106$
	tnz	a
	jreq	00112$
;	HAL_CLK.c: 302: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
	bres	20677, #2
;	HAL_CLK.c: 303: break;
	jra	00112$
;	HAL_CLK.c: 304: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
00106$:
;	HAL_CLK.c: 305: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
	bres	20680, #2
;	HAL_CLK.c: 309: }
00112$:
;	HAL_CLK.c: 312: }
	pop	a
	ret
;	HAL_CLK.c: 315: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
_CLK_SYSCLKConfig:
	push	a
;	HAL_CLK.c: 319: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
;	HAL_CLK.c: 317: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
	tnz	(0x04, sp)
	jrmi	00102$
;	HAL_CLK.c: 319: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	and	a, #0xe7
	ld	0x50c6, a
;	HAL_CLK.c: 320: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	and	a, #0x18
	or	a, (0x01, sp)
	ld	0x50c6, a
	jra	00104$
00102$:
;	HAL_CLK.c: 324: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
	and	a, #0xf8
	ld	0x50c6, a
;	HAL_CLK.c: 325: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
	ld	a, 0x50c6
	ld	(0x01, sp), a
	ld	a, (0x04, sp)
	and	a, #0x07
	or	a, (0x01, sp)
	ld	0x50c6, a
00104$:
;	HAL_CLK.c: 328: }
	pop	a
	ret
;	HAL_CLK.c: 330: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
;	-----------------------------------------
;	 function CLK_SWIMConfig
;	-----------------------------------------
_CLK_SWIMConfig:
;	HAL_CLK.c: 335: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
	ld	a, 0x50cd
;	HAL_CLK.c: 332: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CLK.c: 335: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
	or	a, #0x01
	ld	0x50cd, a
	ret
00102$:
;	HAL_CLK.c: 340: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
	and	a, #0xfe
	ld	0x50cd, a
;	HAL_CLK.c: 343: }
	ret
;	HAL_CLK.c: 345: void CLK_ClockSecuritySystemEnable(void)
;	-----------------------------------------
;	 function CLK_ClockSecuritySystemEnable
;	-----------------------------------------
_CLK_ClockSecuritySystemEnable:
;	HAL_CLK.c: 347: CLK->CSSR |= CLK_CSSR_CSSEN;
	bset	20680, #0
;	HAL_CLK.c: 348: }
	ret
;	HAL_CLK.c: 350: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
;	-----------------------------------------
;	 function CLK_GetSYSCLKSource
;	-----------------------------------------
_CLK_GetSYSCLKSource:
;	HAL_CLK.c: 352: return((CLK_Source_TypeDef)CLK->CMSR);
	ld	a, 0x50c3
;	HAL_CLK.c: 353: }
	ret
;	HAL_CLK.c: 355: uint32_t CLK_GetClockFreq(void)
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
_CLK_GetClockFreq:
	sub	sp, #4
;	HAL_CLK.c: 363: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
	ld	a, 0x50c3
;	HAL_CLK.c: 365: if (clocksource == CLK_SOURCE_HSI)
	ld	(0x04, sp), a
	cp	a, #0xe1
	jrne	00105$
;	HAL_CLK.c: 367: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
	ld	a, 0x50c6
	and	a, #0x18
;	HAL_CLK.c: 368: tmp = (uint8_t)(tmp >> 3);
	srl	a
	srl	a
	srl	a
;	HAL_CLK.c: 369: presc = HSIDivFactor[tmp];
	clrw	x
	ld	xl, a
	addw	x, #(_HSIDivFactor + 0)
	ld	a, (x)
;	HAL_CLK.c: 370: clockfrequency = HSI_VALUE / presc;
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	jra	00106$
00105$:
;	HAL_CLK.c: 372: else if ( clocksource == CLK_SOURCE_LSI)
	ld	a, (0x04, sp)
	cp	a, #0xd2
	jrne	00102$
;	HAL_CLK.c: 374: clockfrequency = LSI_VALUE;
	ldw	x, #0xf400
	ldw	(0x03, sp), x
	ldw	y, #0x0001
	jra	00106$
00102$:
;	HAL_CLK.c: 378: clockfrequency = HSE_VALUE;
	ldw	x, #0x3600
	ldw	(0x03, sp), x
	ldw	y, #0x016e
00106$:
;	HAL_CLK.c: 381: return((uint32_t)clockfrequency);
	ldw	x, (0x03, sp)
;	HAL_CLK.c: 383: }
	addw	sp, #4
	ret
;	HAL_CLK.c: 385: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
;	-----------------------------------------
;	 function CLK_AdjustHSICalibrationValue
;	-----------------------------------------
_CLK_AdjustHSICalibrationValue:
;	HAL_CLK.c: 387: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
	ld	a, 0x50cc
	and	a, #0xf8
	or	a, (0x03, sp)
	ld	0x50cc, a
;	HAL_CLK.c: 388: }
	ret
;	HAL_CLK.c: 390: void CLK_SYSCLKEmergencyClear(void)
;	-----------------------------------------
;	 function CLK_SYSCLKEmergencyClear
;	-----------------------------------------
_CLK_SYSCLKEmergencyClear:
;	HAL_CLK.c: 392: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
	bres	20677, #0
;	HAL_CLK.c: 393: }
	ret
;	HAL_CLK.c: 395: uint8_t CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
;	-----------------------------------------
;	 function CLK_GetFlagStatus
;	-----------------------------------------
_CLK_GetFlagStatus:
	sub	sp, #2
;	HAL_CLK.c: 402: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
	ldw	x, (0x05, sp)
	clr	a
	ld	xl, a
;	HAL_CLK.c: 405: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
	ldw	(0x01, sp), x
	cpw	x, #0x0100
	jrne	00111$
;	HAL_CLK.c: 407: tmpreg = CLK->ICKR;
	ld	a, 0x50c0
	jra	00112$
00111$:
;	HAL_CLK.c: 409: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
	ldw	x, (0x01, sp)
	cpw	x, #0x0200
	jrne	00108$
;	HAL_CLK.c: 411: tmpreg = CLK->ECKR;
	ld	a, 0x50c1
	jra	00112$
00108$:
;	HAL_CLK.c: 413: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
	ldw	x, (0x01, sp)
	cpw	x, #0x0300
	jrne	00105$
;	HAL_CLK.c: 415: tmpreg = CLK->SWCR;
	ld	a, 0x50c5
	jra	00112$
00105$:
;	HAL_CLK.c: 417: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
	ldw	x, (0x01, sp)
	cpw	x, #0x0400
	jrne	00102$
;	HAL_CLK.c: 419: tmpreg = CLK->CSSR;
	ld	a, 0x50c8
	jra	00112$
00102$:
;	HAL_CLK.c: 423: tmpreg = CLK->CCOR;
	ld	a, 0x50c9
00112$:
;	HAL_CLK.c: 426: if ((tmpreg & (uint8_t)CLK_FLAG) != 0)
	push	a
	ld	a, (0x07, sp)
	ld	(0x03, sp), a
	pop	a
	and	a, (0x02, sp)
	jreq	00114$
;	HAL_CLK.c: 428: bitstatus = 1;
	ld	a, #0x01
;	HAL_CLK.c: 432: bitstatus = 0;
	.byte 0x21
00114$:
	clr	a
00115$:
;	HAL_CLK.c: 436: return(bitstatus);
;	HAL_CLK.c: 438: }
	addw	sp, #2
	ret
;	HAL_CLK.c: 440: uint8_t CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_GetITStatus
;	-----------------------------------------
_CLK_GetITStatus:
;	HAL_CLK.c: 444: if (CLK_IT == CLK_IT_SWIF)
	ld	a, (0x03, sp)
	cp	a, #0x1c
	jrne	00108$
;	HAL_CLK.c: 447: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c5
	and	a, (0x03, sp)
;	HAL_CLK.c: 449: bitstatus = 1;
	sub	a, #0x0c
	jrne	00102$
	inc	a
	ret
00102$:
;	HAL_CLK.c: 453: bitstatus = 0;
	clr	a
	ret
00108$:
;	HAL_CLK.c: 459: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ld	a, 0x50c8
	and	a, (0x03, sp)
;	HAL_CLK.c: 461: bitstatus = 1;
	sub	a, #0x0c
	jrne	00105$
	inc	a
	ret
00105$:
;	HAL_CLK.c: 465: bitstatus = 0;
	clr	a
;	HAL_CLK.c: 469: return bitstatus;
;	HAL_CLK.c: 471: }
	ret
;	HAL_CLK.c: 473: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_ClearITPendingBit
;	-----------------------------------------
_CLK_ClearITPendingBit:
;	HAL_CLK.c: 475: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
	ld	a, (0x03, sp)
	cp	a, #0x0c
	jrne	00102$
;	HAL_CLK.c: 478: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
	bres	20680, #3
	ret
00102$:
;	HAL_CLK.c: 483: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
	bres	20677, #3
;	HAL_CLK.c: 486: }
	ret
	.area CODE
	.area CONST
_HSIDivFactor:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
_CLKPrescTable:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x28	; 40
	.area INITIALIZER
	.area CABS (ABS)
