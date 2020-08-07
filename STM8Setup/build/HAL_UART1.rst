                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_UART1
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _UART1_DeInit
                                     12 	.globl _UART1_Init
                                     13 	.globl _UART1_Cmd
                                     14 	.globl _UART1_ITConfig
                                     15 	.globl _UART1_HalfDuplexCmd
                                     16 	.globl _UART1_IrDAConfig
                                     17 	.globl _UART1_IrDACmd
                                     18 	.globl _UART1_LINBreakDetectionConfig
                                     19 	.globl _UART1_LINCmd
                                     20 	.globl _UART1_SmartCardCmd
                                     21 	.globl _UART1_SmartCardNACKCmd
                                     22 	.globl _UART1_WakeUpConfig
                                     23 	.globl _UART1_ReceiverWakeUpCmd
                                     24 	.globl _UART1_ReceiveData8
                                     25 	.globl _UART1_ReceiveData9
                                     26 	.globl _UART1_SendData8
                                     27 	.globl _UART1_SendData9
                                     28 	.globl _UART1_SendBreak
                                     29 	.globl _UART1_SetAddress
                                     30 	.globl _UART1_SetGuardTime
                                     31 	.globl _UART1_SetPrescaler
                                     32 	.globl _UART1_GetFlagStatus
                                     33 	.globl _UART1_ClearFlag
                                     34 	.globl _UART1_GetITStatus
                                     35 	.globl _UART1_ClearITPendingBit
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
                                     73 ;	HAL_UART1.c: 9: void UART1_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function UART1_DeInit
                                     76 ;	-----------------------------------------
      00867B                         77 _UART1_DeInit:
                                     78 ;	HAL_UART1.c: 13: (void)UART1->SR;
      00867B C6 52 30         [ 1]   79 	ld	a, 0x5230
                                     80 ;	HAL_UART1.c: 14: (void)UART1->DR;
      00867E C6 52 31         [ 1]   81 	ld	a, 0x5231
                                     82 ;	HAL_UART1.c: 16: UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
      008681 35 00 52 33      [ 1]   83 	mov	0x5233+0, #0x00
                                     84 ;	HAL_UART1.c: 17: UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
      008685 35 00 52 32      [ 1]   85 	mov	0x5232+0, #0x00
                                     86 ;	HAL_UART1.c: 19: UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
      008689 35 00 52 34      [ 1]   87 	mov	0x5234+0, #0x00
                                     88 ;	HAL_UART1.c: 20: UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
      00868D 35 00 52 35      [ 1]   89 	mov	0x5235+0, #0x00
                                     90 ;	HAL_UART1.c: 21: UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
      008691 35 00 52 36      [ 1]   91 	mov	0x5236+0, #0x00
                                     92 ;	HAL_UART1.c: 22: UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
      008695 35 00 52 37      [ 1]   93 	mov	0x5237+0, #0x00
                                     94 ;	HAL_UART1.c: 23: UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
      008699 35 00 52 38      [ 1]   95 	mov	0x5238+0, #0x00
                                     96 ;	HAL_UART1.c: 25: UART1->GTR = UART1_GTR_RESET_VALUE;
      00869D 35 00 52 39      [ 1]   97 	mov	0x5239+0, #0x00
                                     98 ;	HAL_UART1.c: 26: UART1->PSCR = UART1_PSCR_RESET_VALUE;
      0086A1 35 00 52 3A      [ 1]   99 	mov	0x523a+0, #0x00
                                    100 ;	HAL_UART1.c: 27: }
      0086A5 81               [ 4]  101 	ret
                                    102 ;	HAL_UART1.c: 29: void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength,
                                    103 ;	-----------------------------------------
                                    104 ;	 function UART1_Init
                                    105 ;	-----------------------------------------
      0086A6                        106 _UART1_Init:
      0086A6 52 11            [ 2]  107 	sub	sp, #17
                                    108 ;	HAL_UART1.c: 36: UART1->CR1 &= (uint8_t)(~UART1_CR1_M);
      0086A8 72 19 52 34      [ 1]  109 	bres	21044, #4
                                    110 ;	HAL_UART1.c: 39: UART1->CR1 |= (uint8_t)WordLength;
      0086AC C6 52 34         [ 1]  111 	ld	a, 0x5234
      0086AF 1A 18            [ 1]  112 	or	a, (0x18, sp)
      0086B1 C7 52 34         [ 1]  113 	ld	0x5234, a
                                    114 ;	HAL_UART1.c: 42: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
      0086B4 C6 52 36         [ 1]  115 	ld	a, 0x5236
      0086B7 A4 CF            [ 1]  116 	and	a, #0xcf
      0086B9 C7 52 36         [ 1]  117 	ld	0x5236, a
                                    118 ;	HAL_UART1.c: 44: UART1->CR3 |= (uint8_t)StopBits;
      0086BC C6 52 36         [ 1]  119 	ld	a, 0x5236
      0086BF 1A 19            [ 1]  120 	or	a, (0x19, sp)
      0086C1 C7 52 36         [ 1]  121 	ld	0x5236, a
                                    122 ;	HAL_UART1.c: 47: UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS));
      0086C4 C6 52 34         [ 1]  123 	ld	a, 0x5234
      0086C7 A4 F9            [ 1]  124 	and	a, #0xf9
      0086C9 C7 52 34         [ 1]  125 	ld	0x5234, a
                                    126 ;	HAL_UART1.c: 49: UART1->CR1 |= (uint8_t)Parity;
      0086CC C6 52 34         [ 1]  127 	ld	a, 0x5234
      0086CF 1A 1A            [ 1]  128 	or	a, (0x1a, sp)
      0086D1 C7 52 34         [ 1]  129 	ld	0x5234, a
                                    130 ;	HAL_UART1.c: 52: UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);
      0086D4 C6 52 32         [ 1]  131 	ld	a, 0x5232
      0086D7 35 00 52 32      [ 1]  132 	mov	0x5232+0, #0x00
                                    133 ;	HAL_UART1.c: 54: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);
      0086DB C6 52 33         [ 1]  134 	ld	a, 0x5233
      0086DE A4 0F            [ 1]  135 	and	a, #0x0f
      0086E0 C7 52 33         [ 1]  136 	ld	0x5233, a
                                    137 ;	HAL_UART1.c: 56: UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);
      0086E3 C6 52 33         [ 1]  138 	ld	a, 0x5233
      0086E6 A4 F0            [ 1]  139 	and	a, #0xf0
      0086E8 C7 52 33         [ 1]  140 	ld	0x5233, a
                                    141 ;	HAL_UART1.c: 59: BaudRate_Mantissa = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
      0086EB CD 85 A1         [ 4]  142 	call	_CLK_GetClockFreq
      0086EE 1F 10            [ 2]  143 	ldw	(0x10, sp), x
      0086F0 90 5F            [ 1]  144 	clrw	y
      0086F2 0D 10            [ 1]  145 	tnz	(0x10, sp)
      0086F4 2A 02            [ 1]  146 	jrpl	00127$
      0086F6 90 5A            [ 2]  147 	decw	y
      0086F8                        148 00127$:
      0086F8 1E 14            [ 2]  149 	ldw	x, (0x14, sp)
      0086FA 1F 0A            [ 2]  150 	ldw	(0x0a, sp), x
      0086FC 1E 16            [ 2]  151 	ldw	x, (0x16, sp)
      0086FE A6 04            [ 1]  152 	ld	a, #0x04
      008700                        153 00128$:
      008700 58               [ 2]  154 	sllw	x
      008701 09 0B            [ 1]  155 	rlc	(0x0b, sp)
      008703 09 0A            [ 1]  156 	rlc	(0x0a, sp)
      008705 4A               [ 1]  157 	dec	a
      008706 26 F8            [ 1]  158 	jrne	00128$
      008708 1F 0C            [ 2]  159 	ldw	(0x0c, sp), x
      00870A 89               [ 2]  160 	pushw	x
      00870B 1E 0C            [ 2]  161 	ldw	x, (0x0c, sp)
      00870D 89               [ 2]  162 	pushw	x
      00870E 1E 14            [ 2]  163 	ldw	x, (0x14, sp)
      008710 89               [ 2]  164 	pushw	x
      008711 90 89            [ 2]  165 	pushw	y
      008713 CD 9A 2E         [ 4]  166 	call	__divulong
      008716 5B 08            [ 2]  167 	addw	sp, #8
      008718 1F 03            [ 2]  168 	ldw	(0x03, sp), x
      00871A 17 01            [ 2]  169 	ldw	(0x01, sp), y
                                    170 ;	HAL_UART1.c: 60: BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
      00871C CD 85 A1         [ 4]  171 	call	_CLK_GetClockFreq
      00871F 90 5F            [ 1]  172 	clrw	y
      008721 5D               [ 2]  173 	tnzw	x
      008722 2A 02            [ 1]  174 	jrpl	00130$
      008724 90 5A            [ 2]  175 	decw	y
      008726                        176 00130$:
      008726 89               [ 2]  177 	pushw	x
      008727 90 89            [ 2]  178 	pushw	y
      008729 4B 64            [ 1]  179 	push	#0x64
      00872B 5F               [ 1]  180 	clrw	x
      00872C 89               [ 2]  181 	pushw	x
      00872D 4B 00            [ 1]  182 	push	#0x00
      00872F CD 9A 88         [ 4]  183 	call	__mullong
      008732 5B 08            [ 2]  184 	addw	sp, #8
      008734 1F 10            [ 2]  185 	ldw	(0x10, sp), x
      008736 1E 0C            [ 2]  186 	ldw	x, (0x0c, sp)
      008738 89               [ 2]  187 	pushw	x
      008739 1E 0C            [ 2]  188 	ldw	x, (0x0c, sp)
      00873B 89               [ 2]  189 	pushw	x
      00873C 1E 14            [ 2]  190 	ldw	x, (0x14, sp)
      00873E 89               [ 2]  191 	pushw	x
      00873F 90 89            [ 2]  192 	pushw	y
      008741 CD 9A 2E         [ 4]  193 	call	__divulong
      008744 5B 08            [ 2]  194 	addw	sp, #8
      008746 1F 07            [ 2]  195 	ldw	(0x07, sp), x
      008748 17 05            [ 2]  196 	ldw	(0x05, sp), y
                                    197 ;	HAL_UART1.c: 62: UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F);
      00874A C6 52 33         [ 1]  198 	ld	a, 0x5233
      00874D 6B 09            [ 1]  199 	ld	(0x09, sp), a
      00874F 1E 03            [ 2]  200 	ldw	x, (0x03, sp)
      008751 89               [ 2]  201 	pushw	x
      008752 1E 03            [ 2]  202 	ldw	x, (0x03, sp)
      008754 89               [ 2]  203 	pushw	x
      008755 4B 64            [ 1]  204 	push	#0x64
      008757 5F               [ 1]  205 	clrw	x
      008758 89               [ 2]  206 	pushw	x
      008759 4B 00            [ 1]  207 	push	#0x00
      00875B CD 9A 88         [ 4]  208 	call	__mullong
      00875E 5B 08            [ 2]  209 	addw	sp, #8
      008760 1F 0C            [ 2]  210 	ldw	(0x0c, sp), x
      008762 17 0A            [ 2]  211 	ldw	(0x0a, sp), y
      008764 1E 07            [ 2]  212 	ldw	x, (0x07, sp)
      008766 72 F0 0C         [ 2]  213 	subw	x, (0x0c, sp)
      008769 1F 10            [ 2]  214 	ldw	(0x10, sp), x
      00876B 7B 06            [ 1]  215 	ld	a, (0x06, sp)
      00876D 12 0B            [ 1]  216 	sbc	a, (0x0b, sp)
      00876F 6B 0F            [ 1]  217 	ld	(0x0f, sp), a
      008771 7B 05            [ 1]  218 	ld	a, (0x05, sp)
      008773 12 0A            [ 1]  219 	sbc	a, (0x0a, sp)
      008775 6B 0E            [ 1]  220 	ld	(0x0e, sp), a
      008777 1E 10            [ 2]  221 	ldw	x, (0x10, sp)
      008779 16 0E            [ 2]  222 	ldw	y, (0x0e, sp)
      00877B A6 04            [ 1]  223 	ld	a, #0x04
      00877D                        224 00131$:
      00877D 58               [ 2]  225 	sllw	x
      00877E 90 59            [ 2]  226 	rlcw	y
      008780 4A               [ 1]  227 	dec	a
      008781 26 FA            [ 1]  228 	jrne	00131$
      008783 4B 64            [ 1]  229 	push	#0x64
      008785 4B 00            [ 1]  230 	push	#0x00
      008787 4B 00            [ 1]  231 	push	#0x00
      008789 4B 00            [ 1]  232 	push	#0x00
      00878B 89               [ 2]  233 	pushw	x
      00878C 90 89            [ 2]  234 	pushw	y
      00878E CD 9A 2E         [ 4]  235 	call	__divulong
      008791 5B 08            [ 2]  236 	addw	sp, #8
      008793 9F               [ 1]  237 	ld	a, xl
      008794 A4 0F            [ 1]  238 	and	a, #0x0f
      008796 1A 09            [ 1]  239 	or	a, (0x09, sp)
      008798 C7 52 33         [ 1]  240 	ld	0x5233, a
                                    241 ;	HAL_UART1.c: 64: UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
      00879B C6 52 33         [ 1]  242 	ld	a, 0x5233
      00879E 6B 11            [ 1]  243 	ld	(0x11, sp), a
      0087A0 1E 03            [ 2]  244 	ldw	x, (0x03, sp)
      0087A2 A6 10            [ 1]  245 	ld	a, #0x10
      0087A4 62               [ 2]  246 	div	x, a
      0087A5 9F               [ 1]  247 	ld	a, xl
      0087A6 A4 F0            [ 1]  248 	and	a, #0xf0
      0087A8 1A 11            [ 1]  249 	or	a, (0x11, sp)
      0087AA C7 52 33         [ 1]  250 	ld	0x5233, a
                                    251 ;	HAL_UART1.c: 66: UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;
      0087AD C6 52 32         [ 1]  252 	ld	a, 0x5232
      0087B0 6B 11            [ 1]  253 	ld	(0x11, sp), a
      0087B2 7B 04            [ 1]  254 	ld	a, (0x04, sp)
      0087B4 1A 11            [ 1]  255 	or	a, (0x11, sp)
      0087B6 C7 52 32         [ 1]  256 	ld	0x5232, a
                                    257 ;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
      0087B9 C6 52 35         [ 1]  258 	ld	a, 0x5235
      0087BC A4 F3            [ 1]  259 	and	a, #0xf3
      0087BE C7 52 35         [ 1]  260 	ld	0x5235, a
                                    261 ;	HAL_UART1.c: 71: UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
      0087C1 C6 52 36         [ 1]  262 	ld	a, 0x5236
      0087C4 A4 F8            [ 1]  263 	and	a, #0xf8
      0087C6 C7 52 36         [ 1]  264 	ld	0x5236, a
                                    265 ;	HAL_UART1.c: 73: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL |
      0087C9 C6 52 36         [ 1]  266 	ld	a, 0x5236
      0087CC 6B 11            [ 1]  267 	ld	(0x11, sp), a
      0087CE 7B 1B            [ 1]  268 	ld	a, (0x1b, sp)
      0087D0 A4 07            [ 1]  269 	and	a, #0x07
      0087D2 1A 11            [ 1]  270 	or	a, (0x11, sp)
      0087D4 C7 52 36         [ 1]  271 	ld	0x5236, a
                                    272 ;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
      0087D7 C6 52 35         [ 1]  273 	ld	a, 0x5235
                                    274 ;	HAL_UART1.c: 76: if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
      0087DA 88               [ 1]  275 	push	a
      0087DB 7B 1D            [ 1]  276 	ld	a, (0x1d, sp)
      0087DD A5 04            [ 1]  277 	bcp	a, #0x04
      0087DF 84               [ 1]  278 	pop	a
      0087E0 27 07            [ 1]  279 	jreq	00102$
                                    280 ;	HAL_UART1.c: 79: UART1->CR2 |= (uint8_t)UART1_CR2_TEN;
      0087E2 AA 08            [ 1]  281 	or	a, #0x08
      0087E4 C7 52 35         [ 1]  282 	ld	0x5235, a
      0087E7 20 05            [ 2]  283 	jra	00103$
      0087E9                        284 00102$:
                                    285 ;	HAL_UART1.c: 84: UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);
      0087E9 A4 F7            [ 1]  286 	and	a, #0xf7
      0087EB C7 52 35         [ 1]  287 	ld	0x5235, a
      0087EE                        288 00103$:
                                    289 ;	HAL_UART1.c: 69: UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN);
      0087EE C6 52 35         [ 1]  290 	ld	a, 0x5235
                                    291 ;	HAL_UART1.c: 86: if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
      0087F1 88               [ 1]  292 	push	a
      0087F2 7B 1D            [ 1]  293 	ld	a, (0x1d, sp)
      0087F4 A5 08            [ 1]  294 	bcp	a, #0x08
      0087F6 84               [ 1]  295 	pop	a
      0087F7 27 07            [ 1]  296 	jreq	00105$
                                    297 ;	HAL_UART1.c: 89: UART1->CR2 |= (uint8_t)UART1_CR2_REN;
      0087F9 AA 04            [ 1]  298 	or	a, #0x04
      0087FB C7 52 35         [ 1]  299 	ld	0x5235, a
      0087FE 20 05            [ 2]  300 	jra	00106$
      008800                        301 00105$:
                                    302 ;	HAL_UART1.c: 94: UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);
      008800 A4 FB            [ 1]  303 	and	a, #0xfb
      008802 C7 52 35         [ 1]  304 	ld	0x5235, a
      008805                        305 00106$:
                                    306 ;	HAL_UART1.c: 42: UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);
      008805 C6 52 36         [ 1]  307 	ld	a, 0x5236
                                    308 ;	HAL_UART1.c: 98: if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
      008808 0D 1B            [ 1]  309 	tnz	(0x1b, sp)
      00880A 2A 07            [ 1]  310 	jrpl	00108$
                                    311 ;	HAL_UART1.c: 101: UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN);
      00880C A4 F7            [ 1]  312 	and	a, #0xf7
      00880E C7 52 36         [ 1]  313 	ld	0x5236, a
      008811 20 0D            [ 2]  314 	jra	00110$
      008813                        315 00108$:
                                    316 ;	HAL_UART1.c: 105: UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
      008813 88               [ 1]  317 	push	a
      008814 7B 1C            [ 1]  318 	ld	a, (0x1c, sp)
      008816 A4 08            [ 1]  319 	and	a, #0x08
      008818 6B 12            [ 1]  320 	ld	(0x12, sp), a
      00881A 84               [ 1]  321 	pop	a
      00881B 1A 11            [ 1]  322 	or	a, (0x11, sp)
      00881D C7 52 36         [ 1]  323 	ld	0x5236, a
      008820                        324 00110$:
                                    325 ;	HAL_UART1.c: 107: }
      008820 5B 11            [ 2]  326 	addw	sp, #17
      008822 81               [ 4]  327 	ret
                                    328 ;	HAL_UART1.c: 115: void UART1_Cmd(uint8_t NewState)
                                    329 ;	-----------------------------------------
                                    330 ;	 function UART1_Cmd
                                    331 ;	-----------------------------------------
      008823                        332 _UART1_Cmd:
                                    333 ;	HAL_UART1.c: 120: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
      008823 C6 52 34         [ 1]  334 	ld	a, 0x5234
                                    335 ;	HAL_UART1.c: 117: if (NewState != 0)
      008826 0D 03            [ 1]  336 	tnz	(0x03, sp)
      008828 27 06            [ 1]  337 	jreq	00102$
                                    338 ;	HAL_UART1.c: 120: UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD);
      00882A A4 DF            [ 1]  339 	and	a, #0xdf
      00882C C7 52 34         [ 1]  340 	ld	0x5234, a
      00882F 81               [ 4]  341 	ret
      008830                        342 00102$:
                                    343 ;	HAL_UART1.c: 125: UART1->CR1 |= UART1_CR1_UARTD;
      008830 AA 20            [ 1]  344 	or	a, #0x20
      008832 C7 52 34         [ 1]  345 	ld	0x5234, a
                                    346 ;	HAL_UART1.c: 127: }
      008835 81               [ 4]  347 	ret
                                    348 ;	HAL_UART1.c: 143: void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, uint8_t NewState)
                                    349 ;	-----------------------------------------
                                    350 ;	 function UART1_ITConfig
                                    351 ;	-----------------------------------------
      008836                        352 _UART1_ITConfig:
      008836 52 02            [ 2]  353 	sub	sp, #2
                                    354 ;	HAL_UART1.c: 148: uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
      008838 1E 05            [ 2]  355 	ldw	x, (0x05, sp)
                                    356 ;	HAL_UART1.c: 150: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      00883A 7B 06            [ 1]  357 	ld	a, (0x06, sp)
      00883C A4 0F            [ 1]  358 	and	a, #0x0f
      00883E 88               [ 1]  359 	push	a
      00883F A6 01            [ 1]  360 	ld	a, #0x01
      008841 6B 03            [ 1]  361 	ld	(0x03, sp), a
      008843 84               [ 1]  362 	pop	a
      008844 4D               [ 1]  363 	tnz	a
      008845 27 05            [ 1]  364 	jreq	00144$
      008847                        365 00143$:
      008847 08 02            [ 1]  366 	sll	(0x02, sp)
      008849 4A               [ 1]  367 	dec	a
      00884A 26 FB            [ 1]  368 	jrne	00143$
      00884C                        369 00144$:
                                    370 ;	HAL_UART1.c: 155: if (uartreg == 0x01)
      00884C 9E               [ 1]  371 	ld	a, xh
      00884D 4A               [ 1]  372 	dec	a
      00884E 26 05            [ 1]  373 	jrne	00146$
      008850 A6 01            [ 1]  374 	ld	a, #0x01
      008852 6B 01            [ 1]  375 	ld	(0x01, sp), a
      008854 C5                     376 	.byte 0xc5
      008855                        377 00146$:
      008855 0F 01            [ 1]  378 	clr	(0x01, sp)
      008857                        379 00147$:
                                    380 ;	HAL_UART1.c: 159: else if (uartreg == 0x02)
      008857 9E               [ 1]  381 	ld	a, xh
      008858 A0 02            [ 1]  382 	sub	a, #0x02
      00885A 26 02            [ 1]  383 	jrne	00149$
      00885C 4C               [ 1]  384 	inc	a
      00885D 21                     385 	.byte 0x21
      00885E                        386 00149$:
      00885E 4F               [ 1]  387 	clr	a
      00885F                        388 00150$:
                                    389 ;	HAL_UART1.c: 152: if (NewState != 0)
      00885F 0D 07            [ 1]  390 	tnz	(0x07, sp)
      008861 27 25            [ 1]  391 	jreq	00114$
                                    392 ;	HAL_UART1.c: 155: if (uartreg == 0x01)
      008863 0D 01            [ 1]  393 	tnz	(0x01, sp)
      008865 27 0A            [ 1]  394 	jreq	00105$
                                    395 ;	HAL_UART1.c: 157: UART1->CR1 |= itpos;
      008867 C6 52 34         [ 1]  396 	ld	a, 0x5234
      00886A 1A 02            [ 1]  397 	or	a, (0x02, sp)
      00886C C7 52 34         [ 1]  398 	ld	0x5234, a
      00886F 20 3C            [ 2]  399 	jra	00116$
      008871                        400 00105$:
                                    401 ;	HAL_UART1.c: 159: else if (uartreg == 0x02)
      008871 4D               [ 1]  402 	tnz	a
      008872 27 0A            [ 1]  403 	jreq	00102$
                                    404 ;	HAL_UART1.c: 161: UART1->CR2 |= itpos;
      008874 C6 52 35         [ 1]  405 	ld	a, 0x5235
      008877 1A 02            [ 1]  406 	or	a, (0x02, sp)
      008879 C7 52 35         [ 1]  407 	ld	0x5235, a
      00887C 20 2F            [ 2]  408 	jra	00116$
      00887E                        409 00102$:
                                    410 ;	HAL_UART1.c: 165: UART1->CR4 |= itpos;
      00887E C6 52 37         [ 1]  411 	ld	a, 0x5237
      008881 1A 02            [ 1]  412 	or	a, (0x02, sp)
      008883 C7 52 37         [ 1]  413 	ld	0x5237, a
      008886 20 25            [ 2]  414 	jra	00116$
      008888                        415 00114$:
                                    416 ;	HAL_UART1.c: 173: UART1->CR1 &= (uint8_t)(~itpos);
      008888 03 02            [ 1]  417 	cpl	(0x02, sp)
                                    418 ;	HAL_UART1.c: 171: if (uartreg == 0x01)
      00888A 0D 01            [ 1]  419 	tnz	(0x01, sp)
      00888C 27 0A            [ 1]  420 	jreq	00111$
                                    421 ;	HAL_UART1.c: 173: UART1->CR1 &= (uint8_t)(~itpos);
      00888E C6 52 34         [ 1]  422 	ld	a, 0x5234
      008891 14 02            [ 1]  423 	and	a, (0x02, sp)
      008893 C7 52 34         [ 1]  424 	ld	0x5234, a
      008896 20 15            [ 2]  425 	jra	00116$
      008898                        426 00111$:
                                    427 ;	HAL_UART1.c: 175: else if (uartreg == 0x02)
      008898 4D               [ 1]  428 	tnz	a
      008899 27 0A            [ 1]  429 	jreq	00108$
                                    430 ;	HAL_UART1.c: 177: UART1->CR2 &= (uint8_t)(~itpos);
      00889B C6 52 35         [ 1]  431 	ld	a, 0x5235
      00889E 14 02            [ 1]  432 	and	a, (0x02, sp)
      0088A0 C7 52 35         [ 1]  433 	ld	0x5235, a
      0088A3 20 08            [ 2]  434 	jra	00116$
      0088A5                        435 00108$:
                                    436 ;	HAL_UART1.c: 181: UART1->CR4 &= (uint8_t)(~itpos);
      0088A5 C6 52 37         [ 1]  437 	ld	a, 0x5237
      0088A8 14 02            [ 1]  438 	and	a, (0x02, sp)
      0088AA C7 52 37         [ 1]  439 	ld	0x5237, a
      0088AD                        440 00116$:
                                    441 ;	HAL_UART1.c: 185: }
      0088AD 5B 02            [ 2]  442 	addw	sp, #2
      0088AF 81               [ 4]  443 	ret
                                    444 ;	HAL_UART1.c: 192: void UART1_HalfDuplexCmd(uint8_t NewState)
                                    445 ;	-----------------------------------------
                                    446 ;	 function UART1_HalfDuplexCmd
                                    447 ;	-----------------------------------------
      0088B0                        448 _UART1_HalfDuplexCmd:
                                    449 ;	HAL_UART1.c: 197: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      0088B0 C6 52 38         [ 1]  450 	ld	a, 0x5238
                                    451 ;	HAL_UART1.c: 195: if (NewState != 0)
      0088B3 0D 03            [ 1]  452 	tnz	(0x03, sp)
      0088B5 27 06            [ 1]  453 	jreq	00102$
                                    454 ;	HAL_UART1.c: 197: UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
      0088B7 AA 08            [ 1]  455 	or	a, #0x08
      0088B9 C7 52 38         [ 1]  456 	ld	0x5238, a
      0088BC 81               [ 4]  457 	ret
      0088BD                        458 00102$:
                                    459 ;	HAL_UART1.c: 201: UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
      0088BD A4 F7            [ 1]  460 	and	a, #0xf7
      0088BF C7 52 38         [ 1]  461 	ld	0x5238, a
                                    462 ;	HAL_UART1.c: 203: }
      0088C2 81               [ 4]  463 	ret
                                    464 ;	HAL_UART1.c: 211: void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
                                    465 ;	-----------------------------------------
                                    466 ;	 function UART1_IrDAConfig
                                    467 ;	-----------------------------------------
      0088C3                        468 _UART1_IrDAConfig:
                                    469 ;	HAL_UART1.c: 216: UART1->CR5 |= UART1_CR5_IRLP;
      0088C3 C6 52 38         [ 1]  470 	ld	a, 0x5238
                                    471 ;	HAL_UART1.c: 214: if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
      0088C6 0D 03            [ 1]  472 	tnz	(0x03, sp)
      0088C8 27 06            [ 1]  473 	jreq	00102$
                                    474 ;	HAL_UART1.c: 216: UART1->CR5 |= UART1_CR5_IRLP;
      0088CA AA 04            [ 1]  475 	or	a, #0x04
      0088CC C7 52 38         [ 1]  476 	ld	0x5238, a
      0088CF 81               [ 4]  477 	ret
      0088D0                        478 00102$:
                                    479 ;	HAL_UART1.c: 220: UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
      0088D0 A4 FB            [ 1]  480 	and	a, #0xfb
      0088D2 C7 52 38         [ 1]  481 	ld	0x5238, a
                                    482 ;	HAL_UART1.c: 222: }
      0088D5 81               [ 4]  483 	ret
                                    484 ;	HAL_UART1.c: 230: void UART1_IrDACmd(uint8_t NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function UART1_IrDACmd
                                    487 ;	-----------------------------------------
      0088D6                        488 _UART1_IrDACmd:
                                    489 ;	HAL_UART1.c: 237: UART1->CR5 |= UART1_CR5_IREN;
      0088D6 C6 52 38         [ 1]  490 	ld	a, 0x5238
                                    491 ;	HAL_UART1.c: 234: if (NewState != 0)
      0088D9 0D 03            [ 1]  492 	tnz	(0x03, sp)
      0088DB 27 06            [ 1]  493 	jreq	00102$
                                    494 ;	HAL_UART1.c: 237: UART1->CR5 |= UART1_CR5_IREN;
      0088DD AA 02            [ 1]  495 	or	a, #0x02
      0088DF C7 52 38         [ 1]  496 	ld	0x5238, a
      0088E2 81               [ 4]  497 	ret
      0088E3                        498 00102$:
                                    499 ;	HAL_UART1.c: 242: UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
      0088E3 A4 FD            [ 1]  500 	and	a, #0xfd
      0088E5 C7 52 38         [ 1]  501 	ld	0x5238, a
                                    502 ;	HAL_UART1.c: 244: }
      0088E8 81               [ 4]  503 	ret
                                    504 ;	HAL_UART1.c: 253: void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
                                    505 ;	-----------------------------------------
                                    506 ;	 function UART1_LINBreakDetectionConfig
                                    507 ;	-----------------------------------------
      0088E9                        508 _UART1_LINBreakDetectionConfig:
                                    509 ;	HAL_UART1.c: 258: UART1->CR4 |= UART1_CR4_LBDL;
      0088E9 C6 52 37         [ 1]  510 	ld	a, 0x5237
                                    511 ;	HAL_UART1.c: 256: if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
      0088EC 0D 03            [ 1]  512 	tnz	(0x03, sp)
      0088EE 27 06            [ 1]  513 	jreq	00102$
                                    514 ;	HAL_UART1.c: 258: UART1->CR4 |= UART1_CR4_LBDL;
      0088F0 AA 20            [ 1]  515 	or	a, #0x20
      0088F2 C7 52 37         [ 1]  516 	ld	0x5237, a
      0088F5 81               [ 4]  517 	ret
      0088F6                        518 00102$:
                                    519 ;	HAL_UART1.c: 262: UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
      0088F6 A4 DF            [ 1]  520 	and	a, #0xdf
      0088F8 C7 52 37         [ 1]  521 	ld	0x5237, a
                                    522 ;	HAL_UART1.c: 264: }
      0088FB 81               [ 4]  523 	ret
                                    524 ;	HAL_UART1.c: 272: void UART1_LINCmd(uint8_t NewState)
                                    525 ;	-----------------------------------------
                                    526 ;	 function UART1_LINCmd
                                    527 ;	-----------------------------------------
      0088FC                        528 _UART1_LINCmd:
                                    529 ;	HAL_UART1.c: 278: UART1->CR3 |= UART1_CR3_LINEN;
      0088FC C6 52 36         [ 1]  530 	ld	a, 0x5236
                                    531 ;	HAL_UART1.c: 275: if (NewState != 0)
      0088FF 0D 03            [ 1]  532 	tnz	(0x03, sp)
      008901 27 06            [ 1]  533 	jreq	00102$
                                    534 ;	HAL_UART1.c: 278: UART1->CR3 |= UART1_CR3_LINEN;
      008903 AA 40            [ 1]  535 	or	a, #0x40
      008905 C7 52 36         [ 1]  536 	ld	0x5236, a
      008908 81               [ 4]  537 	ret
      008909                        538 00102$:
                                    539 ;	HAL_UART1.c: 283: UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
      008909 A4 BF            [ 1]  540 	and	a, #0xbf
      00890B C7 52 36         [ 1]  541 	ld	0x5236, a
                                    542 ;	HAL_UART1.c: 285: }
      00890E 81               [ 4]  543 	ret
                                    544 ;	HAL_UART1.c: 292: void UART1_SmartCardCmd(uint8_t NewState)
                                    545 ;	-----------------------------------------
                                    546 ;	 function UART1_SmartCardCmd
                                    547 ;	-----------------------------------------
      00890F                        548 _UART1_SmartCardCmd:
                                    549 ;	HAL_UART1.c: 298: UART1->CR5 |= UART1_CR5_SCEN;
      00890F C6 52 38         [ 1]  550 	ld	a, 0x5238
                                    551 ;	HAL_UART1.c: 295: if (NewState != 0)
      008912 0D 03            [ 1]  552 	tnz	(0x03, sp)
      008914 27 06            [ 1]  553 	jreq	00102$
                                    554 ;	HAL_UART1.c: 298: UART1->CR5 |= UART1_CR5_SCEN;
      008916 AA 20            [ 1]  555 	or	a, #0x20
      008918 C7 52 38         [ 1]  556 	ld	0x5238, a
      00891B 81               [ 4]  557 	ret
      00891C                        558 00102$:
                                    559 ;	HAL_UART1.c: 303: UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
      00891C A4 DF            [ 1]  560 	and	a, #0xdf
      00891E C7 52 38         [ 1]  561 	ld	0x5238, a
                                    562 ;	HAL_UART1.c: 305: }
      008921 81               [ 4]  563 	ret
                                    564 ;	HAL_UART1.c: 314: void UART1_SmartCardNACKCmd(uint8_t NewState)
                                    565 ;	-----------------------------------------
                                    566 ;	 function UART1_SmartCardNACKCmd
                                    567 ;	-----------------------------------------
      008922                        568 _UART1_SmartCardNACKCmd:
                                    569 ;	HAL_UART1.c: 320: UART1->CR5 |= UART1_CR5_NACK;
      008922 C6 52 38         [ 1]  570 	ld	a, 0x5238
                                    571 ;	HAL_UART1.c: 317: if (NewState != 0)
      008925 0D 03            [ 1]  572 	tnz	(0x03, sp)
      008927 27 06            [ 1]  573 	jreq	00102$
                                    574 ;	HAL_UART1.c: 320: UART1->CR5 |= UART1_CR5_NACK;
      008929 AA 10            [ 1]  575 	or	a, #0x10
      00892B C7 52 38         [ 1]  576 	ld	0x5238, a
      00892E 81               [ 4]  577 	ret
      00892F                        578 00102$:
                                    579 ;	HAL_UART1.c: 325: UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
      00892F A4 EF            [ 1]  580 	and	a, #0xef
      008931 C7 52 38         [ 1]  581 	ld	0x5238, a
                                    582 ;	HAL_UART1.c: 327: }
      008934 81               [ 4]  583 	ret
                                    584 ;	HAL_UART1.c: 335: void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
                                    585 ;	-----------------------------------------
                                    586 ;	 function UART1_WakeUpConfig
                                    587 ;	-----------------------------------------
      008935                        588 _UART1_WakeUpConfig:
                                    589 ;	HAL_UART1.c: 338: UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
      008935 72 17 52 34      [ 1]  590 	bres	21044, #3
                                    591 ;	HAL_UART1.c: 339: UART1->CR1 |= (uint8_t)UART1_WakeUp;
      008939 C6 52 34         [ 1]  592 	ld	a, 0x5234
      00893C 1A 03            [ 1]  593 	or	a, (0x03, sp)
      00893E C7 52 34         [ 1]  594 	ld	0x5234, a
                                    595 ;	HAL_UART1.c: 340: }
      008941 81               [ 4]  596 	ret
                                    597 ;	HAL_UART1.c: 347: void UART1_ReceiverWakeUpCmd(uint8_t NewState)
                                    598 ;	-----------------------------------------
                                    599 ;	 function UART1_ReceiverWakeUpCmd
                                    600 ;	-----------------------------------------
      008942                        601 _UART1_ReceiverWakeUpCmd:
                                    602 ;	HAL_UART1.c: 353: UART1->CR2 |= UART1_CR2_RWU;
      008942 C6 52 35         [ 1]  603 	ld	a, 0x5235
                                    604 ;	HAL_UART1.c: 350: if (NewState != 0)
      008945 0D 03            [ 1]  605 	tnz	(0x03, sp)
      008947 27 06            [ 1]  606 	jreq	00102$
                                    607 ;	HAL_UART1.c: 353: UART1->CR2 |= UART1_CR2_RWU;
      008949 AA 02            [ 1]  608 	or	a, #0x02
      00894B C7 52 35         [ 1]  609 	ld	0x5235, a
      00894E 81               [ 4]  610 	ret
      00894F                        611 00102$:
                                    612 ;	HAL_UART1.c: 358: UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
      00894F A4 FD            [ 1]  613 	and	a, #0xfd
      008951 C7 52 35         [ 1]  614 	ld	0x5235, a
                                    615 ;	HAL_UART1.c: 360: }
      008954 81               [ 4]  616 	ret
                                    617 ;	HAL_UART1.c: 367: uint8_t UART1_ReceiveData8(void)
                                    618 ;	-----------------------------------------
                                    619 ;	 function UART1_ReceiveData8
                                    620 ;	-----------------------------------------
      008955                        621 _UART1_ReceiveData8:
                                    622 ;	HAL_UART1.c: 369: return ((uint8_t)UART1->DR);
      008955 C6 52 31         [ 1]  623 	ld	a, 0x5231
                                    624 ;	HAL_UART1.c: 370: }
      008958 81               [ 4]  625 	ret
                                    626 ;	HAL_UART1.c: 377: uint16_t UART1_ReceiveData9(void)
                                    627 ;	-----------------------------------------
                                    628 ;	 function UART1_ReceiveData9
                                    629 ;	-----------------------------------------
      008959                        630 _UART1_ReceiveData9:
      008959 52 02            [ 2]  631 	sub	sp, #2
                                    632 ;	HAL_UART1.c: 381: temp = (uint16_t)(((uint16_t)((uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
      00895B C6 52 34         [ 1]  633 	ld	a, 0x5234
      00895E A4 80            [ 1]  634 	and	a, #0x80
      008960 97               [ 1]  635 	ld	xl, a
      008961 4F               [ 1]  636 	clr	a
      008962 95               [ 1]  637 	ld	xh, a
      008963 58               [ 2]  638 	sllw	x
      008964 1F 01            [ 2]  639 	ldw	(0x01, sp), x
                                    640 ;	HAL_UART1.c: 382: return (uint16_t)((((uint16_t)UART1->DR) | temp) & ((uint16_t)0x01FF));
      008966 C6 52 31         [ 1]  641 	ld	a, 0x5231
      008969 5F               [ 1]  642 	clrw	x
      00896A 1A 02            [ 1]  643 	or	a, (0x02, sp)
      00896C 02               [ 1]  644 	rlwa	x
      00896D 1A 01            [ 1]  645 	or	a, (0x01, sp)
      00896F A4 01            [ 1]  646 	and	a, #0x01
      008971 95               [ 1]  647 	ld	xh, a
                                    648 ;	HAL_UART1.c: 383: }
      008972 5B 02            [ 2]  649 	addw	sp, #2
      008974 81               [ 4]  650 	ret
                                    651 ;	HAL_UART1.c: 390: void UART1_SendData8(uint8_t Data)
                                    652 ;	-----------------------------------------
                                    653 ;	 function UART1_SendData8
                                    654 ;	-----------------------------------------
      008975                        655 _UART1_SendData8:
                                    656 ;	HAL_UART1.c: 393: UART1->DR = Data;
      008975 AE 52 31         [ 2]  657 	ldw	x, #0x5231
      008978 7B 03            [ 1]  658 	ld	a, (0x03, sp)
      00897A F7               [ 1]  659 	ld	(x), a
                                    660 ;	HAL_UART1.c: 394: }
      00897B 81               [ 4]  661 	ret
                                    662 ;	HAL_UART1.c: 402: void UART1_SendData9(uint16_t Data)
                                    663 ;	-----------------------------------------
                                    664 ;	 function UART1_SendData9
                                    665 ;	-----------------------------------------
      00897C                        666 _UART1_SendData9:
      00897C 88               [ 1]  667 	push	a
                                    668 ;	HAL_UART1.c: 405: UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
      00897D 72 1D 52 34      [ 1]  669 	bres	21044, #6
                                    670 ;	HAL_UART1.c: 407: UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
      008981 C6 52 34         [ 1]  671 	ld	a, 0x5234
      008984 6B 01            [ 1]  672 	ld	(0x01, sp), a
      008986 1E 04            [ 2]  673 	ldw	x, (0x04, sp)
      008988 54               [ 2]  674 	srlw	x
      008989 54               [ 2]  675 	srlw	x
      00898A 9F               [ 1]  676 	ld	a, xl
      00898B A4 40            [ 1]  677 	and	a, #0x40
      00898D 1A 01            [ 1]  678 	or	a, (0x01, sp)
      00898F C7 52 34         [ 1]  679 	ld	0x5234, a
                                    680 ;	HAL_UART1.c: 409: UART1->DR = (uint8_t)(Data);
      008992 7B 05            [ 1]  681 	ld	a, (0x05, sp)
      008994 C7 52 31         [ 1]  682 	ld	0x5231, a
                                    683 ;	HAL_UART1.c: 410: }
      008997 84               [ 1]  684 	pop	a
      008998 81               [ 4]  685 	ret
                                    686 ;	HAL_UART1.c: 417: void UART1_SendBreak(void)
                                    687 ;	-----------------------------------------
                                    688 ;	 function UART1_SendBreak
                                    689 ;	-----------------------------------------
      008999                        690 _UART1_SendBreak:
                                    691 ;	HAL_UART1.c: 419: UART1->CR2 |= UART1_CR2_SBK;
      008999 72 10 52 35      [ 1]  692 	bset	21045, #0
                                    693 ;	HAL_UART1.c: 420: }
      00899D 81               [ 4]  694 	ret
                                    695 ;	HAL_UART1.c: 427: void UART1_SetAddress(uint8_t UART1_Address)
                                    696 ;	-----------------------------------------
                                    697 ;	 function UART1_SetAddress
                                    698 ;	-----------------------------------------
      00899E                        699 _UART1_SetAddress:
                                    700 ;	HAL_UART1.c: 431: UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
      00899E C6 52 37         [ 1]  701 	ld	a, 0x5237
      0089A1 A4 F0            [ 1]  702 	and	a, #0xf0
      0089A3 C7 52 37         [ 1]  703 	ld	0x5237, a
                                    704 ;	HAL_UART1.c: 433: UART1->CR4 |= UART1_Address;
      0089A6 C6 52 37         [ 1]  705 	ld	a, 0x5237
      0089A9 1A 03            [ 1]  706 	or	a, (0x03, sp)
      0089AB C7 52 37         [ 1]  707 	ld	0x5237, a
                                    708 ;	HAL_UART1.c: 434: }
      0089AE 81               [ 4]  709 	ret
                                    710 ;	HAL_UART1.c: 442: void UART1_SetGuardTime(uint8_t UART1_GuardTime)
                                    711 ;	-----------------------------------------
                                    712 ;	 function UART1_SetGuardTime
                                    713 ;	-----------------------------------------
      0089AF                        714 _UART1_SetGuardTime:
                                    715 ;	HAL_UART1.c: 445: UART1->GTR = UART1_GuardTime;
      0089AF AE 52 39         [ 2]  716 	ldw	x, #0x5239
      0089B2 7B 03            [ 1]  717 	ld	a, (0x03, sp)
      0089B4 F7               [ 1]  718 	ld	(x), a
                                    719 ;	HAL_UART1.c: 446: }
      0089B5 81               [ 4]  720 	ret
                                    721 ;	HAL_UART1.c: 470: void UART1_SetPrescaler(uint8_t UART1_Prescaler)
                                    722 ;	-----------------------------------------
                                    723 ;	 function UART1_SetPrescaler
                                    724 ;	-----------------------------------------
      0089B6                        725 _UART1_SetPrescaler:
                                    726 ;	HAL_UART1.c: 473: UART1->PSCR = UART1_Prescaler;
      0089B6 AE 52 3A         [ 2]  727 	ldw	x, #0x523a
      0089B9 7B 03            [ 1]  728 	ld	a, (0x03, sp)
      0089BB F7               [ 1]  729 	ld	(x), a
                                    730 ;	HAL_UART1.c: 474: }
      0089BC 81               [ 4]  731 	ret
                                    732 ;	HAL_UART1.c: 482: uint8_t UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
                                    733 ;	-----------------------------------------
                                    734 ;	 function UART1_GetFlagStatus
                                    735 ;	-----------------------------------------
      0089BD                        736 _UART1_GetFlagStatus:
      0089BD 52 03            [ 2]  737 	sub	sp, #3
                                    738 ;	HAL_UART1.c: 490: if (UART1_FLAG == UART1_FLAG_LBDF)
      0089BF 16 06            [ 2]  739 	ldw	y, (0x06, sp)
      0089C1 17 01            [ 2]  740 	ldw	(0x01, sp), y
                                    741 ;	HAL_UART1.c: 492: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      0089C3 7B 07            [ 1]  742 	ld	a, (0x07, sp)
      0089C5 6B 03            [ 1]  743 	ld	(0x03, sp), a
                                    744 ;	HAL_UART1.c: 490: if (UART1_FLAG == UART1_FLAG_LBDF)
      0089C7 1E 01            [ 2]  745 	ldw	x, (0x01, sp)
      0089C9 A3 02 10         [ 2]  746 	cpw	x, #0x0210
      0089CC 26 0E            [ 1]  747 	jrne	00114$
                                    748 ;	HAL_UART1.c: 492: if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      0089CE C6 52 37         [ 1]  749 	ld	a, 0x5237
      0089D1 14 03            [ 1]  750 	and	a, (0x03, sp)
      0089D3 27 04            [ 1]  751 	jreq	00102$
                                    752 ;	HAL_UART1.c: 495: status = 1;
      0089D5 A6 01            [ 1]  753 	ld	a, #0x01
      0089D7 20 23            [ 2]  754 	jra	00115$
      0089D9                        755 00102$:
                                    756 ;	HAL_UART1.c: 500: status = 0;
      0089D9 4F               [ 1]  757 	clr	a
      0089DA 20 20            [ 2]  758 	jra	00115$
      0089DC                        759 00114$:
                                    760 ;	HAL_UART1.c: 503: else if (UART1_FLAG == UART1_FLAG_SBK)
      0089DC 1E 01            [ 2]  761 	ldw	x, (0x01, sp)
      0089DE A3 01 01         [ 2]  762 	cpw	x, #0x0101
      0089E1 26 0E            [ 1]  763 	jrne	00111$
                                    764 ;	HAL_UART1.c: 505: if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      0089E3 C6 52 35         [ 1]  765 	ld	a, 0x5235
      0089E6 14 03            [ 1]  766 	and	a, (0x03, sp)
      0089E8 27 04            [ 1]  767 	jreq	00105$
                                    768 ;	HAL_UART1.c: 508: status = 1;
      0089EA A6 01            [ 1]  769 	ld	a, #0x01
      0089EC 20 0E            [ 2]  770 	jra	00115$
      0089EE                        771 00105$:
                                    772 ;	HAL_UART1.c: 513: status = 0;
      0089EE 4F               [ 1]  773 	clr	a
      0089EF 20 0B            [ 2]  774 	jra	00115$
      0089F1                        775 00111$:
                                    776 ;	HAL_UART1.c: 518: if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
      0089F1 C6 52 30         [ 1]  777 	ld	a, 0x5230
      0089F4 14 03            [ 1]  778 	and	a, (0x03, sp)
      0089F6 27 03            [ 1]  779 	jreq	00108$
                                    780 ;	HAL_UART1.c: 521: status = 1;
      0089F8 A6 01            [ 1]  781 	ld	a, #0x01
                                    782 ;	HAL_UART1.c: 526: status = 0;
      0089FA 21                     783 	.byte 0x21
      0089FB                        784 00108$:
      0089FB 4F               [ 1]  785 	clr	a
      0089FC                        786 00115$:
                                    787 ;	HAL_UART1.c: 530: return status;
                                    788 ;	HAL_UART1.c: 531: }
      0089FC 5B 03            [ 2]  789 	addw	sp, #3
      0089FE 81               [ 4]  790 	ret
                                    791 ;	HAL_UART1.c: 560: void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
                                    792 ;	-----------------------------------------
                                    793 ;	 function UART1_ClearFlag
                                    794 ;	-----------------------------------------
      0089FF                        795 _UART1_ClearFlag:
                                    796 ;	HAL_UART1.c: 564: if (UART1_FLAG == UART1_FLAG_RXNE)
      0089FF 1E 03            [ 2]  797 	ldw	x, (0x03, sp)
      008A01 A3 00 20         [ 2]  798 	cpw	x, #0x0020
      008A04 26 05            [ 1]  799 	jrne	00102$
                                    800 ;	HAL_UART1.c: 566: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      008A06 35 DF 52 30      [ 1]  801 	mov	0x5230+0, #0xdf
      008A0A 81               [ 4]  802 	ret
      008A0B                        803 00102$:
                                    804 ;	HAL_UART1.c: 571: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008A0B 72 19 52 37      [ 1]  805 	bres	21047, #4
                                    806 ;	HAL_UART1.c: 573: }
      008A0F 81               [ 4]  807 	ret
                                    808 ;	HAL_UART1.c: 588: uint8_t UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
                                    809 ;	-----------------------------------------
                                    810 ;	 function UART1_GetITStatus
                                    811 ;	-----------------------------------------
      008A10                        812 _UART1_GetITStatus:
      008A10 52 04            [ 2]  813 	sub	sp, #4
                                    814 ;	HAL_UART1.c: 599: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
      008A12 7B 08            [ 1]  815 	ld	a, (0x08, sp)
      008A14 97               [ 1]  816 	ld	xl, a
      008A15 A4 0F            [ 1]  817 	and	a, #0x0f
      008A17 88               [ 1]  818 	push	a
      008A18 A6 01            [ 1]  819 	ld	a, #0x01
      008A1A 6B 02            [ 1]  820 	ld	(0x02, sp), a
      008A1C 84               [ 1]  821 	pop	a
      008A1D 4D               [ 1]  822 	tnz	a
      008A1E 27 05            [ 1]  823 	jreq	00162$
      008A20                        824 00161$:
      008A20 08 01            [ 1]  825 	sll	(0x01, sp)
      008A22 4A               [ 1]  826 	dec	a
      008A23 26 FB            [ 1]  827 	jrne	00161$
      008A25                        828 00162$:
                                    829 ;	HAL_UART1.c: 601: itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
      008A25 9F               [ 1]  830 	ld	a, xl
      008A26 4E               [ 1]  831 	swap	a
      008A27 A4 0F            [ 1]  832 	and	a, #0x0f
                                    833 ;	HAL_UART1.c: 603: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008A29 88               [ 1]  834 	push	a
      008A2A A6 01            [ 1]  835 	ld	a, #0x01
      008A2C 6B 03            [ 1]  836 	ld	(0x03, sp), a
      008A2E 84               [ 1]  837 	pop	a
      008A2F 4D               [ 1]  838 	tnz	a
      008A30 27 05            [ 1]  839 	jreq	00164$
      008A32                        840 00163$:
      008A32 08 02            [ 1]  841 	sll	(0x02, sp)
      008A34 4A               [ 1]  842 	dec	a
      008A35 26 FB            [ 1]  843 	jrne	00163$
      008A37                        844 00164$:
                                    845 ;	HAL_UART1.c: 607: if (UART1_IT == UART1_IT_PE)
      008A37 16 07            [ 2]  846 	ldw	y, (0x07, sp)
      008A39 17 03            [ 2]  847 	ldw	(0x03, sp), y
      008A3B 93               [ 1]  848 	ldw	x, y
      008A3C A3 01 00         [ 2]  849 	cpw	x, #0x0100
      008A3F 26 18            [ 1]  850 	jrne	00117$
                                    851 ;	HAL_UART1.c: 610: enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
      008A41 C6 52 34         [ 1]  852 	ld	a, 0x5234
      008A44 14 02            [ 1]  853 	and	a, (0x02, sp)
      008A46 97               [ 1]  854 	ld	xl, a
                                    855 ;	HAL_UART1.c: 613: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008A47 C6 52 30         [ 1]  856 	ld	a, 0x5230
      008A4A 14 01            [ 1]  857 	and	a, (0x01, sp)
      008A4C 27 08            [ 1]  858 	jreq	00102$
      008A4E 9F               [ 1]  859 	ld	a, xl
      008A4F 4D               [ 1]  860 	tnz	a
      008A50 27 04            [ 1]  861 	jreq	00102$
                                    862 ;	HAL_UART1.c: 616: pendingbitstatus = 1;
      008A52 A6 01            [ 1]  863 	ld	a, #0x01
      008A54 20 37            [ 2]  864 	jra	00118$
      008A56                        865 00102$:
                                    866 ;	HAL_UART1.c: 621: pendingbitstatus = 0;
      008A56 4F               [ 1]  867 	clr	a
      008A57 20 34            [ 2]  868 	jra	00118$
      008A59                        869 00117$:
                                    870 ;	HAL_UART1.c: 625: else if (UART1_IT == UART1_IT_LBDF)
      008A59 1E 03            [ 2]  871 	ldw	x, (0x03, sp)
      008A5B A3 03 46         [ 2]  872 	cpw	x, #0x0346
      008A5E 26 18            [ 1]  873 	jrne	00114$
                                    874 ;	HAL_UART1.c: 628: enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
      008A60 C6 52 37         [ 1]  875 	ld	a, 0x5237
      008A63 14 02            [ 1]  876 	and	a, (0x02, sp)
      008A65 97               [ 1]  877 	ld	xl, a
                                    878 ;	HAL_UART1.c: 630: if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
      008A66 C6 52 37         [ 1]  879 	ld	a, 0x5237
      008A69 14 01            [ 1]  880 	and	a, (0x01, sp)
      008A6B 27 08            [ 1]  881 	jreq	00106$
      008A6D 9F               [ 1]  882 	ld	a, xl
      008A6E 4D               [ 1]  883 	tnz	a
      008A6F 27 04            [ 1]  884 	jreq	00106$
                                    885 ;	HAL_UART1.c: 633: pendingbitstatus = 1;
      008A71 A6 01            [ 1]  886 	ld	a, #0x01
      008A73 20 18            [ 2]  887 	jra	00118$
      008A75                        888 00106$:
                                    889 ;	HAL_UART1.c: 638: pendingbitstatus = 0;
      008A75 4F               [ 1]  890 	clr	a
      008A76 20 15            [ 2]  891 	jra	00118$
      008A78                        892 00114$:
                                    893 ;	HAL_UART1.c: 644: enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
      008A78 C6 52 35         [ 1]  894 	ld	a, 0x5235
      008A7B 14 02            [ 1]  895 	and	a, (0x02, sp)
      008A7D 97               [ 1]  896 	ld	xl, a
                                    897 ;	HAL_UART1.c: 646: if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
      008A7E C6 52 30         [ 1]  898 	ld	a, 0x5230
      008A81 14 01            [ 1]  899 	and	a, (0x01, sp)
      008A83 27 07            [ 1]  900 	jreq	00110$
      008A85 9F               [ 1]  901 	ld	a, xl
      008A86 4D               [ 1]  902 	tnz	a
      008A87 27 03            [ 1]  903 	jreq	00110$
                                    904 ;	HAL_UART1.c: 649: pendingbitstatus = 1;
      008A89 A6 01            [ 1]  905 	ld	a, #0x01
                                    906 ;	HAL_UART1.c: 654: pendingbitstatus = 0;
      008A8B 21                     907 	.byte 0x21
      008A8C                        908 00110$:
      008A8C 4F               [ 1]  909 	clr	a
      008A8D                        910 00118$:
                                    911 ;	HAL_UART1.c: 659: return  pendingbitstatus;
                                    912 ;	HAL_UART1.c: 660: }
      008A8D 5B 04            [ 2]  913 	addw	sp, #4
      008A8F 81               [ 4]  914 	ret
                                    915 ;	HAL_UART1.c: 687: void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
                                    916 ;	-----------------------------------------
                                    917 ;	 function UART1_ClearITPendingBit
                                    918 ;	-----------------------------------------
      008A90                        919 _UART1_ClearITPendingBit:
                                    920 ;	HAL_UART1.c: 691: if (UART1_IT == UART1_IT_RXNE)
      008A90 1E 03            [ 2]  921 	ldw	x, (0x03, sp)
      008A92 A3 02 55         [ 2]  922 	cpw	x, #0x0255
      008A95 26 05            [ 1]  923 	jrne	00102$
                                    924 ;	HAL_UART1.c: 693: UART1->SR = (uint8_t)~(UART1_SR_RXNE);
      008A97 35 DF 52 30      [ 1]  925 	mov	0x5230+0, #0xdf
      008A9B 81               [ 4]  926 	ret
      008A9C                        927 00102$:
                                    928 ;	HAL_UART1.c: 698: UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
      008A9C 72 19 52 37      [ 1]  929 	bres	21047, #4
                                    930 ;	HAL_UART1.c: 700: }
      008AA0 81               [ 4]  931 	ret
                                    932 	.area CODE
                                    933 	.area CONST
                                    934 	.area INITIALIZER
                                    935 	.area CABS (ABS)
