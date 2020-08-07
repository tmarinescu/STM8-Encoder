;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Delay
	.globl _I2C_CheckEvent
	.globl _I2C_SendData
	.globl _I2C_Send7bitAddress
	.globl _I2C_GenerateSTOP
	.globl _I2C_GenerateSTART
	.globl _I2C_Cmd
	.globl _I2C_Init
	.globl _I2C_DeInit
	.globl _GetTimerTick
	.globl _SetTimerTick
	.globl _CLK_GetClockFreq
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_PeripheralClockConfig
	.globl _TIM4_ClearFlag
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
	int 0x000000 ; trap
	int 0x000000 ; int0
	int 0x000000 ; int1
	int 0x000000 ; int2
	int 0x000000 ; int3
	int 0x000000 ; int4
	int 0x000000 ; int5
	int 0x000000 ; int6
	int 0x000000 ; int7
	int 0x000000 ; int8
	int 0x000000 ; int9
	int 0x000000 ; int10
	int 0x000000 ; int11
	int 0x000000 ; int12
	int 0x000000 ; int13
	int 0x000000 ; int14
	int 0x000000 ; int15
	int 0x000000 ; int16
	int 0x000000 ; int17
	int 0x000000 ; int18
	int 0x000000 ; int19
	int 0x000000 ; int20
	int 0x000000 ; int21
	int 0x000000 ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 19: void Delay(uint32_t n)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
;	main.c: 21: SetTimerTick(n);
	ldw	x, (0x05, sp)
	pushw	x
	ldw	x, (0x05, sp)
	pushw	x
	call	_SetTimerTick
	addw	sp, #4
;	main.c: 22: while(GetTimerTick() != 0);
00101$:
	call	_GetTimerTick
	tnzw	x
	jrne	00101$
	tnzw	y
	jrne	00101$
;	main.c: 23: }
	ret
;	main.c: 25: uint32_t main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 28: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	main.c: 29: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 0, CLK_CURRENTCLOCKSTATE_DISABLE);
	push	#0x00
	push	#0x00
	push	#0xb4
	push	#0x01
	call	_CLK_ClockSwitchConfig
	addw	sp, #4
;	main.c: 30: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, 1);
	push	#0x01
	push	#0x00
	call	_CLK_PeripheralClockConfig
	addw	sp, #2
;	main.c: 31: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, 1);
	push	#0x01
	push	#0x04
	call	_CLK_PeripheralClockConfig
	addw	sp, #2
;	main.c: 34: TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
	push	#0x7c
	push	#0x07
	call	_TIM4_TimeBaseInit
	addw	sp, #2
;	main.c: 35: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	push	#0x01
	call	_TIM4_ClearFlag
	pop	a
;	main.c: 36: TIM4_ITConfig(TIM4_IT_UPDATE, 1);
	push	#0x01
	push	#0x01
	call	_TIM4_ITConfig
	addw	sp, #2
;	main.c: 37: TIM4_Cmd(1);
	push	#0x01
	call	_TIM4_Cmd
	pop	a
;	main.c: 40: I2C_DeInit();
	call	_I2C_DeInit
;	main.c: 42: clock = CLK_GetClockFreq() / 1000000;
	call	_CLK_GetClockFreq
	push	#0x40
	push	#0x42
	push	#0x0f
	push	#0x00
	pushw	x
	pushw	y
	call	__divulong
	addw	sp, #8
	ld	a, xl
;	main.c: 43: I2C_Cmd(1);
	push	a
	push	#0x01
	call	_I2C_Cmd
	pop	a
	pop	a
;	main.c: 45: I2C_Init(I2C_MAX_STANDARD_FREQ, 0x3C, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, clock);
	push	a
	push	#0x00
	push	#0x01
	push	#0x00
	push	#0x3c
	push	#0x00
	push	#0xa0
	push	#0x86
	push	#0x01
	push	#0x00
	call	_I2C_Init
	addw	sp, #10
;	main.c: 48: enableInterrupts();
	rim
;	main.c: 50: while(1)
00111$:
;	main.c: 52: I2C_GenerateSTART(1);
	push	#0x01
	call	_I2C_GenerateSTART
	pop	a
;	main.c: 53: while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
00101$:
	push	#0x01
	push	#0x03
	call	_I2C_CheckEvent
	addw	sp, #2
	tnz	a
	jreq	00101$
;	main.c: 54: I2C_Send7bitAddress(0x3C, I2C_DIRECTION_TX);
	push	#0x00
	push	#0x3c
	call	_I2C_Send7bitAddress
	addw	sp, #2
;	main.c: 55: while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
00104$:
	push	#0x82
	push	#0x07
	call	_I2C_CheckEvent
	addw	sp, #2
	tnz	a
	jreq	00104$
;	main.c: 56: I2C_SendData(0x06);
	push	#0x06
	call	_I2C_SendData
	pop	a
;	main.c: 57: while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
00107$:
	push	#0x84
	push	#0x07
	call	_I2C_CheckEvent
	addw	sp, #2
	tnz	a
	jreq	00107$
;	main.c: 58: I2C_GenerateSTOP(1);
	push	#0x01
	call	_I2C_GenerateSTOP
	pop	a
;	main.c: 59: Delay(500);
	push	#0xf4
	push	#0x01
	clrw	x
	pushw	x
	call	_Delay
	addw	sp, #4
	jra	00111$
;	main.c: 61: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
