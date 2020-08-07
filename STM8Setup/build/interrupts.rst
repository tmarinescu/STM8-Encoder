                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module interrupts
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearITPendingBit
                                     12 	.globl _SetTimerTick
                                     13 	.globl _GetTimerTick
                                     14 	.globl _TIM4_UPD_OVF_IRQHandler
                                     15 ;--------------------------------------------------------
                                     16 ; ram data
                                     17 ;--------------------------------------------------------
                                     18 	.area DATA
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area INITIALIZED
      000001                         23 _TimerTick:
      000001                         24 	.ds 4
                                     25 ;--------------------------------------------------------
                                     26 ; absolute external ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area DABS (ABS)
                                     29 
                                     30 ; default segment ordering for linker
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area CONST
                                     35 	.area INITIALIZER
                                     36 	.area CODE
                                     37 
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	interrupts.c: 10: void SetTimerTick(uint32_t tick)
                                     55 ;	-----------------------------------------
                                     56 ;	 function SetTimerTick
                                     57 ;	-----------------------------------------
      008234                         58 _SetTimerTick:
                                     59 ;	interrupts.c: 12: TimerTick = tick;
      008234 1E 05            [ 2]   60 	ldw	x, (0x05, sp)
      008236 CF 00 03         [ 2]   61 	ldw	_TimerTick+2, x
      008239 1E 03            [ 2]   62 	ldw	x, (0x03, sp)
      00823B CF 00 01         [ 2]   63 	ldw	_TimerTick+0, x
                                     64 ;	interrupts.c: 13: }
      00823E 81               [ 4]   65 	ret
                                     66 ;	interrupts.c: 15: uint32_t GetTimerTick()
                                     67 ;	-----------------------------------------
                                     68 ;	 function GetTimerTick
                                     69 ;	-----------------------------------------
      00823F                         70 _GetTimerTick:
                                     71 ;	interrupts.c: 17: return TimerTick;
      00823F CE 00 03         [ 2]   72 	ldw	x, _TimerTick+2
      008242 90 CE 00 01      [ 2]   73 	ldw	y, _TimerTick+0
                                     74 ;	interrupts.c: 18: }
      008246 81               [ 4]   75 	ret
                                     76 ;	interrupts.c: 20: void TIM4_UPD_OVF_IRQHandler() __interrupt(23) //Timer 4 update interrupt
                                     77 ;	-----------------------------------------
                                     78 ;	 function TIM4_UPD_OVF_IRQHandler
                                     79 ;	-----------------------------------------
      008247                         80 _TIM4_UPD_OVF_IRQHandler:
      008247 4F               [ 1]   81 	clr	a
      008248 62               [ 2]   82 	div	x, a
                                     83 ;	interrupts.c: 22: if(TimerTick != 0)
      008249 CE 00 03         [ 2]   84 	ldw	x, _TimerTick+2
      00824C 26 05            [ 1]   85 	jrne	00110$
      00824E CE 00 01         [ 2]   86 	ldw	x, _TimerTick+0
      008251 27 15            [ 1]   87 	jreq	00102$
      008253                         88 00110$:
                                     89 ;	interrupts.c: 24: TimerTick--;
      008253 CE 00 03         [ 2]   90 	ldw	x, _TimerTick+2
      008256 90 CE 00 01      [ 2]   91 	ldw	y, _TimerTick+0
      00825A 1D 00 01         [ 2]   92 	subw	x, #0x0001
      00825D 24 02            [ 1]   93 	jrnc	00111$
      00825F 90 5A            [ 2]   94 	decw	y
      008261                         95 00111$:
      008261 CF 00 03         [ 2]   96 	ldw	_TimerTick+2, x
      008264 90 CF 00 01      [ 2]   97 	ldw	_TimerTick+0, y
      008268                         98 00102$:
                                     99 ;	interrupts.c: 26: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008268 4B 01            [ 1]  100 	push	#0x01
      00826A CD 83 50         [ 4]  101 	call	_TIM4_ClearITPendingBit
      00826D 84               [ 1]  102 	pop	a
                                    103 ;	interrupts.c: 27: }
      00826E 80               [11]  104 	iret
                                    105 	.area CODE
                                    106 	.area CONST
                                    107 	.area INITIALIZER
      008094                        108 __xinit__TimerTick:
      008094 00 00 00 00            109 	.byte #0x00, #0x00, #0x00, #0x00	; 0
                                    110 	.area CABS (ABS)
