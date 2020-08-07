                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_CLK
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	HAL_CLK.c: 12: void CLK_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function CLK_DeInit
                                     76 ;	-----------------------------------------
      008357                         77 _CLK_DeInit:
                                     78 ;	HAL_CLK.c: 15: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008357 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	HAL_CLK.c: 16: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      00835B 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	HAL_CLK.c: 17: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00835F 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	HAL_CLK.c: 18: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008363 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	HAL_CLK.c: 19: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008367 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	HAL_CLK.c: 20: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      00836B 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	HAL_CLK.c: 21: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00836F 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	HAL_CLK.c: 22: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008373 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	HAL_CLK.c: 23: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008377 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	HAL_CLK.c: 24: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      00837B                         97 00101$:
      00837B C6 50 C9         [ 1]   98 	ld	a, 0x50c9
      00837E 44               [ 1]   99 	srl	a
      00837F 25 FA            [ 1]  100 	jrc	00101$
                                    101 ;	HAL_CLK.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008381 35 00 50 C9      [ 1]  102 	mov	0x50c9+0, #0x00
                                    103 ;	HAL_CLK.c: 27: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008385 35 00 50 CC      [ 1]  104 	mov	0x50cc+0, #0x00
                                    105 ;	HAL_CLK.c: 28: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008389 35 00 50 CD      [ 1]  106 	mov	0x50cd+0, #0x00
                                    107 ;	HAL_CLK.c: 30: }
      00838D 81               [ 4]  108 	ret
                                    109 ;	HAL_CLK.c: 32: void CLK_FastHaltWakeUpCmd(uint8_t NewState)
                                    110 ;	-----------------------------------------
                                    111 ;	 function CLK_FastHaltWakeUpCmd
                                    112 ;	-----------------------------------------
      00838E                        113 _CLK_FastHaltWakeUpCmd:
                                    114 ;	HAL_CLK.c: 37: CLK->ICKR |= CLK_ICKR_FHWU;
      00838E C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	HAL_CLK.c: 34: if (NewState != 0)
      008391 0D 03            [ 1]  117 	tnz	(0x03, sp)
      008393 27 06            [ 1]  118 	jreq	00102$
                                    119 ;	HAL_CLK.c: 37: CLK->ICKR |= CLK_ICKR_FHWU;
      008395 AA 04            [ 1]  120 	or	a, #0x04
      008397 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      00839A 81               [ 4]  122 	ret
      00839B                        123 00102$:
                                    124 ;	HAL_CLK.c: 42: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      00839B A4 FB            [ 1]  125 	and	a, #0xfb
      00839D C7 50 C0         [ 1]  126 	ld	0x50c0, a
                                    127 ;	HAL_CLK.c: 45: }
      0083A0 81               [ 4]  128 	ret
                                    129 ;	HAL_CLK.c: 47: void CLK_HSECmd(uint8_t NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function CLK_HSECmd
                                    132 ;	-----------------------------------------
      0083A1                        133 _CLK_HSECmd:
                                    134 ;	HAL_CLK.c: 52: CLK->ECKR |= CLK_ECKR_HSEEN;
      0083A1 C6 50 C1         [ 1]  135 	ld	a, 0x50c1
                                    136 ;	HAL_CLK.c: 49: if (NewState != 0)
      0083A4 0D 03            [ 1]  137 	tnz	(0x03, sp)
      0083A6 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	HAL_CLK.c: 52: CLK->ECKR |= CLK_ECKR_HSEEN;
      0083A8 AA 01            [ 1]  140 	or	a, #0x01
      0083AA C7 50 C1         [ 1]  141 	ld	0x50c1, a
      0083AD 81               [ 4]  142 	ret
      0083AE                        143 00102$:
                                    144 ;	HAL_CLK.c: 57: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0083AE A4 FE            [ 1]  145 	and	a, #0xfe
      0083B0 C7 50 C1         [ 1]  146 	ld	0x50c1, a
                                    147 ;	HAL_CLK.c: 60: }
      0083B3 81               [ 4]  148 	ret
                                    149 ;	HAL_CLK.c: 62: void CLK_HSICmd(uint8_t NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_HSICmd
                                    152 ;	-----------------------------------------
      0083B4                        153 _CLK_HSICmd:
                                    154 ;	HAL_CLK.c: 67: CLK->ICKR |= CLK_ICKR_HSIEN;
      0083B4 C6 50 C0         [ 1]  155 	ld	a, 0x50c0
                                    156 ;	HAL_CLK.c: 64: if (NewState != 0)
      0083B7 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0083B9 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	HAL_CLK.c: 67: CLK->ICKR |= CLK_ICKR_HSIEN;
      0083BB AA 01            [ 1]  160 	or	a, #0x01
      0083BD C7 50 C0         [ 1]  161 	ld	0x50c0, a
      0083C0 81               [ 4]  162 	ret
      0083C1                        163 00102$:
                                    164 ;	HAL_CLK.c: 72: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0083C1 A4 FE            [ 1]  165 	and	a, #0xfe
      0083C3 C7 50 C0         [ 1]  166 	ld	0x50c0, a
                                    167 ;	HAL_CLK.c: 75: }
      0083C6 81               [ 4]  168 	ret
                                    169 ;	HAL_CLK.c: 78: void CLK_LSICmd(uint8_t NewState)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_LSICmd
                                    172 ;	-----------------------------------------
      0083C7                        173 _CLK_LSICmd:
                                    174 ;	HAL_CLK.c: 83: CLK->ICKR |= CLK_ICKR_LSIEN;
      0083C7 C6 50 C0         [ 1]  175 	ld	a, 0x50c0
                                    176 ;	HAL_CLK.c: 80: if (NewState != 0)
      0083CA 0D 03            [ 1]  177 	tnz	(0x03, sp)
      0083CC 27 06            [ 1]  178 	jreq	00102$
                                    179 ;	HAL_CLK.c: 83: CLK->ICKR |= CLK_ICKR_LSIEN;
      0083CE AA 08            [ 1]  180 	or	a, #0x08
      0083D0 C7 50 C0         [ 1]  181 	ld	0x50c0, a
      0083D3 81               [ 4]  182 	ret
      0083D4                        183 00102$:
                                    184 ;	HAL_CLK.c: 88: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0083D4 A4 F7            [ 1]  185 	and	a, #0xf7
      0083D6 C7 50 C0         [ 1]  186 	ld	0x50c0, a
                                    187 ;	HAL_CLK.c: 91: }
      0083D9 81               [ 4]  188 	ret
                                    189 ;	HAL_CLK.c: 93: void CLK_CCOCmd(uint8_t NewState)
                                    190 ;	-----------------------------------------
                                    191 ;	 function CLK_CCOCmd
                                    192 ;	-----------------------------------------
      0083DA                        193 _CLK_CCOCmd:
                                    194 ;	HAL_CLK.c: 98: CLK->CCOR |= CLK_CCOR_CCOEN;
      0083DA C6 50 C9         [ 1]  195 	ld	a, 0x50c9
                                    196 ;	HAL_CLK.c: 95: if (NewState != 0)
      0083DD 0D 03            [ 1]  197 	tnz	(0x03, sp)
      0083DF 27 06            [ 1]  198 	jreq	00102$
                                    199 ;	HAL_CLK.c: 98: CLK->CCOR |= CLK_CCOR_CCOEN;
      0083E1 AA 01            [ 1]  200 	or	a, #0x01
      0083E3 C7 50 C9         [ 1]  201 	ld	0x50c9, a
      0083E6 81               [ 4]  202 	ret
      0083E7                        203 00102$:
                                    204 ;	HAL_CLK.c: 103: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0083E7 A4 FE            [ 1]  205 	and	a, #0xfe
      0083E9 C7 50 C9         [ 1]  206 	ld	0x50c9, a
                                    207 ;	HAL_CLK.c: 106: }
      0083EC 81               [ 4]  208 	ret
                                    209 ;	HAL_CLK.c: 115: void CLK_ClockSwitchCmd(uint8_t NewState)
                                    210 ;	-----------------------------------------
                                    211 ;	 function CLK_ClockSwitchCmd
                                    212 ;	-----------------------------------------
      0083ED                        213 _CLK_ClockSwitchCmd:
                                    214 ;	HAL_CLK.c: 120: CLK->SWCR |= CLK_SWCR_SWEN;
      0083ED C6 50 C5         [ 1]  215 	ld	a, 0x50c5
                                    216 ;	HAL_CLK.c: 117: if (NewState != 0 )
      0083F0 0D 03            [ 1]  217 	tnz	(0x03, sp)
      0083F2 27 06            [ 1]  218 	jreq	00102$
                                    219 ;	HAL_CLK.c: 120: CLK->SWCR |= CLK_SWCR_SWEN;
      0083F4 AA 02            [ 1]  220 	or	a, #0x02
      0083F6 C7 50 C5         [ 1]  221 	ld	0x50c5, a
      0083F9 81               [ 4]  222 	ret
      0083FA                        223 00102$:
                                    224 ;	HAL_CLK.c: 125: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0083FA A4 FD            [ 1]  225 	and	a, #0xfd
      0083FC C7 50 C5         [ 1]  226 	ld	0x50c5, a
                                    227 ;	HAL_CLK.c: 128: }
      0083FF 81               [ 4]  228 	ret
                                    229 ;	HAL_CLK.c: 130: void CLK_SlowActiveHaltWakeUpCmd(uint8_t NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    232 ;	-----------------------------------------
      008400                        233 _CLK_SlowActiveHaltWakeUpCmd:
                                    234 ;	HAL_CLK.c: 135: CLK->ICKR |= CLK_ICKR_SWUAH;
      008400 C6 50 C0         [ 1]  235 	ld	a, 0x50c0
                                    236 ;	HAL_CLK.c: 132: if (NewState != 0)
      008403 0D 03            [ 1]  237 	tnz	(0x03, sp)
      008405 27 06            [ 1]  238 	jreq	00102$
                                    239 ;	HAL_CLK.c: 135: CLK->ICKR |= CLK_ICKR_SWUAH;
      008407 AA 20            [ 1]  240 	or	a, #0x20
      008409 C7 50 C0         [ 1]  241 	ld	0x50c0, a
      00840C 81               [ 4]  242 	ret
      00840D                        243 00102$:
                                    244 ;	HAL_CLK.c: 140: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      00840D A4 DF            [ 1]  245 	and	a, #0xdf
      00840F C7 50 C0         [ 1]  246 	ld	0x50c0, a
                                    247 ;	HAL_CLK.c: 143: }
      008412 81               [ 4]  248 	ret
                                    249 ;	HAL_CLK.c: 145: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, uint8_t NewState)
                                    250 ;	-----------------------------------------
                                    251 ;	 function CLK_PeripheralClockConfig
                                    252 ;	-----------------------------------------
      008413                        253 _CLK_PeripheralClockConfig:
      008413 52 02            [ 2]  254 	sub	sp, #2
                                    255 ;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008415 7B 05            [ 1]  256 	ld	a, (0x05, sp)
      008417 A4 0F            [ 1]  257 	and	a, #0x0f
      008419 88               [ 1]  258 	push	a
      00841A A6 01            [ 1]  259 	ld	a, #0x01
      00841C 6B 02            [ 1]  260 	ld	(0x02, sp), a
      00841E 84               [ 1]  261 	pop	a
      00841F 4D               [ 1]  262 	tnz	a
      008420 27 05            [ 1]  263 	jreq	00128$
      008422                        264 00127$:
      008422 08 01            [ 1]  265 	sll	(0x01, sp)
      008424 4A               [ 1]  266 	dec	a
      008425 26 FB            [ 1]  267 	jrne	00127$
      008427                        268 00128$:
                                    269 ;	HAL_CLK.c: 157: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008427 7B 01            [ 1]  270 	ld	a, (0x01, sp)
      008429 43               [ 1]  271 	cpl	a
      00842A 6B 02            [ 1]  272 	ld	(0x02, sp), a
                                    273 ;	HAL_CLK.c: 147: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      00842C 7B 05            [ 1]  274 	ld	a, (0x05, sp)
      00842E A5 10            [ 1]  275 	bcp	a, #0x10
      008430 26 15            [ 1]  276 	jrne	00108$
                                    277 ;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008432 C6 50 C7         [ 1]  278 	ld	a, 0x50c7
                                    279 ;	HAL_CLK.c: 149: if (NewState != 0)
      008435 0D 06            [ 1]  280 	tnz	(0x06, sp)
      008437 27 07            [ 1]  281 	jreq	00102$
                                    282 ;	HAL_CLK.c: 152: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008439 1A 01            [ 1]  283 	or	a, (0x01, sp)
      00843B C7 50 C7         [ 1]  284 	ld	0x50c7, a
      00843E 20 1A            [ 2]  285 	jra	00110$
      008440                        286 00102$:
                                    287 ;	HAL_CLK.c: 157: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008440 14 02            [ 1]  288 	and	a, (0x02, sp)
      008442 C7 50 C7         [ 1]  289 	ld	0x50c7, a
      008445 20 13            [ 2]  290 	jra	00110$
      008447                        291 00108$:
                                    292 ;	HAL_CLK.c: 165: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008447 C6 50 CA         [ 1]  293 	ld	a, 0x50ca
                                    294 ;	HAL_CLK.c: 162: if (NewState != 0)
      00844A 0D 06            [ 1]  295 	tnz	(0x06, sp)
      00844C 27 07            [ 1]  296 	jreq	00105$
                                    297 ;	HAL_CLK.c: 165: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00844E 1A 01            [ 1]  298 	or	a, (0x01, sp)
      008450 C7 50 CA         [ 1]  299 	ld	0x50ca, a
      008453 20 05            [ 2]  300 	jra	00110$
      008455                        301 00105$:
                                    302 ;	HAL_CLK.c: 170: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008455 14 02            [ 1]  303 	and	a, (0x02, sp)
      008457 C7 50 CA         [ 1]  304 	ld	0x50ca, a
      00845A                        305 00110$:
                                    306 ;	HAL_CLK.c: 174: }
      00845A 5B 02            [ 2]  307 	addw	sp, #2
      00845C 81               [ 4]  308 	ret
                                    309 ;	HAL_CLK.c: 176: uint8_t CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, uint8_t ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    310 ;	-----------------------------------------
                                    311 ;	 function CLK_ClockSwitchConfig
                                    312 ;	-----------------------------------------
      00845D                        313 _CLK_ClockSwitchConfig:
                                    314 ;	HAL_CLK.c: 182: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00845D C6 50 C3         [ 1]  315 	ld	a, 0x50c3
      008460 90 97            [ 1]  316 	ld	yl, a
                                    317 ;	HAL_CLK.c: 189: CLK->SWCR |= CLK_SWCR_SWEN;
      008462 C6 50 C5         [ 1]  318 	ld	a, 0x50c5
                                    319 ;	HAL_CLK.c: 185: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      008465 88               [ 1]  320 	push	a
      008466 7B 04            [ 1]  321 	ld	a, (0x04, sp)
      008468 4A               [ 1]  322 	dec	a
      008469 84               [ 1]  323 	pop	a
      00846A 26 38            [ 1]  324 	jrne	00115$
                                    325 ;	HAL_CLK.c: 189: CLK->SWCR |= CLK_SWCR_SWEN;
      00846C AA 02            [ 1]  326 	or	a, #0x02
      00846E C7 50 C5         [ 1]  327 	ld	0x50c5, a
      008471 C6 50 C5         [ 1]  328 	ld	a, 0x50c5
                                    329 ;	HAL_CLK.c: 192: if (ITState != 0)
      008474 0D 05            [ 1]  330 	tnz	(0x05, sp)
      008476 27 07            [ 1]  331 	jreq	00102$
                                    332 ;	HAL_CLK.c: 194: CLK->SWCR |= CLK_SWCR_SWIEN;
      008478 AA 04            [ 1]  333 	or	a, #0x04
      00847A C7 50 C5         [ 1]  334 	ld	0x50c5, a
      00847D 20 05            [ 2]  335 	jra	00103$
      00847F                        336 00102$:
                                    337 ;	HAL_CLK.c: 198: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00847F A4 FB            [ 1]  338 	and	a, #0xfb
      008481 C7 50 C5         [ 1]  339 	ld	0x50c5, a
      008484                        340 00103$:
                                    341 ;	HAL_CLK.c: 202: CLK->SWR = (uint8_t)CLK_NewClock;
      008484 AE 50 C4         [ 2]  342 	ldw	x, #0x50c4
      008487 7B 04            [ 1]  343 	ld	a, (0x04, sp)
      008489 F7               [ 1]  344 	ld	(x), a
                                    345 ;	HAL_CLK.c: 204: while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      00848A AE 04 91         [ 2]  346 	ldw	x, #0x0491
      00848D                        347 00105$:
      00848D C6 50 C5         [ 1]  348 	ld	a, 0x50c5
      008490 44               [ 1]  349 	srl	a
      008491 24 06            [ 1]  350 	jrnc	00107$
      008493 5D               [ 2]  351 	tnzw	x
      008494 27 03            [ 1]  352 	jreq	00107$
                                    353 ;	HAL_CLK.c: 206: DownCounter--;
      008496 5A               [ 2]  354 	decw	x
      008497 20 F4            [ 2]  355 	jra	00105$
      008499                        356 00107$:
                                    357 ;	HAL_CLK.c: 209: if (DownCounter != 0)
      008499 5D               [ 2]  358 	tnzw	x
      00849A 27 05            [ 1]  359 	jreq	00109$
                                    360 ;	HAL_CLK.c: 211: Swif = 1;
      00849C A6 01            [ 1]  361 	ld	a, #0x01
      00849E 97               [ 1]  362 	ld	xl, a
      00849F 20 1C            [ 2]  363 	jra	00116$
      0084A1                        364 00109$:
                                    365 ;	HAL_CLK.c: 215: Swif = 0;
      0084A1 5F               [ 1]  366 	clrw	x
      0084A2 20 19            [ 2]  367 	jra	00116$
      0084A4                        368 00115$:
                                    369 ;	HAL_CLK.c: 223: if (ITState != 0)
      0084A4 0D 05            [ 1]  370 	tnz	(0x05, sp)
      0084A6 27 07            [ 1]  371 	jreq	00112$
                                    372 ;	HAL_CLK.c: 225: CLK->SWCR |= CLK_SWCR_SWIEN;
      0084A8 AA 04            [ 1]  373 	or	a, #0x04
      0084AA C7 50 C5         [ 1]  374 	ld	0x50c5, a
      0084AD 20 05            [ 2]  375 	jra	00113$
      0084AF                        376 00112$:
                                    377 ;	HAL_CLK.c: 229: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0084AF A4 FB            [ 1]  378 	and	a, #0xfb
      0084B1 C7 50 C5         [ 1]  379 	ld	0x50c5, a
      0084B4                        380 00113$:
                                    381 ;	HAL_CLK.c: 233: CLK->SWR = (uint8_t)CLK_NewClock;
      0084B4 AE 50 C4         [ 2]  382 	ldw	x, #0x50c4
      0084B7 7B 04            [ 1]  383 	ld	a, (0x04, sp)
      0084B9 F7               [ 1]  384 	ld	(x), a
                                    385 ;	HAL_CLK.c: 237: Swif = 1;
      0084BA A6 01            [ 1]  386 	ld	a, #0x01
      0084BC 97               [ 1]  387 	ld	xl, a
      0084BD                        388 00116$:
                                    389 ;	HAL_CLK.c: 242: if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0084BD 0D 06            [ 1]  390 	tnz	(0x06, sp)
      0084BF 26 0C            [ 1]  391 	jrne	00125$
      0084C1 90 9F            [ 1]  392 	ld	a, yl
      0084C3 A1 E1            [ 1]  393 	cp	a, #0xe1
      0084C5 26 06            [ 1]  394 	jrne	00125$
                                    395 ;	HAL_CLK.c: 244: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0084C7 72 11 50 C0      [ 1]  396 	bres	20672, #0
      0084CB 20 1E            [ 2]  397 	jra	00126$
      0084CD                        398 00125$:
                                    399 ;	HAL_CLK.c: 246: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0084CD 0D 06            [ 1]  400 	tnz	(0x06, sp)
      0084CF 26 0C            [ 1]  401 	jrne	00121$
      0084D1 90 9F            [ 1]  402 	ld	a, yl
      0084D3 A1 D2            [ 1]  403 	cp	a, #0xd2
      0084D5 26 06            [ 1]  404 	jrne	00121$
                                    405 ;	HAL_CLK.c: 248: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0084D7 72 17 50 C0      [ 1]  406 	bres	20672, #3
      0084DB 20 0E            [ 2]  407 	jra	00126$
      0084DD                        408 00121$:
                                    409 ;	HAL_CLK.c: 250: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0084DD 0D 06            [ 1]  410 	tnz	(0x06, sp)
      0084DF 26 0A            [ 1]  411 	jrne	00126$
      0084E1 90 9F            [ 1]  412 	ld	a, yl
      0084E3 A1 B4            [ 1]  413 	cp	a, #0xb4
      0084E5 26 04            [ 1]  414 	jrne	00126$
                                    415 ;	HAL_CLK.c: 252: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0084E7 72 11 50 C1      [ 1]  416 	bres	20673, #0
      0084EB                        417 00126$:
                                    418 ;	HAL_CLK.c: 255: return(Swif);
      0084EB 9F               [ 1]  419 	ld	a, xl
                                    420 ;	HAL_CLK.c: 257: }
      0084EC 81               [ 4]  421 	ret
                                    422 ;	HAL_CLK.c: 259: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    423 ;	-----------------------------------------
                                    424 ;	 function CLK_HSIPrescalerConfig
                                    425 ;	-----------------------------------------
      0084ED                        426 _CLK_HSIPrescalerConfig:
                                    427 ;	HAL_CLK.c: 262: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0084ED C6 50 C6         [ 1]  428 	ld	a, 0x50c6
      0084F0 A4 E7            [ 1]  429 	and	a, #0xe7
      0084F2 C7 50 C6         [ 1]  430 	ld	0x50c6, a
                                    431 ;	HAL_CLK.c: 265: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0084F5 C6 50 C6         [ 1]  432 	ld	a, 0x50c6
      0084F8 1A 03            [ 1]  433 	or	a, (0x03, sp)
      0084FA C7 50 C6         [ 1]  434 	ld	0x50c6, a
                                    435 ;	HAL_CLK.c: 267: }
      0084FD 81               [ 4]  436 	ret
                                    437 ;	HAL_CLK.c: 269: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    438 ;	-----------------------------------------
                                    439 ;	 function CLK_CCOConfig
                                    440 ;	-----------------------------------------
      0084FE                        441 _CLK_CCOConfig:
                                    442 ;	HAL_CLK.c: 271: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0084FE C6 50 C9         [ 1]  443 	ld	a, 0x50c9
      008501 A4 E1            [ 1]  444 	and	a, #0xe1
      008503 C7 50 C9         [ 1]  445 	ld	0x50c9, a
                                    446 ;	HAL_CLK.c: 274: CLK->CCOR |= (uint8_t)CLK_CCO;
      008506 C6 50 C9         [ 1]  447 	ld	a, 0x50c9
      008509 1A 03            [ 1]  448 	or	a, (0x03, sp)
      00850B C7 50 C9         [ 1]  449 	ld	0x50c9, a
                                    450 ;	HAL_CLK.c: 277: CLK->CCOR |= CLK_CCOR_CCOEN;
      00850E 72 10 50 C9      [ 1]  451 	bset	20681, #0
                                    452 ;	HAL_CLK.c: 279: }
      008512 81               [ 4]  453 	ret
                                    454 ;	HAL_CLK.c: 281: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, uint8_t NewState)
                                    455 ;	-----------------------------------------
                                    456 ;	 function CLK_ITConfig
                                    457 ;	-----------------------------------------
      008513                        458 _CLK_ITConfig:
      008513 88               [ 1]  459 	push	a
                                    460 ;	HAL_CLK.c: 285: switch (CLK_IT)
      008514 7B 04            [ 1]  461 	ld	a, (0x04, sp)
      008516 A0 0C            [ 1]  462 	sub	a, #0x0c
      008518 26 04            [ 1]  463 	jrne	00140$
      00851A 4C               [ 1]  464 	inc	a
      00851B 6B 01            [ 1]  465 	ld	(0x01, sp), a
      00851D C5                     466 	.byte 0xc5
      00851E                        467 00140$:
      00851E 0F 01            [ 1]  468 	clr	(0x01, sp)
      008520                        469 00141$:
      008520 7B 04            [ 1]  470 	ld	a, (0x04, sp)
      008522 A0 1C            [ 1]  471 	sub	a, #0x1c
      008524 26 02            [ 1]  472 	jrne	00143$
      008526 4C               [ 1]  473 	inc	a
      008527 21                     474 	.byte 0x21
      008528                        475 00143$:
      008528 4F               [ 1]  476 	clr	a
      008529                        477 00144$:
                                    478 ;	HAL_CLK.c: 283: if (NewState != 0)
      008529 0D 05            [ 1]  479 	tnz	(0x05, sp)
      00852B 27 13            [ 1]  480 	jreq	00110$
                                    481 ;	HAL_CLK.c: 285: switch (CLK_IT)
      00852D 0D 01            [ 1]  482 	tnz	(0x01, sp)
      00852F 26 09            [ 1]  483 	jrne	00102$
      008531 4D               [ 1]  484 	tnz	a
      008532 27 1D            [ 1]  485 	jreq	00112$
                                    486 ;	HAL_CLK.c: 288: CLK->SWCR |= CLK_SWCR_SWIEN;
      008534 72 14 50 C5      [ 1]  487 	bset	20677, #2
                                    488 ;	HAL_CLK.c: 289: break;
      008538 20 17            [ 2]  489 	jra	00112$
                                    490 ;	HAL_CLK.c: 290: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      00853A                        491 00102$:
                                    492 ;	HAL_CLK.c: 291: CLK->CSSR |= CLK_CSSR_CSSDIE;
      00853A 72 14 50 C8      [ 1]  493 	bset	20680, #2
                                    494 ;	HAL_CLK.c: 292: break;
      00853E 20 11            [ 2]  495 	jra	00112$
                                    496 ;	HAL_CLK.c: 295: }
      008540                        497 00110$:
                                    498 ;	HAL_CLK.c: 299: switch (CLK_IT)
      008540 0D 01            [ 1]  499 	tnz	(0x01, sp)
      008542 26 09            [ 1]  500 	jrne	00106$
      008544 4D               [ 1]  501 	tnz	a
      008545 27 0A            [ 1]  502 	jreq	00112$
                                    503 ;	HAL_CLK.c: 302: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008547 72 15 50 C5      [ 1]  504 	bres	20677, #2
                                    505 ;	HAL_CLK.c: 303: break;
      00854B 20 04            [ 2]  506 	jra	00112$
                                    507 ;	HAL_CLK.c: 304: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      00854D                        508 00106$:
                                    509 ;	HAL_CLK.c: 305: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00854D 72 15 50 C8      [ 1]  510 	bres	20680, #2
                                    511 ;	HAL_CLK.c: 309: }
      008551                        512 00112$:
                                    513 ;	HAL_CLK.c: 312: }
      008551 84               [ 1]  514 	pop	a
      008552 81               [ 4]  515 	ret
                                    516 ;	HAL_CLK.c: 315: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    517 ;	-----------------------------------------
                                    518 ;	 function CLK_SYSCLKConfig
                                    519 ;	-----------------------------------------
      008553                        520 _CLK_SYSCLKConfig:
      008553 88               [ 1]  521 	push	a
                                    522 ;	HAL_CLK.c: 319: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008554 C6 50 C6         [ 1]  523 	ld	a, 0x50c6
                                    524 ;	HAL_CLK.c: 317: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008557 0D 04            [ 1]  525 	tnz	(0x04, sp)
      008559 2B 15            [ 1]  526 	jrmi	00102$
                                    527 ;	HAL_CLK.c: 319: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00855B A4 E7            [ 1]  528 	and	a, #0xe7
      00855D C7 50 C6         [ 1]  529 	ld	0x50c6, a
                                    530 ;	HAL_CLK.c: 320: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008560 C6 50 C6         [ 1]  531 	ld	a, 0x50c6
      008563 6B 01            [ 1]  532 	ld	(0x01, sp), a
      008565 7B 04            [ 1]  533 	ld	a, (0x04, sp)
      008567 A4 18            [ 1]  534 	and	a, #0x18
      008569 1A 01            [ 1]  535 	or	a, (0x01, sp)
      00856B C7 50 C6         [ 1]  536 	ld	0x50c6, a
      00856E 20 13            [ 2]  537 	jra	00104$
      008570                        538 00102$:
                                    539 ;	HAL_CLK.c: 324: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008570 A4 F8            [ 1]  540 	and	a, #0xf8
      008572 C7 50 C6         [ 1]  541 	ld	0x50c6, a
                                    542 ;	HAL_CLK.c: 325: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008575 C6 50 C6         [ 1]  543 	ld	a, 0x50c6
      008578 6B 01            [ 1]  544 	ld	(0x01, sp), a
      00857A 7B 04            [ 1]  545 	ld	a, (0x04, sp)
      00857C A4 07            [ 1]  546 	and	a, #0x07
      00857E 1A 01            [ 1]  547 	or	a, (0x01, sp)
      008580 C7 50 C6         [ 1]  548 	ld	0x50c6, a
      008583                        549 00104$:
                                    550 ;	HAL_CLK.c: 328: }
      008583 84               [ 1]  551 	pop	a
      008584 81               [ 4]  552 	ret
                                    553 ;	HAL_CLK.c: 330: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    554 ;	-----------------------------------------
                                    555 ;	 function CLK_SWIMConfig
                                    556 ;	-----------------------------------------
      008585                        557 _CLK_SWIMConfig:
                                    558 ;	HAL_CLK.c: 335: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008585 C6 50 CD         [ 1]  559 	ld	a, 0x50cd
                                    560 ;	HAL_CLK.c: 332: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      008588 0D 03            [ 1]  561 	tnz	(0x03, sp)
      00858A 27 06            [ 1]  562 	jreq	00102$
                                    563 ;	HAL_CLK.c: 335: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00858C AA 01            [ 1]  564 	or	a, #0x01
      00858E C7 50 CD         [ 1]  565 	ld	0x50cd, a
      008591 81               [ 4]  566 	ret
      008592                        567 00102$:
                                    568 ;	HAL_CLK.c: 340: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008592 A4 FE            [ 1]  569 	and	a, #0xfe
      008594 C7 50 CD         [ 1]  570 	ld	0x50cd, a
                                    571 ;	HAL_CLK.c: 343: }
      008597 81               [ 4]  572 	ret
                                    573 ;	HAL_CLK.c: 345: void CLK_ClockSecuritySystemEnable(void)
                                    574 ;	-----------------------------------------
                                    575 ;	 function CLK_ClockSecuritySystemEnable
                                    576 ;	-----------------------------------------
      008598                        577 _CLK_ClockSecuritySystemEnable:
                                    578 ;	HAL_CLK.c: 347: CLK->CSSR |= CLK_CSSR_CSSEN;
      008598 72 10 50 C8      [ 1]  579 	bset	20680, #0
                                    580 ;	HAL_CLK.c: 348: }
      00859C 81               [ 4]  581 	ret
                                    582 ;	HAL_CLK.c: 350: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    583 ;	-----------------------------------------
                                    584 ;	 function CLK_GetSYSCLKSource
                                    585 ;	-----------------------------------------
      00859D                        586 _CLK_GetSYSCLKSource:
                                    587 ;	HAL_CLK.c: 352: return((CLK_Source_TypeDef)CLK->CMSR);
      00859D C6 50 C3         [ 1]  588 	ld	a, 0x50c3
                                    589 ;	HAL_CLK.c: 353: }
      0085A0 81               [ 4]  590 	ret
                                    591 ;	HAL_CLK.c: 355: uint32_t CLK_GetClockFreq(void)
                                    592 ;	-----------------------------------------
                                    593 ;	 function CLK_GetClockFreq
                                    594 ;	-----------------------------------------
      0085A1                        595 _CLK_GetClockFreq:
      0085A1 52 04            [ 2]  596 	sub	sp, #4
                                    597 ;	HAL_CLK.c: 363: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0085A3 C6 50 C3         [ 1]  598 	ld	a, 0x50c3
                                    599 ;	HAL_CLK.c: 365: if (clocksource == CLK_SOURCE_HSI)
      0085A6 6B 04            [ 1]  600 	ld	(0x04, sp), a
      0085A8 A1 E1            [ 1]  601 	cp	a, #0xe1
      0085AA 26 26            [ 1]  602 	jrne	00105$
                                    603 ;	HAL_CLK.c: 367: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0085AC C6 50 C6         [ 1]  604 	ld	a, 0x50c6
      0085AF A4 18            [ 1]  605 	and	a, #0x18
                                    606 ;	HAL_CLK.c: 368: tmp = (uint8_t)(tmp >> 3);
      0085B1 44               [ 1]  607 	srl	a
      0085B2 44               [ 1]  608 	srl	a
      0085B3 44               [ 1]  609 	srl	a
                                    610 ;	HAL_CLK.c: 369: presc = HSIDivFactor[tmp];
      0085B4 5F               [ 1]  611 	clrw	x
      0085B5 97               [ 1]  612 	ld	xl, a
      0085B6 1C 80 88         [ 2]  613 	addw	x, #(_HSIDivFactor + 0)
      0085B9 F6               [ 1]  614 	ld	a, (x)
                                    615 ;	HAL_CLK.c: 370: clockfrequency = HSI_VALUE / presc;
      0085BA 5F               [ 1]  616 	clrw	x
      0085BB 97               [ 1]  617 	ld	xl, a
      0085BC 90 5F            [ 1]  618 	clrw	y
      0085BE 89               [ 2]  619 	pushw	x
      0085BF 90 89            [ 2]  620 	pushw	y
      0085C1 4B 00            [ 1]  621 	push	#0x00
      0085C3 4B 24            [ 1]  622 	push	#0x24
      0085C5 4B F4            [ 1]  623 	push	#0xf4
      0085C7 4B 00            [ 1]  624 	push	#0x00
      0085C9 CD 9A 2E         [ 4]  625 	call	__divulong
      0085CC 5B 08            [ 2]  626 	addw	sp, #8
      0085CE 1F 03            [ 2]  627 	ldw	(0x03, sp), x
      0085D0 20 1A            [ 2]  628 	jra	00106$
      0085D2                        629 00105$:
                                    630 ;	HAL_CLK.c: 372: else if ( clocksource == CLK_SOURCE_LSI)
      0085D2 7B 04            [ 1]  631 	ld	a, (0x04, sp)
      0085D4 A1 D2            [ 1]  632 	cp	a, #0xd2
      0085D6 26 0B            [ 1]  633 	jrne	00102$
                                    634 ;	HAL_CLK.c: 374: clockfrequency = LSI_VALUE;
      0085D8 AE F4 00         [ 2]  635 	ldw	x, #0xf400
      0085DB 1F 03            [ 2]  636 	ldw	(0x03, sp), x
      0085DD 90 AE 00 01      [ 2]  637 	ldw	y, #0x0001
      0085E1 20 09            [ 2]  638 	jra	00106$
      0085E3                        639 00102$:
                                    640 ;	HAL_CLK.c: 378: clockfrequency = HSE_VALUE;
      0085E3 AE 36 00         [ 2]  641 	ldw	x, #0x3600
      0085E6 1F 03            [ 2]  642 	ldw	(0x03, sp), x
      0085E8 90 AE 01 6E      [ 2]  643 	ldw	y, #0x016e
      0085EC                        644 00106$:
                                    645 ;	HAL_CLK.c: 381: return((uint32_t)clockfrequency);
      0085EC 1E 03            [ 2]  646 	ldw	x, (0x03, sp)
                                    647 ;	HAL_CLK.c: 383: }
      0085EE 5B 04            [ 2]  648 	addw	sp, #4
      0085F0 81               [ 4]  649 	ret
                                    650 ;	HAL_CLK.c: 385: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    651 ;	-----------------------------------------
                                    652 ;	 function CLK_AdjustHSICalibrationValue
                                    653 ;	-----------------------------------------
      0085F1                        654 _CLK_AdjustHSICalibrationValue:
                                    655 ;	HAL_CLK.c: 387: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0085F1 C6 50 CC         [ 1]  656 	ld	a, 0x50cc
      0085F4 A4 F8            [ 1]  657 	and	a, #0xf8
      0085F6 1A 03            [ 1]  658 	or	a, (0x03, sp)
      0085F8 C7 50 CC         [ 1]  659 	ld	0x50cc, a
                                    660 ;	HAL_CLK.c: 388: }
      0085FB 81               [ 4]  661 	ret
                                    662 ;	HAL_CLK.c: 390: void CLK_SYSCLKEmergencyClear(void)
                                    663 ;	-----------------------------------------
                                    664 ;	 function CLK_SYSCLKEmergencyClear
                                    665 ;	-----------------------------------------
      0085FC                        666 _CLK_SYSCLKEmergencyClear:
                                    667 ;	HAL_CLK.c: 392: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0085FC 72 11 50 C5      [ 1]  668 	bres	20677, #0
                                    669 ;	HAL_CLK.c: 393: }
      008600 81               [ 4]  670 	ret
                                    671 ;	HAL_CLK.c: 395: uint8_t CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    672 ;	-----------------------------------------
                                    673 ;	 function CLK_GetFlagStatus
                                    674 ;	-----------------------------------------
      008601                        675 _CLK_GetFlagStatus:
      008601 52 02            [ 2]  676 	sub	sp, #2
                                    677 ;	HAL_CLK.c: 402: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      008603 1E 05            [ 2]  678 	ldw	x, (0x05, sp)
      008605 4F               [ 1]  679 	clr	a
      008606 97               [ 1]  680 	ld	xl, a
                                    681 ;	HAL_CLK.c: 405: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      008607 1F 01            [ 2]  682 	ldw	(0x01, sp), x
      008609 A3 01 00         [ 2]  683 	cpw	x, #0x0100
      00860C 26 05            [ 1]  684 	jrne	00111$
                                    685 ;	HAL_CLK.c: 407: tmpreg = CLK->ICKR;
      00860E C6 50 C0         [ 1]  686 	ld	a, 0x50c0
      008611 20 27            [ 2]  687 	jra	00112$
      008613                        688 00111$:
                                    689 ;	HAL_CLK.c: 409: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      008613 1E 01            [ 2]  690 	ldw	x, (0x01, sp)
      008615 A3 02 00         [ 2]  691 	cpw	x, #0x0200
      008618 26 05            [ 1]  692 	jrne	00108$
                                    693 ;	HAL_CLK.c: 411: tmpreg = CLK->ECKR;
      00861A C6 50 C1         [ 1]  694 	ld	a, 0x50c1
      00861D 20 1B            [ 2]  695 	jra	00112$
      00861F                        696 00108$:
                                    697 ;	HAL_CLK.c: 413: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00861F 1E 01            [ 2]  698 	ldw	x, (0x01, sp)
      008621 A3 03 00         [ 2]  699 	cpw	x, #0x0300
      008624 26 05            [ 1]  700 	jrne	00105$
                                    701 ;	HAL_CLK.c: 415: tmpreg = CLK->SWCR;
      008626 C6 50 C5         [ 1]  702 	ld	a, 0x50c5
      008629 20 0F            [ 2]  703 	jra	00112$
      00862B                        704 00105$:
                                    705 ;	HAL_CLK.c: 417: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      00862B 1E 01            [ 2]  706 	ldw	x, (0x01, sp)
      00862D A3 04 00         [ 2]  707 	cpw	x, #0x0400
      008630 26 05            [ 1]  708 	jrne	00102$
                                    709 ;	HAL_CLK.c: 419: tmpreg = CLK->CSSR;
      008632 C6 50 C8         [ 1]  710 	ld	a, 0x50c8
      008635 20 03            [ 2]  711 	jra	00112$
      008637                        712 00102$:
                                    713 ;	HAL_CLK.c: 423: tmpreg = CLK->CCOR;
      008637 C6 50 C9         [ 1]  714 	ld	a, 0x50c9
      00863A                        715 00112$:
                                    716 ;	HAL_CLK.c: 426: if ((tmpreg & (uint8_t)CLK_FLAG) != 0)
      00863A 88               [ 1]  717 	push	a
      00863B 7B 07            [ 1]  718 	ld	a, (0x07, sp)
      00863D 6B 03            [ 1]  719 	ld	(0x03, sp), a
      00863F 84               [ 1]  720 	pop	a
      008640 14 02            [ 1]  721 	and	a, (0x02, sp)
      008642 27 03            [ 1]  722 	jreq	00114$
                                    723 ;	HAL_CLK.c: 428: bitstatus = 1;
      008644 A6 01            [ 1]  724 	ld	a, #0x01
                                    725 ;	HAL_CLK.c: 432: bitstatus = 0;
      008646 21                     726 	.byte 0x21
      008647                        727 00114$:
      008647 4F               [ 1]  728 	clr	a
      008648                        729 00115$:
                                    730 ;	HAL_CLK.c: 436: return(bitstatus);
                                    731 ;	HAL_CLK.c: 438: }
      008648 5B 02            [ 2]  732 	addw	sp, #2
      00864A 81               [ 4]  733 	ret
                                    734 ;	HAL_CLK.c: 440: uint8_t CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    735 ;	-----------------------------------------
                                    736 ;	 function CLK_GetITStatus
                                    737 ;	-----------------------------------------
      00864B                        738 _CLK_GetITStatus:
                                    739 ;	HAL_CLK.c: 444: if (CLK_IT == CLK_IT_SWIF)
      00864B 7B 03            [ 1]  740 	ld	a, (0x03, sp)
      00864D A1 1C            [ 1]  741 	cp	a, #0x1c
      00864F 26 0D            [ 1]  742 	jrne	00108$
                                    743 ;	HAL_CLK.c: 447: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008651 C6 50 C5         [ 1]  744 	ld	a, 0x50c5
      008654 14 03            [ 1]  745 	and	a, (0x03, sp)
                                    746 ;	HAL_CLK.c: 449: bitstatus = 1;
      008656 A0 0C            [ 1]  747 	sub	a, #0x0c
      008658 26 02            [ 1]  748 	jrne	00102$
      00865A 4C               [ 1]  749 	inc	a
      00865B 81               [ 4]  750 	ret
      00865C                        751 00102$:
                                    752 ;	HAL_CLK.c: 453: bitstatus = 0;
      00865C 4F               [ 1]  753 	clr	a
      00865D 81               [ 4]  754 	ret
      00865E                        755 00108$:
                                    756 ;	HAL_CLK.c: 459: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00865E C6 50 C8         [ 1]  757 	ld	a, 0x50c8
      008661 14 03            [ 1]  758 	and	a, (0x03, sp)
                                    759 ;	HAL_CLK.c: 461: bitstatus = 1;
      008663 A0 0C            [ 1]  760 	sub	a, #0x0c
      008665 26 02            [ 1]  761 	jrne	00105$
      008667 4C               [ 1]  762 	inc	a
      008668 81               [ 4]  763 	ret
      008669                        764 00105$:
                                    765 ;	HAL_CLK.c: 465: bitstatus = 0;
      008669 4F               [ 1]  766 	clr	a
                                    767 ;	HAL_CLK.c: 469: return bitstatus;
                                    768 ;	HAL_CLK.c: 471: }
      00866A 81               [ 4]  769 	ret
                                    770 ;	HAL_CLK.c: 473: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    771 ;	-----------------------------------------
                                    772 ;	 function CLK_ClearITPendingBit
                                    773 ;	-----------------------------------------
      00866B                        774 _CLK_ClearITPendingBit:
                                    775 ;	HAL_CLK.c: 475: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      00866B 7B 03            [ 1]  776 	ld	a, (0x03, sp)
      00866D A1 0C            [ 1]  777 	cp	a, #0x0c
      00866F 26 05            [ 1]  778 	jrne	00102$
                                    779 ;	HAL_CLK.c: 478: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008671 72 17 50 C8      [ 1]  780 	bres	20680, #3
      008675 81               [ 4]  781 	ret
      008676                        782 00102$:
                                    783 ;	HAL_CLK.c: 483: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      008676 72 17 50 C5      [ 1]  784 	bres	20677, #3
                                    785 ;	HAL_CLK.c: 486: }
      00867A 81               [ 4]  786 	ret
                                    787 	.area CODE
                                    788 	.area CONST
      008088                        789 _HSIDivFactor:
      008088 01                     790 	.db #0x01	; 1
      008089 02                     791 	.db #0x02	; 2
      00808A 04                     792 	.db #0x04	; 4
      00808B 08                     793 	.db #0x08	; 8
      00808C                        794 _CLKPrescTable:
      00808C 01                     795 	.db #0x01	; 1
      00808D 02                     796 	.db #0x02	; 2
      00808E 04                     797 	.db #0x04	; 4
      00808F 08                     798 	.db #0x08	; 8
      008090 0A                     799 	.db #0x0a	; 10
      008091 10                     800 	.db #0x10	; 16
      008092 14                     801 	.db #0x14	; 20
      008093 28                     802 	.db #0x28	; 40
                                    803 	.area INITIALIZER
                                    804 	.area CABS (ABS)
