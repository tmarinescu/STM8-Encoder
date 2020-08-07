;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module interrupts
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_ClearITPendingBit
	.globl _SetTimerTick
	.globl _GetTimerTick
	.globl _TIM4_UPD_OVF_IRQHandler
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_TimerTick:
	.ds 4
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
;	interrupts.c: 10: void SetTimerTick(uint32_t tick)
;	-----------------------------------------
;	 function SetTimerTick
;	-----------------------------------------
_SetTimerTick:
;	interrupts.c: 12: TimerTick = tick;
	ldw	x, (0x05, sp)
	ldw	_TimerTick+2, x
	ldw	x, (0x03, sp)
	ldw	_TimerTick+0, x
;	interrupts.c: 13: }
	ret
;	interrupts.c: 15: uint32_t GetTimerTick()
;	-----------------------------------------
;	 function GetTimerTick
;	-----------------------------------------
_GetTimerTick:
;	interrupts.c: 17: return TimerTick;
	ldw	x, _TimerTick+2
	ldw	y, _TimerTick+0
;	interrupts.c: 18: }
	ret
;	interrupts.c: 20: void TIM4_UPD_OVF_IRQHandler() __interrupt(23) //Timer 4 update interrupt
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	clr	a
	div	x, a
;	interrupts.c: 22: if(TimerTick != 0)
	ldw	x, _TimerTick+2
	jrne	00110$
	ldw	x, _TimerTick+0
	jreq	00102$
00110$:
;	interrupts.c: 24: TimerTick--;
	ldw	x, _TimerTick+2
	ldw	y, _TimerTick+0
	subw	x, #0x0001
	jrnc	00111$
	decw	y
00111$:
	ldw	_TimerTick+2, x
	ldw	_TimerTick+0, y
00102$:
;	interrupts.c: 26: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	interrupts.c: 27: }
	iret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__TimerTick:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
	.area CABS (ABS)
