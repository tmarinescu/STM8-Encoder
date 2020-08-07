;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module HAL_I2C
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _I2C_DeInit
	.globl _I2C_Init
	.globl _I2C_Cmd
	.globl _I2C_GeneralCallCmd
	.globl _I2C_GenerateSTART
	.globl _I2C_GenerateSTOP
	.globl _I2C_SoftwareResetCmd
	.globl _I2C_StretchClockCmd
	.globl _I2C_AcknowledgeConfig
	.globl _I2C_ITConfig
	.globl _I2C_FastModeDutyCycleConfig
	.globl _I2C_ReceiveData
	.globl _I2C_Send7bitAddress
	.globl _I2C_SendData
	.globl _I2C_CheckEvent
	.globl _I2C_GetLastEvent
	.globl _I2C_GetFlagStatus
	.globl _I2C_ClearFlag
	.globl _I2C_GetITStatus
	.globl _I2C_ClearITPendingBit
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
;	HAL_I2C.c: 17: void I2C_DeInit(void)
;	-----------------------------------------
;	 function I2C_DeInit
;	-----------------------------------------
_I2C_DeInit:
;	HAL_I2C.c: 19: I2C->CR1 = I2C_CR1_RESET_VALUE;
	mov	0x5210+0, #0x00
;	HAL_I2C.c: 20: I2C->CR2 = I2C_CR2_RESET_VALUE;
	mov	0x5211+0, #0x00
;	HAL_I2C.c: 21: I2C->FREQR = I2C_FREQR_RESET_VALUE;
	mov	0x5212+0, #0x00
;	HAL_I2C.c: 22: I2C->OARL = I2C_OARL_RESET_VALUE;
	mov	0x5213+0, #0x00
;	HAL_I2C.c: 23: I2C->OARH = I2C_OARH_RESET_VALUE;
	mov	0x5214+0, #0x00
;	HAL_I2C.c: 24: I2C->ITR = I2C_ITR_RESET_VALUE;
	mov	0x521a+0, #0x00
;	HAL_I2C.c: 25: I2C->CCRL = I2C_CCRL_RESET_VALUE;
	mov	0x521b+0, #0x00
;	HAL_I2C.c: 26: I2C->CCRH = I2C_CCRH_RESET_VALUE;
	mov	0x521c+0, #0x00
;	HAL_I2C.c: 27: I2C->TRISER = I2C_TRISER_RESET_VALUE;
	mov	0x521d+0, #0x02
;	HAL_I2C.c: 28: }
	ret
;	HAL_I2C.c: 30: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress,
;	-----------------------------------------
;	 function I2C_Init
;	-----------------------------------------
_I2C_Init:
	sub	sp, #7
;	HAL_I2C.c: 36: uint8_t tmpccrh = 0;
	clr	(0x05, sp)
;	HAL_I2C.c: 40: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
	ld	a, 0x5212
	and	a, #0xc0
	ld	0x5212, a
;	HAL_I2C.c: 42: I2C->FREQR |= InputClockFrequencyMHz;
	ld	a, 0x5212
	or	a, (0x13, sp)
	ld	0x5212, a
;	HAL_I2C.c: 46: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	bres	21008, #0
;	HAL_I2C.c: 49: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
	ld	a, 0x521c
	and	a, #0x30
	ld	0x521c, a
;	HAL_I2C.c: 50: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
	ld	a, 0x521b
	mov	0x521b+0, #0x00
;	HAL_I2C.c: 61: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	clrw	x
	ld	a, (0x13, sp)
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	call	__mullong
	addw	sp, #8
	ldw	(0x03, sp), x
	ldw	(0x01, sp), y
;	HAL_I2C.c: 53: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
	ldw	x, #0x86a0
	cpw	x, (0x0c, sp)
	ld	a, #0x01
	sbc	a, (0x0b, sp)
	clr	a
	sbc	a, (0x0a, sp)
	jrnc	00109$
;	HAL_I2C.c: 56: tmpccrh = I2C_CCRH_FS;
	ld	a, #0x80
	ld	(0x05, sp), a
;	HAL_I2C.c: 58: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
	tnz	(0x10, sp)
	jrne	00102$
;	HAL_I2C.c: 61: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x03
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x06, sp), x
	jra	00103$
00102$:
;	HAL_I2C.c: 66: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
	ldw	x, (0x0c, sp)
	pushw	x
	ldw	x, (0x0c, sp)
	pushw	x
	push	#0x19
	clrw	x
	pushw	x
	push	#0x00
	call	__mullong
	addw	sp, #8
	ld	a, xl
	push	a
	ld	a, xh
	push	a
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
	ldw	(0x06, sp), x
;	HAL_I2C.c: 68: tmpccrh |= I2C_CCRH_DUTY;
	ld	a, #0xc0
	ld	(0x05, sp), a
00103$:
;	HAL_I2C.c: 72: if (result < (uint16_t)0x01)
	ldw	x, (0x06, sp)
	cpw	x, #0x0001
	jrnc	00105$
;	HAL_I2C.c: 75: result = (uint16_t)0x0001;
	ldw	x, #0x0001
	ldw	(0x06, sp), x
00105$:
;	HAL_I2C.c: 81: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
	ld	a, (0x13, sp)
	clrw	x
	ld	xl, a
	pushw	x
	sllw	x
	addw	x, (1, sp)
	addw	sp, #2
	push	#0x0a
	push	#0x00
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, xl
	inc	a
;	HAL_I2C.c: 82: I2C->TRISER = (uint8_t)tmpval;
	ld	0x521d, a
	jra	00110$
00109$:
;	HAL_I2C.c: 89: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
	ldw	x, (0x0c, sp)
	ldw	y, (0x0a, sp)
	sllw	x
	rlcw	y
	pushw	x
	pushw	y
	ldw	x, (0x07, sp)
	pushw	x
	ldw	x, (0x07, sp)
	pushw	x
	call	__divulong
	addw	sp, #8
;	HAL_I2C.c: 92: if (result < (uint16_t)0x0004)
	ldw	(0x06, sp), x
	cpw	x, #0x0004
	jrnc	00107$
;	HAL_I2C.c: 95: result = (uint16_t)0x0004;
	ldw	x, #0x0004
	ldw	(0x06, sp), x
00107$:
;	HAL_I2C.c: 101: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
	ld	a, (0x13, sp)
	inc	a
	ld	0x521d, a
00110$:
;	HAL_I2C.c: 106: I2C->CCRL = (uint8_t)result;
	ld	a, (0x07, sp)
	ld	0x521b, a
;	HAL_I2C.c: 107: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
	ld	a, (0x06, sp)
	and	a, #0x0f
	or	a, (0x05, sp)
	ld	0x521c, a
;	HAL_I2C.c: 110: I2C->CR1 |= I2C_CR1_PE;
	bset	21008, #0
;	HAL_I2C.c: 113: I2C_AcknowledgeConfig(Ack);
	ld	a, (0x11, sp)
	push	a
	call	_I2C_AcknowledgeConfig
	pop	a
;	HAL_I2C.c: 116: I2C->OARL = (uint8_t)(OwnAddress);
	ld	a, (0x0f, sp)
	ld	0x5213, a
;	HAL_I2C.c: 117: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
	ld	a, (0x12, sp)
	or	a, #0x40
	ld	(0x07, sp), a
;	HAL_I2C.c: 118: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
	clr	a
	ld	xl, a
	ld	a, (0x0e, sp)
	and	a, #0x03
	ld	xh, a
	ld	a, #0x80
	div	x, a
	ld	a, xl
	or	a, (0x07, sp)
	ld	0x5214, a
;	HAL_I2C.c: 119: }
	addw	sp, #7
	ret
;	HAL_I2C.c: 121: void I2C_Cmd(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_Cmd
;	-----------------------------------------
_I2C_Cmd:
;	HAL_I2C.c: 126: I2C->CR1 |= I2C_CR1_PE;
	ld	a, 0x5210
;	HAL_I2C.c: 123: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 126: I2C->CR1 |= I2C_CR1_PE;
	or	a, #0x01
	ld	0x5210, a
	ret
00102$:
;	HAL_I2C.c: 131: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
	and	a, #0xfe
	ld	0x5210, a
;	HAL_I2C.c: 133: }
	ret
;	HAL_I2C.c: 135: void I2C_GeneralCallCmd(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_GeneralCallCmd
;	-----------------------------------------
_I2C_GeneralCallCmd:
;	HAL_I2C.c: 140: I2C->CR1 |= I2C_CR1_ENGC;
	ld	a, 0x5210
;	HAL_I2C.c: 137: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 140: I2C->CR1 |= I2C_CR1_ENGC;
	or	a, #0x40
	ld	0x5210, a
	ret
00102$:
;	HAL_I2C.c: 145: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
	and	a, #0xbf
	ld	0x5210, a
;	HAL_I2C.c: 147: }
	ret
;	HAL_I2C.c: 149: void I2C_GenerateSTART(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTART
;	-----------------------------------------
_I2C_GenerateSTART:
;	HAL_I2C.c: 154: I2C->CR2 |= I2C_CR2_START;
	ld	a, 0x5211
;	HAL_I2C.c: 151: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 154: I2C->CR2 |= I2C_CR2_START;
	or	a, #0x01
	ld	0x5211, a
	ret
00102$:
;	HAL_I2C.c: 159: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
	and	a, #0xfe
	ld	0x5211, a
;	HAL_I2C.c: 161: }
	ret
;	HAL_I2C.c: 163: void I2C_GenerateSTOP(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_GenerateSTOP
;	-----------------------------------------
_I2C_GenerateSTOP:
;	HAL_I2C.c: 168: I2C->CR2 |= I2C_CR2_STOP;
	ld	a, 0x5211
;	HAL_I2C.c: 165: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 168: I2C->CR2 |= I2C_CR2_STOP;
	or	a, #0x02
	ld	0x5211, a
	ret
00102$:
;	HAL_I2C.c: 173: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
	and	a, #0xfd
	ld	0x5211, a
;	HAL_I2C.c: 175: }
	ret
;	HAL_I2C.c: 177: void I2C_SoftwareResetCmd(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_SoftwareResetCmd
;	-----------------------------------------
_I2C_SoftwareResetCmd:
;	HAL_I2C.c: 182: I2C->CR2 |= I2C_CR2_SWRST;
	ld	a, 0x5211
;	HAL_I2C.c: 179: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 182: I2C->CR2 |= I2C_CR2_SWRST;
	or	a, #0x80
	ld	0x5211, a
	ret
00102$:
;	HAL_I2C.c: 187: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
	and	a, #0x7f
	ld	0x5211, a
;	HAL_I2C.c: 189: }
	ret
;	HAL_I2C.c: 191: void I2C_StretchClockCmd(uint8_t NewState)
;	-----------------------------------------
;	 function I2C_StretchClockCmd
;	-----------------------------------------
_I2C_StretchClockCmd:
;	HAL_I2C.c: 196: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
	ld	a, 0x5210
;	HAL_I2C.c: 193: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 196: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
	and	a, #0x7f
	ld	0x5210, a
	ret
00102$:
;	HAL_I2C.c: 202: I2C->CR1 |= I2C_CR1_NOSTRETCH;
	or	a, #0x80
	ld	0x5210, a
;	HAL_I2C.c: 204: }
	ret
;	HAL_I2C.c: 206: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
;	-----------------------------------------
;	 function I2C_AcknowledgeConfig
;	-----------------------------------------
_I2C_AcknowledgeConfig:
;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	HAL_I2C.c: 208: if (Ack == I2C_ACK_NONE)
	tnz	(0x03, sp)
	jrne	00105$
;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	and	a, #0xfb
	ld	0x5211, a
	ret
00105$:
;	HAL_I2C.c: 216: I2C->CR2 |= I2C_CR2_ACK;
	or	a, #0x04
	ld	0x5211, a
;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
	ld	a, 0x5211
;	HAL_I2C.c: 218: if (Ack == I2C_ACK_CURR)
	push	a
	ld	a, (0x04, sp)
	dec	a
	pop	a
	jrne	00102$
;	HAL_I2C.c: 221: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
	and	a, #0xf7
	ld	0x5211, a
	ret
00102$:
;	HAL_I2C.c: 226: I2C->CR2 |= I2C_CR2_POS;
	or	a, #0x08
	ld	0x5211, a
;	HAL_I2C.c: 229: }
	ret
;	HAL_I2C.c: 231: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, uint8_t NewState)
;	-----------------------------------------
;	 function I2C_ITConfig
;	-----------------------------------------
_I2C_ITConfig:
	push	a
;	HAL_I2C.c: 236: I2C->ITR |= (uint8_t)I2C_IT;
	ld	a, 0x521a
;	HAL_I2C.c: 233: if (NewState != 0)
	tnz	(0x05, sp)
	jreq	00102$
;	HAL_I2C.c: 236: I2C->ITR |= (uint8_t)I2C_IT;
	or	a, (0x04, sp)
	ld	0x521a, a
	jra	00104$
00102$:
;	HAL_I2C.c: 241: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	ld	0x521a, a
00104$:
;	HAL_I2C.c: 243: }
	pop	a
	ret
;	HAL_I2C.c: 245: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
;	-----------------------------------------
;	 function I2C_FastModeDutyCycleConfig
;	-----------------------------------------
_I2C_FastModeDutyCycleConfig:
;	HAL_I2C.c: 250: I2C->CCRH |= I2C_CCRH_DUTY;
	ld	a, 0x521c
;	HAL_I2C.c: 247: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
	push	a
	ld	a, (0x04, sp)
	cp	a, #0x40
	pop	a
	jrne	00102$
;	HAL_I2C.c: 250: I2C->CCRH |= I2C_CCRH_DUTY;
	or	a, #0x40
	ld	0x521c, a
	ret
00102$:
;	HAL_I2C.c: 255: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
	and	a, #0xbf
	ld	0x521c, a
;	HAL_I2C.c: 257: }
	ret
;	HAL_I2C.c: 259: uint8_t I2C_ReceiveData(void)
;	-----------------------------------------
;	 function I2C_ReceiveData
;	-----------------------------------------
_I2C_ReceiveData:
;	HAL_I2C.c: 262: return ((uint8_t)I2C->DR);
	ld	a, 0x5216
;	HAL_I2C.c: 263: }
	ret
;	HAL_I2C.c: 265: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
;	-----------------------------------------
;	 function I2C_Send7bitAddress
;	-----------------------------------------
_I2C_Send7bitAddress:
;	HAL_I2C.c: 268: Address &= (uint8_t)0xFE;
	srl	(0x03, sp)
	sll	(0x03, sp)
;	HAL_I2C.c: 271: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
	ld	a, (0x03, sp)
	or	a, (0x04, sp)
	ld	0x5216, a
;	HAL_I2C.c: 272: }
	ret
;	HAL_I2C.c: 274: void I2C_SendData(uint8_t Data)
;	-----------------------------------------
;	 function I2C_SendData
;	-----------------------------------------
_I2C_SendData:
;	HAL_I2C.c: 277: I2C->DR = Data;
	ldw	x, #0x5216
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_I2C.c: 278: }
	ret
;	HAL_I2C.c: 280: uint8_t I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
;	-----------------------------------------
;	 function I2C_CheckEvent
;	-----------------------------------------
_I2C_CheckEvent:
	sub	sp, #8
;	HAL_I2C.c: 282: volatile uint16_t lastevent = 0x00;
	clrw	x
	ldw	(0x01, sp), x
;	HAL_I2C.c: 287: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
	ldw	y, (0x0b, sp)
	ldw	(0x03, sp), y
	ldw	x, y
	cpw	x, #0x0004
	jrne	00102$
;	HAL_I2C.c: 289: lastevent = I2C->SR2 & I2C_SR2_AF;
	ld	a, 0x5218
	and	a, #0x04
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	HAL_I2C.c: 293: flag1 = I2C->SR1;
	ld	a, 0x5217
	ld	xl, a
;	HAL_I2C.c: 294: flag2 = I2C->SR3;
	ld	a, 0x5219
;	HAL_I2C.c: 295: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
	ld	xh, a
	clr	(0x06, sp)
	ld	a, xl
	clr	(0x07, sp)
	or	a, (0x06, sp)
	rlwa	x
	or	a, (0x07, sp)
	ld	xh, a
	ldw	(0x01, sp), x
00103$:
;	HAL_I2C.c: 298: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
	ld	a, (0x02, sp)
	and	a, (0x04, sp)
	ld	xl, a
	ld	a, (0x01, sp)
	and	a, (0x03, sp)
	ld	xh, a
	cpw	x, (0x03, sp)
	jrne	00105$
;	HAL_I2C.c: 301: status = 1;
	ld	a, #0x01
;	HAL_I2C.c: 306: status = 0;
	.byte 0x21
00105$:
	clr	a
00106$:
;	HAL_I2C.c: 310: return status;
;	HAL_I2C.c: 311: }
	addw	sp, #8
	ret
;	HAL_I2C.c: 313: I2C_Event_TypeDef I2C_GetLastEvent(void)
;	-----------------------------------------
;	 function I2C_GetLastEvent
;	-----------------------------------------
_I2C_GetLastEvent:
	sub	sp, #4
;	HAL_I2C.c: 315: volatile uint16_t lastevent = 0;
	clrw	x
	ldw	(0x01, sp), x
;	HAL_I2C.c: 319: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
	ld	a, 0x5218
	bcp	a, #0x04
	jreq	00102$
;	HAL_I2C.c: 321: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
	ldw	x, #0x0004
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	HAL_I2C.c: 326: flag1 = I2C->SR1;
	ld	a, 0x5217
	clrw	x
	ld	xl, a
	ldw	(0x03, sp), x
;	HAL_I2C.c: 327: flag2 = I2C->SR3;
	ld	a, 0x5219
;	HAL_I2C.c: 330: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
	ld	xh, a
	ld	a, (0x04, sp)
	rlwa	x
	or	a, (0x03, sp)
	ld	xh, a
	ldw	(0x01, sp), x
00103$:
;	HAL_I2C.c: 333: return (I2C_Event_TypeDef)lastevent;
	ldw	x, (0x01, sp)
;	HAL_I2C.c: 334: }
	addw	sp, #4
	ret
;	HAL_I2C.c: 336: uint8_t I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
;	-----------------------------------------
;	 function I2C_GetFlagStatus
;	-----------------------------------------
_I2C_GetFlagStatus:
	push	a
;	HAL_I2C.c: 338: uint8_t tempreg = 0;
	clr	(0x01, sp)
;	HAL_I2C.c: 343: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
	ldw	x, (0x04, sp)
	ld	a, xh
	clrw	x
;	HAL_I2C.c: 345: switch (regindex)
	cp	a, #0x01
	jreq	00101$
	cp	a, #0x02
	jreq	00102$
	cp	a, #0x03
	jreq	00103$
	jra	00105$
;	HAL_I2C.c: 348: case 0x01:
00101$:
;	HAL_I2C.c: 349: tempreg = (uint8_t)I2C->SR1;
	ld	a, 0x5217
	ld	(0x01, sp), a
;	HAL_I2C.c: 350: break;
	jra	00105$
;	HAL_I2C.c: 353: case 0x02:
00102$:
;	HAL_I2C.c: 354: tempreg = (uint8_t)I2C->SR2;
	ld	a, 0x5218
	ld	(0x01, sp), a
;	HAL_I2C.c: 355: break;
	jra	00105$
;	HAL_I2C.c: 358: case 0x03:
00103$:
;	HAL_I2C.c: 359: tempreg = (uint8_t)I2C->SR3;
	ld	a, 0x5219
	ld	(0x01, sp), a
;	HAL_I2C.c: 364: }
00105$:
;	HAL_I2C.c: 367: if ((tempreg & (uint8_t)I2C_Flag) != 0)
	ld	a, (0x05, sp)
	and	a, (0x01, sp)
	jreq	00107$
;	HAL_I2C.c: 370: bitstatus = 1;
	ld	a, #0x01
;	HAL_I2C.c: 375: bitstatus = 0;
	.byte 0x21
00107$:
	clr	a
00108$:
;	HAL_I2C.c: 378: return bitstatus;
;	HAL_I2C.c: 379: }
	addw	sp, #1
	ret
;	HAL_I2C.c: 381: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
;	-----------------------------------------
;	 function I2C_ClearFlag
;	-----------------------------------------
_I2C_ClearFlag:
;	HAL_I2C.c: 385: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
	ldw	x, (0x03, sp)
	clr	a
;	HAL_I2C.c: 387: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
	ld	xh, a
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	HAL_I2C.c: 388: }
	ret
;	HAL_I2C.c: 390: uint8_t I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_GetITStatus
;	-----------------------------------------
_I2C_GetITStatus:
	sub	sp, #4
;	HAL_I2C.c: 393: volatile uint8_t enablestatus = 0;
	clr	(0x03, sp)
;	HAL_I2C.c: 396: tempregister = (uint8_t)(((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
	ldw	x, (0x07, sp)
	clr	(0x02, sp)
	ld	a, xh
	and	a, #0x07
	ld	(0x04, sp), a
;	HAL_I2C.c: 399: enablestatus = (uint8_t)(I2C->ITR & (uint8_t)tempregister);
	ld	a, 0x521a
	and	a, (0x04, sp)
	ld	(0x03, sp), a
;	HAL_I2C.c: 401: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	clr	a
	rlwa	x
	and	a, #0x30
	ld	xh, a
;	HAL_I2C.c: 404: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
	ld	a, (0x08, sp)
	ld	(0x04, sp), a
;	HAL_I2C.c: 401: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
	cpw	x, #0x0100
	jrne	00110$
;	HAL_I2C.c: 404: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
	ld	a, 0x5217
	and	a, (0x04, sp)
	jreq	00102$
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_I2C.c: 407: bitstatus = 1;
	ld	a, #0x01
	jra	00111$
00102$:
;	HAL_I2C.c: 412: bitstatus = 0;
	clr	a
	jra	00111$
00110$:
;	HAL_I2C.c: 418: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
	ld	a, 0x5218
	and	a, (0x04, sp)
	jreq	00106$
	tnz	(0x03, sp)
	jreq	00106$
;	HAL_I2C.c: 421: bitstatus = 1;
	ld	a, #0x01
;	HAL_I2C.c: 426: bitstatus = 0;
	.byte 0x21
00106$:
	clr	a
00111$:
;	HAL_I2C.c: 430: return  bitstatus;
;	HAL_I2C.c: 432: }
	addw	sp, #4
	ret
;	HAL_I2C.c: 434: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
;	-----------------------------------------
;	 function I2C_ClearITPendingBit
;	-----------------------------------------
_I2C_ClearITPendingBit:
;	HAL_I2C.c: 438: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
	ldw	x, (0x03, sp)
	clr	a
;	HAL_I2C.c: 441: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
	ld	xh, a
	cplw	x
	ld	a, xl
	ld	0x5218, a
;	HAL_I2C.c: 442: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
