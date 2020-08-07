                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_TIM4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_TimeBaseInit
                                     12 	.globl _TIM4_Cmd
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_UpdateDisableConfig
                                     15 	.globl _TIM4_UpdateRequestConfig
                                     16 	.globl _TIM4_SelectOnePulseMode
                                     17 	.globl _TIM4_PrescalerConfig
                                     18 	.globl _TIM4_ARRPreloadConfig
                                     19 	.globl _TIM4_GenerateEvent
                                     20 	.globl _TIM4_SetCounter
                                     21 	.globl _TIM4_SetAutoreload
                                     22 	.globl _TIM4_GetCounter
                                     23 	.globl _TIM4_GetPrescaler
                                     24 	.globl _TIM4_GetFlagStatus
                                     25 	.globl _TIM4_ClearFlag
                                     26 	.globl _TIM4_GetITStatus
                                     27 	.globl _TIM4_ClearITPendingBit
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 
                                     41 ; default segment ordering for linker
                                     42 	.area HOME
                                     43 	.area GSINIT
                                     44 	.area GSFINAL
                                     45 	.area CONST
                                     46 	.area INITIALIZER
                                     47 	.area CODE
                                     48 
                                     49 ;--------------------------------------------------------
                                     50 ; global & static initialisations
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area GSINIT
                                     56 ;--------------------------------------------------------
                                     57 ; Home
                                     58 ;--------------------------------------------------------
                                     59 	.area HOME
                                     60 	.area HOME
                                     61 ;--------------------------------------------------------
                                     62 ; code
                                     63 ;--------------------------------------------------------
                                     64 	.area CODE
                                     65 ;	HAL_TIM4.c: 9: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     66 ;	-----------------------------------------
                                     67 ;	 function TIM4_TimeBaseInit
                                     68 ;	-----------------------------------------
      00826F                         69 _TIM4_TimeBaseInit:
                                     70 ;	HAL_TIM4.c: 11: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      00826F AE 53 45         [ 2]   71 	ldw	x, #0x5345
      008272 7B 03            [ 1]   72 	ld	a, (0x03, sp)
      008274 F7               [ 1]   73 	ld	(x), a
                                     74 ;	HAL_TIM4.c: 12: TIM4->ARR = (uint8_t)(TIM4_Period);
      008275 AE 53 46         [ 2]   75 	ldw	x, #0x5346
      008278 7B 04            [ 1]   76 	ld	a, (0x04, sp)
      00827A F7               [ 1]   77 	ld	(x), a
                                     78 ;	HAL_TIM4.c: 13: }
      00827B 81               [ 4]   79 	ret
                                     80 ;	HAL_TIM4.c: 15: void TIM4_Cmd(uint8_t NewState)
                                     81 ;	-----------------------------------------
                                     82 ;	 function TIM4_Cmd
                                     83 ;	-----------------------------------------
      00827C                         84 _TIM4_Cmd:
                                     85 ;	HAL_TIM4.c: 19: TIM4->CR1 |= TIM4_CR1_CEN;
      00827C C6 53 40         [ 1]   86 	ld	a, 0x5340
                                     87 ;	HAL_TIM4.c: 17: if (NewState != 0)
      00827F 0D 03            [ 1]   88 	tnz	(0x03, sp)
      008281 27 06            [ 1]   89 	jreq	00102$
                                     90 ;	HAL_TIM4.c: 19: TIM4->CR1 |= TIM4_CR1_CEN;
      008283 AA 01            [ 1]   91 	or	a, #0x01
      008285 C7 53 40         [ 1]   92 	ld	0x5340, a
      008288 81               [ 4]   93 	ret
      008289                         94 00102$:
                                     95 ;	HAL_TIM4.c: 23: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
      008289 A4 FE            [ 1]   96 	and	a, #0xfe
      00828B C7 53 40         [ 1]   97 	ld	0x5340, a
                                     98 ;	HAL_TIM4.c: 25: }
      00828E 81               [ 4]   99 	ret
                                    100 ;	HAL_TIM4.c: 27: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, uint8_t NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIM4_ITConfig
                                    103 ;	-----------------------------------------
      00828F                        104 _TIM4_ITConfig:
      00828F 88               [ 1]  105 	push	a
                                    106 ;	HAL_TIM4.c: 31: TIM4->IER |= (uint8_t)TIM4_IT;
      008290 C6 53 41         [ 1]  107 	ld	a, 0x5341
                                    108 ;	HAL_TIM4.c: 29: if (NewState != 0)
      008293 0D 05            [ 1]  109 	tnz	(0x05, sp)
      008295 27 07            [ 1]  110 	jreq	00102$
                                    111 ;	HAL_TIM4.c: 31: TIM4->IER |= (uint8_t)TIM4_IT;
      008297 1A 04            [ 1]  112 	or	a, (0x04, sp)
      008299 C7 53 41         [ 1]  113 	ld	0x5341, a
      00829C 20 0C            [ 2]  114 	jra	00104$
      00829E                        115 00102$:
                                    116 ;	HAL_TIM4.c: 35: TIM4->IER &= (uint8_t)(~TIM4_IT);
      00829E 88               [ 1]  117 	push	a
      00829F 7B 05            [ 1]  118 	ld	a, (0x05, sp)
      0082A1 43               [ 1]  119 	cpl	a
      0082A2 6B 02            [ 1]  120 	ld	(0x02, sp), a
      0082A4 84               [ 1]  121 	pop	a
      0082A5 14 01            [ 1]  122 	and	a, (0x01, sp)
      0082A7 C7 53 41         [ 1]  123 	ld	0x5341, a
      0082AA                        124 00104$:
                                    125 ;	HAL_TIM4.c: 37: }
      0082AA 84               [ 1]  126 	pop	a
      0082AB 81               [ 4]  127 	ret
                                    128 ;	HAL_TIM4.c: 39: void TIM4_UpdateDisableConfig(uint8_t NewState)
                                    129 ;	-----------------------------------------
                                    130 ;	 function TIM4_UpdateDisableConfig
                                    131 ;	-----------------------------------------
      0082AC                        132 _TIM4_UpdateDisableConfig:
                                    133 ;	HAL_TIM4.c: 43: TIM4->CR1 |= TIM4_CR1_UDIS;
      0082AC C6 53 40         [ 1]  134 	ld	a, 0x5340
                                    135 ;	HAL_TIM4.c: 41: if (NewState != 0)
      0082AF 0D 03            [ 1]  136 	tnz	(0x03, sp)
      0082B1 27 06            [ 1]  137 	jreq	00102$
                                    138 ;	HAL_TIM4.c: 43: TIM4->CR1 |= TIM4_CR1_UDIS;
      0082B3 AA 02            [ 1]  139 	or	a, #0x02
      0082B5 C7 53 40         [ 1]  140 	ld	0x5340, a
      0082B8 81               [ 4]  141 	ret
      0082B9                        142 00102$:
                                    143 ;	HAL_TIM4.c: 47: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
      0082B9 A4 FD            [ 1]  144 	and	a, #0xfd
      0082BB C7 53 40         [ 1]  145 	ld	0x5340, a
                                    146 ;	HAL_TIM4.c: 49: }
      0082BE 81               [ 4]  147 	ret
                                    148 ;	HAL_TIM4.c: 51: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    149 ;	-----------------------------------------
                                    150 ;	 function TIM4_UpdateRequestConfig
                                    151 ;	-----------------------------------------
      0082BF                        152 _TIM4_UpdateRequestConfig:
                                    153 ;	HAL_TIM4.c: 55: TIM4->CR1 |= TIM4_CR1_URS;
      0082BF C6 53 40         [ 1]  154 	ld	a, 0x5340
                                    155 ;	HAL_TIM4.c: 53: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
      0082C2 0D 03            [ 1]  156 	tnz	(0x03, sp)
      0082C4 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	HAL_TIM4.c: 55: TIM4->CR1 |= TIM4_CR1_URS;
      0082C6 AA 04            [ 1]  159 	or	a, #0x04
      0082C8 C7 53 40         [ 1]  160 	ld	0x5340, a
      0082CB 81               [ 4]  161 	ret
      0082CC                        162 00102$:
                                    163 ;	HAL_TIM4.c: 59: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
      0082CC A4 FB            [ 1]  164 	and	a, #0xfb
      0082CE C7 53 40         [ 1]  165 	ld	0x5340, a
                                    166 ;	HAL_TIM4.c: 61: }
      0082D1 81               [ 4]  167 	ret
                                    168 ;	HAL_TIM4.c: 63: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM4_SelectOnePulseMode
                                    171 ;	-----------------------------------------
      0082D2                        172 _TIM4_SelectOnePulseMode:
                                    173 ;	HAL_TIM4.c: 67: TIM4->CR1 |= TIM4_CR1_OPM;
      0082D2 C6 53 40         [ 1]  174 	ld	a, 0x5340
                                    175 ;	HAL_TIM4.c: 65: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
      0082D5 0D 03            [ 1]  176 	tnz	(0x03, sp)
      0082D7 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	HAL_TIM4.c: 67: TIM4->CR1 |= TIM4_CR1_OPM;
      0082D9 AA 08            [ 1]  179 	or	a, #0x08
      0082DB C7 53 40         [ 1]  180 	ld	0x5340, a
      0082DE 81               [ 4]  181 	ret
      0082DF                        182 00102$:
                                    183 ;	HAL_TIM4.c: 71: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
      0082DF A4 F7            [ 1]  184 	and	a, #0xf7
      0082E1 C7 53 40         [ 1]  185 	ld	0x5340, a
                                    186 ;	HAL_TIM4.c: 73: }
      0082E4 81               [ 4]  187 	ret
                                    188 ;	HAL_TIM4.c: 75: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
                                    189 ;	-----------------------------------------
                                    190 ;	 function TIM4_PrescalerConfig
                                    191 ;	-----------------------------------------
      0082E5                        192 _TIM4_PrescalerConfig:
                                    193 ;	HAL_TIM4.c: 77: TIM4->PSCR = (uint8_t)Prescaler;
      0082E5 AE 53 45         [ 2]  194 	ldw	x, #0x5345
      0082E8 7B 03            [ 1]  195 	ld	a, (0x03, sp)
      0082EA F7               [ 1]  196 	ld	(x), a
                                    197 ;	HAL_TIM4.c: 78: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
      0082EB AE 53 43         [ 2]  198 	ldw	x, #0x5343
      0082EE 7B 04            [ 1]  199 	ld	a, (0x04, sp)
      0082F0 F7               [ 1]  200 	ld	(x), a
                                    201 ;	HAL_TIM4.c: 79: }
      0082F1 81               [ 4]  202 	ret
                                    203 ;	HAL_TIM4.c: 81: void TIM4_ARRPreloadConfig(uint8_t NewState)
                                    204 ;	-----------------------------------------
                                    205 ;	 function TIM4_ARRPreloadConfig
                                    206 ;	-----------------------------------------
      0082F2                        207 _TIM4_ARRPreloadConfig:
                                    208 ;	HAL_TIM4.c: 85: TIM4->CR1 |= TIM4_CR1_ARPE;
      0082F2 C6 53 40         [ 1]  209 	ld	a, 0x5340
                                    210 ;	HAL_TIM4.c: 83: if (NewState != 0)
      0082F5 0D 03            [ 1]  211 	tnz	(0x03, sp)
      0082F7 27 06            [ 1]  212 	jreq	00102$
                                    213 ;	HAL_TIM4.c: 85: TIM4->CR1 |= TIM4_CR1_ARPE;
      0082F9 AA 80            [ 1]  214 	or	a, #0x80
      0082FB C7 53 40         [ 1]  215 	ld	0x5340, a
      0082FE 81               [ 4]  216 	ret
      0082FF                        217 00102$:
                                    218 ;	HAL_TIM4.c: 89: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
      0082FF A4 7F            [ 1]  219 	and	a, #0x7f
      008301 C7 53 40         [ 1]  220 	ld	0x5340, a
                                    221 ;	HAL_TIM4.c: 91: }
      008304 81               [ 4]  222 	ret
                                    223 ;	HAL_TIM4.c: 93: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    224 ;	-----------------------------------------
                                    225 ;	 function TIM4_GenerateEvent
                                    226 ;	-----------------------------------------
      008305                        227 _TIM4_GenerateEvent:
                                    228 ;	HAL_TIM4.c: 95: TIM4->EGR = (uint8_t)(TIM4_EventSource);
      008305 AE 53 43         [ 2]  229 	ldw	x, #0x5343
      008308 7B 03            [ 1]  230 	ld	a, (0x03, sp)
      00830A F7               [ 1]  231 	ld	(x), a
                                    232 ;	HAL_TIM4.c: 96: }
      00830B 81               [ 4]  233 	ret
                                    234 ;	HAL_TIM4.c: 98: void TIM4_SetCounter(uint8_t Counter)
                                    235 ;	-----------------------------------------
                                    236 ;	 function TIM4_SetCounter
                                    237 ;	-----------------------------------------
      00830C                        238 _TIM4_SetCounter:
                                    239 ;	HAL_TIM4.c: 100: TIM4->CNTR = (uint8_t)(Counter);
      00830C AE 53 44         [ 2]  240 	ldw	x, #0x5344
      00830F 7B 03            [ 1]  241 	ld	a, (0x03, sp)
      008311 F7               [ 1]  242 	ld	(x), a
                                    243 ;	HAL_TIM4.c: 101: }
      008312 81               [ 4]  244 	ret
                                    245 ;	HAL_TIM4.c: 103: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    246 ;	-----------------------------------------
                                    247 ;	 function TIM4_SetAutoreload
                                    248 ;	-----------------------------------------
      008313                        249 _TIM4_SetAutoreload:
                                    250 ;	HAL_TIM4.c: 105: TIM4->ARR = (uint8_t)(Autoreload);
      008313 AE 53 46         [ 2]  251 	ldw	x, #0x5346
      008316 7B 03            [ 1]  252 	ld	a, (0x03, sp)
      008318 F7               [ 1]  253 	ld	(x), a
                                    254 ;	HAL_TIM4.c: 106: }
      008319 81               [ 4]  255 	ret
                                    256 ;	HAL_TIM4.c: 108: uint8_t TIM4_GetCounter(void)
                                    257 ;	-----------------------------------------
                                    258 ;	 function TIM4_GetCounter
                                    259 ;	-----------------------------------------
      00831A                        260 _TIM4_GetCounter:
                                    261 ;	HAL_TIM4.c: 110: return (uint8_t)(TIM4->CNTR);
      00831A C6 53 44         [ 1]  262 	ld	a, 0x5344
                                    263 ;	HAL_TIM4.c: 111: }
      00831D 81               [ 4]  264 	ret
                                    265 ;	HAL_TIM4.c: 113: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    266 ;	-----------------------------------------
                                    267 ;	 function TIM4_GetPrescaler
                                    268 ;	-----------------------------------------
      00831E                        269 _TIM4_GetPrescaler:
                                    270 ;	HAL_TIM4.c: 115: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
      00831E C6 53 45         [ 1]  271 	ld	a, 0x5345
                                    272 ;	HAL_TIM4.c: 116: }
      008321 81               [ 4]  273 	ret
                                    274 ;	HAL_TIM4.c: 118: uint8_t TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    275 ;	-----------------------------------------
                                    276 ;	 function TIM4_GetFlagStatus
                                    277 ;	-----------------------------------------
      008322                        278 _TIM4_GetFlagStatus:
                                    279 ;	HAL_TIM4.c: 121: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      008322 C6 53 42         [ 1]  280 	ld	a, 0x5342
      008325 14 03            [ 1]  281 	and	a, (0x03, sp)
      008327 27 03            [ 1]  282 	jreq	00102$
                                    283 ;	HAL_TIM4.c: 123: bitstatus = 1;
      008329 A6 01            [ 1]  284 	ld	a, #0x01
      00832B 81               [ 4]  285 	ret
      00832C                        286 00102$:
                                    287 ;	HAL_TIM4.c: 127: bitstatus = 0;
      00832C 4F               [ 1]  288 	clr	a
                                    289 ;	HAL_TIM4.c: 129: return (bitstatus);
                                    290 ;	HAL_TIM4.c: 130: }
      00832D 81               [ 4]  291 	ret
                                    292 ;	HAL_TIM4.c: 132: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    293 ;	-----------------------------------------
                                    294 ;	 function TIM4_ClearFlag
                                    295 ;	-----------------------------------------
      00832E                        296 _TIM4_ClearFlag:
                                    297 ;	HAL_TIM4.c: 134: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      00832E 7B 03            [ 1]  298 	ld	a, (0x03, sp)
      008330 43               [ 1]  299 	cpl	a
      008331 C7 53 42         [ 1]  300 	ld	0x5342, a
                                    301 ;	HAL_TIM4.c: 135: }
      008334 81               [ 4]  302 	ret
                                    303 ;	HAL_TIM4.c: 137: uint8_t TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    304 ;	-----------------------------------------
                                    305 ;	 function TIM4_GetITStatus
                                    306 ;	-----------------------------------------
      008335                        307 _TIM4_GetITStatus:
      008335 88               [ 1]  308 	push	a
                                    309 ;	HAL_TIM4.c: 144: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      008336 C6 53 42         [ 1]  310 	ld	a, 0x5342
      008339 14 04            [ 1]  311 	and	a, (0x04, sp)
      00833B 6B 01            [ 1]  312 	ld	(0x01, sp), a
                                    313 ;	HAL_TIM4.c: 146: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      00833D C6 53 41         [ 1]  314 	ld	a, 0x5341
      008340 14 04            [ 1]  315 	and	a, (0x04, sp)
                                    316 ;	HAL_TIM4.c: 148: if ((itstatus != 0 ) && (itenable != 0))
      008342 0D 01            [ 1]  317 	tnz	(0x01, sp)
      008344 27 06            [ 1]  318 	jreq	00102$
      008346 4D               [ 1]  319 	tnz	a
      008347 27 03            [ 1]  320 	jreq	00102$
                                    321 ;	HAL_TIM4.c: 150: bitstatus = 1;
      008349 A6 01            [ 1]  322 	ld	a, #0x01
                                    323 ;	HAL_TIM4.c: 154: bitstatus = 0;
      00834B 21                     324 	.byte 0x21
      00834C                        325 00102$:
      00834C 4F               [ 1]  326 	clr	a
      00834D                        327 00103$:
                                    328 ;	HAL_TIM4.c: 156: return (bitstatus);
                                    329 ;	HAL_TIM4.c: 157: }
      00834D 5B 01            [ 2]  330 	addw	sp, #1
      00834F 81               [ 4]  331 	ret
                                    332 ;	HAL_TIM4.c: 159: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    333 ;	-----------------------------------------
                                    334 ;	 function TIM4_ClearITPendingBit
                                    335 ;	-----------------------------------------
      008350                        336 _TIM4_ClearITPendingBit:
                                    337 ;	HAL_TIM4.c: 161: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      008350 7B 03            [ 1]  338 	ld	a, (0x03, sp)
      008352 43               [ 1]  339 	cpl	a
      008353 C7 53 42         [ 1]  340 	ld	0x5342, a
                                    341 ;	HAL_TIM4.c: 162: }
      008356 81               [ 4]  342 	ret
                                    343 	.area CODE
                                    344 	.area CONST
                                    345 	.area INITIALIZER
                                    346 	.area CABS (ABS)
