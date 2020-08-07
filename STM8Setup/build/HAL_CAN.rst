                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_CAN
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __FMI
                                     12 	.globl __Data
                                     13 	.globl __DLC
                                     14 	.globl __RTR
                                     15 	.globl __IDE
                                     16 	.globl __Id
                                     17 	.globl _CAN_DeInit
                                     18 	.globl _CAN_Init
                                     19 	.globl _CAN_FilterInit
                                     20 	.globl _CAN_ITConfig
                                     21 	.globl _CAN_ST7CompatibilityCmd
                                     22 	.globl _CAN_TTComModeCmd
                                     23 	.globl _CAN_Transmit
                                     24 	.globl _CAN_TransmitStatus
                                     25 	.globl _CAN_CancelTransmit
                                     26 	.globl _CAN_FIFORelease
                                     27 	.globl _CAN_MessagePending
                                     28 	.globl _CAN_Receive
                                     29 	.globl _CAN_GetReceivedId
                                     30 	.globl _CAN_GetReceivedIDE
                                     31 	.globl _CAN_GetReceivedRTR
                                     32 	.globl _CAN_GetReceivedDLC
                                     33 	.globl _CAN_GetReceivedData
                                     34 	.globl _CAN_GetReceivedFMI
                                     35 	.globl _CAN_GetMessageTimeStamp
                                     36 	.globl _CAN_Sleep
                                     37 	.globl _CAN_WakeUp
                                     38 	.globl _CAN_OperatingModeRequest
                                     39 	.globl _CAN_GetLastErrorCode
                                     40 	.globl _CAN_ClearFlag
                                     41 	.globl _CAN_GetFlagStatus
                                     42 	.globl _CAN_GetITStatus
                                     43 	.globl _CAN_ClearITPendingBit
                                     44 	.globl _CAN_GetSelectedPage
                                     45 	.globl _CAN_SelectPage
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DATA
                                     50 ;--------------------------------------------------------
                                     51 ; ram data
                                     52 ;--------------------------------------------------------
                                     53 	.area INITIALIZED
      000005                         54 __Id::
      000005                         55 	.ds 4
      000009                         56 __IDE::
      000009                         57 	.ds 1
      00000A                         58 __RTR::
      00000A                         59 	.ds 1
      00000B                         60 __DLC::
      00000B                         61 	.ds 1
      00000C                         62 __Data::
      00000C                         63 	.ds 8
      000014                         64 __FMI::
      000014                         65 	.ds 1
                                     66 ;--------------------------------------------------------
                                     67 ; absolute external ram data
                                     68 ;--------------------------------------------------------
                                     69 	.area DABS (ABS)
                                     70 
                                     71 ; default segment ordering for linker
                                     72 	.area HOME
                                     73 	.area GSINIT
                                     74 	.area GSFINAL
                                     75 	.area CONST
                                     76 	.area INITIALIZER
                                     77 	.area CODE
                                     78 
                                     79 ;--------------------------------------------------------
                                     80 ; global & static initialisations
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area GSINIT
                                     84 	.area GSFINAL
                                     85 	.area GSINIT
                                     86 ;--------------------------------------------------------
                                     87 ; Home
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area HOME
                                     91 ;--------------------------------------------------------
                                     92 ; code
                                     93 ;--------------------------------------------------------
                                     94 	.area CODE
                                     95 ;	HAL_CAN.c: 23: void CAN_DeInit(void)
                                     96 ;	-----------------------------------------
                                     97 ;	 function CAN_DeInit
                                     98 ;	-----------------------------------------
      008AA1                         99 _CAN_DeInit:
                                    100 ;	HAL_CAN.c: 26: CAN->MCR = CAN_MCR_INRQ;
      008AA1 35 01 54 20      [ 1]  101 	mov	0x5420+0, #0x01
                                    102 ;	HAL_CAN.c: 27: CAN->PSR = CAN_Page_Config;
      008AA5 35 06 54 27      [ 1]  103 	mov	0x5427+0, #0x06
                                    104 ;	HAL_CAN.c: 28: CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
      008AA9 4B 00            [ 1]  105 	push	#0x00
      008AAB CD 93 7D         [ 4]  106 	call	_CAN_OperatingModeRequest
      008AAE 84               [ 1]  107 	pop	a
                                    108 ;	HAL_CAN.c: 29: CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
      008AAF 35 00 54 28      [ 1]  109 	mov	0x5428+0, #0x00
                                    110 ;	HAL_CAN.c: 30: CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
      008AB3 35 00 54 29      [ 1]  111 	mov	0x5429+0, #0x00
                                    112 ;	HAL_CAN.c: 31: CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
      008AB7 35 40 54 2C      [ 1]  113 	mov	0x542c+0, #0x40
                                    114 ;	HAL_CAN.c: 32: CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
      008ABB 35 23 54 2D      [ 1]  115 	mov	0x542d+0, #0x23
                                    116 ;	HAL_CAN.c: 33: CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
      008ABF 35 00 54 30      [ 1]  117 	mov	0x5430+0, #0x00
                                    118 ;	HAL_CAN.c: 34: CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
      008AC3 35 00 54 31      [ 1]  119 	mov	0x5431+0, #0x00
                                    120 ;	HAL_CAN.c: 35: CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
      008AC7 35 00 54 32      [ 1]  121 	mov	0x5432+0, #0x00
                                    122 ;	HAL_CAN.c: 36: CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
      008ACB 35 00 54 33      [ 1]  123 	mov	0x5433+0, #0x00
                                    124 ;	HAL_CAN.c: 37: CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
      008ACF 35 00 54 34      [ 1]  125 	mov	0x5434+0, #0x00
                                    126 ;	HAL_CAN.c: 38: CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
      008AD3 4B 01            [ 1]  127 	push	#0x01
      008AD5 CD 93 7D         [ 4]  128 	call	_CAN_OperatingModeRequest
      008AD8 84               [ 1]  129 	pop	a
                                    130 ;	HAL_CAN.c: 39: CAN->PSR = CAN_Page_RxFifo;
      008AD9 35 07 54 27      [ 1]  131 	mov	0x5427+0, #0x07
                                    132 ;	HAL_CAN.c: 40: CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
      008ADD 35 00 54 29      [ 1]  133 	mov	0x5429+0, #0x00
                                    134 ;	HAL_CAN.c: 41: CAN->PSR = CAN_Page_TxMailBox0;
      008AE1 35 00 54 27      [ 1]  135 	mov	0x5427+0, #0x00
                                    136 ;	HAL_CAN.c: 42: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
      008AE5 35 00 54 29      [ 1]  137 	mov	0x5429+0, #0x00
                                    138 ;	HAL_CAN.c: 43: CAN->PSR = CAN_Page_TxMailBox1;
      008AE9 35 01 54 27      [ 1]  139 	mov	0x5427+0, #0x01
                                    140 ;	HAL_CAN.c: 44: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
      008AED 35 00 54 29      [ 1]  141 	mov	0x5429+0, #0x00
                                    142 ;	HAL_CAN.c: 45: CAN->PSR = CAN_Page_TxMailBox2;
      008AF1 35 05 54 27      [ 1]  143 	mov	0x5427+0, #0x05
                                    144 ;	HAL_CAN.c: 46: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
      008AF5 35 00 54 29      [ 1]  145 	mov	0x5429+0, #0x00
                                    146 ;	HAL_CAN.c: 48: CAN->MCR = CAN_MCR_RESET_VALUE;
      008AF9 35 02 54 20      [ 1]  147 	mov	0x5420+0, #0x02
                                    148 ;	HAL_CAN.c: 49: CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
      008AFD 35 FD 54 21      [ 1]  149 	mov	0x5421+0, #0xfd
                                    150 ;	HAL_CAN.c: 50: CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
      008B01 35 FF 54 22      [ 1]  151 	mov	0x5422+0, #0xff
                                    152 ;	HAL_CAN.c: 51: CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
      008B05 35 FF 54 24      [ 1]  153 	mov	0x5424+0, #0xff
                                    154 ;	HAL_CAN.c: 52: CAN->IER = CAN_IER_RESET_VALUE;
      008B09 35 00 54 25      [ 1]  155 	mov	0x5425+0, #0x00
                                    156 ;	HAL_CAN.c: 53: CAN->DGR = CAN_DGR_RESET_VALUE;
      008B0D 35 0C 54 26      [ 1]  157 	mov	0x5426+0, #0x0c
                                    158 ;	HAL_CAN.c: 54: CAN->PSR = CAN_PSR_RESET_VALUE;
      008B11 35 00 54 27      [ 1]  159 	mov	0x5427+0, #0x00
                                    160 ;	HAL_CAN.c: 55: }
      008B15 81               [ 4]  161 	ret
                                    162 ;	HAL_CAN.c: 57: CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
                                    163 ;	-----------------------------------------
                                    164 ;	 function CAN_Init
                                    165 ;	-----------------------------------------
      008B16                        166 _CAN_Init:
      008B16 88               [ 1]  167 	push	a
                                    168 ;	HAL_CAN.c: 66: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      008B17 CD 96 E8         [ 4]  169 	call	_CAN_GetSelectedPage
      008B1A 90 97            [ 1]  170 	ld	yl, a
                                    171 ;	HAL_CAN.c: 69: CAN->MCR = CAN_MCR_INRQ;
      008B1C 35 01 54 20      [ 1]  172 	mov	0x5420+0, #0x01
                                    173 ;	HAL_CAN.c: 71: while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
      008B20 5F               [ 1]  174 	clrw	x
      008B21 5A               [ 2]  175 	decw	x
      008B22                        176 00102$:
      008B22 C6 54 21         [ 1]  177 	ld	a, 0x5421
      008B25 A4 01            [ 1]  178 	and	a, #0x01
      008B27 4A               [ 1]  179 	dec	a
      008B28 27 06            [ 1]  180 	jreq	00104$
      008B2A 5D               [ 2]  181 	tnzw	x
      008B2B 27 03            [ 1]  182 	jreq	00104$
                                    183 ;	HAL_CAN.c: 73: timeout--;
      008B2D 5A               [ 2]  184 	decw	x
      008B2E 20 F2            [ 2]  185 	jra	00102$
      008B30                        186 00104$:
                                    187 ;	HAL_CAN.c: 77: if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
      008B30 C6 54 21         [ 1]  188 	ld	a, 0x5421
      008B33 A4 01            [ 1]  189 	and	a, #0x01
      008B35 4A               [ 1]  190 	dec	a
      008B36 27 04            [ 1]  191 	jreq	00113$
                                    192 ;	HAL_CAN.c: 80: InitStatus = CAN_InitStatus_Failed;
      008B38 0F 01            [ 1]  193 	clr	(0x01, sp)
      008B3A 20 47            [ 2]  194 	jra	00114$
      008B3C                        195 00113$:
                                    196 ;	HAL_CAN.c: 87: CAN->MCR |= (uint8_t)CAN_MasterCtrl;
      008B3C C6 54 20         [ 1]  197 	ld	a, 0x5420
      008B3F 1A 04            [ 1]  198 	or	a, (0x04, sp)
      008B41 C7 54 20         [ 1]  199 	ld	0x5420, a
                                    200 ;	HAL_CAN.c: 90: CAN->DGR |= (uint8_t)CAN_Mode;
      008B44 C6 54 26         [ 1]  201 	ld	a, 0x5426
      008B47 1A 05            [ 1]  202 	or	a, (0x05, sp)
      008B49 C7 54 26         [ 1]  203 	ld	0x5426, a
                                    204 ;	HAL_CAN.c: 91: CAN->PSR = CAN_Page_Config;
      008B4C 35 06 54 27      [ 1]  205 	mov	0x5427+0, #0x06
                                    206 ;	HAL_CAN.c: 92: CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
      008B50 7B 09            [ 1]  207 	ld	a, (0x09, sp)
      008B52 4A               [ 1]  208 	dec	a
      008B53 1A 06            [ 1]  209 	or	a, (0x06, sp)
      008B55 C7 54 2C         [ 1]  210 	ld	0x542c, a
                                    211 ;	HAL_CAN.c: 93: CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
      008B58 7B 07            [ 1]  212 	ld	a, (0x07, sp)
      008B5A 1A 08            [ 1]  213 	or	a, (0x08, sp)
      008B5C C7 54 2D         [ 1]  214 	ld	0x542d, a
                                    215 ;	HAL_CAN.c: 96: CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
      008B5F 72 11 54 20      [ 1]  216 	bres	21536, #0
                                    217 ;	HAL_CAN.c: 99: while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01)) && (timeout != 0))
      008B63 5F               [ 1]  218 	clrw	x
      008B64 5A               [ 2]  219 	decw	x
      008B65                        220 00106$:
      008B65 C6 54 21         [ 1]  221 	ld	a, 0x5421
      008B68 A4 01            [ 1]  222 	and	a, #0x01
      008B6A 4A               [ 1]  223 	dec	a
      008B6B 26 06            [ 1]  224 	jrne	00108$
      008B6D 5D               [ 2]  225 	tnzw	x
      008B6E 27 03            [ 1]  226 	jreq	00108$
                                    227 ;	HAL_CAN.c: 101: timeout--;
      008B70 5A               [ 2]  228 	decw	x
      008B71 20 F2            [ 2]  229 	jra	00106$
      008B73                        230 00108$:
                                    231 ;	HAL_CAN.c: 104: if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
      008B73 C6 54 21         [ 1]  232 	ld	a, 0x5421
      008B76 A4 01            [ 1]  233 	and	a, #0x01
      008B78 4A               [ 1]  234 	dec	a
      008B79 26 04            [ 1]  235 	jrne	00110$
                                    236 ;	HAL_CAN.c: 106: InitStatus = CAN_InitStatus_Failed;
      008B7B 0F 01            [ 1]  237 	clr	(0x01, sp)
      008B7D 20 04            [ 2]  238 	jra	00114$
      008B7F                        239 00110$:
                                    240 ;	HAL_CAN.c: 110: InitStatus = CAN_InitStatus_Success;
      008B7F A6 01            [ 1]  241 	ld	a, #0x01
      008B81 6B 01            [ 1]  242 	ld	(0x01, sp), a
      008B83                        243 00114$:
                                    244 ;	HAL_CAN.c: 114: CAN_SelectPage(can_page);
      008B83 90 9F            [ 1]  245 	ld	a, yl
      008B85 88               [ 1]  246 	push	a
      008B86 CD 96 EC         [ 4]  247 	call	_CAN_SelectPage
      008B89 84               [ 1]  248 	pop	a
                                    249 ;	HAL_CAN.c: 117: return (CAN_InitStatus_TypeDef)InitStatus;
      008B8A 7B 01            [ 1]  250 	ld	a, (0x01, sp)
                                    251 ;	HAL_CAN.c: 118: }
      008B8C 5B 01            [ 2]  252 	addw	sp, #1
      008B8E 81               [ 4]  253 	ret
                                    254 ;	HAL_CAN.c: 120: void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
                                    255 ;	-----------------------------------------
                                    256 ;	 function CAN_FilterInit
                                    257 ;	-----------------------------------------
      008B8F                        258 _CAN_FilterInit:
      008B8F 52 09            [ 2]  259 	sub	sp, #9
                                    260 ;	HAL_CAN.c: 138: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      008B91 CD 96 E8         [ 4]  261 	call	_CAN_GetSelectedPage
      008B94 6B 01            [ 1]  262 	ld	(0x01, sp), a
                                    263 ;	HAL_CAN.c: 140: if (CAN_FilterNumber == CAN_FilterNumber_0)
      008B96 0D 0C            [ 1]  264 	tnz	(0x0c, sp)
      008B98 26 0E            [ 1]  265 	jrne	00114$
                                    266 ;	HAL_CAN.c: 142: fact = 0x01;
      008B9A A6 01            [ 1]  267 	ld	a, #0x01
      008B9C 6B 02            [ 1]  268 	ld	(0x02, sp), a
                                    269 ;	HAL_CAN.c: 143: fsc = 0x00;
      008B9E 0F 03            [ 1]  270 	clr	(0x03, sp)
                                    271 ;	HAL_CAN.c: 144: fmhl = 0x03;
      008BA0 A6 03            [ 1]  272 	ld	a, #0x03
      008BA2 97               [ 1]  273 	ld	xl, a
                                    274 ;	HAL_CAN.c: 146: can_page_filter = CAN_Page_Filter01;
      008BA3 A6 02            [ 1]  275 	ld	a, #0x02
      008BA5 95               [ 1]  276 	ld	xh, a
      008BA6 20 5F            [ 2]  277 	jra	00115$
      008BA8                        278 00114$:
                                    279 ;	HAL_CAN.c: 148: else if (CAN_FilterNumber == CAN_FilterNumber_1)
      008BA8 7B 0C            [ 1]  280 	ld	a, (0x0c, sp)
      008BAA 4A               [ 1]  281 	dec	a
      008BAB 26 10            [ 1]  282 	jrne	00111$
                                    283 ;	HAL_CAN.c: 150: fact = 0x10;
      008BAD A6 10            [ 1]  284 	ld	a, #0x10
      008BAF 6B 02            [ 1]  285 	ld	(0x02, sp), a
                                    286 ;	HAL_CAN.c: 151: fsc = 0x04;
      008BB1 A6 04            [ 1]  287 	ld	a, #0x04
      008BB3 6B 03            [ 1]  288 	ld	(0x03, sp), a
                                    289 ;	HAL_CAN.c: 152: fmhl = 0x0C;
      008BB5 A6 0C            [ 1]  290 	ld	a, #0x0c
      008BB7 97               [ 1]  291 	ld	xl, a
                                    292 ;	HAL_CAN.c: 154: can_page_filter = CAN_Page_Filter01;
      008BB8 A6 02            [ 1]  293 	ld	a, #0x02
      008BBA 95               [ 1]  294 	ld	xh, a
      008BBB 20 4A            [ 2]  295 	jra	00115$
      008BBD                        296 00111$:
                                    297 ;	HAL_CAN.c: 156: else if (CAN_FilterNumber == CAN_FilterNumber_2)
      008BBD 7B 0C            [ 1]  298 	ld	a, (0x0c, sp)
                                    299 ;	HAL_CAN.c: 158: fact = 0x01;
      008BBF A0 02            [ 1]  300 	sub	a, #0x02
      008BC1 26 0D            [ 1]  301 	jrne	00108$
      008BC3 4C               [ 1]  302 	inc	a
      008BC4 6B 02            [ 1]  303 	ld	(0x02, sp), a
                                    304 ;	HAL_CAN.c: 159: fsc = 0x00;
      008BC6 0F 03            [ 1]  305 	clr	(0x03, sp)
                                    306 ;	HAL_CAN.c: 160: fmhl = 0x30;
      008BC8 A6 30            [ 1]  307 	ld	a, #0x30
      008BCA 97               [ 1]  308 	ld	xl, a
                                    309 ;	HAL_CAN.c: 162: can_page_filter = CAN_Page_Filter23;
      008BCB A6 03            [ 1]  310 	ld	a, #0x03
      008BCD 95               [ 1]  311 	ld	xh, a
      008BCE 20 37            [ 2]  312 	jra	00115$
      008BD0                        313 00108$:
                                    314 ;	HAL_CAN.c: 164: else if (CAN_FilterNumber == CAN_FilterNumber_3)
      008BD0 7B 0C            [ 1]  315 	ld	a, (0x0c, sp)
      008BD2 A1 03            [ 1]  316 	cp	a, #0x03
      008BD4 26 10            [ 1]  317 	jrne	00105$
                                    318 ;	HAL_CAN.c: 166: fact = 0x10;
      008BD6 A6 10            [ 1]  319 	ld	a, #0x10
      008BD8 6B 02            [ 1]  320 	ld	(0x02, sp), a
                                    321 ;	HAL_CAN.c: 167: fsc = 0x04;
      008BDA A6 04            [ 1]  322 	ld	a, #0x04
      008BDC 6B 03            [ 1]  323 	ld	(0x03, sp), a
                                    324 ;	HAL_CAN.c: 168: fmhl = 0xC0;
      008BDE A6 C0            [ 1]  325 	ld	a, #0xc0
      008BE0 97               [ 1]  326 	ld	xl, a
                                    327 ;	HAL_CAN.c: 170: can_page_filter = CAN_Page_Filter23;
      008BE1 A6 03            [ 1]  328 	ld	a, #0x03
      008BE3 95               [ 1]  329 	ld	xh, a
      008BE4 20 21            [ 2]  330 	jra	00115$
      008BE6                        331 00105$:
                                    332 ;	HAL_CAN.c: 172: else if (CAN_FilterNumber == CAN_FilterNumber_4)
      008BE6 7B 0C            [ 1]  333 	ld	a, (0x0c, sp)
                                    334 ;	HAL_CAN.c: 174: fact = 0x01;
      008BE8 A0 04            [ 1]  335 	sub	a, #0x04
      008BEA 26 0D            [ 1]  336 	jrne	00102$
      008BEC 4C               [ 1]  337 	inc	a
      008BED 6B 02            [ 1]  338 	ld	(0x02, sp), a
                                    339 ;	HAL_CAN.c: 175: fsc = 0x00;
      008BEF 0F 03            [ 1]  340 	clr	(0x03, sp)
                                    341 ;	HAL_CAN.c: 176: fmhl = 0x03;
      008BF1 A6 03            [ 1]  342 	ld	a, #0x03
      008BF3 97               [ 1]  343 	ld	xl, a
                                    344 ;	HAL_CAN.c: 178: can_page_filter = CAN_Page_Filter45;
      008BF4 A6 04            [ 1]  345 	ld	a, #0x04
      008BF6 95               [ 1]  346 	ld	xh, a
      008BF7 20 0E            [ 2]  347 	jra	00115$
      008BF9                        348 00102$:
                                    349 ;	HAL_CAN.c: 182: fact = 0x10;
      008BF9 A6 10            [ 1]  350 	ld	a, #0x10
      008BFB 6B 02            [ 1]  351 	ld	(0x02, sp), a
                                    352 ;	HAL_CAN.c: 183: fsc = 0x04;
      008BFD A6 04            [ 1]  353 	ld	a, #0x04
      008BFF 6B 03            [ 1]  354 	ld	(0x03, sp), a
                                    355 ;	HAL_CAN.c: 184: fmhl = 0x0C;
      008C01 A6 0C            [ 1]  356 	ld	a, #0x0c
      008C03 97               [ 1]  357 	ld	xl, a
                                    358 ;	HAL_CAN.c: 186: can_page_filter = CAN_Page_Filter45;
      008C04 A6 04            [ 1]  359 	ld	a, #0x04
      008C06 95               [ 1]  360 	ld	xh, a
      008C07                        361 00115$:
                                    362 ;	HAL_CAN.c: 190: CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
      008C07 89               [ 2]  363 	pushw	x
      008C08 4B 00            [ 1]  364 	push	#0x00
      008C0A CD 93 7D         [ 4]  365 	call	_CAN_OperatingModeRequest
      008C0D 84               [ 1]  366 	pop	a
      008C0E 85               [ 2]  367 	popw	x
                                    368 ;	HAL_CAN.c: 192: CAN->PSR = CAN_Page_Config;
      008C0F 35 06 54 27      [ 1]  369 	mov	0x5427+0, #0x06
                                    370 ;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
      008C13 A6 06            [ 1]  371 	ld	a, #0x06
      008C15 88               [ 1]  372 	push	a
      008C16 7B 04            [ 1]  373 	ld	a, (0x04, sp)
      008C18 27 05            [ 1]  374 	jreq	00322$
      008C1A                        375 00321$:
      008C1A 08 01            [ 1]  376 	sll	(1, sp)
      008C1C 4A               [ 1]  377 	dec	a
      008C1D 26 FB            [ 1]  378 	jrne	00321$
      008C1F                        379 00322$:
      008C1F 7B 10            [ 1]  380 	ld	a, (0x10, sp)
      008C21 6B 09            [ 1]  381 	ld	(0x09, sp), a
      008C23 7B 04            [ 1]  382 	ld	a, (0x04, sp)
      008C25 27 05            [ 1]  383 	jreq	00324$
      008C27                        384 00323$:
      008C27 08 09            [ 1]  385 	sll	(0x09, sp)
      008C29 4A               [ 1]  386 	dec	a
      008C2A 26 FB            [ 1]  387 	jrne	00323$
      008C2C                        388 00324$:
      008C2C 84               [ 1]  389 	pop	a
                                    390 ;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
      008C2D 1A 02            [ 1]  391 	or	a, (0x02, sp)
      008C2F 43               [ 1]  392 	cpl	a
      008C30 6B 09            [ 1]  393 	ld	(0x09, sp), a
                                    394 ;	HAL_CAN.c: 197: if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
      008C32 9E               [ 1]  395 	ld	a, xh
      008C33 A1 02            [ 1]  396 	cp	a, #0x02
      008C35 26 12            [ 1]  397 	jrne	00120$
                                    398 ;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
      008C37 C6 54 32         [ 1]  399 	ld	a, 0x5432
      008C3A 14 09            [ 1]  400 	and	a, (0x09, sp)
      008C3C C7 54 32         [ 1]  401 	ld	0x5432, a
                                    402 ;	HAL_CAN.c: 202: CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
      008C3F C6 54 32         [ 1]  403 	ld	a, 0x5432
      008C42 1A 08            [ 1]  404 	or	a, (0x08, sp)
      008C44 C7 54 32         [ 1]  405 	ld	0x5432, a
      008C47 20 27            [ 2]  406 	jra	00121$
      008C49                        407 00120$:
                                    408 ;	HAL_CAN.c: 204: else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
      008C49 9E               [ 1]  409 	ld	a, xh
      008C4A A1 03            [ 1]  410 	cp	a, #0x03
      008C4C 26 12            [ 1]  411 	jrne	00117$
                                    412 ;	HAL_CAN.c: 207: CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));
      008C4E C6 54 33         [ 1]  413 	ld	a, 0x5433
      008C51 14 09            [ 1]  414 	and	a, (0x09, sp)
      008C53 C7 54 33         [ 1]  415 	ld	0x5433, a
                                    416 ;	HAL_CAN.c: 210: CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
      008C56 C6 54 33         [ 1]  417 	ld	a, 0x5433
      008C59 1A 08            [ 1]  418 	or	a, (0x08, sp)
      008C5B C7 54 33         [ 1]  419 	ld	0x5433, a
      008C5E 20 10            [ 2]  420 	jra	00121$
      008C60                        421 00117$:
                                    422 ;	HAL_CAN.c: 216: CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));
      008C60 C6 54 34         [ 1]  423 	ld	a, 0x5434
      008C63 14 09            [ 1]  424 	and	a, (0x09, sp)
      008C65 C7 54 34         [ 1]  425 	ld	0x5434, a
                                    426 ;	HAL_CAN.c: 219: CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
      008C68 C6 54 34         [ 1]  427 	ld	a, 0x5434
      008C6B 1A 08            [ 1]  428 	or	a, (0x08, sp)
      008C6D C7 54 34         [ 1]  429 	ld	0x5434, a
      008C70                        430 00121$:
                                    431 ;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
      008C70 9F               [ 1]  432 	ld	a, xl
      008C71 43               [ 1]  433 	cpl	a
      008C72 6B 04            [ 1]  434 	ld	(0x04, sp), a
                                    435 ;	HAL_CAN.c: 233: else if (CAN_FilterMode == CAN_FilterMode_IdList)
      008C74 7B 0E            [ 1]  436 	ld	a, (0x0e, sp)
      008C76 4A               [ 1]  437 	dec	a
      008C77 26 05            [ 1]  438 	jrne	00332$
      008C79 A6 01            [ 1]  439 	ld	a, #0x01
      008C7B 6B 05            [ 1]  440 	ld	(0x05, sp), a
      008C7D C5                     441 	.byte 0xc5
      008C7E                        442 00332$:
      008C7E 0F 05            [ 1]  443 	clr	(0x05, sp)
      008C80                        444 00333$:
                                    445 ;	HAL_CAN.c: 238: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
      008C80 7B 0E            [ 1]  446 	ld	a, (0x0e, sp)
      008C82 A0 11            [ 1]  447 	sub	a, #0x11
      008C84 26 04            [ 1]  448 	jrne	00335$
      008C86 4C               [ 1]  449 	inc	a
      008C87 6B 06            [ 1]  450 	ld	(0x06, sp), a
      008C89 C5                     451 	.byte 0xc5
      008C8A                        452 00335$:
      008C8A 0F 06            [ 1]  453 	clr	(0x06, sp)
      008C8C                        454 00336$:
                                    455 ;	HAL_CAN.c: 241: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
      008C8C 9F               [ 1]  456 	ld	a, xl
      008C8D A4 55            [ 1]  457 	and	a, #0x55
      008C8F 6B 07            [ 1]  458 	ld	(0x07, sp), a
                                    459 ;	HAL_CAN.c: 246: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
      008C91 9F               [ 1]  460 	ld	a, xl
      008C92 A4 AA            [ 1]  461 	and	a, #0xaa
      008C94 6B 08            [ 1]  462 	ld	(0x08, sp), a
                                    463 ;	HAL_CAN.c: 225: if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
      008C96 9E               [ 1]  464 	ld	a, xh
      008C97 A1 04            [ 1]  465 	cp	a, #0x04
      008C99 27 2D            [ 1]  466 	jreq	00141$
                                    467 ;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
      008C9B C6 54 30         [ 1]  468 	ld	a, 0x5430
                                    469 ;	HAL_CAN.c: 228: if (CAN_FilterMode == CAN_FilterMode_IdMask)
      008C9E 0D 0E            [ 1]  470 	tnz	(0x0e, sp)
      008CA0 26 07            [ 1]  471 	jrne	00129$
                                    472 ;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
      008CA2 14 04            [ 1]  473 	and	a, (0x04, sp)
      008CA4 C7 54 30         [ 1]  474 	ld	0x5430, a
      008CA7 20 54            [ 2]  475 	jra	00142$
      008CA9                        476 00129$:
                                    477 ;	HAL_CAN.c: 233: else if (CAN_FilterMode == CAN_FilterMode_IdList)
      008CA9 0D 05            [ 1]  478 	tnz	(0x05, sp)
      008CAB 27 09            [ 1]  479 	jreq	00126$
                                    480 ;	HAL_CAN.c: 236: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
      008CAD 89               [ 2]  481 	pushw	x
      008CAE 1A 02            [ 1]  482 	or	a, (2, sp)
      008CB0 85               [ 2]  483 	popw	x
      008CB1 C7 54 30         [ 1]  484 	ld	0x5430, a
      008CB4 20 47            [ 2]  485 	jra	00142$
      008CB6                        486 00126$:
                                    487 ;	HAL_CAN.c: 238: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
      008CB6 0D 06            [ 1]  488 	tnz	(0x06, sp)
      008CB8 27 07            [ 1]  489 	jreq	00123$
                                    490 ;	HAL_CAN.c: 241: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
      008CBA 1A 07            [ 1]  491 	or	a, (0x07, sp)
      008CBC C7 54 30         [ 1]  492 	ld	0x5430, a
      008CBF 20 3C            [ 2]  493 	jra	00142$
      008CC1                        494 00123$:
                                    495 ;	HAL_CAN.c: 246: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
      008CC1 1A 08            [ 1]  496 	or	a, (0x08, sp)
      008CC3 C7 54 30         [ 1]  497 	ld	0x5430, a
      008CC6 20 35            [ 2]  498 	jra	00142$
      008CC8                        499 00141$:
                                    500 ;	HAL_CAN.c: 258: CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
      008CC8 C6 54 31         [ 1]  501 	ld	a, 0x5431
      008CCB 6B 09            [ 1]  502 	ld	(0x09, sp), a
                                    503 ;	HAL_CAN.c: 255: if (CAN_FilterMode == CAN_FilterMode_IdMask)
      008CCD 0D 0E            [ 1]  504 	tnz	(0x0e, sp)
      008CCF 26 09            [ 1]  505 	jrne	00138$
                                    506 ;	HAL_CAN.c: 258: CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
      008CD1 7B 09            [ 1]  507 	ld	a, (0x09, sp)
      008CD3 14 04            [ 1]  508 	and	a, (0x04, sp)
      008CD5 C7 54 31         [ 1]  509 	ld	0x5431, a
      008CD8 20 23            [ 2]  510 	jra	00142$
      008CDA                        511 00138$:
                                    512 ;	HAL_CAN.c: 260: else if (CAN_FilterMode == CAN_FilterMode_IdList)
      008CDA 0D 05            [ 1]  513 	tnz	(0x05, sp)
      008CDC 27 0B            [ 1]  514 	jreq	00135$
                                    515 ;	HAL_CAN.c: 263: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
      008CDE 89               [ 2]  516 	pushw	x
      008CDF 7B 0B            [ 1]  517 	ld	a, (0x0b, sp)
      008CE1 1A 02            [ 1]  518 	or	a, (2, sp)
      008CE3 85               [ 2]  519 	popw	x
      008CE4 C7 54 31         [ 1]  520 	ld	0x5431, a
      008CE7 20 14            [ 2]  521 	jra	00142$
      008CE9                        522 00135$:
                                    523 ;	HAL_CAN.c: 265: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
      008CE9 0D 06            [ 1]  524 	tnz	(0x06, sp)
      008CEB 27 09            [ 1]  525 	jreq	00132$
                                    526 ;	HAL_CAN.c: 268: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
      008CED 7B 09            [ 1]  527 	ld	a, (0x09, sp)
      008CEF 1A 07            [ 1]  528 	or	a, (0x07, sp)
      008CF1 C7 54 31         [ 1]  529 	ld	0x5431, a
      008CF4 20 07            [ 2]  530 	jra	00142$
      008CF6                        531 00132$:
                                    532 ;	HAL_CAN.c: 273: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
      008CF6 7B 09            [ 1]  533 	ld	a, (0x09, sp)
      008CF8 1A 08            [ 1]  534 	or	a, (0x08, sp)
      008CFA C7 54 31         [ 1]  535 	ld	0x5431, a
      008CFD                        536 00142$:
                                    537 ;	HAL_CAN.c: 279: CAN->PSR = (uint8_t)can_page_filter;
      008CFD 90 AE 54 27      [ 2]  538 	ldw	y, #0x5427
      008D01 9E               [ 1]  539 	ld	a, xh
      008D02 90 F7            [ 1]  540 	ld	(y), a
                                    541 ;	HAL_CAN.c: 294: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
      008D04 7B 0F            [ 1]  542 	ld	a, (0x0f, sp)
      008D06 A0 02            [ 1]  543 	sub	a, #0x02
      008D08 26 04            [ 1]  544 	jrne	00347$
      008D0A 4C               [ 1]  545 	inc	a
      008D0B 6B 08            [ 1]  546 	ld	(0x08, sp), a
      008D0D C5                     547 	.byte 0xc5
      008D0E                        548 00347$:
      008D0E 0F 08            [ 1]  549 	clr	(0x08, sp)
      008D10                        550 00348$:
                                    551 ;	HAL_CAN.c: 305: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
      008D10 7B 0F            [ 1]  552 	ld	a, (0x0f, sp)
      008D12 A0 04            [ 1]  553 	sub	a, #0x04
      008D14 26 04            [ 1]  554 	jrne	00350$
      008D16 4C               [ 1]  555 	inc	a
      008D17 6B 09            [ 1]  556 	ld	(0x09, sp), a
      008D19 C5                     557 	.byte 0xc5
      008D1A                        558 00350$:
      008D1A 0F 09            [ 1]  559 	clr	(0x09, sp)
      008D1C                        560 00351$:
                                    561 ;	HAL_CAN.c: 316: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
      008D1C 7B 0F            [ 1]  562 	ld	a, (0x0f, sp)
      008D1E A0 06            [ 1]  563 	sub	a, #0x06
      008D20 26 02            [ 1]  564 	jrne	00353$
      008D22 4C               [ 1]  565 	inc	a
      008D23 21                     566 	.byte 0x21
      008D24                        567 00353$:
      008D24 4F               [ 1]  568 	clr	a
      008D25                        569 00354$:
                                    570 ;	HAL_CAN.c: 280: if (fsc != 0)
      008D25 0D 03            [ 1]  571 	tnz	(0x03, sp)
      008D27 26 03            [ 1]  572 	jrne	00355$
      008D29 CC 8E 0A         [ 2]  573 	jp	00166$
      008D2C                        574 00355$:
                                    575 ;	HAL_CAN.c: 283: if (CAN_FilterScale == CAN_FilterScale_8Bit)
      008D2C 0D 0F            [ 1]  576 	tnz	(0x0f, sp)
      008D2E 26 33            [ 1]  577 	jrne	00152$
                                    578 ;	HAL_CAN.c: 285: CAN->Page.Filter.FR09 = CAN_FilterID1;
      008D30 AE 54 30         [ 2]  579 	ldw	x, #0x5430
      008D33 7B 10            [ 1]  580 	ld	a, (0x10, sp)
      008D35 F7               [ 1]  581 	ld	(x), a
                                    582 ;	HAL_CAN.c: 286: CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
      008D36 AE 54 31         [ 2]  583 	ldw	x, #0x5431
      008D39 7B 14            [ 1]  584 	ld	a, (0x14, sp)
      008D3B F7               [ 1]  585 	ld	(x), a
                                    586 ;	HAL_CAN.c: 287: CAN->Page.Filter.FR11 = CAN_FilterID2;
      008D3C AE 54 32         [ 2]  587 	ldw	x, #0x5432
      008D3F 7B 11            [ 1]  588 	ld	a, (0x11, sp)
      008D41 F7               [ 1]  589 	ld	(x), a
                                    590 ;	HAL_CAN.c: 288: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
      008D42 AE 54 33         [ 2]  591 	ldw	x, #0x5433
      008D45 7B 15            [ 1]  592 	ld	a, (0x15, sp)
      008D47 F7               [ 1]  593 	ld	(x), a
                                    594 ;	HAL_CAN.c: 289: CAN->Page.Filter.FR13 = CAN_FilterID3;
      008D48 AE 54 34         [ 2]  595 	ldw	x, #0x5434
      008D4B 7B 12            [ 1]  596 	ld	a, (0x12, sp)
      008D4D F7               [ 1]  597 	ld	(x), a
                                    598 ;	HAL_CAN.c: 290: CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
      008D4E AE 54 35         [ 2]  599 	ldw	x, #0x5435
      008D51 7B 16            [ 1]  600 	ld	a, (0x16, sp)
      008D53 F7               [ 1]  601 	ld	(x), a
                                    602 ;	HAL_CAN.c: 291: CAN->Page.Filter.FR15 = CAN_FilterID4;
      008D54 AE 54 36         [ 2]  603 	ldw	x, #0x5436
      008D57 7B 13            [ 1]  604 	ld	a, (0x13, sp)
      008D59 F7               [ 1]  605 	ld	(x), a
                                    606 ;	HAL_CAN.c: 292: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
      008D5A AE 54 37         [ 2]  607 	ldw	x, #0x5437
      008D5D 7B 17            [ 1]  608 	ld	a, (0x17, sp)
      008D5F F7               [ 1]  609 	ld	(x), a
      008D60 CC 8E E0         [ 2]  610 	jp	00167$
      008D63                        611 00152$:
                                    612 ;	HAL_CAN.c: 294: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
      008D63 0D 08            [ 1]  613 	tnz	(0x08, sp)
      008D65 27 33            [ 1]  614 	jreq	00149$
                                    615 ;	HAL_CAN.c: 296: CAN->Page.Filter.FR09 = CAN_FilterID1;
      008D67 AE 54 30         [ 2]  616 	ldw	x, #0x5430
      008D6A 7B 10            [ 1]  617 	ld	a, (0x10, sp)
      008D6C F7               [ 1]  618 	ld	(x), a
                                    619 ;	HAL_CAN.c: 297: CAN->Page.Filter.FR10 = CAN_FilterID2;
      008D6D AE 54 31         [ 2]  620 	ldw	x, #0x5431
      008D70 7B 11            [ 1]  621 	ld	a, (0x11, sp)
      008D72 F7               [ 1]  622 	ld	(x), a
                                    623 ;	HAL_CAN.c: 298: CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
      008D73 AE 54 32         [ 2]  624 	ldw	x, #0x5432
      008D76 7B 14            [ 1]  625 	ld	a, (0x14, sp)
      008D78 F7               [ 1]  626 	ld	(x), a
                                    627 ;	HAL_CAN.c: 299: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
      008D79 AE 54 33         [ 2]  628 	ldw	x, #0x5433
      008D7C 7B 15            [ 1]  629 	ld	a, (0x15, sp)
      008D7E F7               [ 1]  630 	ld	(x), a
                                    631 ;	HAL_CAN.c: 300: CAN->Page.Filter.FR13 = CAN_FilterID3;
      008D7F AE 54 34         [ 2]  632 	ldw	x, #0x5434
      008D82 7B 12            [ 1]  633 	ld	a, (0x12, sp)
      008D84 F7               [ 1]  634 	ld	(x), a
                                    635 ;	HAL_CAN.c: 301: CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
      008D85 AE 54 35         [ 2]  636 	ldw	x, #0x5435
      008D88 7B 16            [ 1]  637 	ld	a, (0x16, sp)
      008D8A F7               [ 1]  638 	ld	(x), a
                                    639 ;	HAL_CAN.c: 302: CAN->Page.Filter.FR15 = CAN_FilterID4;
      008D8B AE 54 36         [ 2]  640 	ldw	x, #0x5436
      008D8E 7B 13            [ 1]  641 	ld	a, (0x13, sp)
      008D90 F7               [ 1]  642 	ld	(x), a
                                    643 ;	HAL_CAN.c: 303: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
      008D91 AE 54 37         [ 2]  644 	ldw	x, #0x5437
      008D94 7B 17            [ 1]  645 	ld	a, (0x17, sp)
      008D96 F7               [ 1]  646 	ld	(x), a
      008D97 CC 8E E0         [ 2]  647 	jp	00167$
      008D9A                        648 00149$:
                                    649 ;	HAL_CAN.c: 305: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
      008D9A 0D 09            [ 1]  650 	tnz	(0x09, sp)
      008D9C 27 33            [ 1]  651 	jreq	00146$
                                    652 ;	HAL_CAN.c: 307: CAN->Page.Filter.FR09 = CAN_FilterID1;
      008D9E AE 54 30         [ 2]  653 	ldw	x, #0x5430
      008DA1 7B 10            [ 1]  654 	ld	a, (0x10, sp)
      008DA3 F7               [ 1]  655 	ld	(x), a
                                    656 ;	HAL_CAN.c: 308: CAN->Page.Filter.FR10 = CAN_FilterID2;
      008DA4 AE 54 31         [ 2]  657 	ldw	x, #0x5431
      008DA7 7B 11            [ 1]  658 	ld	a, (0x11, sp)
      008DA9 F7               [ 1]  659 	ld	(x), a
                                    660 ;	HAL_CAN.c: 309: CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
      008DAA AE 54 32         [ 2]  661 	ldw	x, #0x5432
      008DAD 7B 14            [ 1]  662 	ld	a, (0x14, sp)
      008DAF F7               [ 1]  663 	ld	(x), a
                                    664 ;	HAL_CAN.c: 310: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
      008DB0 AE 54 33         [ 2]  665 	ldw	x, #0x5433
      008DB3 7B 15            [ 1]  666 	ld	a, (0x15, sp)
      008DB5 F7               [ 1]  667 	ld	(x), a
                                    668 ;	HAL_CAN.c: 311: CAN->Page.Filter.FR13 = CAN_FilterID3;
      008DB6 AE 54 34         [ 2]  669 	ldw	x, #0x5434
      008DB9 7B 12            [ 1]  670 	ld	a, (0x12, sp)
      008DBB F7               [ 1]  671 	ld	(x), a
                                    672 ;	HAL_CAN.c: 312: CAN->Page.Filter.FR14 = CAN_FilterID4;
      008DBC AE 54 35         [ 2]  673 	ldw	x, #0x5435
      008DBF 7B 13            [ 1]  674 	ld	a, (0x13, sp)
      008DC1 F7               [ 1]  675 	ld	(x), a
                                    676 ;	HAL_CAN.c: 313: CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
      008DC2 AE 54 36         [ 2]  677 	ldw	x, #0x5436
      008DC5 7B 16            [ 1]  678 	ld	a, (0x16, sp)
      008DC7 F7               [ 1]  679 	ld	(x), a
                                    680 ;	HAL_CAN.c: 314: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
      008DC8 AE 54 37         [ 2]  681 	ldw	x, #0x5437
      008DCB 7B 17            [ 1]  682 	ld	a, (0x17, sp)
      008DCD F7               [ 1]  683 	ld	(x), a
      008DCE CC 8E E0         [ 2]  684 	jp	00167$
      008DD1                        685 00146$:
                                    686 ;	HAL_CAN.c: 316: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
      008DD1 4D               [ 1]  687 	tnz	a
      008DD2 26 03            [ 1]  688 	jrne	00359$
      008DD4 CC 8E E0         [ 2]  689 	jp	00167$
      008DD7                        690 00359$:
                                    691 ;	HAL_CAN.c: 318: CAN->Page.Filter.FR09 = CAN_FilterID1;
      008DD7 AE 54 30         [ 2]  692 	ldw	x, #0x5430
      008DDA 7B 10            [ 1]  693 	ld	a, (0x10, sp)
      008DDC F7               [ 1]  694 	ld	(x), a
                                    695 ;	HAL_CAN.c: 319: CAN->Page.Filter.FR10 = CAN_FilterID2;
      008DDD AE 54 31         [ 2]  696 	ldw	x, #0x5431
      008DE0 7B 11            [ 1]  697 	ld	a, (0x11, sp)
      008DE2 F7               [ 1]  698 	ld	(x), a
                                    699 ;	HAL_CAN.c: 320: CAN->Page.Filter.FR11 = CAN_FilterID3;
      008DE3 AE 54 32         [ 2]  700 	ldw	x, #0x5432
      008DE6 7B 12            [ 1]  701 	ld	a, (0x12, sp)
      008DE8 F7               [ 1]  702 	ld	(x), a
                                    703 ;	HAL_CAN.c: 321: CAN->Page.Filter.FR12 = CAN_FilterID4;
      008DE9 AE 54 33         [ 2]  704 	ldw	x, #0x5433
      008DEC 7B 13            [ 1]  705 	ld	a, (0x13, sp)
      008DEE F7               [ 1]  706 	ld	(x), a
                                    707 ;	HAL_CAN.c: 322: CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
      008DEF AE 54 34         [ 2]  708 	ldw	x, #0x5434
      008DF2 7B 14            [ 1]  709 	ld	a, (0x14, sp)
      008DF4 F7               [ 1]  710 	ld	(x), a
                                    711 ;	HAL_CAN.c: 323: CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
      008DF5 AE 54 35         [ 2]  712 	ldw	x, #0x5435
      008DF8 7B 15            [ 1]  713 	ld	a, (0x15, sp)
      008DFA F7               [ 1]  714 	ld	(x), a
                                    715 ;	HAL_CAN.c: 324: CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
      008DFB AE 54 36         [ 2]  716 	ldw	x, #0x5436
      008DFE 7B 16            [ 1]  717 	ld	a, (0x16, sp)
      008E00 F7               [ 1]  718 	ld	(x), a
                                    719 ;	HAL_CAN.c: 325: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
      008E01 AE 54 37         [ 2]  720 	ldw	x, #0x5437
      008E04 7B 17            [ 1]  721 	ld	a, (0x17, sp)
      008E06 F7               [ 1]  722 	ld	(x), a
      008E07 CC 8E E0         [ 2]  723 	jp	00167$
      008E0A                        724 00166$:
                                    725 ;	HAL_CAN.c: 331: if (CAN_FilterScale == CAN_FilterScale_8Bit)
      008E0A 0D 0F            [ 1]  726 	tnz	(0x0f, sp)
      008E0C 26 33            [ 1]  727 	jrne	00163$
                                    728 ;	HAL_CAN.c: 333: CAN->Page.Filter.FR01 = CAN_FilterID1;
      008E0E AE 54 28         [ 2]  729 	ldw	x, #0x5428
      008E11 7B 10            [ 1]  730 	ld	a, (0x10, sp)
      008E13 F7               [ 1]  731 	ld	(x), a
                                    732 ;	HAL_CAN.c: 334: CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
      008E14 AE 54 29         [ 2]  733 	ldw	x, #0x5429
      008E17 7B 14            [ 1]  734 	ld	a, (0x14, sp)
      008E19 F7               [ 1]  735 	ld	(x), a
                                    736 ;	HAL_CAN.c: 335: CAN->Page.Filter.FR03 = CAN_FilterID2;
      008E1A AE 54 2A         [ 2]  737 	ldw	x, #0x542a
      008E1D 7B 11            [ 1]  738 	ld	a, (0x11, sp)
      008E1F F7               [ 1]  739 	ld	(x), a
                                    740 ;	HAL_CAN.c: 336: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
      008E20 AE 54 2B         [ 2]  741 	ldw	x, #0x542b
      008E23 7B 15            [ 1]  742 	ld	a, (0x15, sp)
      008E25 F7               [ 1]  743 	ld	(x), a
                                    744 ;	HAL_CAN.c: 337: CAN->Page.Filter.FR05 = CAN_FilterID3;
      008E26 AE 54 2C         [ 2]  745 	ldw	x, #0x542c
      008E29 7B 12            [ 1]  746 	ld	a, (0x12, sp)
      008E2B F7               [ 1]  747 	ld	(x), a
                                    748 ;	HAL_CAN.c: 338: CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
      008E2C AE 54 2D         [ 2]  749 	ldw	x, #0x542d
      008E2F 7B 16            [ 1]  750 	ld	a, (0x16, sp)
      008E31 F7               [ 1]  751 	ld	(x), a
                                    752 ;	HAL_CAN.c: 339: CAN->Page.Filter.FR07 = CAN_FilterID4;
      008E32 AE 54 2E         [ 2]  753 	ldw	x, #0x542e
      008E35 7B 13            [ 1]  754 	ld	a, (0x13, sp)
      008E37 F7               [ 1]  755 	ld	(x), a
                                    756 ;	HAL_CAN.c: 340: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
      008E38 AE 54 2F         [ 2]  757 	ldw	x, #0x542f
      008E3B 7B 17            [ 1]  758 	ld	a, (0x17, sp)
      008E3D F7               [ 1]  759 	ld	(x), a
      008E3E CC 8E E0         [ 2]  760 	jp	00167$
      008E41                        761 00163$:
                                    762 ;	HAL_CAN.c: 342: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
      008E41 0D 08            [ 1]  763 	tnz	(0x08, sp)
      008E43 27 32            [ 1]  764 	jreq	00160$
                                    765 ;	HAL_CAN.c: 344: CAN->Page.Filter.FR01 = CAN_FilterID1;
      008E45 AE 54 28         [ 2]  766 	ldw	x, #0x5428
      008E48 7B 10            [ 1]  767 	ld	a, (0x10, sp)
      008E4A F7               [ 1]  768 	ld	(x), a
                                    769 ;	HAL_CAN.c: 345: CAN->Page.Filter.FR02 = CAN_FilterID2;
      008E4B AE 54 29         [ 2]  770 	ldw	x, #0x5429
      008E4E 7B 11            [ 1]  771 	ld	a, (0x11, sp)
      008E50 F7               [ 1]  772 	ld	(x), a
                                    773 ;	HAL_CAN.c: 346: CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
      008E51 AE 54 2A         [ 2]  774 	ldw	x, #0x542a
      008E54 7B 14            [ 1]  775 	ld	a, (0x14, sp)
      008E56 F7               [ 1]  776 	ld	(x), a
                                    777 ;	HAL_CAN.c: 347: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
      008E57 AE 54 2B         [ 2]  778 	ldw	x, #0x542b
      008E5A 7B 15            [ 1]  779 	ld	a, (0x15, sp)
      008E5C F7               [ 1]  780 	ld	(x), a
                                    781 ;	HAL_CAN.c: 348: CAN->Page.Filter.FR05 = CAN_FilterID3;
      008E5D AE 54 2C         [ 2]  782 	ldw	x, #0x542c
      008E60 7B 12            [ 1]  783 	ld	a, (0x12, sp)
      008E62 F7               [ 1]  784 	ld	(x), a
                                    785 ;	HAL_CAN.c: 349: CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
      008E63 AE 54 2D         [ 2]  786 	ldw	x, #0x542d
      008E66 7B 16            [ 1]  787 	ld	a, (0x16, sp)
      008E68 F7               [ 1]  788 	ld	(x), a
                                    789 ;	HAL_CAN.c: 350: CAN->Page.Filter.FR07 = CAN_FilterID4;
      008E69 AE 54 2E         [ 2]  790 	ldw	x, #0x542e
      008E6C 7B 13            [ 1]  791 	ld	a, (0x13, sp)
      008E6E F7               [ 1]  792 	ld	(x), a
                                    793 ;	HAL_CAN.c: 351: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
      008E6F AE 54 2F         [ 2]  794 	ldw	x, #0x542f
      008E72 7B 17            [ 1]  795 	ld	a, (0x17, sp)
      008E74 F7               [ 1]  796 	ld	(x), a
      008E75 20 69            [ 2]  797 	jra	00167$
      008E77                        798 00160$:
                                    799 ;	HAL_CAN.c: 353: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
      008E77 0D 09            [ 1]  800 	tnz	(0x09, sp)
      008E79 27 32            [ 1]  801 	jreq	00157$
                                    802 ;	HAL_CAN.c: 355: CAN->Page.Filter.FR01 = CAN_FilterID1;
      008E7B AE 54 28         [ 2]  803 	ldw	x, #0x5428
      008E7E 7B 10            [ 1]  804 	ld	a, (0x10, sp)
      008E80 F7               [ 1]  805 	ld	(x), a
                                    806 ;	HAL_CAN.c: 356: CAN->Page.Filter.FR02 = CAN_FilterID2;
      008E81 AE 54 29         [ 2]  807 	ldw	x, #0x5429
      008E84 7B 11            [ 1]  808 	ld	a, (0x11, sp)
      008E86 F7               [ 1]  809 	ld	(x), a
                                    810 ;	HAL_CAN.c: 357: CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
      008E87 AE 54 2A         [ 2]  811 	ldw	x, #0x542a
      008E8A 7B 14            [ 1]  812 	ld	a, (0x14, sp)
      008E8C F7               [ 1]  813 	ld	(x), a
                                    814 ;	HAL_CAN.c: 358: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
      008E8D AE 54 2B         [ 2]  815 	ldw	x, #0x542b
      008E90 7B 15            [ 1]  816 	ld	a, (0x15, sp)
      008E92 F7               [ 1]  817 	ld	(x), a
                                    818 ;	HAL_CAN.c: 359: CAN->Page.Filter.FR05 = CAN_FilterID3;
      008E93 AE 54 2C         [ 2]  819 	ldw	x, #0x542c
      008E96 7B 12            [ 1]  820 	ld	a, (0x12, sp)
      008E98 F7               [ 1]  821 	ld	(x), a
                                    822 ;	HAL_CAN.c: 360: CAN->Page.Filter.FR06 = CAN_FilterID4;
      008E99 AE 54 2D         [ 2]  823 	ldw	x, #0x542d
      008E9C 7B 13            [ 1]  824 	ld	a, (0x13, sp)
      008E9E F7               [ 1]  825 	ld	(x), a
                                    826 ;	HAL_CAN.c: 361: CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
      008E9F AE 54 2E         [ 2]  827 	ldw	x, #0x542e
      008EA2 7B 16            [ 1]  828 	ld	a, (0x16, sp)
      008EA4 F7               [ 1]  829 	ld	(x), a
                                    830 ;	HAL_CAN.c: 362: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
      008EA5 AE 54 2F         [ 2]  831 	ldw	x, #0x542f
      008EA8 7B 17            [ 1]  832 	ld	a, (0x17, sp)
      008EAA F7               [ 1]  833 	ld	(x), a
      008EAB 20 33            [ 2]  834 	jra	00167$
      008EAD                        835 00157$:
                                    836 ;	HAL_CAN.c: 364: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
      008EAD 4D               [ 1]  837 	tnz	a
      008EAE 27 30            [ 1]  838 	jreq	00167$
                                    839 ;	HAL_CAN.c: 366: CAN->Page.Filter.FR01 = CAN_FilterID1;
      008EB0 AE 54 28         [ 2]  840 	ldw	x, #0x5428
      008EB3 7B 10            [ 1]  841 	ld	a, (0x10, sp)
      008EB5 F7               [ 1]  842 	ld	(x), a
                                    843 ;	HAL_CAN.c: 367: CAN->Page.Filter.FR02 = CAN_FilterID2;
      008EB6 AE 54 29         [ 2]  844 	ldw	x, #0x5429
      008EB9 7B 11            [ 1]  845 	ld	a, (0x11, sp)
      008EBB F7               [ 1]  846 	ld	(x), a
                                    847 ;	HAL_CAN.c: 368: CAN->Page.Filter.FR03 = CAN_FilterID3;
      008EBC AE 54 2A         [ 2]  848 	ldw	x, #0x542a
      008EBF 7B 12            [ 1]  849 	ld	a, (0x12, sp)
      008EC1 F7               [ 1]  850 	ld	(x), a
                                    851 ;	HAL_CAN.c: 369: CAN->Page.Filter.FR04 = CAN_FilterID4;
      008EC2 AE 54 2B         [ 2]  852 	ldw	x, #0x542b
      008EC5 7B 13            [ 1]  853 	ld	a, (0x13, sp)
      008EC7 F7               [ 1]  854 	ld	(x), a
                                    855 ;	HAL_CAN.c: 370: CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
      008EC8 AE 54 2C         [ 2]  856 	ldw	x, #0x542c
      008ECB 7B 14            [ 1]  857 	ld	a, (0x14, sp)
      008ECD F7               [ 1]  858 	ld	(x), a
                                    859 ;	HAL_CAN.c: 371: CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
      008ECE AE 54 2D         [ 2]  860 	ldw	x, #0x542d
      008ED1 7B 15            [ 1]  861 	ld	a, (0x15, sp)
      008ED3 F7               [ 1]  862 	ld	(x), a
                                    863 ;	HAL_CAN.c: 372: CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
      008ED4 AE 54 2E         [ 2]  864 	ldw	x, #0x542e
      008ED7 7B 16            [ 1]  865 	ld	a, (0x16, sp)
      008ED9 F7               [ 1]  866 	ld	(x), a
                                    867 ;	HAL_CAN.c: 373: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
      008EDA AE 54 2F         [ 2]  868 	ldw	x, #0x542f
      008EDD 7B 17            [ 1]  869 	ld	a, (0x17, sp)
      008EDF F7               [ 1]  870 	ld	(x), a
      008EE0                        871 00167$:
                                    872 ;	HAL_CAN.c: 382: CAN->PSR = CAN_Page_Config;
      008EE0 35 06 54 27      [ 1]  873 	mov	0x5427+0, #0x06
                                    874 ;	HAL_CAN.c: 383: if (CAN_FilterActivation != 0)
      008EE4 0D 0D            [ 1]  875 	tnz	(0x0d, sp)
      008EE6 27 2C            [ 1]  876 	jreq	00175$
                                    877 ;	HAL_CAN.c: 385: if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
      008EE8 7B 0C            [ 1]  878 	ld	a, (0x0c, sp)
      008EEA A5 06            [ 1]  879 	bcp	a, #0x06
      008EEC 26 0A            [ 1]  880 	jrne	00172$
                                    881 ;	HAL_CAN.c: 387: CAN->Page.Config.FCR1 |= (uint8_t)fact;
      008EEE C6 54 32         [ 1]  882 	ld	a, 0x5432
      008EF1 1A 02            [ 1]  883 	or	a, (0x02, sp)
      008EF3 C7 54 32         [ 1]  884 	ld	0x5432, a
      008EF6 20 1C            [ 2]  885 	jra	00175$
      008EF8                        886 00172$:
                                    887 ;	HAL_CAN.c: 389: else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
      008EF8 A4 06            [ 1]  888 	and	a, #0x06
      008EFA 97               [ 1]  889 	ld	xl, a
      008EFB 4F               [ 1]  890 	clr	a
      008EFC 95               [ 1]  891 	ld	xh, a
      008EFD A3 00 02         [ 2]  892 	cpw	x, #0x0002
      008F00 26 0A            [ 1]  893 	jrne	00169$
                                    894 ;	HAL_CAN.c: 391: CAN->Page.Config.FCR2 |= (uint8_t)fact;
      008F02 C6 54 33         [ 1]  895 	ld	a, 0x5433
      008F05 1A 02            [ 1]  896 	or	a, (0x02, sp)
      008F07 C7 54 33         [ 1]  897 	ld	0x5433, a
      008F0A 20 08            [ 2]  898 	jra	00175$
      008F0C                        899 00169$:
                                    900 ;	HAL_CAN.c: 395: CAN->Page.Config.FCR3 |= (uint8_t)fact;
      008F0C C6 54 34         [ 1]  901 	ld	a, 0x5434
      008F0F 1A 02            [ 1]  902 	or	a, (0x02, sp)
      008F11 C7 54 34         [ 1]  903 	ld	0x5434, a
      008F14                        904 00175$:
                                    905 ;	HAL_CAN.c: 398: CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
      008F14 4B 01            [ 1]  906 	push	#0x01
      008F16 CD 93 7D         [ 4]  907 	call	_CAN_OperatingModeRequest
      008F19 84               [ 1]  908 	pop	a
                                    909 ;	HAL_CAN.c: 400: CAN_SelectPage(can_page);
      008F1A 7B 01            [ 1]  910 	ld	a, (0x01, sp)
      008F1C 88               [ 1]  911 	push	a
      008F1D CD 96 EC         [ 4]  912 	call	_CAN_SelectPage
                                    913 ;	HAL_CAN.c: 401: }
      008F20 5B 0A            [ 2]  914 	addw	sp, #10
      008F22 81               [ 4]  915 	ret
                                    916 ;	HAL_CAN.c: 403: void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, uint8_t NewState)
                                    917 ;	-----------------------------------------
                                    918 ;	 function CAN_ITConfig
                                    919 ;	-----------------------------------------
      008F23                        920 _CAN_ITConfig:
      008F23 52 02            [ 2]  921 	sub	sp, #2
                                    922 ;	HAL_CAN.c: 406: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      008F25 CD 96 E8         [ 4]  923 	call	_CAN_GetSelectedPage
      008F28 90 97            [ 1]  924 	ld	yl, a
                                    925 ;	HAL_CAN.c: 408: tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >> 7);
      008F2A 1E 05            [ 2]  926 	ldw	x, (0x05, sp)
      008F2C A6 80            [ 1]  927 	ld	a, #0x80
      008F2E 62               [ 2]  928 	div	x, a
                                    929 ;	HAL_CAN.c: 409: tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) |
      008F2F 9F               [ 1]  930 	ld	a, xl
      008F30 A4 F0            [ 1]  931 	and	a, #0xf0
      008F32 6B 02            [ 1]  932 	ld	(0x02, sp), a
                                    933 ;	HAL_CAN.c: 410: (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >> 1));
      008F34 9F               [ 1]  934 	ld	a, xl
      008F35 A4 0F            [ 1]  935 	and	a, #0x0f
      008F37 44               [ 1]  936 	srl	a
      008F38 1A 02            [ 1]  937 	or	a, (0x02, sp)
      008F3A 6B 01            [ 1]  938 	ld	(0x01, sp), a
                                    939 ;	HAL_CAN.c: 412: CAN->PSR = CAN_Page_Config;
      008F3C 35 06 54 27      [ 1]  940 	mov	0x5427+0, #0x06
                                    941 ;	HAL_CAN.c: 416: CAN->IER |= (uint8_t)(CAN_IT);
      008F40 C6 54 25         [ 1]  942 	ld	a, 0x5425
      008F43 6B 02            [ 1]  943 	ld	(0x02, sp), a
                                    944 ;	HAL_CAN.c: 413: if (NewState != 0)
      008F45 0D 07            [ 1]  945 	tnz	(0x07, sp)
      008F47 27 11            [ 1]  946 	jreq	00102$
                                    947 ;	HAL_CAN.c: 416: CAN->IER |= (uint8_t)(CAN_IT);
      008F49 7B 06            [ 1]  948 	ld	a, (0x06, sp)
      008F4B 1A 02            [ 1]  949 	or	a, (0x02, sp)
      008F4D C7 54 25         [ 1]  950 	ld	0x5425, a
                                    951 ;	HAL_CAN.c: 417: CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
      008F50 C6 54 29         [ 1]  952 	ld	a, 0x5429
      008F53 1A 01            [ 1]  953 	or	a, (0x01, sp)
      008F55 C7 54 29         [ 1]  954 	ld	0x5429, a
      008F58 20 15            [ 2]  955 	jra	00103$
      008F5A                        956 00102$:
                                    957 ;	HAL_CAN.c: 422: CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
      008F5A 7B 06            [ 1]  958 	ld	a, (0x06, sp)
      008F5C 43               [ 1]  959 	cpl	a
      008F5D 14 02            [ 1]  960 	and	a, (0x02, sp)
      008F5F C7 54 25         [ 1]  961 	ld	0x5425, a
                                    962 ;	HAL_CAN.c: 423: CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
      008F62 C6 54 29         [ 1]  963 	ld	a, 0x5429
      008F65 6B 02            [ 1]  964 	ld	(0x02, sp), a
      008F67 7B 01            [ 1]  965 	ld	a, (0x01, sp)
      008F69 43               [ 1]  966 	cpl	a
      008F6A 14 02            [ 1]  967 	and	a, (0x02, sp)
      008F6C C7 54 29         [ 1]  968 	ld	0x5429, a
      008F6F                        969 00103$:
                                    970 ;	HAL_CAN.c: 426: CAN_SelectPage(can_page);
      008F6F 90 9F            [ 1]  971 	ld	a, yl
      008F71 88               [ 1]  972 	push	a
      008F72 CD 96 EC         [ 4]  973 	call	_CAN_SelectPage
                                    974 ;	HAL_CAN.c: 427: }
      008F75 5B 03            [ 2]  975 	addw	sp, #3
      008F77 81               [ 4]  976 	ret
                                    977 ;	HAL_CAN.c: 429: void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
                                    978 ;	-----------------------------------------
                                    979 ;	 function CAN_ST7CompatibilityCmd
                                    980 ;	-----------------------------------------
      008F78                        981 _CAN_ST7CompatibilityCmd:
                                    982 ;	HAL_CAN.c: 432: CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
      008F78 72 19 54 26      [ 1]  983 	bres	21542, #4
                                    984 ;	HAL_CAN.c: 435: CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
      008F7C C6 54 26         [ 1]  985 	ld	a, 0x5426
      008F7F 1A 03            [ 1]  986 	or	a, (0x03, sp)
      008F81 C7 54 26         [ 1]  987 	ld	0x5426, a
                                    988 ;	HAL_CAN.c: 436: }
      008F84 81               [ 4]  989 	ret
                                    990 ;	HAL_CAN.c: 438: void CAN_TTComModeCmd(uint8_t NewState)
                                    991 ;	-----------------------------------------
                                    992 ;	 function CAN_TTComModeCmd
                                    993 ;	-----------------------------------------
      008F85                        994 _CAN_TTComModeCmd:
                                    995 ;	HAL_CAN.c: 440: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      008F85 CD 96 E8         [ 4]  996 	call	_CAN_GetSelectedPage
      008F88 97               [ 1]  997 	ld	xl, a
                                    998 ;	HAL_CAN.c: 444: CAN->MCR |= CAN_MCR_TTCM;
      008F89 C6 54 20         [ 1]  999 	ld	a, 0x5420
                                   1000 ;	HAL_CAN.c: 441: if (NewState != 0)
      008F8C 0D 03            [ 1] 1001 	tnz	(0x03, sp)
      008F8E 27 27            [ 1] 1002 	jreq	00102$
                                   1003 ;	HAL_CAN.c: 444: CAN->MCR |= CAN_MCR_TTCM;
      008F90 AA 80            [ 1] 1004 	or	a, #0x80
      008F92 C7 54 20         [ 1] 1005 	ld	0x5420, a
                                   1006 ;	HAL_CAN.c: 446: CAN->PSR = CAN_Page_TxMailBox0;
      008F95 35 00 54 27      [ 1] 1007 	mov	0x5427+0, #0x00
                                   1008 ;	HAL_CAN.c: 447: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
      008F99 72 1E 54 29      [ 1] 1009 	bset	21545, #7
                                   1010 ;	HAL_CAN.c: 448: CAN->PSR = CAN_Page_TxMailBox1;
      008F9D 35 01 54 27      [ 1] 1011 	mov	0x5427+0, #0x01
                                   1012 ;	HAL_CAN.c: 449: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
      008FA1 72 1E 54 29      [ 1] 1013 	bset	21545, #7
                                   1014 ;	HAL_CAN.c: 450: CAN->PSR = CAN_Page_TxMailBox2;
      008FA5 35 05 54 27      [ 1] 1015 	mov	0x5427+0, #0x05
                                   1016 ;	HAL_CAN.c: 451: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
      008FA9 72 1E 54 29      [ 1] 1017 	bset	21545, #7
                                   1018 ;	HAL_CAN.c: 452: CAN->PSR = CAN_Page_RxFifo;
      008FAD 35 07 54 27      [ 1] 1019 	mov	0x5427+0, #0x07
                                   1020 ;	HAL_CAN.c: 453: CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
      008FB1 72 1E 54 29      [ 1] 1021 	bset	21545, #7
      008FB5 20 25            [ 2] 1022 	jra	00103$
      008FB7                       1023 00102$:
                                   1024 ;	HAL_CAN.c: 458: CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
      008FB7 A4 7F            [ 1] 1025 	and	a, #0x7f
      008FB9 C7 54 20         [ 1] 1026 	ld	0x5420, a
                                   1027 ;	HAL_CAN.c: 460: CAN->PSR = CAN_Page_TxMailBox0;
      008FBC 35 00 54 27      [ 1] 1028 	mov	0x5427+0, #0x00
                                   1029 ;	HAL_CAN.c: 461: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
      008FC0 72 1F 54 29      [ 1] 1030 	bres	21545, #7
                                   1031 ;	HAL_CAN.c: 462: CAN->PSR = CAN_Page_TxMailBox1;
      008FC4 35 01 54 27      [ 1] 1032 	mov	0x5427+0, #0x01
                                   1033 ;	HAL_CAN.c: 463: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
      008FC8 72 1F 54 29      [ 1] 1034 	bres	21545, #7
                                   1035 ;	HAL_CAN.c: 464: CAN->PSR = CAN_Page_TxMailBox2;
      008FCC 35 05 54 27      [ 1] 1036 	mov	0x5427+0, #0x05
                                   1037 ;	HAL_CAN.c: 465: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
      008FD0 72 1F 54 29      [ 1] 1038 	bres	21545, #7
                                   1039 ;	HAL_CAN.c: 466: CAN->PSR = CAN_Page_RxFifo;
      008FD4 35 07 54 27      [ 1] 1040 	mov	0x5427+0, #0x07
                                   1041 ;	HAL_CAN.c: 467: CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
      008FD8 72 1F 54 29      [ 1] 1042 	bres	21545, #7
      008FDC                       1043 00103$:
                                   1044 ;	HAL_CAN.c: 470: CAN_SelectPage(can_page);
      008FDC 9F               [ 1] 1045 	ld	a, xl
      008FDD 88               [ 1] 1046 	push	a
      008FDE CD 96 EC         [ 4] 1047 	call	_CAN_SelectPage
      008FE1 84               [ 1] 1048 	pop	a
                                   1049 ;	HAL_CAN.c: 471: }
      008FE2 81               [ 4] 1050 	ret
                                   1051 ;	HAL_CAN.c: 473: CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
                                   1052 ;	-----------------------------------------
                                   1053 ;	 function CAN_Transmit
                                   1054 ;	-----------------------------------------
      008FE3                       1055 _CAN_Transmit:
      008FE3 52 04            [ 2] 1056 	sub	sp, #4
                                   1057 ;	HAL_CAN.c: 480: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      008FE5 CD 96 E8         [ 4] 1058 	call	_CAN_GetSelectedPage
      008FE8 6B 01            [ 1] 1059 	ld	(0x01, sp), a
                                   1060 ;	HAL_CAN.c: 482: if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
      008FEA C6 54 23         [ 1] 1061 	ld	a, 0x5423
      008FED A4 04            [ 1] 1062 	and	a, #0x04
      008FEF A1 04            [ 1] 1063 	cp	a, #0x04
      008FF1 26 04            [ 1] 1064 	jrne	00108$
                                   1065 ;	HAL_CAN.c: 484: CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
      008FF3 0F 02            [ 1] 1066 	clr	(0x02, sp)
      008FF5 20 21            [ 2] 1067 	jra	00109$
      008FF7                       1068 00108$:
                                   1069 ;	HAL_CAN.c: 486: else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
      008FF7 C6 54 23         [ 1] 1070 	ld	a, 0x5423
      008FFA A4 08            [ 1] 1071 	and	a, #0x08
                                   1072 ;	HAL_CAN.c: 488: CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
      008FFC A0 08            [ 1] 1073 	sub	a, #0x08
      008FFE 26 05            [ 1] 1074 	jrne	00105$
      009000 4C               [ 1] 1075 	inc	a
      009001 6B 02            [ 1] 1076 	ld	(0x02, sp), a
      009003 20 13            [ 2] 1077 	jra	00109$
      009005                       1078 00105$:
                                   1079 ;	HAL_CAN.c: 490: else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
      009005 C6 54 23         [ 1] 1080 	ld	a, 0x5423
      009008 A4 10            [ 1] 1081 	and	a, #0x10
      00900A A1 10            [ 1] 1082 	cp	a, #0x10
      00900C 26 06            [ 1] 1083 	jrne	00102$
                                   1084 ;	HAL_CAN.c: 492: CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
      00900E A6 05            [ 1] 1085 	ld	a, #0x05
      009010 6B 02            [ 1] 1086 	ld	(0x02, sp), a
      009012 20 04            [ 2] 1087 	jra	00109$
      009014                       1088 00102$:
                                   1089 ;	HAL_CAN.c: 496: CAN_TxStatus = CAN_TxStatus_NoMailBox;
      009014 A6 F4            [ 1] 1090 	ld	a, #0xf4
      009016 6B 02            [ 1] 1091 	ld	(0x02, sp), a
      009018                       1092 00109$:
                                   1093 ;	HAL_CAN.c: 498: if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
      009018 7B 02            [ 1] 1094 	ld	a, (0x02, sp)
      00901A A1 F4            [ 1] 1095 	cp	a, #0xf4
      00901C 26 03            [ 1] 1096 	jrne	00152$
      00901E CC 90 E1         [ 2] 1097 	jp	00114$
      009021                       1098 00152$:
                                   1099 ;	HAL_CAN.c: 500: CAN->PSR = (uint8_t)CAN_TxStatus;
      009021 AE 54 27         [ 2] 1100 	ldw	x, #0x5427
      009024 7B 02            [ 1] 1101 	ld	a, (0x02, sp)
      009026 F7               [ 1] 1102 	ld	(x), a
                                   1103 ;	HAL_CAN.c: 511: CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id | CAN_IDE | CAN_RTR);
      009027 7B 0C            [ 1] 1104 	ld	a, (0x0c, sp)
      009029 6B 03            [ 1] 1105 	ld	(0x03, sp), a
                                   1106 ;	HAL_CAN.c: 502: if (CAN_IDE != CAN_Id_Standard)
      00902B 0D 0B            [ 1] 1107 	tnz	(0x0b, sp)
      00902D 27 4D            [ 1] 1108 	jreq	00111$
                                   1109 ;	HAL_CAN.c: 504: CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
      00902F 16 09            [ 2] 1110 	ldw	y, (0x09, sp)
      009031 7B 08            [ 1] 1111 	ld	a, (0x08, sp)
      009033 97               [ 1] 1112 	ld	xl, a
      009034 7B 07            [ 1] 1113 	ld	a, (0x07, sp)
      009036 A4 1F            [ 1] 1114 	and	a, #0x1f
      009038 95               [ 1] 1115 	ld	xh, a
      009039 17 09            [ 2] 1116 	ldw	(0x09, sp), y
      00903B 1F 07            [ 2] 1117 	ldw	(0x07, sp), x
                                   1118 ;	HAL_CAN.c: 505: CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
      00903D 7B 0A            [ 1] 1119 	ld	a, (0x0a, sp)
      00903F C7 54 2D         [ 1] 1120 	ld	0x542d, a
                                   1121 ;	HAL_CAN.c: 506: CAN_Id = CAN_Id >> 8;
      009042 16 08            [ 2] 1122 	ldw	y, (0x08, sp)
      009044 7B 07            [ 1] 1123 	ld	a, (0x07, sp)
      009046 97               [ 1] 1124 	ld	xl, a
      009047 4F               [ 1] 1125 	clr	a
      009048 95               [ 1] 1126 	ld	xh, a
      009049 17 09            [ 2] 1127 	ldw	(0x09, sp), y
      00904B 1F 07            [ 2] 1128 	ldw	(0x07, sp), x
                                   1129 ;	HAL_CAN.c: 507: CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
      00904D 7B 0A            [ 1] 1130 	ld	a, (0x0a, sp)
      00904F C7 54 2C         [ 1] 1131 	ld	0x542c, a
                                   1132 ;	HAL_CAN.c: 508: CAN_Id = CAN_Id >> 8;
      009052 16 08            [ 2] 1133 	ldw	y, (0x08, sp)
      009054 7B 07            [ 1] 1134 	ld	a, (0x07, sp)
      009056 97               [ 1] 1135 	ld	xl, a
      009057 4F               [ 1] 1136 	clr	a
      009058 95               [ 1] 1137 	ld	xh, a
      009059 17 09            [ 2] 1138 	ldw	(0x09, sp), y
      00905B 1F 07            [ 2] 1139 	ldw	(0x07, sp), x
                                   1140 ;	HAL_CAN.c: 509: CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
      00905D 7B 0A            [ 1] 1141 	ld	a, (0x0a, sp)
      00905F C7 54 2B         [ 1] 1142 	ld	0x542b, a
                                   1143 ;	HAL_CAN.c: 510: CAN_Id = CAN_Id >> 8;
      009062 16 08            [ 2] 1144 	ldw	y, (0x08, sp)
      009064 7B 07            [ 1] 1145 	ld	a, (0x07, sp)
      009066 97               [ 1] 1146 	ld	xl, a
      009067 4F               [ 1] 1147 	clr	a
      009068 95               [ 1] 1148 	ld	xh, a
      009069 17 09            [ 2] 1149 	ldw	(0x09, sp), y
      00906B 1F 07            [ 2] 1150 	ldw	(0x07, sp), x
                                   1151 ;	HAL_CAN.c: 511: CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id | CAN_IDE | CAN_RTR);
      00906D 7B 0B            [ 1] 1152 	ld	a, (0x0b, sp)
      00906F 6B 04            [ 1] 1153 	ld	(0x04, sp), a
      009071 7B 0A            [ 1] 1154 	ld	a, (0x0a, sp)
      009073 1A 04            [ 1] 1155 	or	a, (0x04, sp)
      009075 1A 03            [ 1] 1156 	or	a, (0x03, sp)
      009077 C7 54 2A         [ 1] 1157 	ld	0x542a, a
      00907A 20 20            [ 2] 1158 	jra	00112$
      00907C                       1159 00111$:
                                   1160 ;	HAL_CAN.c: 515: CAN_Id &= (uint16_t)CAN_STDID_SIZE;
      00907C 7B 0A            [ 1] 1161 	ld	a, (0x0a, sp)
      00907E 97               [ 1] 1162 	ld	xl, a
      00907F 7B 09            [ 1] 1163 	ld	a, (0x09, sp)
      009081 A4 07            [ 1] 1164 	and	a, #0x07
      009083 95               [ 1] 1165 	ld	xh, a
      009084 90 5F            [ 1] 1166 	clrw	y
      009086 1F 09            [ 2] 1167 	ldw	(0x09, sp), x
      009088 17 07            [ 2] 1168 	ldw	(0x07, sp), y
                                   1169 ;	HAL_CAN.c: 516: CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id >> 6) | (CAN_RTR));
      00908A 1E 09            [ 2] 1170 	ldw	x, (0x09, sp)
      00908C A6 40            [ 1] 1171 	ld	a, #0x40
      00908E 62               [ 2] 1172 	div	x, a
      00908F 9F               [ 1] 1173 	ld	a, xl
      009090 1A 03            [ 1] 1174 	or	a, (0x03, sp)
      009092 C7 54 2A         [ 1] 1175 	ld	0x542a, a
                                   1176 ;	HAL_CAN.c: 517: CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id << 2);
      009095 7B 0A            [ 1] 1177 	ld	a, (0x0a, sp)
      009097 48               [ 1] 1178 	sll	a
      009098 48               [ 1] 1179 	sll	a
      009099 C7 54 2B         [ 1] 1180 	ld	0x542b, a
      00909C                       1181 00112$:
                                   1182 ;	HAL_CAN.c: 521: CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
      00909C C6 54 29         [ 1] 1183 	ld	a, 0x5429
      00909F A4 F0            [ 1] 1184 	and	a, #0xf0
      0090A1 C7 54 29         [ 1] 1185 	ld	0x5429, a
                                   1186 ;	HAL_CAN.c: 523: CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
      0090A4 C6 54 29         [ 1] 1187 	ld	a, 0x5429
      0090A7 1A 0D            [ 1] 1188 	or	a, (0x0d, sp)
      0090A9 C7 54 29         [ 1] 1189 	ld	0x5429, a
                                   1190 ;	HAL_CAN.c: 525: CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
      0090AC 16 0E            [ 2] 1191 	ldw	y, (0x0e, sp)
      0090AE 90 F6            [ 1] 1192 	ld	a, (y)
      0090B0 C7 54 2E         [ 1] 1193 	ld	0x542e, a
                                   1194 ;	HAL_CAN.c: 526: CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
      0090B3 93               [ 1] 1195 	ldw	x, y
      0090B4 E6 01            [ 1] 1196 	ld	a, (0x1, x)
      0090B6 C7 54 2F         [ 1] 1197 	ld	0x542f, a
                                   1198 ;	HAL_CAN.c: 527: CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
      0090B9 93               [ 1] 1199 	ldw	x, y
      0090BA E6 02            [ 1] 1200 	ld	a, (0x2, x)
      0090BC C7 54 30         [ 1] 1201 	ld	0x5430, a
                                   1202 ;	HAL_CAN.c: 528: CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
      0090BF 93               [ 1] 1203 	ldw	x, y
      0090C0 E6 03            [ 1] 1204 	ld	a, (0x3, x)
      0090C2 C7 54 31         [ 1] 1205 	ld	0x5431, a
                                   1206 ;	HAL_CAN.c: 529: CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
      0090C5 93               [ 1] 1207 	ldw	x, y
      0090C6 E6 04            [ 1] 1208 	ld	a, (0x4, x)
      0090C8 C7 54 32         [ 1] 1209 	ld	0x5432, a
                                   1210 ;	HAL_CAN.c: 530: CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
      0090CB 93               [ 1] 1211 	ldw	x, y
      0090CC E6 05            [ 1] 1212 	ld	a, (0x5, x)
      0090CE C7 54 33         [ 1] 1213 	ld	0x5433, a
                                   1214 ;	HAL_CAN.c: 531: CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
      0090D1 93               [ 1] 1215 	ldw	x, y
      0090D2 E6 06            [ 1] 1216 	ld	a, (0x6, x)
      0090D4 C7 54 34         [ 1] 1217 	ld	0x5434, a
                                   1218 ;	HAL_CAN.c: 532: CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
      0090D7 90 E6 07         [ 1] 1219 	ld	a, (0x7, y)
      0090DA C7 54 35         [ 1] 1220 	ld	0x5435, a
                                   1221 ;	HAL_CAN.c: 534: CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
      0090DD 72 10 54 28      [ 1] 1222 	bset	21544, #0
      0090E1                       1223 00114$:
                                   1224 ;	HAL_CAN.c: 537: CAN_SelectPage(can_page);
      0090E1 7B 01            [ 1] 1225 	ld	a, (0x01, sp)
      0090E3 88               [ 1] 1226 	push	a
      0090E4 CD 96 EC         [ 4] 1227 	call	_CAN_SelectPage
      0090E7 84               [ 1] 1228 	pop	a
                                   1229 ;	HAL_CAN.c: 538: return (CAN_TxStatus_TypeDef)CAN_TxStatus;
      0090E8 7B 02            [ 1] 1230 	ld	a, (0x02, sp)
                                   1231 ;	HAL_CAN.c: 539: }
      0090EA 5B 04            [ 2] 1232 	addw	sp, #4
      0090EC 81               [ 4] 1233 	ret
                                   1234 ;	HAL_CAN.c: 541: CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
                                   1235 ;	-----------------------------------------
                                   1236 ;	 function CAN_TransmitStatus
                                   1237 ;	-----------------------------------------
      0090ED                       1238 _CAN_TransmitStatus:
      0090ED 88               [ 1] 1239 	push	a
                                   1240 ;	HAL_CAN.c: 545: uint8_t tmpstate = 0;
      0090EE 4F               [ 1] 1241 	clr	a
                                   1242 ;	HAL_CAN.c: 547: switch (CAN_TransmitMailbox)
      0090EF 88               [ 1] 1243 	push	a
      0090F0 7B 05            [ 1] 1244 	ld	a, (0x05, sp)
      0090F2 A1 00            [ 1] 1245 	cp	a, #0x00
      0090F4 84               [ 1] 1246 	pop	a
      0090F5 27 11            [ 1] 1247 	jreq	00101$
      0090F7 88               [ 1] 1248 	push	a
      0090F8 7B 05            [ 1] 1249 	ld	a, (0x05, sp)
      0090FA 4A               [ 1] 1250 	dec	a
      0090FB 84               [ 1] 1251 	pop	a
      0090FC 27 1A            [ 1] 1252 	jreq	00102$
      0090FE 88               [ 1] 1253 	push	a
      0090FF 7B 05            [ 1] 1254 	ld	a, (0x05, sp)
      009101 A1 05            [ 1] 1255 	cp	a, #0x05
      009103 84               [ 1] 1256 	pop	a
      009104 27 24            [ 1] 1257 	jreq	00103$
      009106 20 34            [ 2] 1258 	jra	00105$
                                   1259 ;	HAL_CAN.c: 549: case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0 | CAN_TSR_TXOK0)));
      009108                       1260 00101$:
      009108 C6 54 22         [ 1] 1261 	ld	a, 0x5422
      00910B A4 11            [ 1] 1262 	and	a, #0x11
      00910D 6B 01            [ 1] 1263 	ld	(0x01, sp), a
                                   1264 ;	HAL_CAN.c: 550: tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
      00910F C6 54 23         [ 1] 1265 	ld	a, 0x5423
      009112 A4 04            [ 1] 1266 	and	a, #0x04
      009114 1A 01            [ 1] 1267 	or	a, (0x01, sp)
                                   1268 ;	HAL_CAN.c: 551: break;
      009116 20 24            [ 2] 1269 	jra	00105$
                                   1270 ;	HAL_CAN.c: 552: case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1 | CAN_TSR_TXOK1)) >> 1);
      009118                       1271 00102$:
      009118 C6 54 22         [ 1] 1272 	ld	a, 0x5422
      00911B A4 22            [ 1] 1273 	and	a, #0x22
      00911D 44               [ 1] 1274 	srl	a
      00911E 6B 01            [ 1] 1275 	ld	(0x01, sp), a
                                   1276 ;	HAL_CAN.c: 553: tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
      009120 C6 54 23         [ 1] 1277 	ld	a, 0x5423
      009123 A4 08            [ 1] 1278 	and	a, #0x08
      009125 44               [ 1] 1279 	srl	a
      009126 1A 01            [ 1] 1280 	or	a, (0x01, sp)
                                   1281 ;	HAL_CAN.c: 554: break;
      009128 20 12            [ 2] 1282 	jra	00105$
                                   1283 ;	HAL_CAN.c: 555: case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2 | CAN_TSR_TXOK2)) >> 2);
      00912A                       1284 00103$:
      00912A C6 54 22         [ 1] 1285 	ld	a, 0x5422
      00912D A4 44            [ 1] 1286 	and	a, #0x44
      00912F 44               [ 1] 1287 	srl	a
      009130 44               [ 1] 1288 	srl	a
      009131 6B 01            [ 1] 1289 	ld	(0x01, sp), a
                                   1290 ;	HAL_CAN.c: 556: tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
      009133 C6 54 23         [ 1] 1291 	ld	a, 0x5423
      009136 A4 10            [ 1] 1292 	and	a, #0x10
      009138 44               [ 1] 1293 	srl	a
      009139 44               [ 1] 1294 	srl	a
      00913A 1A 01            [ 1] 1295 	or	a, (0x01, sp)
                                   1296 ;	HAL_CAN.c: 561: }
      00913C                       1297 00105$:
                                   1298 ;	HAL_CAN.c: 563: switch (tmpstate)
      00913C A1 00            [ 1] 1299 	cp	a, #0x00
      00913E 27 0E            [ 1] 1300 	jreq	00106$
      009140 A1 04            [ 1] 1301 	cp	a, #0x04
      009142 27 16            [ 1] 1302 	jreq	00109$
      009144 A1 05            [ 1] 1303 	cp	a, #0x05
      009146 27 0A            [ 1] 1304 	jreq	00107$
      009148 A1 15            [ 1] 1305 	cp	a, #0x15
      00914A 27 0A            [ 1] 1306 	jreq	00108$
      00914C 20 0F            [ 2] 1307 	jra	00110$
                                   1308 ;	HAL_CAN.c: 566: case (0x00): tstate = CAN_TxStatus_Pending;
      00914E                       1309 00106$:
      00914E A6 F2            [ 1] 1310 	ld	a, #0xf2
                                   1311 ;	HAL_CAN.c: 567: break;
      009150 20 0D            [ 2] 1312 	jra	00111$
                                   1313 ;	HAL_CAN.c: 569: case (0x05): tstate = CAN_TxStatus_Failed;
      009152                       1314 00107$:
      009152 A6 F0            [ 1] 1315 	ld	a, #0xf0
                                   1316 ;	HAL_CAN.c: 570: break;
      009154 20 09            [ 2] 1317 	jra	00111$
                                   1318 ;	HAL_CAN.c: 572: case (0x15): tstate = CAN_TxStatus_Ok;
      009156                       1319 00108$:
      009156 A6 F1            [ 1] 1320 	ld	a, #0xf1
                                   1321 ;	HAL_CAN.c: 573: break;
      009158 20 05            [ 2] 1322 	jra	00111$
                                   1323 ;	HAL_CAN.c: 575: case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
      00915A                       1324 00109$:
      00915A A6 F5            [ 1] 1325 	ld	a, #0xf5
                                   1326 ;	HAL_CAN.c: 576: break;
                                   1327 ;	HAL_CAN.c: 577: default:
                                   1328 ;	HAL_CAN.c: 578: tstate = CAN_TxStatus_Failed;
                                   1329 ;	HAL_CAN.c: 580: }
      00915C C5                    1330 	.byte 0xc5
      00915D                       1331 00110$:
      00915D A6 F0            [ 1] 1332 	ld	a, #0xf0
      00915F                       1333 00111$:
                                   1334 ;	HAL_CAN.c: 582: return (CAN_TxStatus_TypeDef)tstate;
                                   1335 ;	HAL_CAN.c: 583: }
      00915F 5B 01            [ 2] 1336 	addw	sp, #1
      009161 81               [ 4] 1337 	ret
                                   1338 ;	HAL_CAN.c: 585: void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
                                   1339 ;	-----------------------------------------
                                   1340 ;	 function CAN_CancelTransmit
                                   1341 ;	-----------------------------------------
      009162                       1342 _CAN_CancelTransmit:
      009162 88               [ 1] 1343 	push	a
                                   1344 ;	HAL_CAN.c: 587: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      009163 CD 96 E8         [ 4] 1345 	call	_CAN_GetSelectedPage
      009166 6B 01            [ 1] 1346 	ld	(0x01, sp), a
                                   1347 ;	HAL_CAN.c: 589: CAN->PSR = (uint8_t)CAN_TransmitMailbox;
      009168 AE 54 27         [ 2] 1348 	ldw	x, #0x5427
      00916B 7B 04            [ 1] 1349 	ld	a, (0x04, sp)
      00916D F7               [ 1] 1350 	ld	(x), a
                                   1351 ;	HAL_CAN.c: 591: CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
      00916E 72 12 54 28      [ 1] 1352 	bset	21544, #1
                                   1353 ;	HAL_CAN.c: 593: CAN_SelectPage(can_page);
      009172 7B 01            [ 1] 1354 	ld	a, (0x01, sp)
      009174 88               [ 1] 1355 	push	a
      009175 CD 96 EC         [ 4] 1356 	call	_CAN_SelectPage
                                   1357 ;	HAL_CAN.c: 594: }
      009178 85               [ 2] 1358 	popw	x
      009179 81               [ 4] 1359 	ret
                                   1360 ;	HAL_CAN.c: 596: void CAN_FIFORelease(void)
                                   1361 ;	-----------------------------------------
                                   1362 ;	 function CAN_FIFORelease
                                   1363 ;	-----------------------------------------
      00917A                       1364 _CAN_FIFORelease:
                                   1365 ;	HAL_CAN.c: 599: CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
      00917A 35 20 54 24      [ 1] 1366 	mov	0x5424+0, #0x20
                                   1367 ;	HAL_CAN.c: 600: }
      00917E 81               [ 4] 1368 	ret
                                   1369 ;	HAL_CAN.c: 602: CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
                                   1370 ;	-----------------------------------------
                                   1371 ;	 function CAN_MessagePending
                                   1372 ;	-----------------------------------------
      00917F                       1373 _CAN_MessagePending:
                                   1374 ;	HAL_CAN.c: 605: msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
      00917F C6 54 24         [ 1] 1375 	ld	a, 0x5424
      009182 A4 03            [ 1] 1376 	and	a, #0x03
                                   1377 ;	HAL_CAN.c: 606: return (CAN_NbrPendingMessage_TypeDef)msgpending;
                                   1378 ;	HAL_CAN.c: 607: }
      009184 81               [ 4] 1379 	ret
                                   1380 ;	HAL_CAN.c: 609: void CAN_Receive(void)
                                   1381 ;	-----------------------------------------
                                   1382 ;	 function CAN_Receive
                                   1383 ;	-----------------------------------------
      009185                       1384 _CAN_Receive:
      009185 52 15            [ 2] 1385 	sub	sp, #21
                                   1386 ;	HAL_CAN.c: 611: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      009187 CD 96 E8         [ 4] 1387 	call	_CAN_GetSelectedPage
      00918A 6B 01            [ 1] 1388 	ld	(0x01, sp), a
                                   1389 ;	HAL_CAN.c: 615: CAN->PSR = CAN_Page_RxFifo;
      00918C 35 07 54 27      [ 1] 1390 	mov	0x5427+0, #0x07
                                   1391 ;	HAL_CAN.c: 618: _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
      009190 C6 54 2A         [ 1] 1392 	ld	a, 0x542a
      009193 A4 40            [ 1] 1393 	and	a, #0x40
      009195 C7 00 09         [ 1] 1394 	ld	__IDE+0, a
                                   1395 ;	HAL_CAN.c: 619: if (_IDE != CAN_Id_Standard)
      009198 72 5D 00 09      [ 1] 1396 	tnz	__IDE+0
      00919C 26 03            [ 1] 1397 	jrne	00111$
      00919E CC 92 6E         [ 2] 1398 	jp	00102$
      0091A1                       1399 00111$:
                                   1400 ;	HAL_CAN.c: 621: temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
      0091A1 C6 54 2C         [ 1] 1401 	ld	a, 0x542c
      0091A4 6B 15            [ 1] 1402 	ld	(0x15, sp), a
      0091A6 0F 14            [ 1] 1403 	clr	(0x14, sp)
      0091A8 0F 13            [ 1] 1404 	clr	(0x13, sp)
      0091AA 0F 12            [ 1] 1405 	clr	(0x12, sp)
      0091AC 16 14            [ 2] 1406 	ldw	y, (0x14, sp)
      0091AE 17 13            [ 2] 1407 	ldw	(0x13, sp), y
      0091B0 7B 13            [ 1] 1408 	ld	a, (0x13, sp)
      0091B2 6B 12            [ 1] 1409 	ld	(0x12, sp), a
      0091B4 0F 15            [ 1] 1410 	clr	(0x15, sp)
      0091B6 16 14            [ 2] 1411 	ldw	y, (0x14, sp)
      0091B8 17 04            [ 2] 1412 	ldw	(0x04, sp), y
      0091BA 16 12            [ 2] 1413 	ldw	y, (0x12, sp)
      0091BC 17 02            [ 2] 1414 	ldw	(0x02, sp), y
                                   1415 ;	HAL_CAN.c: 622: temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);
      0091BE C6 54 2B         [ 1] 1416 	ld	a, 0x542b
      0091C1 6B 15            [ 1] 1417 	ld	(0x15, sp), a
      0091C3 0F 14            [ 1] 1418 	clr	(0x14, sp)
      0091C5 0F 13            [ 1] 1419 	clr	(0x13, sp)
      0091C7 0F 12            [ 1] 1420 	clr	(0x12, sp)
      0091C9 16 14            [ 2] 1421 	ldw	y, (0x14, sp)
      0091CB 17 12            [ 2] 1422 	ldw	(0x12, sp), y
      0091CD 5F               [ 1] 1423 	clrw	x
      0091CE 1F 14            [ 2] 1424 	ldw	(0x14, sp), x
      0091D0 1F 08            [ 2] 1425 	ldw	(0x08, sp), x
      0091D2 16 12            [ 2] 1426 	ldw	y, (0x12, sp)
      0091D4 17 06            [ 2] 1427 	ldw	(0x06, sp), y
                                   1428 ;	HAL_CAN.c: 623: temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
      0091D6 C6 54 2A         [ 1] 1429 	ld	a, 0x542a
      0091D9 6B 15            [ 1] 1430 	ld	(0x15, sp), a
      0091DB 6B 11            [ 1] 1431 	ld	(0x11, sp), a
      0091DD 0F 10            [ 1] 1432 	clr	(0x10, sp)
      0091DF 0F 0F            [ 1] 1433 	clr	(0x0f, sp)
      0091E1 0F 0E            [ 1] 1434 	clr	(0x0e, sp)
      0091E3 7B 11            [ 1] 1435 	ld	a, (0x11, sp)
      0091E5 A4 1F            [ 1] 1436 	and	a, #0x1f
      0091E7 6B 15            [ 1] 1437 	ld	(0x15, sp), a
      0091E9 5F               [ 1] 1438 	clrw	x
      0091EA 1F 13            [ 2] 1439 	ldw	(0x13, sp), x
      0091EC 0F 12            [ 1] 1440 	clr	(0x12, sp)
      0091EE 7B 15            [ 1] 1441 	ld	a, (0x15, sp)
      0091F0 6B 12            [ 1] 1442 	ld	(0x12, sp), a
      0091F2 5F               [ 1] 1443 	clrw	x
      0091F3 1F 14            [ 2] 1444 	ldw	(0x14, sp), x
      0091F5 0F 13            [ 1] 1445 	clr	(0x13, sp)
      0091F7 16 14            [ 2] 1446 	ldw	y, (0x14, sp)
      0091F9 17 0C            [ 2] 1447 	ldw	(0x0c, sp), y
      0091FB 16 12            [ 2] 1448 	ldw	y, (0x12, sp)
      0091FD 17 0A            [ 2] 1449 	ldw	(0x0a, sp), y
                                   1450 ;	HAL_CAN.c: 625: _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3);
      0091FF C6 54 2D         [ 1] 1451 	ld	a, 0x542d
      009202 6B 15            [ 1] 1452 	ld	(0x15, sp), a
      009204 6B 11            [ 1] 1453 	ld	(0x11, sp), a
      009206 0F 10            [ 1] 1454 	clr	(0x10, sp)
      009208 0F 0F            [ 1] 1455 	clr	(0x0f, sp)
      00920A 0F 0E            [ 1] 1456 	clr	(0x0e, sp)
      00920C 7B 11            [ 1] 1457 	ld	a, (0x11, sp)
      00920E 1A 05            [ 1] 1458 	or	a, (0x05, sp)
      009210 6B 15            [ 1] 1459 	ld	(0x15, sp), a
      009212 7B 10            [ 1] 1460 	ld	a, (0x10, sp)
      009214 1A 04            [ 1] 1461 	or	a, (0x04, sp)
      009216 6B 14            [ 1] 1462 	ld	(0x14, sp), a
      009218 7B 0F            [ 1] 1463 	ld	a, (0x0f, sp)
      00921A 1A 03            [ 1] 1464 	or	a, (0x03, sp)
      00921C 6B 13            [ 1] 1465 	ld	(0x13, sp), a
      00921E 7B 0E            [ 1] 1466 	ld	a, (0x0e, sp)
      009220 1A 02            [ 1] 1467 	or	a, (0x02, sp)
      009222 6B 12            [ 1] 1468 	ld	(0x12, sp), a
      009224 7B 15            [ 1] 1469 	ld	a, (0x15, sp)
      009226 1A 09            [ 1] 1470 	or	a, (0x09, sp)
      009228 6B 11            [ 1] 1471 	ld	(0x11, sp), a
      00922A 7B 14            [ 1] 1472 	ld	a, (0x14, sp)
      00922C 1A 08            [ 1] 1473 	or	a, (0x08, sp)
      00922E 6B 10            [ 1] 1474 	ld	(0x10, sp), a
      009230 7B 13            [ 1] 1475 	ld	a, (0x13, sp)
      009232 1A 07            [ 1] 1476 	or	a, (0x07, sp)
      009234 6B 0F            [ 1] 1477 	ld	(0x0f, sp), a
      009236 7B 12            [ 1] 1478 	ld	a, (0x12, sp)
      009238 1A 06            [ 1] 1479 	or	a, (0x06, sp)
      00923A 6B 0E            [ 1] 1480 	ld	(0x0e, sp), a
      00923C 7B 11            [ 1] 1481 	ld	a, (0x11, sp)
      00923E 1A 0D            [ 1] 1482 	or	a, (0x0d, sp)
      009240 6B 15            [ 1] 1483 	ld	(0x15, sp), a
      009242 7B 10            [ 1] 1484 	ld	a, (0x10, sp)
      009244 1A 0C            [ 1] 1485 	or	a, (0x0c, sp)
      009246 6B 14            [ 1] 1486 	ld	(0x14, sp), a
      009248 7B 0F            [ 1] 1487 	ld	a, (0x0f, sp)
      00924A 1A 0B            [ 1] 1488 	or	a, (0x0b, sp)
      00924C 6B 13            [ 1] 1489 	ld	(0x13, sp), a
      00924E 7B 0E            [ 1] 1490 	ld	a, (0x0e, sp)
      009250 1A 0A            [ 1] 1491 	or	a, (0x0a, sp)
      009252 6B 12            [ 1] 1492 	ld	(0x12, sp), a
      009254 16 14            [ 2] 1493 	ldw	y, (0x14, sp)
      009256 17 10            [ 2] 1494 	ldw	(0x10, sp), y
      009258 7B 13            [ 1] 1495 	ld	a, (0x13, sp)
      00925A 6B 0F            [ 1] 1496 	ld	(0x0f, sp), a
      00925C 7B 12            [ 1] 1497 	ld	a, (0x12, sp)
      00925E A4 1F            [ 1] 1498 	and	a, #0x1f
      009260 6B 0E            [ 1] 1499 	ld	(0x0e, sp), a
      009262 1E 10            [ 2] 1500 	ldw	x, (0x10, sp)
      009264 CF 00 07         [ 2] 1501 	ldw	__Id+2, x
      009267 1E 0E            [ 2] 1502 	ldw	x, (0x0e, sp)
      009269 CF 00 05         [ 2] 1503 	ldw	__Id+0, x
      00926C 20 46            [ 2] 1504 	jra	00103$
      00926E                       1505 00102$:
                                   1506 ;	HAL_CAN.c: 629: temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
      00926E C6 54 2A         [ 1] 1507 	ld	a, 0x542a
      009271 A4 1F            [ 1] 1508 	and	a, #0x1f
      009273 97               [ 1] 1509 	ld	xl, a
      009274 4F               [ 1] 1510 	clr	a
      009275 95               [ 1] 1511 	ld	xh, a
      009276 58               [ 2] 1512 	sllw	x
      009277 58               [ 2] 1513 	sllw	x
      009278 58               [ 2] 1514 	sllw	x
      009279 58               [ 2] 1515 	sllw	x
      00927A 58               [ 2] 1516 	sllw	x
      00927B 58               [ 2] 1517 	sllw	x
      00927C 90 5F            [ 1] 1518 	clrw	y
      00927E 1F 10            [ 2] 1519 	ldw	(0x10, sp), x
      009280 17 0E            [ 2] 1520 	ldw	(0x0e, sp), y
                                   1521 ;	HAL_CAN.c: 630: temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2) & 0x3F);
      009282 C6 54 2B         [ 1] 1522 	ld	a, 0x542b
      009285 5F               [ 1] 1523 	clrw	x
      009286 97               [ 1] 1524 	ld	xl, a
      009287 54               [ 2] 1525 	srlw	x
      009288 54               [ 2] 1526 	srlw	x
      009289 9F               [ 1] 1527 	ld	a, xl
      00928A A4 3F            [ 1] 1528 	and	a, #0x3f
      00928C 97               [ 1] 1529 	ld	xl, a
      00928D 4F               [ 1] 1530 	clr	a
      00928E 90 5F            [ 1] 1531 	clrw	y
      009290 41               [ 1] 1532 	exg	a, xl
      009291 6B 15            [ 1] 1533 	ld	(0x15, sp), a
      009293 41               [ 1] 1534 	exg	a, xl
      009294 17 12            [ 2] 1535 	ldw	(0x12, sp), y
                                   1536 ;	HAL_CAN.c: 632: _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2);
      009296 1A 10            [ 1] 1537 	or	a, (0x10, sp)
      009298 88               [ 1] 1538 	push	a
      009299 7B 12            [ 1] 1539 	ld	a, (0x12, sp)
      00929B 1A 16            [ 1] 1540 	or	a, (0x16, sp)
      00929D 90 97            [ 1] 1541 	ld	yl, a
      00929F 7B 10            [ 1] 1542 	ld	a, (0x10, sp)
      0092A1 1A 14            [ 1] 1543 	or	a, (0x14, sp)
      0092A3 7B 0F            [ 1] 1544 	ld	a, (0x0f, sp)
      0092A5 1A 13            [ 1] 1545 	or	a, (0x13, sp)
      0092A7 84               [ 1] 1546 	pop	a
      0092A8 A4 07            [ 1] 1547 	and	a, #0x07
      0092AA 90 95            [ 1] 1548 	ld	yh, a
      0092AC 5F               [ 1] 1549 	clrw	x
      0092AD 90 CF 00 07      [ 2] 1550 	ldw	__Id+2, y
      0092B1 CF 00 05         [ 2] 1551 	ldw	__Id+0, x
      0092B4                       1552 00103$:
                                   1553 ;	HAL_CAN.c: 635: _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
      0092B4 C6 54 2A         [ 1] 1554 	ld	a, 0x542a
      0092B7 A4 20            [ 1] 1555 	and	a, #0x20
      0092B9 C7 00 0A         [ 1] 1556 	ld	__RTR+0, a
                                   1557 ;	HAL_CAN.c: 638: _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
      0092BC C6 54 29         [ 1] 1558 	ld	a, 0x5429
      0092BF A4 0F            [ 1] 1559 	and	a, #0x0f
      0092C1 C7 00 0B         [ 1] 1560 	ld	__DLC+0, a
                                   1561 ;	HAL_CAN.c: 641: _FMI = CAN->Page.RxFIFO.MFMI;
      0092C4 C6 54 28         [ 1] 1562 	ld	a, 0x5428
      0092C7 C7 00 14         [ 1] 1563 	ld	__FMI+0, a
                                   1564 ;	HAL_CAN.c: 644: _Data[0] = CAN->Page.RxFIFO.MDAR1;
      0092CA C6 54 2E         [ 1] 1565 	ld	a, 0x542e
      0092CD C7 00 0C         [ 1] 1566 	ld	__Data+0, a
                                   1567 ;	HAL_CAN.c: 645: _Data[1] = CAN->Page.RxFIFO.MDAR2;
      0092D0 C6 54 2F         [ 1] 1568 	ld	a, 0x542f
      0092D3 C7 00 0D         [ 1] 1569 	ld	__Data+1, a
                                   1570 ;	HAL_CAN.c: 646: _Data[2] = CAN->Page.RxFIFO.MDAR3;
      0092D6 C6 54 30         [ 1] 1571 	ld	a, 0x5430
      0092D9 C7 00 0E         [ 1] 1572 	ld	__Data+2, a
                                   1573 ;	HAL_CAN.c: 647: _Data[3] = CAN->Page.RxFIFO.MDAR4;
      0092DC C6 54 31         [ 1] 1574 	ld	a, 0x5431
      0092DF C7 00 0F         [ 1] 1575 	ld	__Data+3, a
                                   1576 ;	HAL_CAN.c: 648: _Data[4] = CAN->Page.RxFIFO.MDAR5;
      0092E2 C6 54 32         [ 1] 1577 	ld	a, 0x5432
      0092E5 C7 00 10         [ 1] 1578 	ld	__Data+4, a
                                   1579 ;	HAL_CAN.c: 649: _Data[5] = CAN->Page.RxFIFO.MDAR6;
      0092E8 C6 54 33         [ 1] 1580 	ld	a, 0x5433
      0092EB C7 00 11         [ 1] 1581 	ld	__Data+5, a
                                   1582 ;	HAL_CAN.c: 650: _Data[6] = CAN->Page.RxFIFO.MDAR7;
      0092EE C6 54 34         [ 1] 1583 	ld	a, 0x5434
      0092F1 C7 00 12         [ 1] 1584 	ld	__Data+6, a
                                   1585 ;	HAL_CAN.c: 651: _Data[7] = CAN->Page.RxFIFO.MDAR8;
      0092F4 C6 54 35         [ 1] 1586 	ld	a, 0x5435
      0092F7 C7 00 13         [ 1] 1587 	ld	__Data+7, a
                                   1588 ;	HAL_CAN.c: 654: CAN_FIFORelease();
      0092FA CD 91 7A         [ 4] 1589 	call	_CAN_FIFORelease
                                   1590 ;	HAL_CAN.c: 656: CAN_SelectPage(can_page);
      0092FD 7B 01            [ 1] 1591 	ld	a, (0x01, sp)
      0092FF 88               [ 1] 1592 	push	a
      009300 CD 96 EC         [ 4] 1593 	call	_CAN_SelectPage
                                   1594 ;	HAL_CAN.c: 657: }
      009303 5B 16            [ 2] 1595 	addw	sp, #22
      009305 81               [ 4] 1596 	ret
                                   1597 ;	HAL_CAN.c: 659: uint32_t CAN_GetReceivedId(void)
                                   1598 ;	-----------------------------------------
                                   1599 ;	 function CAN_GetReceivedId
                                   1600 ;	-----------------------------------------
      009306                       1601 _CAN_GetReceivedId:
                                   1602 ;	HAL_CAN.c: 661: return (_Id);
      009306 CE 00 07         [ 2] 1603 	ldw	x, __Id+2
      009309 90 CE 00 05      [ 2] 1604 	ldw	y, __Id+0
                                   1605 ;	HAL_CAN.c: 662: }
      00930D 81               [ 4] 1606 	ret
                                   1607 ;	HAL_CAN.c: 664: CAN_Id_TypeDef CAN_GetReceivedIDE(void)
                                   1608 ;	-----------------------------------------
                                   1609 ;	 function CAN_GetReceivedIDE
                                   1610 ;	-----------------------------------------
      00930E                       1611 _CAN_GetReceivedIDE:
                                   1612 ;	HAL_CAN.c: 666: return (CAN_Id_TypeDef)(_IDE);
      00930E C6 00 09         [ 1] 1613 	ld	a, __IDE+0
                                   1614 ;	HAL_CAN.c: 667: }
      009311 81               [ 4] 1615 	ret
                                   1616 ;	HAL_CAN.c: 669: CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
                                   1617 ;	-----------------------------------------
                                   1618 ;	 function CAN_GetReceivedRTR
                                   1619 ;	-----------------------------------------
      009312                       1620 _CAN_GetReceivedRTR:
                                   1621 ;	HAL_CAN.c: 671: return (CAN_RTR_TypeDef)(_RTR);
      009312 C6 00 0A         [ 1] 1622 	ld	a, __RTR+0
                                   1623 ;	HAL_CAN.c: 672: }
      009315 81               [ 4] 1624 	ret
                                   1625 ;	HAL_CAN.c: 674: uint8_t CAN_GetReceivedDLC(void)
                                   1626 ;	-----------------------------------------
                                   1627 ;	 function CAN_GetReceivedDLC
                                   1628 ;	-----------------------------------------
      009316                       1629 _CAN_GetReceivedDLC:
                                   1630 ;	HAL_CAN.c: 676: return (_DLC);
      009316 C6 00 0B         [ 1] 1631 	ld	a, __DLC+0
                                   1632 ;	HAL_CAN.c: 677: }
      009319 81               [ 4] 1633 	ret
                                   1634 ;	HAL_CAN.c: 679: uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
                                   1635 ;	-----------------------------------------
                                   1636 ;	 function CAN_GetReceivedData
                                   1637 ;	-----------------------------------------
      00931A                       1638 _CAN_GetReceivedData:
                                   1639 ;	HAL_CAN.c: 681: return (_Data[CAN_DataIndex]);
      00931A 5F               [ 1] 1640 	clrw	x
      00931B 7B 03            [ 1] 1641 	ld	a, (0x03, sp)
      00931D 97               [ 1] 1642 	ld	xl, a
      00931E 1C 00 0C         [ 2] 1643 	addw	x, #(__Data + 0)
      009321 F6               [ 1] 1644 	ld	a, (x)
                                   1645 ;	HAL_CAN.c: 682: }
      009322 81               [ 4] 1646 	ret
                                   1647 ;	HAL_CAN.c: 684: uint8_t CAN_GetReceivedFMI(void)
                                   1648 ;	-----------------------------------------
                                   1649 ;	 function CAN_GetReceivedFMI
                                   1650 ;	-----------------------------------------
      009323                       1651 _CAN_GetReceivedFMI:
                                   1652 ;	HAL_CAN.c: 686: return (_FMI);
      009323 C6 00 14         [ 1] 1653 	ld	a, __FMI+0
                                   1654 ;	HAL_CAN.c: 687: }
      009326 81               [ 4] 1655 	ret
                                   1656 ;	HAL_CAN.c: 689: uint16_t CAN_GetMessageTimeStamp(void)
                                   1657 ;	-----------------------------------------
                                   1658 ;	 function CAN_GetMessageTimeStamp
                                   1659 ;	-----------------------------------------
      009327                       1660 _CAN_GetMessageTimeStamp:
      009327 52 02            [ 2] 1661 	sub	sp, #2
                                   1662 ;	HAL_CAN.c: 692: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      009329 CD 96 E8         [ 4] 1663 	call	_CAN_GetSelectedPage
      00932C 90 97            [ 1] 1664 	ld	yl, a
                                   1665 ;	HAL_CAN.c: 695: CAN->PSR = CAN_Page_RxFifo;
      00932E 35 07 54 27      [ 1] 1666 	mov	0x5427+0, #0x07
                                   1667 ;	HAL_CAN.c: 697: timestamp = CAN->Page.RxFIFO.MTSRL;
      009332 C6 54 36         [ 1] 1668 	ld	a, 0x5436
      009335 5F               [ 1] 1669 	clrw	x
      009336 97               [ 1] 1670 	ld	xl, a
                                   1671 ;	HAL_CAN.c: 698: timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH) << 8);
      009337 C6 54 37         [ 1] 1672 	ld	a, 0x5437
      00933A 0F 01            [ 1] 1673 	clr	(0x01, sp)
      00933C 0F 02            [ 1] 1674 	clr	(0x02, sp)
      00933E 89               [ 2] 1675 	pushw	x
      00933F 1A 01            [ 1] 1676 	or	a, (1, sp)
      009341 85               [ 2] 1677 	popw	x
      009342 01               [ 1] 1678 	rrwa	x
      009343 1A 02            [ 1] 1679 	or	a, (0x02, sp)
      009345 97               [ 1] 1680 	ld	xl, a
                                   1681 ;	HAL_CAN.c: 701: CAN_SelectPage(can_page);
      009346 89               [ 2] 1682 	pushw	x
      009347 90 9F            [ 1] 1683 	ld	a, yl
      009349 88               [ 1] 1684 	push	a
      00934A CD 96 EC         [ 4] 1685 	call	_CAN_SelectPage
      00934D 84               [ 1] 1686 	pop	a
      00934E 85               [ 2] 1687 	popw	x
                                   1688 ;	HAL_CAN.c: 703: return (uint16_t)(timestamp);
                                   1689 ;	HAL_CAN.c: 704: }
      00934F 5B 02            [ 2] 1690 	addw	sp, #2
      009351 81               [ 4] 1691 	ret
                                   1692 ;	HAL_CAN.c: 706: CAN_Sleep_TypeDef CAN_Sleep(void)
                                   1693 ;	-----------------------------------------
                                   1694 ;	 function CAN_Sleep
                                   1695 ;	-----------------------------------------
      009352                       1696 _CAN_Sleep:
                                   1697 ;	HAL_CAN.c: 709: CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
      009352 5F               [ 1] 1698 	clrw	x
                                   1699 ;	HAL_CAN.c: 712: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
      009353 C6 54 20         [ 1] 1700 	ld	a, 0x5420
      009356 A4 FE            [ 1] 1701 	and	a, #0xfe
      009358 AA 02            [ 1] 1702 	or	a, #0x02
      00935A C7 54 20         [ 1] 1703 	ld	0x5420, a
                                   1704 ;	HAL_CAN.c: 715: if ((CAN->MSR & (CAN_MSR_SLAK | CAN_MSR_INAK)) == CAN_MSR_SLAK)
      00935D C6 54 21         [ 1] 1705 	ld	a, 0x5421
      009360 A4 03            [ 1] 1706 	and	a, #0x03
                                   1707 ;	HAL_CAN.c: 718: sleepstatus = CAN_Sleep_Ok;
      009362 A0 02            [ 1] 1708 	sub	a, #0x02
      009364 26 02            [ 1] 1709 	jrne	00102$
      009366 4C               [ 1] 1710 	inc	a
      009367 97               [ 1] 1711 	ld	xl, a
      009368                       1712 00102$:
                                   1713 ;	HAL_CAN.c: 722: return (CAN_Sleep_TypeDef)sleepstatus;
      009368 9F               [ 1] 1714 	ld	a, xl
                                   1715 ;	HAL_CAN.c: 723: }
      009369 81               [ 4] 1716 	ret
                                   1717 ;	HAL_CAN.c: 730: CAN_WakeUp_TypeDef CAN_WakeUp(void)
                                   1718 ;	-----------------------------------------
                                   1719 ;	 function CAN_WakeUp
                                   1720 ;	-----------------------------------------
      00936A                       1721 _CAN_WakeUp:
                                   1722 ;	HAL_CAN.c: 732: CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
      00936A 5F               [ 1] 1723 	clrw	x
                                   1724 ;	HAL_CAN.c: 735: CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
      00936B 72 13 54 20      [ 1] 1725 	bres	21536, #1
                                   1726 ;	HAL_CAN.c: 738: if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
      00936F C6 54 21         [ 1] 1727 	ld	a, 0x5421
      009372 A4 02            [ 1] 1728 	and	a, #0x02
      009374 A1 02            [ 1] 1729 	cp	a, #0x02
      009376 27 03            [ 1] 1730 	jreq	00102$
                                   1731 ;	HAL_CAN.c: 741: wakeupstatus = CAN_WakeUp_Ok;
      009378 A6 01            [ 1] 1732 	ld	a, #0x01
      00937A 97               [ 1] 1733 	ld	xl, a
      00937B                       1734 00102$:
                                   1735 ;	HAL_CAN.c: 745: return (CAN_WakeUp_TypeDef)wakeupstatus;
      00937B 9F               [ 1] 1736 	ld	a, xl
                                   1737 ;	HAL_CAN.c: 746: }
      00937C 81               [ 4] 1738 	ret
                                   1739 ;	HAL_CAN.c: 748: CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
                                   1740 ;	-----------------------------------------
                                   1741 ;	 function CAN_OperatingModeRequest
                                   1742 ;	-----------------------------------------
      00937D                       1743 _CAN_OperatingModeRequest:
                                   1744 ;	HAL_CAN.c: 754: if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
      00937D 0D 03            [ 1] 1745 	tnz	(0x03, sp)
      00937F 26 27            [ 1] 1746 	jrne	00129$
                                   1747 ;	HAL_CAN.c: 757: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
      009381 C6 54 20         [ 1] 1748 	ld	a, 0x5420
      009384 A4 FD            [ 1] 1749 	and	a, #0xfd
      009386 AA 01            [ 1] 1750 	or	a, #0x01
      009388 C7 54 20         [ 1] 1751 	ld	0x5420, a
                                   1752 ;	HAL_CAN.c: 760: while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
      00938B 5F               [ 1] 1753 	clrw	x
      00938C 5A               [ 2] 1754 	decw	x
      00938D                       1755 00102$:
      00938D C6 54 21         [ 1] 1756 	ld	a, 0x5421
      009390 A4 03            [ 1] 1757 	and	a, #0x03
      009392 4A               [ 1] 1758 	dec	a
      009393 27 06            [ 1] 1759 	jreq	00104$
      009395 5D               [ 2] 1760 	tnzw	x
      009396 27 03            [ 1] 1761 	jreq	00104$
                                   1762 ;	HAL_CAN.c: 762: timeout--;
      009398 5A               [ 2] 1763 	decw	x
      009399 20 F2            [ 2] 1764 	jra	00102$
      00939B                       1765 00104$:
                                   1766 ;	HAL_CAN.c: 764: if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
      00939B C6 54 21         [ 1] 1767 	ld	a, 0x5421
      00939E A4 03            [ 1] 1768 	and	a, #0x03
      0093A0 4A               [ 1] 1769 	dec	a
      0093A1 27 02            [ 1] 1770 	jreq	00106$
                                   1771 ;	HAL_CAN.c: 766: modestatus = CAN_ModeStatus_Failed;
      0093A3 4F               [ 1] 1772 	clr	a
      0093A4 81               [ 4] 1773 	ret
      0093A5                       1774 00106$:
                                   1775 ;	HAL_CAN.c: 770: modestatus = CAN_ModeStatus_Success;
      0093A5 A6 01            [ 1] 1776 	ld	a, #0x01
      0093A7 81               [ 4] 1777 	ret
      0093A8                       1778 00129$:
                                   1779 ;	HAL_CAN.c: 774: else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
      0093A8 7B 03            [ 1] 1780 	ld	a, (0x03, sp)
      0093AA 4A               [ 1] 1781 	dec	a
      0093AB 26 23            [ 1] 1782 	jrne	00126$
                                   1783 ;	HAL_CAN.c: 777: CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP | CAN_MCR_INRQ));
      0093AD C6 54 20         [ 1] 1784 	ld	a, 0x5420
      0093B0 A4 FC            [ 1] 1785 	and	a, #0xfc
      0093B2 C7 54 20         [ 1] 1786 	ld	0x5420, a
                                   1787 ;	HAL_CAN.c: 780: while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout != 0))
      0093B5 5F               [ 1] 1788 	clrw	x
      0093B6 5A               [ 2] 1789 	decw	x
      0093B7                       1790 00109$:
      0093B7 C6 54 21         [ 1] 1791 	ld	a, 0x5421
      0093BA A5 03            [ 1] 1792 	bcp	a, #0x03
      0093BC 27 06            [ 1] 1793 	jreq	00111$
      0093BE 5D               [ 2] 1794 	tnzw	x
      0093BF 27 03            [ 1] 1795 	jreq	00111$
                                   1796 ;	HAL_CAN.c: 782: timeout--;
      0093C1 5A               [ 2] 1797 	decw	x
      0093C2 20 F3            [ 2] 1798 	jra	00109$
      0093C4                       1799 00111$:
                                   1800 ;	HAL_CAN.c: 784: if ((CAN->MSR & CAN_MODE_MASK) != 0)
      0093C4 C6 54 21         [ 1] 1801 	ld	a, 0x5421
      0093C7 A5 03            [ 1] 1802 	bcp	a, #0x03
      0093C9 27 02            [ 1] 1803 	jreq	00113$
                                   1804 ;	HAL_CAN.c: 786: modestatus = CAN_ModeStatus_Failed;
      0093CB 4F               [ 1] 1805 	clr	a
      0093CC 81               [ 4] 1806 	ret
      0093CD                       1807 00113$:
                                   1808 ;	HAL_CAN.c: 790: modestatus = CAN_ModeStatus_Success;
      0093CD A6 01            [ 1] 1809 	ld	a, #0x01
      0093CF 81               [ 4] 1810 	ret
      0093D0                       1811 00126$:
                                   1812 ;	HAL_CAN.c: 793: else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
      0093D0 7B 03            [ 1] 1813 	ld	a, (0x03, sp)
      0093D2 A1 02            [ 1] 1814 	cp	a, #0x02
      0093D4 26 29            [ 1] 1815 	jrne	00123$
                                   1816 ;	HAL_CAN.c: 796: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
      0093D6 C6 54 20         [ 1] 1817 	ld	a, 0x5420
      0093D9 A4 FE            [ 1] 1818 	and	a, #0xfe
      0093DB AA 02            [ 1] 1819 	or	a, #0x02
      0093DD C7 54 20         [ 1] 1820 	ld	0x5420, a
                                   1821 ;	HAL_CAN.c: 799: while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout != 0))
      0093E0 5F               [ 1] 1822 	clrw	x
      0093E1 5A               [ 2] 1823 	decw	x
      0093E2                       1824 00116$:
      0093E2 C6 54 21         [ 1] 1825 	ld	a, 0x5421
      0093E5 A4 03            [ 1] 1826 	and	a, #0x03
      0093E7 A1 02            [ 1] 1827 	cp	a, #0x02
      0093E9 27 06            [ 1] 1828 	jreq	00118$
      0093EB 5D               [ 2] 1829 	tnzw	x
      0093EC 27 03            [ 1] 1830 	jreq	00118$
                                   1831 ;	HAL_CAN.c: 801: timeout--;
      0093EE 5A               [ 2] 1832 	decw	x
      0093EF 20 F1            [ 2] 1833 	jra	00116$
      0093F1                       1834 00118$:
                                   1835 ;	HAL_CAN.c: 803: if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
      0093F1 C6 54 21         [ 1] 1836 	ld	a, 0x5421
      0093F4 A4 03            [ 1] 1837 	and	a, #0x03
      0093F6 A1 02            [ 1] 1838 	cp	a, #0x02
      0093F8 27 02            [ 1] 1839 	jreq	00120$
                                   1840 ;	HAL_CAN.c: 805: modestatus = CAN_ModeStatus_Failed;
      0093FA 4F               [ 1] 1841 	clr	a
      0093FB 81               [ 4] 1842 	ret
      0093FC                       1843 00120$:
                                   1844 ;	HAL_CAN.c: 809: modestatus = CAN_ModeStatus_Success;
      0093FC A6 01            [ 1] 1845 	ld	a, #0x01
      0093FE 81               [ 4] 1846 	ret
      0093FF                       1847 00123$:
                                   1848 ;	HAL_CAN.c: 814: modestatus = CAN_ModeStatus_Failed;
      0093FF 4F               [ 1] 1849 	clr	a
                                   1850 ;	HAL_CAN.c: 816: return (CAN_ModeStatus_TypeDef)(modestatus);
                                   1851 ;	HAL_CAN.c: 817: }
      009400 81               [ 4] 1852 	ret
                                   1853 ;	HAL_CAN.c: 819: CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
                                   1854 ;	-----------------------------------------
                                   1855 ;	 function CAN_GetLastErrorCode
                                   1856 ;	-----------------------------------------
      009401                       1857 _CAN_GetLastErrorCode:
                                   1858 ;	HAL_CAN.c: 822: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      009401 CD 96 E8         [ 4] 1859 	call	_CAN_GetSelectedPage
      009404 97               [ 1] 1860 	ld	xl, a
                                   1861 ;	HAL_CAN.c: 824: CAN->PSR = CAN_Page_Config;
      009405 35 06 54 27      [ 1] 1862 	mov	0x5427+0, #0x06
                                   1863 ;	HAL_CAN.c: 825: errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
      009409 C6 54 28         [ 1] 1864 	ld	a, 0x5428
      00940C A4 70            [ 1] 1865 	and	a, #0x70
                                   1866 ;	HAL_CAN.c: 828: CAN_SelectPage(can_page);
      00940E 88               [ 1] 1867 	push	a
      00940F 89               [ 2] 1868 	pushw	x
      009410 5B 01            [ 2] 1869 	addw	sp, #1
      009412 CD 96 EC         [ 4] 1870 	call	_CAN_SelectPage
      009415 84               [ 1] 1871 	pop	a
      009416 84               [ 1] 1872 	pop	a
                                   1873 ;	HAL_CAN.c: 830: return (CAN_ErrorCode_TypeDef)(errcode);
                                   1874 ;	HAL_CAN.c: 831: }
      009417 81               [ 4] 1875 	ret
                                   1876 ;	HAL_CAN.c: 833: void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
                                   1877 ;	-----------------------------------------
                                   1878 ;	 function CAN_ClearFlag
                                   1879 ;	-----------------------------------------
      009418                       1880 _CAN_ClearFlag:
      009418 52 02            [ 2] 1881 	sub	sp, #2
                                   1882 ;	HAL_CAN.c: 836: if (((uint16_t)CAN_Flag & 0x0700) != 0)
      00941A 1E 05            [ 2] 1883 	ldw	x, (0x05, sp)
      00941C 9E               [ 1] 1884 	ld	a, xh
      00941D A5 07            [ 1] 1885 	bcp	a, #0x07
      00941F 27 2C            [ 1] 1886 	jreq	00108$
                                   1887 ;	HAL_CAN.c: 841: CAN->RFR = (uint8_t)(CAN_Flag);
      009421 9F               [ 1] 1888 	ld	a, xl
                                   1889 ;	HAL_CAN.c: 838: if (((uint16_t)CAN_Flag & 0x020B) != 0)
      009422 88               [ 1] 1890 	push	a
      009423 9F               [ 1] 1891 	ld	a, xl
      009424 A4 0B            [ 1] 1892 	and	a, #0x0b
      009426 6B 03            [ 1] 1893 	ld	(0x03, sp), a
      009428 9E               [ 1] 1894 	ld	a, xh
      009429 A4 02            [ 1] 1895 	and	a, #0x02
      00942B 6B 02            [ 1] 1896 	ld	(0x02, sp), a
      00942D 84               [ 1] 1897 	pop	a
      00942E 16 01            [ 2] 1898 	ldw	y, (0x01, sp)
      009430 27 05            [ 1] 1899 	jreq	00105$
                                   1900 ;	HAL_CAN.c: 841: CAN->RFR = (uint8_t)(CAN_Flag);
      009432 C7 54 24         [ 1] 1901 	ld	0x5424, a
      009435 20 26            [ 2] 1902 	jra	00110$
      009437                       1903 00105$:
                                   1904 ;	HAL_CAN.c: 843: else if (((uint16_t)CAN_Flag & 0x0403) != 0)
      009437 88               [ 1] 1905 	push	a
      009438 9F               [ 1] 1906 	ld	a, xl
      009439 A4 03            [ 1] 1907 	and	a, #0x03
      00943B 02               [ 1] 1908 	rlwa	x
      00943C A4 04            [ 1] 1909 	and	a, #0x04
      00943E 95               [ 1] 1910 	ld	xh, a
      00943F 84               [ 1] 1911 	pop	a
      009440 5D               [ 2] 1912 	tnzw	x
      009441 27 05            [ 1] 1913 	jreq	00102$
                                   1914 ;	HAL_CAN.c: 846: CAN->TSR = (uint8_t)(CAN_Flag);
      009443 C7 54 22         [ 1] 1915 	ld	0x5422, a
      009446 20 15            [ 2] 1916 	jra	00110$
      009448                       1917 00102$:
                                   1918 ;	HAL_CAN.c: 851: CAN->MSR = (uint8_t)(CAN_Flag);
      009448 C7 54 21         [ 1] 1919 	ld	0x5421, a
      00944B 20 10            [ 2] 1920 	jra	00110$
      00944D                       1921 00108$:
                                   1922 ;	HAL_CAN.c: 857: can_page = CAN_GetSelectedPage();
      00944D CD 96 E8         [ 4] 1923 	call	_CAN_GetSelectedPage
                                   1924 ;	HAL_CAN.c: 860: CAN->PSR = CAN_Page_Config;
      009450 35 06 54 27      [ 1] 1925 	mov	0x5427+0, #0x06
                                   1926 ;	HAL_CAN.c: 861: CAN->Page.Config.ESR = (uint8_t)0;
      009454 35 00 54 28      [ 1] 1927 	mov	0x5428+0, #0x00
                                   1928 ;	HAL_CAN.c: 864: CAN_SelectPage(can_page);
      009458 88               [ 1] 1929 	push	a
      009459 CD 96 EC         [ 4] 1930 	call	_CAN_SelectPage
      00945C 84               [ 1] 1931 	pop	a
      00945D                       1932 00110$:
                                   1933 ;	HAL_CAN.c: 866: }
      00945D 5B 02            [ 2] 1934 	addw	sp, #2
      00945F 81               [ 4] 1935 	ret
                                   1936 ;	HAL_CAN.c: 868: uint8_t CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
                                   1937 ;	-----------------------------------------
                                   1938 ;	 function CAN_GetFlagStatus
                                   1939 ;	-----------------------------------------
      009460                       1940 _CAN_GetFlagStatus:
      009460 52 05            [ 2] 1941 	sub	sp, #5
                                   1942 ;	HAL_CAN.c: 873: if (((uint16_t)CAN_Flag & 0x0700) != 0)
      009462 16 08            [ 2] 1943 	ldw	y, (0x08, sp)
                                   1944 ;	HAL_CAN.c: 878: if ((CAN->RFR & (uint16_t)CAN_Flag) != 0)
      009464 17 04            [ 2] 1945 	ldw	(0x04, sp), y
      009466 17 01            [ 2] 1946 	ldw	(0x01, sp), y
                                   1947 ;	HAL_CAN.c: 873: if (((uint16_t)CAN_Flag & 0x0700) != 0)
      009468 7B 04            [ 1] 1948 	ld	a, (0x04, sp)
      00946A A5 07            [ 1] 1949 	bcp	a, #0x07
      00946C 27 5F            [ 1] 1950 	jreq	00120$
                                   1951 ;	HAL_CAN.c: 875: if (((uint16_t)CAN_Flag & 0x020B) != 0)
      00946E 7B 05            [ 1] 1952 	ld	a, (0x05, sp)
      009470 A4 0B            [ 1] 1953 	and	a, #0x0b
      009472 97               [ 1] 1954 	ld	xl, a
      009473 7B 04            [ 1] 1955 	ld	a, (0x04, sp)
      009475 A4 02            [ 1] 1956 	and	a, #0x02
      009477 95               [ 1] 1957 	ld	xh, a
      009478 5D               [ 2] 1958 	tnzw	x
      009479 27 17            [ 1] 1959 	jreq	00114$
                                   1960 ;	HAL_CAN.c: 878: if ((CAN->RFR & (uint16_t)CAN_Flag) != 0)
      00947B C6 54 24         [ 1] 1961 	ld	a, 0x5424
      00947E 5F               [ 1] 1962 	clrw	x
      00947F 14 02            [ 1] 1963 	and	a, (0x02, sp)
      009481 02               [ 1] 1964 	rlwa	x
      009482 14 01            [ 1] 1965 	and	a, (0x01, sp)
      009484 95               [ 1] 1966 	ld	xh, a
      009485 5D               [ 2] 1967 	tnzw	x
      009486 27 06            [ 1] 1968 	jreq	00102$
                                   1969 ;	HAL_CAN.c: 881: bitstatus = 1;
      009488 A6 01            [ 1] 1970 	ld	a, #0x01
      00948A 6B 05            [ 1] 1971 	ld	(0x05, sp), a
      00948C 20 67            [ 2] 1972 	jra	00121$
      00948E                       1973 00102$:
                                   1974 ;	HAL_CAN.c: 886: bitstatus = 0;
      00948E 0F 05            [ 1] 1975 	clr	(0x05, sp)
      009490 20 63            [ 2] 1976 	jra	00121$
      009492                       1977 00114$:
                                   1978 ;	HAL_CAN.c: 890: else if (((uint16_t)CAN_Flag & 0x0403) != 0)
      009492 7B 05            [ 1] 1979 	ld	a, (0x05, sp)
      009494 A4 03            [ 1] 1980 	and	a, #0x03
      009496 97               [ 1] 1981 	ld	xl, a
      009497 7B 04            [ 1] 1982 	ld	a, (0x04, sp)
      009499 A4 04            [ 1] 1983 	and	a, #0x04
      00949B 95               [ 1] 1984 	ld	xh, a
      00949C 5D               [ 2] 1985 	tnzw	x
      00949D 27 17            [ 1] 1986 	jreq	00111$
                                   1987 ;	HAL_CAN.c: 893: if ((CAN->TSR & (uint16_t)CAN_Flag) != 0)
      00949F C6 54 22         [ 1] 1988 	ld	a, 0x5422
      0094A2 5F               [ 1] 1989 	clrw	x
      0094A3 14 02            [ 1] 1990 	and	a, (0x02, sp)
      0094A5 02               [ 1] 1991 	rlwa	x
      0094A6 14 01            [ 1] 1992 	and	a, (0x01, sp)
      0094A8 95               [ 1] 1993 	ld	xh, a
      0094A9 5D               [ 2] 1994 	tnzw	x
      0094AA 27 06            [ 1] 1995 	jreq	00105$
                                   1996 ;	HAL_CAN.c: 896: bitstatus = 1;
      0094AC A6 01            [ 1] 1997 	ld	a, #0x01
      0094AE 6B 05            [ 1] 1998 	ld	(0x05, sp), a
      0094B0 20 43            [ 2] 1999 	jra	00121$
      0094B2                       2000 00105$:
                                   2001 ;	HAL_CAN.c: 901: bitstatus = 0;
      0094B2 0F 05            [ 1] 2002 	clr	(0x05, sp)
      0094B4 20 3F            [ 2] 2003 	jra	00121$
      0094B6                       2004 00111$:
                                   2005 ;	HAL_CAN.c: 907: if ((CAN->MSR & (uint16_t)CAN_Flag) != 0)
      0094B6 C6 54 21         [ 1] 2006 	ld	a, 0x5421
      0094B9 5F               [ 1] 2007 	clrw	x
      0094BA 14 02            [ 1] 2008 	and	a, (0x02, sp)
      0094BC 02               [ 1] 2009 	rlwa	x
      0094BD 14 01            [ 1] 2010 	and	a, (0x01, sp)
      0094BF 95               [ 1] 2011 	ld	xh, a
      0094C0 5D               [ 2] 2012 	tnzw	x
      0094C1 27 06            [ 1] 2013 	jreq	00108$
                                   2014 ;	HAL_CAN.c: 910: bitstatus = 1;
      0094C3 A6 01            [ 1] 2015 	ld	a, #0x01
      0094C5 6B 05            [ 1] 2016 	ld	(0x05, sp), a
      0094C7 20 2C            [ 2] 2017 	jra	00121$
      0094C9                       2018 00108$:
                                   2019 ;	HAL_CAN.c: 915: bitstatus = 0;
      0094C9 0F 05            [ 1] 2020 	clr	(0x05, sp)
      0094CB 20 28            [ 2] 2021 	jra	00121$
      0094CD                       2022 00120$:
                                   2023 ;	HAL_CAN.c: 922: can_page = CAN_GetSelectedPage();
      0094CD CD 96 E8         [ 4] 2024 	call	_CAN_GetSelectedPage
      0094D0 6B 03            [ 1] 2025 	ld	(0x03, sp), a
                                   2026 ;	HAL_CAN.c: 924: CAN->PSR = CAN_Page_Config;
      0094D2 35 06 54 27      [ 1] 2027 	mov	0x5427+0, #0x06
                                   2028 ;	HAL_CAN.c: 925: if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != 0)
      0094D6 C6 54 28         [ 1] 2029 	ld	a, 0x5428
      0094D9 5F               [ 1] 2030 	clrw	x
      0094DA 14 02            [ 1] 2031 	and	a, (0x02, sp)
      0094DC 6B 05            [ 1] 2032 	ld	(0x05, sp), a
      0094DE 9F               [ 1] 2033 	ld	a, xl
      0094DF 14 01            [ 1] 2034 	and	a, (0x01, sp)
      0094E1 6B 04            [ 1] 2035 	ld	(0x04, sp), a
      0094E3 1E 04            [ 2] 2036 	ldw	x, (0x04, sp)
      0094E5 27 05            [ 1] 2037 	jreq	00117$
                                   2038 ;	HAL_CAN.c: 928: bitstatus = 1;
      0094E7 A6 01            [ 1] 2039 	ld	a, #0x01
      0094E9 6B 05            [ 1] 2040 	ld	(0x05, sp), a
                                   2041 ;	HAL_CAN.c: 933: bitstatus = 0;
      0094EB C5                    2042 	.byte 0xc5
      0094EC                       2043 00117$:
      0094EC 0F 05            [ 1] 2044 	clr	(0x05, sp)
      0094EE                       2045 00118$:
                                   2046 ;	HAL_CAN.c: 936: CAN_SelectPage(can_page);
      0094EE 7B 03            [ 1] 2047 	ld	a, (0x03, sp)
      0094F0 88               [ 1] 2048 	push	a
      0094F1 CD 96 EC         [ 4] 2049 	call	_CAN_SelectPage
      0094F4 84               [ 1] 2050 	pop	a
      0094F5                       2051 00121$:
                                   2052 ;	HAL_CAN.c: 941: return  (uint8_t)bitstatus;
      0094F5 7B 05            [ 1] 2053 	ld	a, (0x05, sp)
                                   2054 ;	HAL_CAN.c: 942: }
      0094F7 5B 05            [ 2] 2055 	addw	sp, #5
      0094F9 81               [ 4] 2056 	ret
                                   2057 ;	HAL_CAN.c: 944: uint8_t CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
                                   2058 ;	-----------------------------------------
                                   2059 ;	 function CAN_GetITStatus
                                   2060 ;	-----------------------------------------
      0094FA                       2061 _CAN_GetITStatus:
      0094FA 52 03            [ 2] 2062 	sub	sp, #3
                                   2063 ;	HAL_CAN.c: 947: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      0094FC CD 96 E8         [ 4] 2064 	call	_CAN_GetSelectedPage
      0094FF 6B 01            [ 1] 2065 	ld	(0x01, sp), a
                                   2066 ;	HAL_CAN.c: 949: switch (CAN_IT)
      009501 16 06            [ 2] 2067 	ldw	y, (0x06, sp)
      009503 17 02            [ 2] 2068 	ldw	(0x02, sp), y
      009505 93               [ 1] 2069 	ldw	x, y
      009506 5A               [ 2] 2070 	decw	x
      009507 27 57            [ 1] 2071 	jreq	00101$
      009509 1E 02            [ 2] 2072 	ldw	x, (0x02, sp)
      00950B A3 00 02         [ 2] 2073 	cpw	x, #0x0002
      00950E 27 68            [ 1] 2074 	jreq	00105$
      009510 1E 02            [ 2] 2075 	ldw	x, (0x02, sp)
      009512 A3 00 04         [ 2] 2076 	cpw	x, #0x0004
      009515 27 7A            [ 1] 2077 	jreq	00109$
      009517 1E 02            [ 2] 2078 	ldw	x, (0x02, sp)
      009519 A3 00 08         [ 2] 2079 	cpw	x, #0x0008
      00951C 26 03            [ 1] 2080 	jrne	00255$
      00951E CC 95 AA         [ 2] 2081 	jp	00113$
      009521                       2082 00255$:
      009521 1E 02            [ 2] 2083 	ldw	x, (0x02, sp)
      009523 A3 00 80         [ 2] 2084 	cpw	x, #0x0080
      009526 26 03            [ 1] 2085 	jrne	00258$
      009528 CC 95 C3         [ 2] 2086 	jp	00117$
      00952B                       2087 00258$:
      00952B 1E 02            [ 2] 2088 	ldw	x, (0x02, sp)
      00952D A3 01 00         [ 2] 2089 	cpw	x, #0x0100
      009530 26 03            [ 1] 2090 	jrne	00261$
      009532 CC 95 F3         [ 2] 2091 	jp	00125$
      009535                       2092 00261$:
      009535 1E 02            [ 2] 2093 	ldw	x, (0x02, sp)
      009537 A3 02 00         [ 2] 2094 	cpw	x, #0x0200
      00953A 26 03            [ 1] 2095 	jrne	00264$
      00953C CC 96 0D         [ 2] 2096 	jp	00129$
      00953F                       2097 00264$:
      00953F 1E 02            [ 2] 2098 	ldw	x, (0x02, sp)
      009541 A3 04 00         [ 2] 2099 	cpw	x, #0x0400
      009544 26 03            [ 1] 2100 	jrne	00267$
      009546 CC 96 28         [ 2] 2101 	jp	00133$
      009549                       2102 00267$:
      009549 1E 02            [ 2] 2103 	ldw	x, (0x02, sp)
      00954B A3 08 00         [ 2] 2104 	cpw	x, #0x0800
      00954E 26 03            [ 1] 2105 	jrne	00270$
      009550 CC 96 43         [ 2] 2106 	jp	00137$
      009553                       2107 00270$:
      009553 1E 02            [ 2] 2108 	ldw	x, (0x02, sp)
      009555 A3 40 00         [ 2] 2109 	cpw	x, #0x4000
      009558 26 03            [ 1] 2110 	jrne	00273$
      00955A CC 95 DA         [ 2] 2111 	jp	00121$
      00955D                       2112 00273$:
      00955D CC 96 5D         [ 2] 2113 	jp	00141$
                                   2114 ;	HAL_CAN.c: 951: case CAN_IT_TME:
      009560                       2115 00101$:
                                   2116 ;	HAL_CAN.c: 952: if ((CAN->IER & CAN_IER_TMEIE) != 0)
      009560 C6 54 25         [ 1] 2117 	ld	a, 0x5425
      009563 44               [ 1] 2118 	srl	a
      009564 24 0E            [ 1] 2119 	jrnc	00103$
                                   2120 ;	HAL_CAN.c: 954: pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
      009566 C6 54 22         [ 1] 2121 	ld	a, 0x5422
      009569 4B 07            [ 1] 2122 	push	#0x07
      00956B 88               [ 1] 2123 	push	a
      00956C CD 96 F3         [ 4] 2124 	call	_CheckITStatus
      00956F 5B 02            [ 2] 2125 	addw	sp, #2
      009571 CC 96 5E         [ 2] 2126 	jp	00142$
      009574                       2127 00103$:
                                   2128 ;	HAL_CAN.c: 958: pendingbitstatus = 0;
      009574 4F               [ 1] 2129 	clr	a
                                   2130 ;	HAL_CAN.c: 960: break;
      009575 CC 96 5E         [ 2] 2131 	jp	00142$
                                   2132 ;	HAL_CAN.c: 962: case CAN_IT_FMP:
      009578                       2133 00105$:
                                   2134 ;	HAL_CAN.c: 963: if ((CAN->IER & CAN_IER_FMPIE) != 0)
      009578 C6 54 25         [ 1] 2135 	ld	a, 0x5425
      00957B A5 02            [ 1] 2136 	bcp	a, #0x02
      00957D 27 0E            [ 1] 2137 	jreq	00107$
                                   2138 ;	HAL_CAN.c: 965: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
      00957F C6 54 24         [ 1] 2139 	ld	a, 0x5424
      009582 4B 03            [ 1] 2140 	push	#0x03
      009584 88               [ 1] 2141 	push	a
      009585 CD 96 F3         [ 4] 2142 	call	_CheckITStatus
      009588 5B 02            [ 2] 2143 	addw	sp, #2
      00958A CC 96 5E         [ 2] 2144 	jp	00142$
      00958D                       2145 00107$:
                                   2146 ;	HAL_CAN.c: 969: pendingbitstatus = 0;
      00958D 4F               [ 1] 2147 	clr	a
                                   2148 ;	HAL_CAN.c: 971: break;
      00958E CC 96 5E         [ 2] 2149 	jp	00142$
                                   2150 ;	HAL_CAN.c: 972: case CAN_IT_FF:
      009591                       2151 00109$:
                                   2152 ;	HAL_CAN.c: 973: if ((CAN->IER & CAN_IER_FFIE) != 0)
      009591 C6 54 25         [ 1] 2153 	ld	a, 0x5425
      009594 A5 04            [ 1] 2154 	bcp	a, #0x04
      009596 27 0E            [ 1] 2155 	jreq	00111$
                                   2156 ;	HAL_CAN.c: 975: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
      009598 C6 54 24         [ 1] 2157 	ld	a, 0x5424
      00959B 4B 08            [ 1] 2158 	push	#0x08
      00959D 88               [ 1] 2159 	push	a
      00959E CD 96 F3         [ 4] 2160 	call	_CheckITStatus
      0095A1 5B 02            [ 2] 2161 	addw	sp, #2
      0095A3 CC 96 5E         [ 2] 2162 	jp	00142$
      0095A6                       2163 00111$:
                                   2164 ;	HAL_CAN.c: 979: pendingbitstatus = 0;
      0095A6 4F               [ 1] 2165 	clr	a
                                   2166 ;	HAL_CAN.c: 981: break;
      0095A7 CC 96 5E         [ 2] 2167 	jp	00142$
                                   2168 ;	HAL_CAN.c: 982: case CAN_IT_FOV:
      0095AA                       2169 00113$:
                                   2170 ;	HAL_CAN.c: 983: if ((CAN->IER & CAN_IER_FOVIE) != 0)
      0095AA C6 54 25         [ 1] 2171 	ld	a, 0x5425
      0095AD A5 08            [ 1] 2172 	bcp	a, #0x08
      0095AF 27 0E            [ 1] 2173 	jreq	00115$
                                   2174 ;	HAL_CAN.c: 985: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
      0095B1 C6 54 24         [ 1] 2175 	ld	a, 0x5424
      0095B4 4B 10            [ 1] 2176 	push	#0x10
      0095B6 88               [ 1] 2177 	push	a
      0095B7 CD 96 F3         [ 4] 2178 	call	_CheckITStatus
      0095BA 5B 02            [ 2] 2179 	addw	sp, #2
      0095BC CC 96 5E         [ 2] 2180 	jp	00142$
      0095BF                       2181 00115$:
                                   2182 ;	HAL_CAN.c: 989: pendingbitstatus = 0;
      0095BF 4F               [ 1] 2183 	clr	a
                                   2184 ;	HAL_CAN.c: 991: break;
      0095C0 CC 96 5E         [ 2] 2185 	jp	00142$
                                   2186 ;	HAL_CAN.c: 992: case CAN_IT_WKU:
      0095C3                       2187 00117$:
                                   2188 ;	HAL_CAN.c: 993: if ((CAN->IER & CAN_IER_WKUIE) != 0)
      0095C3 C6 54 25         [ 1] 2189 	ld	a, 0x5425
      0095C6 2A 0E            [ 1] 2190 	jrpl	00119$
                                   2191 ;	HAL_CAN.c: 995: pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
      0095C8 C6 54 21         [ 1] 2192 	ld	a, 0x5421
      0095CB 4B 08            [ 1] 2193 	push	#0x08
      0095CD 88               [ 1] 2194 	push	a
      0095CE CD 96 F3         [ 4] 2195 	call	_CheckITStatus
      0095D1 5B 02            [ 2] 2196 	addw	sp, #2
      0095D3 CC 96 5E         [ 2] 2197 	jp	00142$
      0095D6                       2198 00119$:
                                   2199 ;	HAL_CAN.c: 999: pendingbitstatus = 0;
      0095D6 4F               [ 1] 2200 	clr	a
                                   2201 ;	HAL_CAN.c: 1001: break;
      0095D7 CC 96 5E         [ 2] 2202 	jp	00142$
                                   2203 ;	HAL_CAN.c: 1003: case CAN_IT_ERR:
      0095DA                       2204 00121$:
                                   2205 ;	HAL_CAN.c: 1004: CAN->PSR = CAN_Page_Config;
      0095DA 35 06 54 27      [ 1] 2206 	mov	0x5427+0, #0x06
                                   2207 ;	HAL_CAN.c: 1005: if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) != 0)
      0095DE C6 54 29         [ 1] 2208 	ld	a, 0x5429
      0095E1 2A 0D            [ 1] 2209 	jrpl	00123$
                                   2210 ;	HAL_CAN.c: 1007: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF | CAN_ESR_EPVF | CAN_ESR_BOFF | CAN_ESR_LEC);
      0095E3 C6 54 28         [ 1] 2211 	ld	a, 0x5428
      0095E6 4B 77            [ 1] 2212 	push	#0x77
      0095E8 88               [ 1] 2213 	push	a
      0095E9 CD 96 F3         [ 4] 2214 	call	_CheckITStatus
      0095EC 5B 02            [ 2] 2215 	addw	sp, #2
      0095EE 20 6E            [ 2] 2216 	jra	00142$
      0095F0                       2217 00123$:
                                   2218 ;	HAL_CAN.c: 1011: pendingbitstatus = 0;
      0095F0 4F               [ 1] 2219 	clr	a
                                   2220 ;	HAL_CAN.c: 1013: break;
      0095F1 20 6B            [ 2] 2221 	jra	00142$
                                   2222 ;	HAL_CAN.c: 1015: case CAN_IT_EWG:
      0095F3                       2223 00125$:
                                   2224 ;	HAL_CAN.c: 1016: CAN->PSR = CAN_Page_Config;
      0095F3 35 06 54 27      [ 1] 2225 	mov	0x5427+0, #0x06
                                   2226 ;	HAL_CAN.c: 1017: if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) != 0)
      0095F7 C6 54 29         [ 1] 2227 	ld	a, 0x5429
      0095FA 44               [ 1] 2228 	srl	a
      0095FB 24 0D            [ 1] 2229 	jrnc	00127$
                                   2230 ;	HAL_CAN.c: 1019: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
      0095FD C6 54 28         [ 1] 2231 	ld	a, 0x5428
      009600 4B 01            [ 1] 2232 	push	#0x01
      009602 88               [ 1] 2233 	push	a
      009603 CD 96 F3         [ 4] 2234 	call	_CheckITStatus
      009606 5B 02            [ 2] 2235 	addw	sp, #2
      009608 20 54            [ 2] 2236 	jra	00142$
      00960A                       2237 00127$:
                                   2238 ;	HAL_CAN.c: 1023: pendingbitstatus = 0;
      00960A 4F               [ 1] 2239 	clr	a
                                   2240 ;	HAL_CAN.c: 1025: break;
      00960B 20 51            [ 2] 2241 	jra	00142$
                                   2242 ;	HAL_CAN.c: 1027: case CAN_IT_EPV:
      00960D                       2243 00129$:
                                   2244 ;	HAL_CAN.c: 1028: CAN->PSR = CAN_Page_Config;
      00960D 35 06 54 27      [ 1] 2245 	mov	0x5427+0, #0x06
                                   2246 ;	HAL_CAN.c: 1029: if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) != 0)
      009611 C6 54 29         [ 1] 2247 	ld	a, 0x5429
      009614 A5 02            [ 1] 2248 	bcp	a, #0x02
      009616 27 0D            [ 1] 2249 	jreq	00131$
                                   2250 ;	HAL_CAN.c: 1031: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
      009618 C6 54 28         [ 1] 2251 	ld	a, 0x5428
      00961B 4B 02            [ 1] 2252 	push	#0x02
      00961D 88               [ 1] 2253 	push	a
      00961E CD 96 F3         [ 4] 2254 	call	_CheckITStatus
      009621 5B 02            [ 2] 2255 	addw	sp, #2
      009623 20 39            [ 2] 2256 	jra	00142$
      009625                       2257 00131$:
                                   2258 ;	HAL_CAN.c: 1035: pendingbitstatus = 0;
      009625 4F               [ 1] 2259 	clr	a
                                   2260 ;	HAL_CAN.c: 1037: break;
      009626 20 36            [ 2] 2261 	jra	00142$
                                   2262 ;	HAL_CAN.c: 1038: case CAN_IT_BOF:
      009628                       2263 00133$:
                                   2264 ;	HAL_CAN.c: 1039: CAN->PSR = CAN_Page_Config;
      009628 35 06 54 27      [ 1] 2265 	mov	0x5427+0, #0x06
                                   2266 ;	HAL_CAN.c: 1040: if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) != 0)
      00962C C6 54 29         [ 1] 2267 	ld	a, 0x5429
      00962F A5 04            [ 1] 2268 	bcp	a, #0x04
      009631 27 0D            [ 1] 2269 	jreq	00135$
                                   2270 ;	HAL_CAN.c: 1042: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
      009633 C6 54 28         [ 1] 2271 	ld	a, 0x5428
      009636 4B 04            [ 1] 2272 	push	#0x04
      009638 88               [ 1] 2273 	push	a
      009639 CD 96 F3         [ 4] 2274 	call	_CheckITStatus
      00963C 5B 02            [ 2] 2275 	addw	sp, #2
      00963E 20 1E            [ 2] 2276 	jra	00142$
      009640                       2277 00135$:
                                   2278 ;	HAL_CAN.c: 1046: pendingbitstatus = 0;
      009640 4F               [ 1] 2279 	clr	a
                                   2280 ;	HAL_CAN.c: 1048: break;
      009641 20 1B            [ 2] 2281 	jra	00142$
                                   2282 ;	HAL_CAN.c: 1049: case CAN_IT_LEC:
      009643                       2283 00137$:
                                   2284 ;	HAL_CAN.c: 1050: CAN->PSR = CAN_Page_Config;
      009643 35 06 54 27      [ 1] 2285 	mov	0x5427+0, #0x06
                                   2286 ;	HAL_CAN.c: 1051: if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) != 0)
      009647 C6 54 29         [ 1] 2287 	ld	a, 0x5429
      00964A A5 10            [ 1] 2288 	bcp	a, #0x10
      00964C 27 0D            [ 1] 2289 	jreq	00139$
                                   2290 ;	HAL_CAN.c: 1053: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
      00964E C6 54 28         [ 1] 2291 	ld	a, 0x5428
      009651 4B 70            [ 1] 2292 	push	#0x70
      009653 88               [ 1] 2293 	push	a
      009654 CD 96 F3         [ 4] 2294 	call	_CheckITStatus
      009657 5B 02            [ 2] 2295 	addw	sp, #2
      009659 20 03            [ 2] 2296 	jra	00142$
      00965B                       2297 00139$:
                                   2298 ;	HAL_CAN.c: 1057: pendingbitstatus = 0;
      00965B 4F               [ 1] 2299 	clr	a
                                   2300 ;	HAL_CAN.c: 1059: break;
                                   2301 ;	HAL_CAN.c: 1060: default:
                                   2302 ;	HAL_CAN.c: 1061: pendingbitstatus = 0;
                                   2303 ;	HAL_CAN.c: 1063: }
      00965C 21                    2304 	.byte 0x21
      00965D                       2305 00141$:
      00965D 4F               [ 1] 2306 	clr	a
      00965E                       2307 00142$:
                                   2308 ;	HAL_CAN.c: 1065: CAN_SelectPage(can_page);
      00965E 88               [ 1] 2309 	push	a
      00965F 41               [ 1] 2310 	exg	a, xl
      009660 7B 02            [ 1] 2311 	ld	a, (0x02, sp)
      009662 41               [ 1] 2312 	exg	a, xl
      009663 89               [ 2] 2313 	pushw	x
      009664 5B 01            [ 2] 2314 	addw	sp, #1
      009666 CD 96 EC         [ 4] 2315 	call	_CAN_SelectPage
      009669 84               [ 1] 2316 	pop	a
      00966A 84               [ 1] 2317 	pop	a
                                   2318 ;	HAL_CAN.c: 1067: return  (uint8_t)pendingbitstatus;
                                   2319 ;	HAL_CAN.c: 1068: }
      00966B 5B 03            [ 2] 2320 	addw	sp, #3
      00966D 81               [ 4] 2321 	ret
                                   2322 ;	HAL_CAN.c: 1070: void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
                                   2323 ;	-----------------------------------------
                                   2324 ;	 function CAN_ClearITPendingBit
                                   2325 ;	-----------------------------------------
      00966E                       2326 _CAN_ClearITPendingBit:
                                   2327 ;	HAL_CAN.c: 1072: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
      00966E CD 96 E8         [ 4] 2328 	call	_CAN_GetSelectedPage
                                   2329 ;	HAL_CAN.c: 1074: switch (CAN_IT)
      009671 1E 03            [ 2] 2330 	ldw	x, (0x03, sp)
      009673 A3 00 01         [ 2] 2331 	cpw	x, #0x0001
      009676 27 2A            [ 1] 2332 	jreq	00101$
      009678 A3 00 04         [ 2] 2333 	cpw	x, #0x0004
      00967B 27 2B            [ 1] 2334 	jreq	00102$
      00967D A3 00 08         [ 2] 2335 	cpw	x, #0x0008
      009680 27 2C            [ 1] 2336 	jreq	00103$
      009682 A3 00 80         [ 2] 2337 	cpw	x, #0x0080
      009685 27 2D            [ 1] 2338 	jreq	00104$
      009687 A3 01 00         [ 2] 2339 	cpw	x, #0x0100
      00968A 27 3C            [ 1] 2340 	jreq	00106$
      00968C A3 02 00         [ 2] 2341 	cpw	x, #0x0200
      00968F 27 3D            [ 1] 2342 	jreq	00107$
      009691 A3 04 00         [ 2] 2343 	cpw	x, #0x0400
      009694 27 3E            [ 1] 2344 	jreq	00108$
      009696 A3 08 00         [ 2] 2345 	cpw	x, #0x0800
      009699 27 3F            [ 1] 2346 	jreq	00109$
      00969B A3 40 00         [ 2] 2347 	cpw	x, #0x4000
      00969E 27 1A            [ 1] 2348 	jreq	00105$
      0096A0 20 40            [ 2] 2349 	jra	00111$
                                   2350 ;	HAL_CAN.c: 1076: case CAN_IT_TME:
      0096A2                       2351 00101$:
                                   2352 ;	HAL_CAN.c: 1077: CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
      0096A2 35 07 54 22      [ 1] 2353 	mov	0x5422+0, #0x07
                                   2354 ;	HAL_CAN.c: 1078: break;
      0096A6 20 3A            [ 2] 2355 	jra	00111$
                                   2356 ;	HAL_CAN.c: 1080: case CAN_IT_FF:
      0096A8                       2357 00102$:
                                   2358 ;	HAL_CAN.c: 1081: CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
      0096A8 35 08 54 24      [ 1] 2359 	mov	0x5424+0, #0x08
                                   2360 ;	HAL_CAN.c: 1082: break;
      0096AC 20 34            [ 2] 2361 	jra	00111$
                                   2362 ;	HAL_CAN.c: 1084: case CAN_IT_FOV:
      0096AE                       2363 00103$:
                                   2364 ;	HAL_CAN.c: 1085: CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
      0096AE 35 10 54 24      [ 1] 2365 	mov	0x5424+0, #0x10
                                   2366 ;	HAL_CAN.c: 1086: break;
      0096B2 20 2E            [ 2] 2367 	jra	00111$
                                   2368 ;	HAL_CAN.c: 1088: case CAN_IT_WKU:
      0096B4                       2369 00104$:
                                   2370 ;	HAL_CAN.c: 1089: CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
      0096B4 35 08 54 21      [ 1] 2371 	mov	0x5421+0, #0x08
                                   2372 ;	HAL_CAN.c: 1090: break;
      0096B8 20 28            [ 2] 2373 	jra	00111$
                                   2374 ;	HAL_CAN.c: 1092: case CAN_IT_ERR:
      0096BA                       2375 00105$:
                                   2376 ;	HAL_CAN.c: 1093: CAN->PSR = CAN_Page_Config;
      0096BA 35 06 54 27      [ 1] 2377 	mov	0x5427+0, #0x06
                                   2378 ;	HAL_CAN.c: 1094: CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
      0096BE 35 00 54 28      [ 1] 2379 	mov	0x5428+0, #0x00
                                   2380 ;	HAL_CAN.c: 1095: CAN->MSR = CAN_MSR_ERRI;
      0096C2 35 04 54 21      [ 1] 2381 	mov	0x5421+0, #0x04
                                   2382 ;	HAL_CAN.c: 1096: break;
      0096C6 20 1A            [ 2] 2383 	jra	00111$
                                   2384 ;	HAL_CAN.c: 1098: case CAN_IT_EWG:
      0096C8                       2385 00106$:
                                   2386 ;	HAL_CAN.c: 1099: CAN->MSR = CAN_MSR_ERRI;
      0096C8 35 04 54 21      [ 1] 2387 	mov	0x5421+0, #0x04
                                   2388 ;	HAL_CAN.c: 1100: break;
      0096CC 20 14            [ 2] 2389 	jra	00111$
                                   2390 ;	HAL_CAN.c: 1102: case CAN_IT_EPV:
      0096CE                       2391 00107$:
                                   2392 ;	HAL_CAN.c: 1103: CAN->MSR = CAN_MSR_ERRI;
      0096CE 35 04 54 21      [ 1] 2393 	mov	0x5421+0, #0x04
                                   2394 ;	HAL_CAN.c: 1104: break;
      0096D2 20 0E            [ 2] 2395 	jra	00111$
                                   2396 ;	HAL_CAN.c: 1106: case CAN_IT_BOF:
      0096D4                       2397 00108$:
                                   2398 ;	HAL_CAN.c: 1107: CAN->MSR = CAN_MSR_ERRI;
      0096D4 35 04 54 21      [ 1] 2399 	mov	0x5421+0, #0x04
                                   2400 ;	HAL_CAN.c: 1108: break;
      0096D8 20 08            [ 2] 2401 	jra	00111$
                                   2402 ;	HAL_CAN.c: 1110: case CAN_IT_LEC:
      0096DA                       2403 00109$:
                                   2404 ;	HAL_CAN.c: 1111: CAN->PSR = CAN_Page_Config;
      0096DA 35 06 54 27      [ 1] 2405 	mov	0x5427+0, #0x06
                                   2406 ;	HAL_CAN.c: 1112: CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
      0096DE 35 00 54 28      [ 1] 2407 	mov	0x5428+0, #0x00
                                   2408 ;	HAL_CAN.c: 1119: }
      0096E2                       2409 00111$:
                                   2410 ;	HAL_CAN.c: 1121: CAN_SelectPage(can_page);
      0096E2 88               [ 1] 2411 	push	a
      0096E3 CD 96 EC         [ 4] 2412 	call	_CAN_SelectPage
      0096E6 84               [ 1] 2413 	pop	a
                                   2414 ;	HAL_CAN.c: 1122: }
      0096E7 81               [ 4] 2415 	ret
                                   2416 ;	HAL_CAN.c: 1124: CAN_Page_TypeDef CAN_GetSelectedPage(void)
                                   2417 ;	-----------------------------------------
                                   2418 ;	 function CAN_GetSelectedPage
                                   2419 ;	-----------------------------------------
      0096E8                       2420 _CAN_GetSelectedPage:
                                   2421 ;	HAL_CAN.c: 1126: return (CAN_Page_TypeDef)(CAN->PSR);
      0096E8 C6 54 27         [ 1] 2422 	ld	a, 0x5427
                                   2423 ;	HAL_CAN.c: 1127: }
      0096EB 81               [ 4] 2424 	ret
                                   2425 ;	HAL_CAN.c: 1129: void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
                                   2426 ;	-----------------------------------------
                                   2427 ;	 function CAN_SelectPage
                                   2428 ;	-----------------------------------------
      0096EC                       2429 _CAN_SelectPage:
                                   2430 ;	HAL_CAN.c: 1131: CAN->PSR = (uint8_t)CAN_Page;
      0096EC AE 54 27         [ 2] 2431 	ldw	x, #0x5427
      0096EF 7B 03            [ 1] 2432 	ld	a, (0x03, sp)
      0096F1 F7               [ 1] 2433 	ld	(x), a
                                   2434 ;	HAL_CAN.c: 1132: }
      0096F2 81               [ 4] 2435 	ret
                                   2436 ;	HAL_CAN.c: 1134: static uint8_t CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
                                   2437 ;	-----------------------------------------
                                   2438 ;	 function CheckITStatus
                                   2439 ;	-----------------------------------------
      0096F3                       2440 _CheckITStatus:
                                   2441 ;	HAL_CAN.c: 1137: if ((CAN_Reg & It_Bit) != (uint8_t)0)
      0096F3 7B 03            [ 1] 2442 	ld	a, (0x03, sp)
      0096F5 14 04            [ 1] 2443 	and	a, (0x04, sp)
      0096F7 27 03            [ 1] 2444 	jreq	00102$
                                   2445 ;	HAL_CAN.c: 1140: pendingbitstatus = 1;
      0096F9 A6 01            [ 1] 2446 	ld	a, #0x01
      0096FB 81               [ 4] 2447 	ret
      0096FC                       2448 00102$:
                                   2449 ;	HAL_CAN.c: 1145: pendingbitstatus = 0;
      0096FC 4F               [ 1] 2450 	clr	a
                                   2451 ;	HAL_CAN.c: 1147: return (uint8_t)pendingbitstatus;
                                   2452 ;	HAL_CAN.c: 1148: }
      0096FD 81               [ 4] 2453 	ret
                                   2454 	.area CODE
                                   2455 	.area CONST
                                   2456 	.area INITIALIZER
      008098                       2457 __xinit___Id:
      008098 00 00 00 00           2458 	.byte #0x00, #0x00, #0x00, #0x00	; 0
      00809C                       2459 __xinit___IDE:
      00809C 00                    2460 	.db #0x00	; 0
      00809D                       2461 __xinit___RTR:
      00809D 00                    2462 	.db #0x00	; 0
      00809E                       2463 __xinit___DLC:
      00809E 00                    2464 	.db #0x00	; 0
      00809F                       2465 __xinit___Data:
      00809F 00                    2466 	.db #0x00	; 0
      0080A0 00                    2467 	.db 0x00
      0080A1 00                    2468 	.db 0x00
      0080A2 00                    2469 	.db 0x00
      0080A3 00                    2470 	.db 0x00
      0080A4 00                    2471 	.db 0x00
      0080A5 00                    2472 	.db 0x00
      0080A6 00                    2473 	.db 0x00
      0080A7                       2474 __xinit___FMI:
      0080A7 00                    2475 	.db #0x00	; 0
                                   2476 	.area CABS (ABS)
