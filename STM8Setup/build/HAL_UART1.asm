;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module HAL_UART1
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UART1_DeInit
	.globl _UART1_Init
	.globl _UART1_Cmd
	.globl _UART1_ITConfig
	.globl _UART1_HalfDuplexCmd
	.globl _UART1_IrDAConfig
	.globl _UART1_IrDACmd
	.globl _UART1_LINBreakDetectionConfig
	.globl _UART1_LINCmd
	.globl _UART1_SmartCardCmd
	.globl _UART1_SmartCardNACKCmd
	.globl _UART1_WakeUpConfig
	.globl _UART1_ReceiverWakeUpCmd
	.globl _UART1_ReceiveData8
	.globl _UART1_ReceiveData9
	.globl _UART1_SendData8
	.globl _UART1_SendData9
	.globl _UART1_SendBreak
	.globl _UART1_SetAddress
	.globl _UART1_SetGuardTime
	.globl _UART1_SetPrescaler
	.globl _UART1_GetFlagStatus
	.globl _UART1_ClearFlag
	.globl _UART1_GetITStatus
	.globl _UART1_ClearITPendingBit
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
;	HAL_UART1.c: 9: void UART1_DeInit(void)
;	-----------------------------------------
;	 function UART1_DeInit
;	-----------------------------------------
_UART1_DeInit:
;	HAL_UART1.c: 13: (void)UART1->SR;
	ld	a, 0x5230
;	HAL_UART1.c: 14: (void)UART1->DR;
	ld	a, 0x5231
;	HAL_UART1.c: 16: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
	mov	0x5233+0, #0x00
;	HAL_UART1.c: 17: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
	mov	0x5232+0, #0x00
;	HAL_UART1.c: 19: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
	mov	0x5234+0, #0x00
;	HAL_UART1.c: 20: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
	mov	0x5235+0, #0x00
;	HAL_UART1.c: 21: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
	mov	0x5236+0, #0x00
;	HAL_UART1.c: 22: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
	mov	0x5237+0, #0x00
;	HAL_UART1.c: 23: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
	mov	0x5238+0, #0x00
;	HAL_UART1.c: 25: UART1->GTR = UART1_GTR_RESET_VALUE;
	mov	0x5239+0, #0x00
;	HAL_UART1.c: 26: UART1->PSCR = UART1_PSCR_RESET_VALUE;
	mov	0x523a+0, #0x00
;	HAL_UART1.c: 27: }
	ret
;	HAL_UART1.c: 29: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	sub	sp, #17
;	HAL_UART1.c: 36: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);
	bres	21044, #4
;	HAL_UART1.c: 39: UART1->CR1 |= (uint8_t)WordLength;
	ld	a, 0x5234
	or	a, (0x18, sp)
	ld	0x5234, a
;	HAL_UART1.c: 42: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
	ld	a, 0x5236
	and	a, #0xcf
	ld	0x5236, a
;	HAL_UART1.c: 44: UART1->CR3 |= (uint8_t)StopBits;
	ld	a, 0x5236
	or	a, (0x19, sp)
	ld	0x5236, a
;	HAL_UART1.c: 47: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS));
	ld	a, 0x5234
	and	a, #0xf9
	ld	0x5234, a
;	HAL_UART1.c: 49: UART1->CR1 |= (uint8_t)Parity;
	ld	a, 0x5234
	or	a, (0x1a, sp)
	ld	0x5234, a
;	HAL_UART1.c: 52: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);
	ld	a, 0x5232
	mov	0x5232+0, #0x00
;	HAL_UART1.c: 54: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);
	ld	a, 0x5233
	and	a, #0x0f
	ld	0x5233, a
;	HAL_UART1.c: 56: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);
	ld	a, 0x5233
	and	a, #0xf0
	ld	0x5233, a
;	HAL_UART1.c: 59: BaudRate_Mantissa = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
	call	_CLK_GetClockFreq
	ldw	(0x10, sp), x
	clrw	y
	tnz	(0x10, sp)
	jrpl	00127$
	decw	y
00127$:
	ldw	x, (0x14, sp)
	ldw	(0x0a, sp), x
	ldw	x, (0x16, sp)
	ld	a, #0x04
00128$:
	sllw	x
	rlc	(0x0b, sp)
	rlc	(0x0a, sp)
	dec	a
	jrne	00128$
	ldw	(0x0c, sp), x
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	HAL_UART1.c: 60: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
	call	_CLK_GetClockFreq
	clrw	y
	tnzw	x
	jrpl	00130$
	decw	y
00130$:
	pushw	x
	pushw	y
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ldw	(0x07, sp), x
	ldw	(0x05, sp), y
;	HAL_UART1.c: 62: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F);
	ld	a, 0x5233
	ld	(0x09, sp), a
	ldw	x, (0x03, sp)
	pushw	x
	ldw	x, (0x03, sp)
	pushw	x
	push	#0x64
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x0c, sp), x
	ldw	(0x0a, sp), y
	ldw	x, (0x07, sp)
	subw	x, (0x0c, sp)
	ldw	(0x10, sp), x
	ld	a, (0x06, sp)
	sbc	a, (0x0b, sp)
	ld	(0x0f, sp), a
	ld	a, (0x05, sp)
	sbc	a, (0x0a, sp)
	ld	(0x0e, sp), a
	ldw	x, (0x10, sp)
	ldw	y, (0x0e, sp)
	ld	a, #0x04
00131$:
	sllw	x
	rlcw	y
	dec	a
	jrne	00131$
	push	#0x64
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
	and	a, #0x0f
	or	a, (0x09, sp)
	ld	0x5233, a
;	HAL_UART1.c: 64: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
	ld	a, 0x5233
	ld	(0x11, sp), a
	ldw	x, (0x03, sp)
	ld	a, #0x10
	div	x, a
	ld	a, xl
	and	a, #0xf0
	or	a, (0x11, sp)
	ld	0x5233, a
;	HAL_UART1.c: 66: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;
	ld	a, 0x5232
	ld	(0x11, sp), a
	ld	a, (0x04, sp)
	or	a, (0x11, sp)
	ld	0x5232, a
;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
	ld	a, 0x5235
	and	a, #0xf3
	ld	0x5235, a
;	HAL_UART1.c: 71: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
	ld	a, 0x5236
	and	a, #0xf8
	ld	0x5236, a
;	HAL_UART1.c: 73: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL |
	ld	a, 0x5236
	ld	(0x11, sp), a
	ld	a, (0x1b, sp)
	and	a, #0x07
	or	a, (0x11, sp)
	ld	0x5236, a
;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
	ld	a, 0x5235
;	HAL_UART1.c: 76: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
	push	a
	ld	a, (0x1d, sp)
	bcp	a, #0x04
	pop	a
	jreq	00102$
;	HAL_UART1.c: 79: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
	or	a, #0x08
	ld	0x5235, a
	jra	00103$
00102$:
;	HAL_UART1.c: 84: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);
	and	a, #0xf7
	ld	0x5235, a
00103$:
;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
	ld	a, 0x5235
;	HAL_UART1.c: 86: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
	push	a
	ld	a, (0x1d, sp)
	bcp	a, #0x08
	pop	a
	jreq	00105$
;	HAL_UART1.c: 89: UART1->CR2 |= (uint8_t)UART1_CR2_REN;
	or	a, #0x04
	ld	0x5235, a
	jra	00106$
00105$:
;	HAL_UART1.c: 94: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);
	and	a, #0xfb
	ld	0x5235, a
00106$:
;	HAL_UART1.c: 42: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
	ld	a, 0x5236
;	HAL_UART1.c: 98: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
	tnz	(0x1b, sp)
	jrpl	00108$
;	HAL_UART1.c: 101: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN);
	and	a, #0xf7
	ld	0x5236, a
	jra	00110$
00108$:
;	HAL_UART1.c: 105: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
	push	a
	ld	a, (0x1c, sp)
	and	a, #0x08
	ld	(0x12, sp), a
	pop	a
	or	a, (0x11, sp)
	ld	0x5236, a
00110$:
;	HAL_UART1.c: 107: }
	addw	sp, #17
	ret
;	HAL_UART1.c: 115: void UART1_Cmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_Cmd
;	-----------------------------------------
_UART1_Cmd:
;	HAL_UART1.c: 120: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
	ld	a, 0x5234
;	HAL_UART1.c: 117: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 120: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
	and	a, #0xdf
	ld	0x5234, a
	ret
00102$:
;	HAL_UART1.c: 125: UART1->CR1 |= UART1_CR1_UARTD;
	or	a, #0x20
	ld	0x5234, a
;	HAL_UART1.c: 127: }
	ret
;	HAL_UART1.c: 143: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, uint8_t NewState)
;	-----------------------------------------
;	 function UART1_ITConfig
;	-----------------------------------------
_UART1_ITConfig:
	sub	sp, #2
;	HAL_UART1.c: 148: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
	ldw	x, (0x05, sp)
;	HAL_UART1.c: 150: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x06, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00144$
00143$:
	sll	(0x02, sp)
	dec	a
	jrne	00143$
00144$:
;	HAL_UART1.c: 155: if (uartreg == 0x01)
	ld	a, xh
	dec	a
	jrne	00146$
	ld	a, #0x01
	ld	(0x01, sp), a
	.byte 0xc5
00146$:
	clr	(0x01, sp)
00147$:
;	HAL_UART1.c: 159: else if (uartreg == 0x02)
	ld	a, xh
	sub	a, #0x02
	jrne	00149$
	inc	a
	.byte 0x21
00149$:
	clr	a
00150$:
;	HAL_UART1.c: 152: if (NewState != 0)
	tnz	(0x07, sp)
	jreq	00114$
;	HAL_UART1.c: 155: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00105$
;	HAL_UART1.c: 157: UART1->CR1 |= itpos;
	ld	a, 0x5234
	or	a, (0x02, sp)
	ld	0x5234, a
	jra	00116$
00105$:
;	HAL_UART1.c: 159: else if (uartreg == 0x02)
	tnz	a
	jreq	00102$
;	HAL_UART1.c: 161: UART1->CR2 |= itpos;
	ld	a, 0x5235
	or	a, (0x02, sp)
	ld	0x5235, a
	jra	00116$
00102$:
;	HAL_UART1.c: 165: UART1->CR4 |= itpos;
	ld	a, 0x5237
	or	a, (0x02, sp)
	ld	0x5237, a
	jra	00116$
00114$:
;	HAL_UART1.c: 173: UART1->CR1 &= (uint8_t)(~itpos);
	cpl	(0x02, sp)
;	HAL_UART1.c: 171: if (uartreg == 0x01)
	tnz	(0x01, sp)
	jreq	00111$
;	HAL_UART1.c: 173: UART1->CR1 &= (uint8_t)(~itpos);
	ld	a, 0x5234
	and	a, (0x02, sp)
	ld	0x5234, a
	jra	00116$
00111$:
;	HAL_UART1.c: 175: else if (uartreg == 0x02)
	tnz	a
	jreq	00108$
;	HAL_UART1.c: 177: UART1->CR2 &= (uint8_t)(~itpos);
	ld	a, 0x5235
	and	a, (0x02, sp)
	ld	0x5235, a
	jra	00116$
00108$:
;	HAL_UART1.c: 181: UART1->CR4 &= (uint8_t)(~itpos);
	ld	a, 0x5237
	and	a, (0x02, sp)
	ld	0x5237, a
00116$:
;	HAL_UART1.c: 185: }
	addw	sp, #2
	ret
;	HAL_UART1.c: 192: void UART1_HalfDuplexCmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_HalfDuplexCmd
;	-----------------------------------------
_UART1_HalfDuplexCmd:
;	HAL_UART1.c: 197: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
	ld	a, 0x5238
;	HAL_UART1.c: 195: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 197: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
	or	a, #0x08
	ld	0x5238, a
	ret
00102$:
;	HAL_UART1.c: 201: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
	and	a, #0xf7
	ld	0x5238, a
;	HAL_UART1.c: 203: }
	ret
;	HAL_UART1.c: 211: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
;	-----------------------------------------
;	 function UART1_IrDAConfig
;	-----------------------------------------
_UART1_IrDAConfig:
;	HAL_UART1.c: 216: UART1->CR5 |= UART1_CR5_IRLP;
	ld	a, 0x5238
;	HAL_UART1.c: 214: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 216: UART1->CR5 |= UART1_CR5_IRLP;
	or	a, #0x04
	ld	0x5238, a
	ret
00102$:
;	HAL_UART1.c: 220: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
	and	a, #0xfb
	ld	0x5238, a
;	HAL_UART1.c: 222: }
	ret
;	HAL_UART1.c: 230: void UART1_IrDACmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_IrDACmd
;	-----------------------------------------
_UART1_IrDACmd:
;	HAL_UART1.c: 237: UART1->CR5 |= UART1_CR5_IREN;
	ld	a, 0x5238
;	HAL_UART1.c: 234: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 237: UART1->CR5 |= UART1_CR5_IREN;
	or	a, #0x02
	ld	0x5238, a
	ret
00102$:
;	HAL_UART1.c: 242: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
	and	a, #0xfd
	ld	0x5238, a
;	HAL_UART1.c: 244: }
	ret
;	HAL_UART1.c: 253: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
;	-----------------------------------------
;	 function UART1_LINBreakDetectionConfig
;	-----------------------------------------
_UART1_LINBreakDetectionConfig:
;	HAL_UART1.c: 258: UART1->CR4 |= UART1_CR4_LBDL;
	ld	a, 0x5237
;	HAL_UART1.c: 256: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 258: UART1->CR4 |= UART1_CR4_LBDL;
	or	a, #0x20
	ld	0x5237, a
	ret
00102$:
;	HAL_UART1.c: 262: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
	and	a, #0xdf
	ld	0x5237, a
;	HAL_UART1.c: 264: }
	ret
;	HAL_UART1.c: 272: void UART1_LINCmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_LINCmd
;	-----------------------------------------
_UART1_LINCmd:
;	HAL_UART1.c: 278: UART1->CR3 |= UART1_CR3_LINEN;
	ld	a, 0x5236
;	HAL_UART1.c: 275: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 278: UART1->CR3 |= UART1_CR3_LINEN;
	or	a, #0x40
	ld	0x5236, a
	ret
00102$:
;	HAL_UART1.c: 283: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
	and	a, #0xbf
	ld	0x5236, a
;	HAL_UART1.c: 285: }
	ret
;	HAL_UART1.c: 292: void UART1_SmartCardCmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_SmartCardCmd
;	-----------------------------------------
_UART1_SmartCardCmd:
;	HAL_UART1.c: 298: UART1->CR5 |= UART1_CR5_SCEN;
	ld	a, 0x5238
;	HAL_UART1.c: 295: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 298: UART1->CR5 |= UART1_CR5_SCEN;
	or	a, #0x20
	ld	0x5238, a
	ret
00102$:
;	HAL_UART1.c: 303: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
	and	a, #0xdf
	ld	0x5238, a
;	HAL_UART1.c: 305: }
	ret
;	HAL_UART1.c: 314: void UART1_SmartCardNACKCmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_SmartCardNACKCmd
;	-----------------------------------------
_UART1_SmartCardNACKCmd:
;	HAL_UART1.c: 320: UART1->CR5 |= UART1_CR5_NACK;
	ld	a, 0x5238
;	HAL_UART1.c: 317: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 320: UART1->CR5 |= UART1_CR5_NACK;
	or	a, #0x10
	ld	0x5238, a
	ret
00102$:
;	HAL_UART1.c: 325: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
	and	a, #0xef
	ld	0x5238, a
;	HAL_UART1.c: 327: }
	ret
;	HAL_UART1.c: 335: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
;	-----------------------------------------
;	 function UART1_WakeUpConfig
;	-----------------------------------------
_UART1_WakeUpConfig:
;	HAL_UART1.c: 338: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
	bres	21044, #3
;	HAL_UART1.c: 339: UART1->CR1 |= (uint8_t)UART1_WakeUp;
	ld	a, 0x5234
	or	a, (0x03, sp)
	ld	0x5234, a
;	HAL_UART1.c: 340: }
	ret
;	HAL_UART1.c: 347: void UART1_ReceiverWakeUpCmd(uint8_t NewState)
;	-----------------------------------------
;	 function UART1_ReceiverWakeUpCmd
;	-----------------------------------------
_UART1_ReceiverWakeUpCmd:
;	HAL_UART1.c: 353: UART1->CR2 |= UART1_CR2_RWU;
	ld	a, 0x5235
;	HAL_UART1.c: 350: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 353: UART1->CR2 |= UART1_CR2_RWU;
	or	a, #0x02
	ld	0x5235, a
	ret
00102$:
;	HAL_UART1.c: 358: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
	and	a, #0xfd
	ld	0x5235, a
;	HAL_UART1.c: 360: }
	ret
;	HAL_UART1.c: 367: uint8_t UART1_ReceiveData8(void)
;	-----------------------------------------
;	 function UART1_ReceiveData8
;	-----------------------------------------
_UART1_ReceiveData8:
;	HAL_UART1.c: 369: return ((uint8_t)UART1->DR);
	ld	a, 0x5231
;	HAL_UART1.c: 370: }
	ret
;	HAL_UART1.c: 377: uint16_t UART1_ReceiveData9(void)
;	-----------------------------------------
;	 function UART1_ReceiveData9
;	-----------------------------------------
_UART1_ReceiveData9:
	sub	sp, #2
;	HAL_UART1.c: 381: temp = (uint16_t)(((uint16_t)((uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
	ld	a, 0x5234
	and	a, #0x80
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	ldw	(0x01, sp), x
;	HAL_UART1.c: 382: return (uint16_t)((((uint16_t)UART1->DR) | temp) & ((uint16_t)0x01FF));
	ld	a, 0x5231
	clrw	x
	or	a, (0x02, sp)
	rlwa	x
	or	a, (0x01, sp)
	and	a, #0x01
	ld	xh, a
;	HAL_UART1.c: 383: }
	addw	sp, #2
	ret
;	HAL_UART1.c: 390: void UART1_SendData8(uint8_t Data)
;	-----------------------------------------
;	 function UART1_SendData8
;	-----------------------------------------
_UART1_SendData8:
;	HAL_UART1.c: 393: UART1->DR = Data;
	ldw	x, #0x5231
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_UART1.c: 394: }
	ret
;	HAL_UART1.c: 402: void UART1_SendData9(uint16_t Data)
;	-----------------------------------------
;	 function UART1_SendData9
;	-----------------------------------------
_UART1_SendData9:
	push	a
;	HAL_UART1.c: 405: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
	bres	21044, #6
;	HAL_UART1.c: 407: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
	ld	a, 0x5234
	ld	(0x01, sp), a
	ldw	x, (0x04, sp)
	srlw	x
	srlw	x
	ld	a, xl
	and	a, #0x40
	or	a, (0x01, sp)
	ld	0x5234, a
;	HAL_UART1.c: 409: UART1->DR = (uint8_t)(Data);
	ld	a, (0x05, sp)
	ld	0x5231, a
;	HAL_UART1.c: 410: }
	pop	a
	ret
;	HAL_UART1.c: 417: void UART1_SendBreak(void)
;	-----------------------------------------
;	 function UART1_SendBreak
;	-----------------------------------------
_UART1_SendBreak:
;	HAL_UART1.c: 419: UART1->CR2 |= UART1_CR2_SBK;
	bset	21045, #0
;	HAL_UART1.c: 420: }
	ret
;	HAL_UART1.c: 427: void UART1_SetAddress(uint8_t UART1_Address)
;	-----------------------------------------
;	 function UART1_SetAddress
;	-----------------------------------------
_UART1_SetAddress:
;	HAL_UART1.c: 431: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
	ld	a, 0x5237
	and	a, #0xf0
	ld	0x5237, a
;	HAL_UART1.c: 433: UART1->CR4 |= UART1_Address;
	ld	a, 0x5237
	or	a, (0x03, sp)
	ld	0x5237, a
;	HAL_UART1.c: 434: }
	ret
;	HAL_UART1.c: 442: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
;	-----------------------------------------
;	 function UART1_SetGuardTime
;	-----------------------------------------
_UART1_SetGuardTime:
;	HAL_UART1.c: 445: UART1->GTR = UART1_GuardTime;
	ldw	x, #0x5239
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_UART1.c: 446: }
	ret
;	HAL_UART1.c: 470: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
;	-----------------------------------------
;	 function UART1_SetPrescaler
;	-----------------------------------------
_UART1_SetPrescaler:
;	HAL_UART1.c: 473: UART1->PSCR = UART1_Prescaler;
	ldw	x, #0x523a
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_UART1.c: 474: }
	ret
;	HAL_UART1.c: 482: uint8_t UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_GetFlagStatus
;	-----------------------------------------
_UART1_GetFlagStatus:
	sub	sp, #3
;	HAL_UART1.c: 490: if (UART1_FLAG == UART1_FLAG_LBDF)
	ldw	y, (0x06, sp)
	ldw	(0x01, sp), y
;	HAL_UART1.c: 492: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, (0x07, sp)
	ld	(0x03, sp), a
;	HAL_UART1.c: 490: if (UART1_FLAG == UART1_FLAG_LBDF)
	ldw	x, (0x01, sp)
	cpw	x, #0x0210
	jrne	00114$
;	HAL_UART1.c: 492: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5237
	and	a, (0x03, sp)
	jreq	00102$
;	HAL_UART1.c: 495: status = 1;
	ld	a, #0x01
	jra	00115$
00102$:
;	HAL_UART1.c: 500: status = 0;
	clr	a
	jra	00115$
00114$:
;	HAL_UART1.c: 503: else if (UART1_FLAG == UART1_FLAG_SBK)
	ldw	x, (0x01, sp)
	cpw	x, #0x0101
	jrne	00111$
;	HAL_UART1.c: 505: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5235
	and	a, (0x03, sp)
	jreq	00105$
;	HAL_UART1.c: 508: status = 1;
	ld	a, #0x01
	jra	00115$
00105$:
;	HAL_UART1.c: 513: status = 0;
	clr	a
	jra	00115$
00111$:
;	HAL_UART1.c: 518: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
	ld	a, 0x5230
	and	a, (0x03, sp)
	jreq	00108$
;	HAL_UART1.c: 521: status = 1;
	ld	a, #0x01
;	HAL_UART1.c: 526: status = 0;
	.byte 0x21
00108$:
	clr	a
00115$:
;	HAL_UART1.c: 530: return status;
;	HAL_UART1.c: 531: }
	addw	sp, #3
	ret
;	HAL_UART1.c: 560: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
;	-----------------------------------------
;	 function UART1_ClearFlag
;	-----------------------------------------
_UART1_ClearFlag:
;	HAL_UART1.c: 564: if (UART1_FLAG == UART1_FLAG_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0020
	jrne	00102$
;	HAL_UART1.c: 566: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	HAL_UART1.c: 571: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	bres	21047, #4
;	HAL_UART1.c: 573: }
	ret
;	HAL_UART1.c: 588: uint8_t UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_GetITStatus
;	-----------------------------------------
_UART1_GetITStatus:
	sub	sp, #4
;	HAL_UART1.c: 599: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
	ld	a, (0x08, sp)
	ld	xl, a
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00162$
00161$:
	sll	(0x01, sp)
	dec	a
	jrne	00161$
00162$:
;	HAL_UART1.c: 601: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
	ld	a, xl
	swap	a
	and	a, #0x0f
;	HAL_UART1.c: 603: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
	push	a
	ld	a, #0x01
	ld	(0x03, sp), a
	pop	a
	tnz	a
	jreq	00164$
00163$:
	sll	(0x02, sp)
	dec	a
	jrne	00163$
00164$:
;	HAL_UART1.c: 607: if (UART1_IT == UART1_IT_PE)
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	cpw	x, #0x0100
	jrne	00117$
;	HAL_UART1.c: 610: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
	ld	a, 0x5234
	and	a, (0x02, sp)
	ld	xl, a
;	HAL_UART1.c: 613: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5230
	and	a, (0x01, sp)
	jreq	00102$
	ld	a, xl
	tnz	a
	jreq	00102$
;	HAL_UART1.c: 616: pendingbitstatus = 1;
	ld	a, #0x01
	jra	00118$
00102$:
;	HAL_UART1.c: 621: pendingbitstatus = 0;
	clr	a
	jra	00118$
00117$:
;	HAL_UART1.c: 625: else if (UART1_IT == UART1_IT_LBDF)
	ldw	x, (0x03, sp)
	cpw	x, #0x0346
	jrne	00114$
;	HAL_UART1.c: 628: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
	ld	a, 0x5237
	and	a, (0x02, sp)
	ld	xl, a
;	HAL_UART1.c: 630: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5237
	and	a, (0x01, sp)
	jreq	00106$
	ld	a, xl
	tnz	a
	jreq	00106$
;	HAL_UART1.c: 633: pendingbitstatus = 1;
	ld	a, #0x01
	jra	00118$
00106$:
;	HAL_UART1.c: 638: pendingbitstatus = 0;
	clr	a
	jra	00118$
00114$:
;	HAL_UART1.c: 644: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
	ld	a, 0x5235
	and	a, (0x02, sp)
	ld	xl, a
;	HAL_UART1.c: 646: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
	ld	a, 0x5230
	and	a, (0x01, sp)
	jreq	00110$
	ld	a, xl
	tnz	a
	jreq	00110$
;	HAL_UART1.c: 649: pendingbitstatus = 1;
	ld	a, #0x01
;	HAL_UART1.c: 654: pendingbitstatus = 0;
	.byte 0x21
00110$:
	clr	a
00118$:
;	HAL_UART1.c: 659: return  pendingbitstatus;
;	HAL_UART1.c: 660: }
	addw	sp, #4
	ret
;	HAL_UART1.c: 687: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
;	-----------------------------------------
;	 function UART1_ClearITPendingBit
;	-----------------------------------------
_UART1_ClearITPendingBit:
;	HAL_UART1.c: 691: if (UART1_IT == UART1_IT_RXNE)
	ldw	x, (0x03, sp)
	cpw	x, #0x0255
	jrne	00102$
;	HAL_UART1.c: 693: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
	mov	0x5230+0, #0xdf
	ret
00102$:
;	HAL_UART1.c: 698: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
	bres	21047, #4
;	HAL_UART1.c: 700: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
