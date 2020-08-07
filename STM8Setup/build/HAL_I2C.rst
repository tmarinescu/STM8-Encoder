                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_I2C
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _I2C_DeInit
                                     12 	.globl _I2C_Init
                                     13 	.globl _I2C_Cmd
                                     14 	.globl _I2C_GeneralCallCmd
                                     15 	.globl _I2C_GenerateSTART
                                     16 	.globl _I2C_GenerateSTOP
                                     17 	.globl _I2C_SoftwareResetCmd
                                     18 	.globl _I2C_StretchClockCmd
                                     19 	.globl _I2C_AcknowledgeConfig
                                     20 	.globl _I2C_ITConfig
                                     21 	.globl _I2C_FastModeDutyCycleConfig
                                     22 	.globl _I2C_ReceiveData
                                     23 	.globl _I2C_Send7bitAddress
                                     24 	.globl _I2C_SendData
                                     25 	.globl _I2C_CheckEvent
                                     26 	.globl _I2C_GetLastEvent
                                     27 	.globl _I2C_GetFlagStatus
                                     28 	.globl _I2C_ClearFlag
                                     29 	.globl _I2C_GetITStatus
                                     30 	.globl _I2C_ClearITPendingBit
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; absolute external ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area DABS (ABS)
                                     43 
                                     44 ; default segment ordering for linker
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area CONST
                                     49 	.area INITIALIZER
                                     50 	.area CODE
                                     51 
                                     52 ;--------------------------------------------------------
                                     53 ; global & static initialisations
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area GSINIT
                                     57 	.area GSFINAL
                                     58 	.area GSINIT
                                     59 ;--------------------------------------------------------
                                     60 ; Home
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
                                     63 	.area HOME
                                     64 ;--------------------------------------------------------
                                     65 ; code
                                     66 ;--------------------------------------------------------
                                     67 	.area CODE
                                     68 ;	HAL_I2C.c: 17: void I2C_DeInit(void)
                                     69 ;	-----------------------------------------
                                     70 ;	 function I2C_DeInit
                                     71 ;	-----------------------------------------
      0096FE                         72 _I2C_DeInit:
                                     73 ;	HAL_I2C.c: 19: I2C->CR1 = I2C_CR1_RESET_VALUE;
      0096FE 35 00 52 10      [ 1]   74 	mov	0x5210+0, #0x00
                                     75 ;	HAL_I2C.c: 20: I2C->CR2 = I2C_CR2_RESET_VALUE;
      009702 35 00 52 11      [ 1]   76 	mov	0x5211+0, #0x00
                                     77 ;	HAL_I2C.c: 21: I2C->FREQR = I2C_FREQR_RESET_VALUE;
      009706 35 00 52 12      [ 1]   78 	mov	0x5212+0, #0x00
                                     79 ;	HAL_I2C.c: 22: I2C->OARL = I2C_OARL_RESET_VALUE;
      00970A 35 00 52 13      [ 1]   80 	mov	0x5213+0, #0x00
                                     81 ;	HAL_I2C.c: 23: I2C->OARH = I2C_OARH_RESET_VALUE;
      00970E 35 00 52 14      [ 1]   82 	mov	0x5214+0, #0x00
                                     83 ;	HAL_I2C.c: 24: I2C->ITR = I2C_ITR_RESET_VALUE;
      009712 35 00 52 1A      [ 1]   84 	mov	0x521a+0, #0x00
                                     85 ;	HAL_I2C.c: 25: I2C->CCRL = I2C_CCRL_RESET_VALUE;
      009716 35 00 52 1B      [ 1]   86 	mov	0x521b+0, #0x00
                                     87 ;	HAL_I2C.c: 26: I2C->CCRH = I2C_CCRH_RESET_VALUE;
      00971A 35 00 52 1C      [ 1]   88 	mov	0x521c+0, #0x00
                                     89 ;	HAL_I2C.c: 27: I2C->TRISER = I2C_TRISER_RESET_VALUE;
      00971E 35 02 52 1D      [ 1]   90 	mov	0x521d+0, #0x02
                                     91 ;	HAL_I2C.c: 28: }
      009722 81               [ 4]   92 	ret
                                     93 ;	HAL_I2C.c: 30: void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress,
                                     94 ;	-----------------------------------------
                                     95 ;	 function I2C_Init
                                     96 ;	-----------------------------------------
      009723                         97 _I2C_Init:
      009723 52 07            [ 2]   98 	sub	sp, #7
                                     99 ;	HAL_I2C.c: 36: uint8_t tmpccrh = 0;
      009725 0F 05            [ 1]  100 	clr	(0x05, sp)
                                    101 ;	HAL_I2C.c: 40: I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
      009727 C6 52 12         [ 1]  102 	ld	a, 0x5212
      00972A A4 C0            [ 1]  103 	and	a, #0xc0
      00972C C7 52 12         [ 1]  104 	ld	0x5212, a
                                    105 ;	HAL_I2C.c: 42: I2C->FREQR |= InputClockFrequencyMHz;
      00972F C6 52 12         [ 1]  106 	ld	a, 0x5212
      009732 1A 13            [ 1]  107 	or	a, (0x13, sp)
      009734 C7 52 12         [ 1]  108 	ld	0x5212, a
                                    109 ;	HAL_I2C.c: 46: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009737 72 11 52 10      [ 1]  110 	bres	21008, #0
                                    111 ;	HAL_I2C.c: 49: I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
      00973B C6 52 1C         [ 1]  112 	ld	a, 0x521c
      00973E A4 30            [ 1]  113 	and	a, #0x30
      009740 C7 52 1C         [ 1]  114 	ld	0x521c, a
                                    115 ;	HAL_I2C.c: 50: I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
      009743 C6 52 1B         [ 1]  116 	ld	a, 0x521b
      009746 35 00 52 1B      [ 1]  117 	mov	0x521b+0, #0x00
                                    118 ;	HAL_I2C.c: 61: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00974A 5F               [ 1]  119 	clrw	x
      00974B 7B 13            [ 1]  120 	ld	a, (0x13, sp)
      00974D 97               [ 1]  121 	ld	xl, a
      00974E 90 5F            [ 1]  122 	clrw	y
      009750 89               [ 2]  123 	pushw	x
      009751 90 89            [ 2]  124 	pushw	y
      009753 4B 40            [ 1]  125 	push	#0x40
      009755 4B 42            [ 1]  126 	push	#0x42
      009757 4B 0F            [ 1]  127 	push	#0x0f
      009759 4B 00            [ 1]  128 	push	#0x00
      00975B CD 9A 88         [ 4]  129 	call	__mullong
      00975E 5B 08            [ 2]  130 	addw	sp, #8
      009760 1F 03            [ 2]  131 	ldw	(0x03, sp), x
      009762 17 01            [ 2]  132 	ldw	(0x01, sp), y
                                    133 ;	HAL_I2C.c: 53: if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
      009764 AE 86 A0         [ 2]  134 	ldw	x, #0x86a0
      009767 13 0C            [ 2]  135 	cpw	x, (0x0c, sp)
      009769 A6 01            [ 1]  136 	ld	a, #0x01
      00976B 12 0B            [ 1]  137 	sbc	a, (0x0b, sp)
      00976D 4F               [ 1]  138 	clr	a
      00976E 12 0A            [ 1]  139 	sbc	a, (0x0a, sp)
      009770 24 7B            [ 1]  140 	jrnc	00109$
                                    141 ;	HAL_I2C.c: 56: tmpccrh = I2C_CCRH_FS;
      009772 A6 80            [ 1]  142 	ld	a, #0x80
      009774 6B 05            [ 1]  143 	ld	(0x05, sp), a
                                    144 ;	HAL_I2C.c: 58: if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
      009776 0D 10            [ 1]  145 	tnz	(0x10, sp)
      009778 26 23            [ 1]  146 	jrne	00102$
                                    147 ;	HAL_I2C.c: 61: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
      00977A 1E 0C            [ 2]  148 	ldw	x, (0x0c, sp)
      00977C 89               [ 2]  149 	pushw	x
      00977D 1E 0C            [ 2]  150 	ldw	x, (0x0c, sp)
      00977F 89               [ 2]  151 	pushw	x
      009780 4B 03            [ 1]  152 	push	#0x03
      009782 5F               [ 1]  153 	clrw	x
      009783 89               [ 2]  154 	pushw	x
      009784 4B 00            [ 1]  155 	push	#0x00
      009786 CD 9A 88         [ 4]  156 	call	__mullong
      009789 5B 08            [ 2]  157 	addw	sp, #8
      00978B 89               [ 2]  158 	pushw	x
      00978C 90 89            [ 2]  159 	pushw	y
      00978E 1E 07            [ 2]  160 	ldw	x, (0x07, sp)
      009790 89               [ 2]  161 	pushw	x
      009791 1E 07            [ 2]  162 	ldw	x, (0x07, sp)
      009793 89               [ 2]  163 	pushw	x
      009794 CD 9A 2E         [ 4]  164 	call	__divulong
      009797 5B 08            [ 2]  165 	addw	sp, #8
      009799 1F 06            [ 2]  166 	ldw	(0x06, sp), x
      00979B 20 28            [ 2]  167 	jra	00103$
      00979D                        168 00102$:
                                    169 ;	HAL_I2C.c: 66: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
      00979D 1E 0C            [ 2]  170 	ldw	x, (0x0c, sp)
      00979F 89               [ 2]  171 	pushw	x
      0097A0 1E 0C            [ 2]  172 	ldw	x, (0x0c, sp)
      0097A2 89               [ 2]  173 	pushw	x
      0097A3 4B 19            [ 1]  174 	push	#0x19
      0097A5 5F               [ 1]  175 	clrw	x
      0097A6 89               [ 2]  176 	pushw	x
      0097A7 4B 00            [ 1]  177 	push	#0x00
      0097A9 CD 9A 88         [ 4]  178 	call	__mullong
      0097AC 5B 08            [ 2]  179 	addw	sp, #8
      0097AE 9F               [ 1]  180 	ld	a, xl
      0097AF 88               [ 1]  181 	push	a
      0097B0 9E               [ 1]  182 	ld	a, xh
      0097B1 88               [ 1]  183 	push	a
      0097B2 90 89            [ 2]  184 	pushw	y
      0097B4 1E 07            [ 2]  185 	ldw	x, (0x07, sp)
      0097B6 89               [ 2]  186 	pushw	x
      0097B7 1E 07            [ 2]  187 	ldw	x, (0x07, sp)
      0097B9 89               [ 2]  188 	pushw	x
      0097BA CD 9A 2E         [ 4]  189 	call	__divulong
      0097BD 5B 08            [ 2]  190 	addw	sp, #8
      0097BF 1F 06            [ 2]  191 	ldw	(0x06, sp), x
                                    192 ;	HAL_I2C.c: 68: tmpccrh |= I2C_CCRH_DUTY;
      0097C1 A6 C0            [ 1]  193 	ld	a, #0xc0
      0097C3 6B 05            [ 1]  194 	ld	(0x05, sp), a
      0097C5                        195 00103$:
                                    196 ;	HAL_I2C.c: 72: if (result < (uint16_t)0x01)
      0097C5 1E 06            [ 2]  197 	ldw	x, (0x06, sp)
      0097C7 A3 00 01         [ 2]  198 	cpw	x, #0x0001
      0097CA 24 05            [ 1]  199 	jrnc	00105$
                                    200 ;	HAL_I2C.c: 75: result = (uint16_t)0x0001;
      0097CC AE 00 01         [ 2]  201 	ldw	x, #0x0001
      0097CF 1F 06            [ 2]  202 	ldw	(0x06, sp), x
      0097D1                        203 00105$:
                                    204 ;	HAL_I2C.c: 81: tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
      0097D1 7B 13            [ 1]  205 	ld	a, (0x13, sp)
      0097D3 5F               [ 1]  206 	clrw	x
      0097D4 97               [ 1]  207 	ld	xl, a
      0097D5 89               [ 2]  208 	pushw	x
      0097D6 58               [ 2]  209 	sllw	x
      0097D7 72 FB 01         [ 2]  210 	addw	x, (1, sp)
      0097DA 5B 02            [ 2]  211 	addw	sp, #2
      0097DC 4B 0A            [ 1]  212 	push	#0x0a
      0097DE 4B 00            [ 1]  213 	push	#0x00
      0097E0 89               [ 2]  214 	pushw	x
      0097E1 CD 9B 04         [ 4]  215 	call	__divsint
      0097E4 5B 04            [ 2]  216 	addw	sp, #4
      0097E6 9F               [ 1]  217 	ld	a, xl
      0097E7 4C               [ 1]  218 	inc	a
                                    219 ;	HAL_I2C.c: 82: I2C->TRISER = (uint8_t)tmpval;
      0097E8 C7 52 1D         [ 1]  220 	ld	0x521d, a
      0097EB 20 27            [ 2]  221 	jra	00110$
      0097ED                        222 00109$:
                                    223 ;	HAL_I2C.c: 89: result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
      0097ED 1E 0C            [ 2]  224 	ldw	x, (0x0c, sp)
      0097EF 16 0A            [ 2]  225 	ldw	y, (0x0a, sp)
      0097F1 58               [ 2]  226 	sllw	x
      0097F2 90 59            [ 2]  227 	rlcw	y
      0097F4 89               [ 2]  228 	pushw	x
      0097F5 90 89            [ 2]  229 	pushw	y
      0097F7 1E 07            [ 2]  230 	ldw	x, (0x07, sp)
      0097F9 89               [ 2]  231 	pushw	x
      0097FA 1E 07            [ 2]  232 	ldw	x, (0x07, sp)
      0097FC 89               [ 2]  233 	pushw	x
      0097FD CD 9A 2E         [ 4]  234 	call	__divulong
      009800 5B 08            [ 2]  235 	addw	sp, #8
                                    236 ;	HAL_I2C.c: 92: if (result < (uint16_t)0x0004)
      009802 1F 06            [ 2]  237 	ldw	(0x06, sp), x
      009804 A3 00 04         [ 2]  238 	cpw	x, #0x0004
      009807 24 05            [ 1]  239 	jrnc	00107$
                                    240 ;	HAL_I2C.c: 95: result = (uint16_t)0x0004;
      009809 AE 00 04         [ 2]  241 	ldw	x, #0x0004
      00980C 1F 06            [ 2]  242 	ldw	(0x06, sp), x
      00980E                        243 00107$:
                                    244 ;	HAL_I2C.c: 101: I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
      00980E 7B 13            [ 1]  245 	ld	a, (0x13, sp)
      009810 4C               [ 1]  246 	inc	a
      009811 C7 52 1D         [ 1]  247 	ld	0x521d, a
      009814                        248 00110$:
                                    249 ;	HAL_I2C.c: 106: I2C->CCRL = (uint8_t)result;
      009814 7B 07            [ 1]  250 	ld	a, (0x07, sp)
      009816 C7 52 1B         [ 1]  251 	ld	0x521b, a
                                    252 ;	HAL_I2C.c: 107: I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
      009819 7B 06            [ 1]  253 	ld	a, (0x06, sp)
      00981B A4 0F            [ 1]  254 	and	a, #0x0f
      00981D 1A 05            [ 1]  255 	or	a, (0x05, sp)
      00981F C7 52 1C         [ 1]  256 	ld	0x521c, a
                                    257 ;	HAL_I2C.c: 110: I2C->CR1 |= I2C_CR1_PE;
      009822 72 10 52 10      [ 1]  258 	bset	21008, #0
                                    259 ;	HAL_I2C.c: 113: I2C_AcknowledgeConfig(Ack);
      009826 7B 11            [ 1]  260 	ld	a, (0x11, sp)
      009828 88               [ 1]  261 	push	a
      009829 CD 98 BD         [ 4]  262 	call	_I2C_AcknowledgeConfig
      00982C 84               [ 1]  263 	pop	a
                                    264 ;	HAL_I2C.c: 116: I2C->OARL = (uint8_t)(OwnAddress);
      00982D 7B 0F            [ 1]  265 	ld	a, (0x0f, sp)
      00982F C7 52 13         [ 1]  266 	ld	0x5213, a
                                    267 ;	HAL_I2C.c: 117: I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
      009832 7B 12            [ 1]  268 	ld	a, (0x12, sp)
      009834 AA 40            [ 1]  269 	or	a, #0x40
      009836 6B 07            [ 1]  270 	ld	(0x07, sp), a
                                    271 ;	HAL_I2C.c: 118: (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
      009838 4F               [ 1]  272 	clr	a
      009839 97               [ 1]  273 	ld	xl, a
      00983A 7B 0E            [ 1]  274 	ld	a, (0x0e, sp)
      00983C A4 03            [ 1]  275 	and	a, #0x03
      00983E 95               [ 1]  276 	ld	xh, a
      00983F A6 80            [ 1]  277 	ld	a, #0x80
      009841 62               [ 2]  278 	div	x, a
      009842 9F               [ 1]  279 	ld	a, xl
      009843 1A 07            [ 1]  280 	or	a, (0x07, sp)
      009845 C7 52 14         [ 1]  281 	ld	0x5214, a
                                    282 ;	HAL_I2C.c: 119: }
      009848 5B 07            [ 2]  283 	addw	sp, #7
      00984A 81               [ 4]  284 	ret
                                    285 ;	HAL_I2C.c: 121: void I2C_Cmd(uint8_t NewState)
                                    286 ;	-----------------------------------------
                                    287 ;	 function I2C_Cmd
                                    288 ;	-----------------------------------------
      00984B                        289 _I2C_Cmd:
                                    290 ;	HAL_I2C.c: 126: I2C->CR1 |= I2C_CR1_PE;
      00984B C6 52 10         [ 1]  291 	ld	a, 0x5210
                                    292 ;	HAL_I2C.c: 123: if (NewState != 0)
      00984E 0D 03            [ 1]  293 	tnz	(0x03, sp)
      009850 27 06            [ 1]  294 	jreq	00102$
                                    295 ;	HAL_I2C.c: 126: I2C->CR1 |= I2C_CR1_PE;
      009852 AA 01            [ 1]  296 	or	a, #0x01
      009854 C7 52 10         [ 1]  297 	ld	0x5210, a
      009857 81               [ 4]  298 	ret
      009858                        299 00102$:
                                    300 ;	HAL_I2C.c: 131: I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
      009858 A4 FE            [ 1]  301 	and	a, #0xfe
      00985A C7 52 10         [ 1]  302 	ld	0x5210, a
                                    303 ;	HAL_I2C.c: 133: }
      00985D 81               [ 4]  304 	ret
                                    305 ;	HAL_I2C.c: 135: void I2C_GeneralCallCmd(uint8_t NewState)
                                    306 ;	-----------------------------------------
                                    307 ;	 function I2C_GeneralCallCmd
                                    308 ;	-----------------------------------------
      00985E                        309 _I2C_GeneralCallCmd:
                                    310 ;	HAL_I2C.c: 140: I2C->CR1 |= I2C_CR1_ENGC;
      00985E C6 52 10         [ 1]  311 	ld	a, 0x5210
                                    312 ;	HAL_I2C.c: 137: if (NewState != 0)
      009861 0D 03            [ 1]  313 	tnz	(0x03, sp)
      009863 27 06            [ 1]  314 	jreq	00102$
                                    315 ;	HAL_I2C.c: 140: I2C->CR1 |= I2C_CR1_ENGC;
      009865 AA 40            [ 1]  316 	or	a, #0x40
      009867 C7 52 10         [ 1]  317 	ld	0x5210, a
      00986A 81               [ 4]  318 	ret
      00986B                        319 00102$:
                                    320 ;	HAL_I2C.c: 145: I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
      00986B A4 BF            [ 1]  321 	and	a, #0xbf
      00986D C7 52 10         [ 1]  322 	ld	0x5210, a
                                    323 ;	HAL_I2C.c: 147: }
      009870 81               [ 4]  324 	ret
                                    325 ;	HAL_I2C.c: 149: void I2C_GenerateSTART(uint8_t NewState)
                                    326 ;	-----------------------------------------
                                    327 ;	 function I2C_GenerateSTART
                                    328 ;	-----------------------------------------
      009871                        329 _I2C_GenerateSTART:
                                    330 ;	HAL_I2C.c: 154: I2C->CR2 |= I2C_CR2_START;
      009871 C6 52 11         [ 1]  331 	ld	a, 0x5211
                                    332 ;	HAL_I2C.c: 151: if (NewState != 0)
      009874 0D 03            [ 1]  333 	tnz	(0x03, sp)
      009876 27 06            [ 1]  334 	jreq	00102$
                                    335 ;	HAL_I2C.c: 154: I2C->CR2 |= I2C_CR2_START;
      009878 AA 01            [ 1]  336 	or	a, #0x01
      00987A C7 52 11         [ 1]  337 	ld	0x5211, a
      00987D 81               [ 4]  338 	ret
      00987E                        339 00102$:
                                    340 ;	HAL_I2C.c: 159: I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
      00987E A4 FE            [ 1]  341 	and	a, #0xfe
      009880 C7 52 11         [ 1]  342 	ld	0x5211, a
                                    343 ;	HAL_I2C.c: 161: }
      009883 81               [ 4]  344 	ret
                                    345 ;	HAL_I2C.c: 163: void I2C_GenerateSTOP(uint8_t NewState)
                                    346 ;	-----------------------------------------
                                    347 ;	 function I2C_GenerateSTOP
                                    348 ;	-----------------------------------------
      009884                        349 _I2C_GenerateSTOP:
                                    350 ;	HAL_I2C.c: 168: I2C->CR2 |= I2C_CR2_STOP;
      009884 C6 52 11         [ 1]  351 	ld	a, 0x5211
                                    352 ;	HAL_I2C.c: 165: if (NewState != 0)
      009887 0D 03            [ 1]  353 	tnz	(0x03, sp)
      009889 27 06            [ 1]  354 	jreq	00102$
                                    355 ;	HAL_I2C.c: 168: I2C->CR2 |= I2C_CR2_STOP;
      00988B AA 02            [ 1]  356 	or	a, #0x02
      00988D C7 52 11         [ 1]  357 	ld	0x5211, a
      009890 81               [ 4]  358 	ret
      009891                        359 00102$:
                                    360 ;	HAL_I2C.c: 173: I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
      009891 A4 FD            [ 1]  361 	and	a, #0xfd
      009893 C7 52 11         [ 1]  362 	ld	0x5211, a
                                    363 ;	HAL_I2C.c: 175: }
      009896 81               [ 4]  364 	ret
                                    365 ;	HAL_I2C.c: 177: void I2C_SoftwareResetCmd(uint8_t NewState)
                                    366 ;	-----------------------------------------
                                    367 ;	 function I2C_SoftwareResetCmd
                                    368 ;	-----------------------------------------
      009897                        369 _I2C_SoftwareResetCmd:
                                    370 ;	HAL_I2C.c: 182: I2C->CR2 |= I2C_CR2_SWRST;
      009897 C6 52 11         [ 1]  371 	ld	a, 0x5211
                                    372 ;	HAL_I2C.c: 179: if (NewState != 0)
      00989A 0D 03            [ 1]  373 	tnz	(0x03, sp)
      00989C 27 06            [ 1]  374 	jreq	00102$
                                    375 ;	HAL_I2C.c: 182: I2C->CR2 |= I2C_CR2_SWRST;
      00989E AA 80            [ 1]  376 	or	a, #0x80
      0098A0 C7 52 11         [ 1]  377 	ld	0x5211, a
      0098A3 81               [ 4]  378 	ret
      0098A4                        379 00102$:
                                    380 ;	HAL_I2C.c: 187: I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
      0098A4 A4 7F            [ 1]  381 	and	a, #0x7f
      0098A6 C7 52 11         [ 1]  382 	ld	0x5211, a
                                    383 ;	HAL_I2C.c: 189: }
      0098A9 81               [ 4]  384 	ret
                                    385 ;	HAL_I2C.c: 191: void I2C_StretchClockCmd(uint8_t NewState)
                                    386 ;	-----------------------------------------
                                    387 ;	 function I2C_StretchClockCmd
                                    388 ;	-----------------------------------------
      0098AA                        389 _I2C_StretchClockCmd:
                                    390 ;	HAL_I2C.c: 196: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      0098AA C6 52 10         [ 1]  391 	ld	a, 0x5210
                                    392 ;	HAL_I2C.c: 193: if (NewState != 0)
      0098AD 0D 03            [ 1]  393 	tnz	(0x03, sp)
      0098AF 27 06            [ 1]  394 	jreq	00102$
                                    395 ;	HAL_I2C.c: 196: I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
      0098B1 A4 7F            [ 1]  396 	and	a, #0x7f
      0098B3 C7 52 10         [ 1]  397 	ld	0x5210, a
      0098B6 81               [ 4]  398 	ret
      0098B7                        399 00102$:
                                    400 ;	HAL_I2C.c: 202: I2C->CR1 |= I2C_CR1_NOSTRETCH;
      0098B7 AA 80            [ 1]  401 	or	a, #0x80
      0098B9 C7 52 10         [ 1]  402 	ld	0x5210, a
                                    403 ;	HAL_I2C.c: 204: }
      0098BC 81               [ 4]  404 	ret
                                    405 ;	HAL_I2C.c: 206: void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
                                    406 ;	-----------------------------------------
                                    407 ;	 function I2C_AcknowledgeConfig
                                    408 ;	-----------------------------------------
      0098BD                        409 _I2C_AcknowledgeConfig:
                                    410 ;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0098BD C6 52 11         [ 1]  411 	ld	a, 0x5211
                                    412 ;	HAL_I2C.c: 208: if (Ack == I2C_ACK_NONE)
      0098C0 0D 03            [ 1]  413 	tnz	(0x03, sp)
      0098C2 26 06            [ 1]  414 	jrne	00105$
                                    415 ;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0098C4 A4 FB            [ 1]  416 	and	a, #0xfb
      0098C6 C7 52 11         [ 1]  417 	ld	0x5211, a
      0098C9 81               [ 4]  418 	ret
      0098CA                        419 00105$:
                                    420 ;	HAL_I2C.c: 216: I2C->CR2 |= I2C_CR2_ACK;
      0098CA AA 04            [ 1]  421 	or	a, #0x04
      0098CC C7 52 11         [ 1]  422 	ld	0x5211, a
                                    423 ;	HAL_I2C.c: 211: I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
      0098CF C6 52 11         [ 1]  424 	ld	a, 0x5211
                                    425 ;	HAL_I2C.c: 218: if (Ack == I2C_ACK_CURR)
      0098D2 88               [ 1]  426 	push	a
      0098D3 7B 04            [ 1]  427 	ld	a, (0x04, sp)
      0098D5 4A               [ 1]  428 	dec	a
      0098D6 84               [ 1]  429 	pop	a
      0098D7 26 06            [ 1]  430 	jrne	00102$
                                    431 ;	HAL_I2C.c: 221: I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
      0098D9 A4 F7            [ 1]  432 	and	a, #0xf7
      0098DB C7 52 11         [ 1]  433 	ld	0x5211, a
      0098DE 81               [ 4]  434 	ret
      0098DF                        435 00102$:
                                    436 ;	HAL_I2C.c: 226: I2C->CR2 |= I2C_CR2_POS;
      0098DF AA 08            [ 1]  437 	or	a, #0x08
      0098E1 C7 52 11         [ 1]  438 	ld	0x5211, a
                                    439 ;	HAL_I2C.c: 229: }
      0098E4 81               [ 4]  440 	ret
                                    441 ;	HAL_I2C.c: 231: void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, uint8_t NewState)
                                    442 ;	-----------------------------------------
                                    443 ;	 function I2C_ITConfig
                                    444 ;	-----------------------------------------
      0098E5                        445 _I2C_ITConfig:
      0098E5 88               [ 1]  446 	push	a
                                    447 ;	HAL_I2C.c: 236: I2C->ITR |= (uint8_t)I2C_IT;
      0098E6 C6 52 1A         [ 1]  448 	ld	a, 0x521a
                                    449 ;	HAL_I2C.c: 233: if (NewState != 0)
      0098E9 0D 05            [ 1]  450 	tnz	(0x05, sp)
      0098EB 27 07            [ 1]  451 	jreq	00102$
                                    452 ;	HAL_I2C.c: 236: I2C->ITR |= (uint8_t)I2C_IT;
      0098ED 1A 04            [ 1]  453 	or	a, (0x04, sp)
      0098EF C7 52 1A         [ 1]  454 	ld	0x521a, a
      0098F2 20 0C            [ 2]  455 	jra	00104$
      0098F4                        456 00102$:
                                    457 ;	HAL_I2C.c: 241: I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
      0098F4 88               [ 1]  458 	push	a
      0098F5 7B 05            [ 1]  459 	ld	a, (0x05, sp)
      0098F7 43               [ 1]  460 	cpl	a
      0098F8 6B 02            [ 1]  461 	ld	(0x02, sp), a
      0098FA 84               [ 1]  462 	pop	a
      0098FB 14 01            [ 1]  463 	and	a, (0x01, sp)
      0098FD C7 52 1A         [ 1]  464 	ld	0x521a, a
      009900                        465 00104$:
                                    466 ;	HAL_I2C.c: 243: }
      009900 84               [ 1]  467 	pop	a
      009901 81               [ 4]  468 	ret
                                    469 ;	HAL_I2C.c: 245: void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
                                    470 ;	-----------------------------------------
                                    471 ;	 function I2C_FastModeDutyCycleConfig
                                    472 ;	-----------------------------------------
      009902                        473 _I2C_FastModeDutyCycleConfig:
                                    474 ;	HAL_I2C.c: 250: I2C->CCRH |= I2C_CCRH_DUTY;
      009902 C6 52 1C         [ 1]  475 	ld	a, 0x521c
                                    476 ;	HAL_I2C.c: 247: if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
      009905 88               [ 1]  477 	push	a
      009906 7B 04            [ 1]  478 	ld	a, (0x04, sp)
      009908 A1 40            [ 1]  479 	cp	a, #0x40
      00990A 84               [ 1]  480 	pop	a
      00990B 26 06            [ 1]  481 	jrne	00102$
                                    482 ;	HAL_I2C.c: 250: I2C->CCRH |= I2C_CCRH_DUTY;
      00990D AA 40            [ 1]  483 	or	a, #0x40
      00990F C7 52 1C         [ 1]  484 	ld	0x521c, a
      009912 81               [ 4]  485 	ret
      009913                        486 00102$:
                                    487 ;	HAL_I2C.c: 255: I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
      009913 A4 BF            [ 1]  488 	and	a, #0xbf
      009915 C7 52 1C         [ 1]  489 	ld	0x521c, a
                                    490 ;	HAL_I2C.c: 257: }
      009918 81               [ 4]  491 	ret
                                    492 ;	HAL_I2C.c: 259: uint8_t I2C_ReceiveData(void)
                                    493 ;	-----------------------------------------
                                    494 ;	 function I2C_ReceiveData
                                    495 ;	-----------------------------------------
      009919                        496 _I2C_ReceiveData:
                                    497 ;	HAL_I2C.c: 262: return ((uint8_t)I2C->DR);
      009919 C6 52 16         [ 1]  498 	ld	a, 0x5216
                                    499 ;	HAL_I2C.c: 263: }
      00991C 81               [ 4]  500 	ret
                                    501 ;	HAL_I2C.c: 265: void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
                                    502 ;	-----------------------------------------
                                    503 ;	 function I2C_Send7bitAddress
                                    504 ;	-----------------------------------------
      00991D                        505 _I2C_Send7bitAddress:
                                    506 ;	HAL_I2C.c: 268: Address &= (uint8_t)0xFE;
      00991D 04 03            [ 1]  507 	srl	(0x03, sp)
      00991F 08 03            [ 1]  508 	sll	(0x03, sp)
                                    509 ;	HAL_I2C.c: 271: I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
      009921 7B 03            [ 1]  510 	ld	a, (0x03, sp)
      009923 1A 04            [ 1]  511 	or	a, (0x04, sp)
      009925 C7 52 16         [ 1]  512 	ld	0x5216, a
                                    513 ;	HAL_I2C.c: 272: }
      009928 81               [ 4]  514 	ret
                                    515 ;	HAL_I2C.c: 274: void I2C_SendData(uint8_t Data)
                                    516 ;	-----------------------------------------
                                    517 ;	 function I2C_SendData
                                    518 ;	-----------------------------------------
      009929                        519 _I2C_SendData:
                                    520 ;	HAL_I2C.c: 277: I2C->DR = Data;
      009929 AE 52 16         [ 2]  521 	ldw	x, #0x5216
      00992C 7B 03            [ 1]  522 	ld	a, (0x03, sp)
      00992E F7               [ 1]  523 	ld	(x), a
                                    524 ;	HAL_I2C.c: 278: }
      00992F 81               [ 4]  525 	ret
                                    526 ;	HAL_I2C.c: 280: uint8_t I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
                                    527 ;	-----------------------------------------
                                    528 ;	 function I2C_CheckEvent
                                    529 ;	-----------------------------------------
      009930                        530 _I2C_CheckEvent:
      009930 52 08            [ 2]  531 	sub	sp, #8
                                    532 ;	HAL_I2C.c: 282: volatile uint16_t lastevent = 0x00;
      009932 5F               [ 1]  533 	clrw	x
      009933 1F 01            [ 2]  534 	ldw	(0x01, sp), x
                                    535 ;	HAL_I2C.c: 287: if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
      009935 16 0B            [ 2]  536 	ldw	y, (0x0b, sp)
      009937 17 03            [ 2]  537 	ldw	(0x03, sp), y
      009939 93               [ 1]  538 	ldw	x, y
      00993A A3 00 04         [ 2]  539 	cpw	x, #0x0004
      00993D 26 0B            [ 1]  540 	jrne	00102$
                                    541 ;	HAL_I2C.c: 289: lastevent = I2C->SR2 & I2C_SR2_AF;
      00993F C6 52 18         [ 1]  542 	ld	a, 0x5218
      009942 A4 04            [ 1]  543 	and	a, #0x04
      009944 5F               [ 1]  544 	clrw	x
      009945 97               [ 1]  545 	ld	xl, a
      009946 1F 01            [ 2]  546 	ldw	(0x01, sp), x
      009948 20 15            [ 2]  547 	jra	00103$
      00994A                        548 00102$:
                                    549 ;	HAL_I2C.c: 293: flag1 = I2C->SR1;
      00994A C6 52 17         [ 1]  550 	ld	a, 0x5217
      00994D 97               [ 1]  551 	ld	xl, a
                                    552 ;	HAL_I2C.c: 294: flag2 = I2C->SR3;
      00994E C6 52 19         [ 1]  553 	ld	a, 0x5219
                                    554 ;	HAL_I2C.c: 295: lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
      009951 95               [ 1]  555 	ld	xh, a
      009952 0F 06            [ 1]  556 	clr	(0x06, sp)
      009954 9F               [ 1]  557 	ld	a, xl
      009955 0F 07            [ 1]  558 	clr	(0x07, sp)
      009957 1A 06            [ 1]  559 	or	a, (0x06, sp)
      009959 02               [ 1]  560 	rlwa	x
      00995A 1A 07            [ 1]  561 	or	a, (0x07, sp)
      00995C 95               [ 1]  562 	ld	xh, a
      00995D 1F 01            [ 2]  563 	ldw	(0x01, sp), x
      00995F                        564 00103$:
                                    565 ;	HAL_I2C.c: 298: if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
      00995F 7B 02            [ 1]  566 	ld	a, (0x02, sp)
      009961 14 04            [ 1]  567 	and	a, (0x04, sp)
      009963 97               [ 1]  568 	ld	xl, a
      009964 7B 01            [ 1]  569 	ld	a, (0x01, sp)
      009966 14 03            [ 1]  570 	and	a, (0x03, sp)
      009968 95               [ 1]  571 	ld	xh, a
      009969 13 03            [ 2]  572 	cpw	x, (0x03, sp)
      00996B 26 03            [ 1]  573 	jrne	00105$
                                    574 ;	HAL_I2C.c: 301: status = 1;
      00996D A6 01            [ 1]  575 	ld	a, #0x01
                                    576 ;	HAL_I2C.c: 306: status = 0;
      00996F 21                     577 	.byte 0x21
      009970                        578 00105$:
      009970 4F               [ 1]  579 	clr	a
      009971                        580 00106$:
                                    581 ;	HAL_I2C.c: 310: return status;
                                    582 ;	HAL_I2C.c: 311: }
      009971 5B 08            [ 2]  583 	addw	sp, #8
      009973 81               [ 4]  584 	ret
                                    585 ;	HAL_I2C.c: 313: I2C_Event_TypeDef I2C_GetLastEvent(void)
                                    586 ;	-----------------------------------------
                                    587 ;	 function I2C_GetLastEvent
                                    588 ;	-----------------------------------------
      009974                        589 _I2C_GetLastEvent:
      009974 52 04            [ 2]  590 	sub	sp, #4
                                    591 ;	HAL_I2C.c: 315: volatile uint16_t lastevent = 0;
      009976 5F               [ 1]  592 	clrw	x
      009977 1F 01            [ 2]  593 	ldw	(0x01, sp), x
                                    594 ;	HAL_I2C.c: 319: if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
      009979 C6 52 18         [ 1]  595 	ld	a, 0x5218
      00997C A5 04            [ 1]  596 	bcp	a, #0x04
      00997E 27 07            [ 1]  597 	jreq	00102$
                                    598 ;	HAL_I2C.c: 321: lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
      009980 AE 00 04         [ 2]  599 	ldw	x, #0x0004
      009983 1F 01            [ 2]  600 	ldw	(0x01, sp), x
      009985 20 13            [ 2]  601 	jra	00103$
      009987                        602 00102$:
                                    603 ;	HAL_I2C.c: 326: flag1 = I2C->SR1;
      009987 C6 52 17         [ 1]  604 	ld	a, 0x5217
      00998A 5F               [ 1]  605 	clrw	x
      00998B 97               [ 1]  606 	ld	xl, a
      00998C 1F 03            [ 2]  607 	ldw	(0x03, sp), x
                                    608 ;	HAL_I2C.c: 327: flag2 = I2C->SR3;
      00998E C6 52 19         [ 1]  609 	ld	a, 0x5219
                                    610 ;	HAL_I2C.c: 330: lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
      009991 95               [ 1]  611 	ld	xh, a
      009992 7B 04            [ 1]  612 	ld	a, (0x04, sp)
      009994 02               [ 1]  613 	rlwa	x
      009995 1A 03            [ 1]  614 	or	a, (0x03, sp)
      009997 95               [ 1]  615 	ld	xh, a
      009998 1F 01            [ 2]  616 	ldw	(0x01, sp), x
      00999A                        617 00103$:
                                    618 ;	HAL_I2C.c: 333: return (I2C_Event_TypeDef)lastevent;
      00999A 1E 01            [ 2]  619 	ldw	x, (0x01, sp)
                                    620 ;	HAL_I2C.c: 334: }
      00999C 5B 04            [ 2]  621 	addw	sp, #4
      00999E 81               [ 4]  622 	ret
                                    623 ;	HAL_I2C.c: 336: uint8_t I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
                                    624 ;	-----------------------------------------
                                    625 ;	 function I2C_GetFlagStatus
                                    626 ;	-----------------------------------------
      00999F                        627 _I2C_GetFlagStatus:
      00999F 88               [ 1]  628 	push	a
                                    629 ;	HAL_I2C.c: 338: uint8_t tempreg = 0;
      0099A0 0F 01            [ 1]  630 	clr	(0x01, sp)
                                    631 ;	HAL_I2C.c: 343: regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
      0099A2 1E 04            [ 2]  632 	ldw	x, (0x04, sp)
      0099A4 9E               [ 1]  633 	ld	a, xh
      0099A5 5F               [ 1]  634 	clrw	x
                                    635 ;	HAL_I2C.c: 345: switch (regindex)
      0099A6 A1 01            [ 1]  636 	cp	a, #0x01
      0099A8 27 0A            [ 1]  637 	jreq	00101$
      0099AA A1 02            [ 1]  638 	cp	a, #0x02
      0099AC 27 0D            [ 1]  639 	jreq	00102$
      0099AE A1 03            [ 1]  640 	cp	a, #0x03
      0099B0 27 10            [ 1]  641 	jreq	00103$
      0099B2 20 13            [ 2]  642 	jra	00105$
                                    643 ;	HAL_I2C.c: 348: case 0x01:
      0099B4                        644 00101$:
                                    645 ;	HAL_I2C.c: 349: tempreg = (uint8_t)I2C->SR1;
      0099B4 C6 52 17         [ 1]  646 	ld	a, 0x5217
      0099B7 6B 01            [ 1]  647 	ld	(0x01, sp), a
                                    648 ;	HAL_I2C.c: 350: break;
      0099B9 20 0C            [ 2]  649 	jra	00105$
                                    650 ;	HAL_I2C.c: 353: case 0x02:
      0099BB                        651 00102$:
                                    652 ;	HAL_I2C.c: 354: tempreg = (uint8_t)I2C->SR2;
      0099BB C6 52 18         [ 1]  653 	ld	a, 0x5218
      0099BE 6B 01            [ 1]  654 	ld	(0x01, sp), a
                                    655 ;	HAL_I2C.c: 355: break;
      0099C0 20 05            [ 2]  656 	jra	00105$
                                    657 ;	HAL_I2C.c: 358: case 0x03:
      0099C2                        658 00103$:
                                    659 ;	HAL_I2C.c: 359: tempreg = (uint8_t)I2C->SR3;
      0099C2 C6 52 19         [ 1]  660 	ld	a, 0x5219
      0099C5 6B 01            [ 1]  661 	ld	(0x01, sp), a
                                    662 ;	HAL_I2C.c: 364: }
      0099C7                        663 00105$:
                                    664 ;	HAL_I2C.c: 367: if ((tempreg & (uint8_t)I2C_Flag) != 0)
      0099C7 7B 05            [ 1]  665 	ld	a, (0x05, sp)
      0099C9 14 01            [ 1]  666 	and	a, (0x01, sp)
      0099CB 27 03            [ 1]  667 	jreq	00107$
                                    668 ;	HAL_I2C.c: 370: bitstatus = 1;
      0099CD A6 01            [ 1]  669 	ld	a, #0x01
                                    670 ;	HAL_I2C.c: 375: bitstatus = 0;
      0099CF 21                     671 	.byte 0x21
      0099D0                        672 00107$:
      0099D0 4F               [ 1]  673 	clr	a
      0099D1                        674 00108$:
                                    675 ;	HAL_I2C.c: 378: return bitstatus;
                                    676 ;	HAL_I2C.c: 379: }
      0099D1 5B 01            [ 2]  677 	addw	sp, #1
      0099D3 81               [ 4]  678 	ret
                                    679 ;	HAL_I2C.c: 381: void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
                                    680 ;	-----------------------------------------
                                    681 ;	 function I2C_ClearFlag
                                    682 ;	-----------------------------------------
      0099D4                        683 _I2C_ClearFlag:
                                    684 ;	HAL_I2C.c: 385: flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
      0099D4 1E 03            [ 2]  685 	ldw	x, (0x03, sp)
      0099D6 4F               [ 1]  686 	clr	a
                                    687 ;	HAL_I2C.c: 387: I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
      0099D7 95               [ 1]  688 	ld	xh, a
      0099D8 53               [ 2]  689 	cplw	x
      0099D9 9F               [ 1]  690 	ld	a, xl
      0099DA C7 52 18         [ 1]  691 	ld	0x5218, a
                                    692 ;	HAL_I2C.c: 388: }
      0099DD 81               [ 4]  693 	ret
                                    694 ;	HAL_I2C.c: 390: uint8_t I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    695 ;	-----------------------------------------
                                    696 ;	 function I2C_GetITStatus
                                    697 ;	-----------------------------------------
      0099DE                        698 _I2C_GetITStatus:
      0099DE 52 04            [ 2]  699 	sub	sp, #4
                                    700 ;	HAL_I2C.c: 393: volatile uint8_t enablestatus = 0;
      0099E0 0F 03            [ 1]  701 	clr	(0x03, sp)
                                    702 ;	HAL_I2C.c: 396: tempregister = (uint8_t)(((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
      0099E2 1E 07            [ 2]  703 	ldw	x, (0x07, sp)
      0099E4 0F 02            [ 1]  704 	clr	(0x02, sp)
      0099E6 9E               [ 1]  705 	ld	a, xh
      0099E7 A4 07            [ 1]  706 	and	a, #0x07
      0099E9 6B 04            [ 1]  707 	ld	(0x04, sp), a
                                    708 ;	HAL_I2C.c: 399: enablestatus = (uint8_t)(I2C->ITR & (uint8_t)tempregister);
      0099EB C6 52 1A         [ 1]  709 	ld	a, 0x521a
      0099EE 14 04            [ 1]  710 	and	a, (0x04, sp)
      0099F0 6B 03            [ 1]  711 	ld	(0x03, sp), a
                                    712 ;	HAL_I2C.c: 401: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0099F2 4F               [ 1]  713 	clr	a
      0099F3 02               [ 1]  714 	rlwa	x
      0099F4 A4 30            [ 1]  715 	and	a, #0x30
      0099F6 95               [ 1]  716 	ld	xh, a
                                    717 ;	HAL_I2C.c: 404: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
      0099F7 7B 08            [ 1]  718 	ld	a, (0x08, sp)
      0099F9 6B 04            [ 1]  719 	ld	(0x04, sp), a
                                    720 ;	HAL_I2C.c: 401: if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
      0099FB A3 01 00         [ 2]  721 	cpw	x, #0x0100
      0099FE 26 12            [ 1]  722 	jrne	00110$
                                    723 ;	HAL_I2C.c: 404: if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
      009A00 C6 52 17         [ 1]  724 	ld	a, 0x5217
      009A03 14 04            [ 1]  725 	and	a, (0x04, sp)
      009A05 27 08            [ 1]  726 	jreq	00102$
      009A07 0D 03            [ 1]  727 	tnz	(0x03, sp)
      009A09 27 04            [ 1]  728 	jreq	00102$
                                    729 ;	HAL_I2C.c: 407: bitstatus = 1;
      009A0B A6 01            [ 1]  730 	ld	a, #0x01
      009A0D 20 12            [ 2]  731 	jra	00111$
      009A0F                        732 00102$:
                                    733 ;	HAL_I2C.c: 412: bitstatus = 0;
      009A0F 4F               [ 1]  734 	clr	a
      009A10 20 0F            [ 2]  735 	jra	00111$
      009A12                        736 00110$:
                                    737 ;	HAL_I2C.c: 418: if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != 0) && enablestatus)
      009A12 C6 52 18         [ 1]  738 	ld	a, 0x5218
      009A15 14 04            [ 1]  739 	and	a, (0x04, sp)
      009A17 27 07            [ 1]  740 	jreq	00106$
      009A19 0D 03            [ 1]  741 	tnz	(0x03, sp)
      009A1B 27 03            [ 1]  742 	jreq	00106$
                                    743 ;	HAL_I2C.c: 421: bitstatus = 1;
      009A1D A6 01            [ 1]  744 	ld	a, #0x01
                                    745 ;	HAL_I2C.c: 426: bitstatus = 0;
      009A1F 21                     746 	.byte 0x21
      009A20                        747 00106$:
      009A20 4F               [ 1]  748 	clr	a
      009A21                        749 00111$:
                                    750 ;	HAL_I2C.c: 430: return  bitstatus;
                                    751 ;	HAL_I2C.c: 432: }
      009A21 5B 04            [ 2]  752 	addw	sp, #4
      009A23 81               [ 4]  753 	ret
                                    754 ;	HAL_I2C.c: 434: void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
                                    755 ;	-----------------------------------------
                                    756 ;	 function I2C_ClearITPendingBit
                                    757 ;	-----------------------------------------
      009A24                        758 _I2C_ClearITPendingBit:
                                    759 ;	HAL_I2C.c: 438: flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
      009A24 1E 03            [ 2]  760 	ldw	x, (0x03, sp)
      009A26 4F               [ 1]  761 	clr	a
                                    762 ;	HAL_I2C.c: 441: I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
      009A27 95               [ 1]  763 	ld	xh, a
      009A28 53               [ 2]  764 	cplw	x
      009A29 9F               [ 1]  765 	ld	a, xl
      009A2A C7 52 18         [ 1]  766 	ld	0x5218, a
                                    767 ;	HAL_I2C.c: 442: }
      009A2D 81               [ 4]  768 	ret
                                    769 	.area CODE
                                    770 	.area CONST
                                    771 	.area INITIALIZER
                                    772 	.area CABS (ABS)
