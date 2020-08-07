;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module HAL_CAN
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __FMI
	.globl __Data
	.globl __DLC
	.globl __RTR
	.globl __IDE
	.globl __Id
	.globl _CAN_DeInit
	.globl _CAN_Init
	.globl _CAN_FilterInit
	.globl _CAN_ITConfig
	.globl _CAN_ST7CompatibilityCmd
	.globl _CAN_TTComModeCmd
	.globl _CAN_Transmit
	.globl _CAN_TransmitStatus
	.globl _CAN_CancelTransmit
	.globl _CAN_FIFORelease
	.globl _CAN_MessagePending
	.globl _CAN_Receive
	.globl _CAN_GetReceivedId
	.globl _CAN_GetReceivedIDE
	.globl _CAN_GetReceivedRTR
	.globl _CAN_GetReceivedDLC
	.globl _CAN_GetReceivedData
	.globl _CAN_GetReceivedFMI
	.globl _CAN_GetMessageTimeStamp
	.globl _CAN_Sleep
	.globl _CAN_WakeUp
	.globl _CAN_OperatingModeRequest
	.globl _CAN_GetLastErrorCode
	.globl _CAN_ClearFlag
	.globl _CAN_GetFlagStatus
	.globl _CAN_GetITStatus
	.globl _CAN_ClearITPendingBit
	.globl _CAN_GetSelectedPage
	.globl _CAN_SelectPage
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
__Id::
	.ds 4
__IDE::
	.ds 1
__RTR::
	.ds 1
__DLC::
	.ds 1
__Data::
	.ds 8
__FMI::
	.ds 1
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
;	HAL_CAN.c: 23: void CAN_DeInit(void)
;	-----------------------------------------
;	 function CAN_DeInit
;	-----------------------------------------
_CAN_DeInit:
;	HAL_CAN.c: 26: CAN->MCR = CAN_MCR_INRQ;
	mov	0x5420+0, #0x01
;	HAL_CAN.c: 27: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 28: CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
	push	#0x00
	call	_CAN_OperatingModeRequest
	pop	a
;	HAL_CAN.c: 29: CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
	mov	0x5428+0, #0x00
;	HAL_CAN.c: 30: CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
	mov	0x5429+0, #0x00
;	HAL_CAN.c: 31: CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
	mov	0x542c+0, #0x40
;	HAL_CAN.c: 32: CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
	mov	0x542d+0, #0x23
;	HAL_CAN.c: 33: CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
	mov	0x5430+0, #0x00
;	HAL_CAN.c: 34: CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
	mov	0x5431+0, #0x00
;	HAL_CAN.c: 35: CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
	mov	0x5432+0, #0x00
;	HAL_CAN.c: 36: CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
	mov	0x5433+0, #0x00
;	HAL_CAN.c: 37: CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
	mov	0x5434+0, #0x00
;	HAL_CAN.c: 38: CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
	push	#0x01
	call	_CAN_OperatingModeRequest
	pop	a
;	HAL_CAN.c: 39: CAN->PSR = CAN_Page_RxFifo;
	mov	0x5427+0, #0x07
;	HAL_CAN.c: 40: CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
	mov	0x5429+0, #0x00
;	HAL_CAN.c: 41: CAN->PSR = CAN_Page_TxMailBox0;
	mov	0x5427+0, #0x00
;	HAL_CAN.c: 42: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
	mov	0x5429+0, #0x00
;	HAL_CAN.c: 43: CAN->PSR = CAN_Page_TxMailBox1;
	mov	0x5427+0, #0x01
;	HAL_CAN.c: 44: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
	mov	0x5429+0, #0x00
;	HAL_CAN.c: 45: CAN->PSR = CAN_Page_TxMailBox2;
	mov	0x5427+0, #0x05
;	HAL_CAN.c: 46: CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
	mov	0x5429+0, #0x00
;	HAL_CAN.c: 48: CAN->MCR = CAN_MCR_RESET_VALUE;
	mov	0x5420+0, #0x02
;	HAL_CAN.c: 49: CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
	mov	0x5421+0, #0xfd
;	HAL_CAN.c: 50: CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
	mov	0x5422+0, #0xff
;	HAL_CAN.c: 51: CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
	mov	0x5424+0, #0xff
;	HAL_CAN.c: 52: CAN->IER = CAN_IER_RESET_VALUE;
	mov	0x5425+0, #0x00
;	HAL_CAN.c: 53: CAN->DGR = CAN_DGR_RESET_VALUE;
	mov	0x5426+0, #0x0c
;	HAL_CAN.c: 54: CAN->PSR = CAN_PSR_RESET_VALUE;
	mov	0x5427+0, #0x00
;	HAL_CAN.c: 55: }
	ret
;	HAL_CAN.c: 57: CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
;	-----------------------------------------
;	 function CAN_Init
;	-----------------------------------------
_CAN_Init:
	push	a
;	HAL_CAN.c: 66: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	yl, a
;	HAL_CAN.c: 69: CAN->MCR = CAN_MCR_INRQ;
	mov	0x5420+0, #0x01
;	HAL_CAN.c: 71: while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
	clrw	x
	decw	x
00102$:
	ld	a, 0x5421
	and	a, #0x01
	dec	a
	jreq	00104$
	tnzw	x
	jreq	00104$
;	HAL_CAN.c: 73: timeout--;
	decw	x
	jra	00102$
00104$:
;	HAL_CAN.c: 77: if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
	ld	a, 0x5421
	and	a, #0x01
	dec	a
	jreq	00113$
;	HAL_CAN.c: 80: InitStatus = CAN_InitStatus_Failed;
	clr	(0x01, sp)
	jra	00114$
00113$:
;	HAL_CAN.c: 87: CAN->MCR |= (uint8_t)CAN_MasterCtrl;
	ld	a, 0x5420
	or	a, (0x04, sp)
	ld	0x5420, a
;	HAL_CAN.c: 90: CAN->DGR |= (uint8_t)CAN_Mode;
	ld	a, 0x5426
	or	a, (0x05, sp)
	ld	0x5426, a
;	HAL_CAN.c: 91: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 92: CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
	ld	a, (0x09, sp)
	dec	a
	or	a, (0x06, sp)
	ld	0x542c, a
;	HAL_CAN.c: 93: CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
	ld	a, (0x07, sp)
	or	a, (0x08, sp)
	ld	0x542d, a
;	HAL_CAN.c: 96: CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
	bres	21536, #0
;	HAL_CAN.c: 99: while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01)) && (timeout != 0))
	clrw	x
	decw	x
00106$:
	ld	a, 0x5421
	and	a, #0x01
	dec	a
	jrne	00108$
	tnzw	x
	jreq	00108$
;	HAL_CAN.c: 101: timeout--;
	decw	x
	jra	00106$
00108$:
;	HAL_CAN.c: 104: if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
	ld	a, 0x5421
	and	a, #0x01
	dec	a
	jrne	00110$
;	HAL_CAN.c: 106: InitStatus = CAN_InitStatus_Failed;
	clr	(0x01, sp)
	jra	00114$
00110$:
;	HAL_CAN.c: 110: InitStatus = CAN_InitStatus_Success;
	ld	a, #0x01
	ld	(0x01, sp), a
00114$:
;	HAL_CAN.c: 114: CAN_SelectPage(can_page);
	ld	a, yl
	push	a
	call	_CAN_SelectPage
	pop	a
;	HAL_CAN.c: 117: return (CAN_InitStatus_TypeDef)InitStatus;
	ld	a, (0x01, sp)
;	HAL_CAN.c: 118: }
	addw	sp, #1
	ret
;	HAL_CAN.c: 120: void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
;	-----------------------------------------
;	 function CAN_FilterInit
;	-----------------------------------------
_CAN_FilterInit:
	sub	sp, #9
;	HAL_CAN.c: 138: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x01, sp), a
;	HAL_CAN.c: 140: if (CAN_FilterNumber == CAN_FilterNumber_0)
	tnz	(0x0c, sp)
	jrne	00114$
;	HAL_CAN.c: 142: fact = 0x01;
	ld	a, #0x01
	ld	(0x02, sp), a
;	HAL_CAN.c: 143: fsc = 0x00;
	clr	(0x03, sp)
;	HAL_CAN.c: 144: fmhl = 0x03;
	ld	a, #0x03
	ld	xl, a
;	HAL_CAN.c: 146: can_page_filter = CAN_Page_Filter01;
	ld	a, #0x02
	ld	xh, a
	jra	00115$
00114$:
;	HAL_CAN.c: 148: else if (CAN_FilterNumber == CAN_FilterNumber_1)
	ld	a, (0x0c, sp)
	dec	a
	jrne	00111$
;	HAL_CAN.c: 150: fact = 0x10;
	ld	a, #0x10
	ld	(0x02, sp), a
;	HAL_CAN.c: 151: fsc = 0x04;
	ld	a, #0x04
	ld	(0x03, sp), a
;	HAL_CAN.c: 152: fmhl = 0x0C;
	ld	a, #0x0c
	ld	xl, a
;	HAL_CAN.c: 154: can_page_filter = CAN_Page_Filter01;
	ld	a, #0x02
	ld	xh, a
	jra	00115$
00111$:
;	HAL_CAN.c: 156: else if (CAN_FilterNumber == CAN_FilterNumber_2)
	ld	a, (0x0c, sp)
;	HAL_CAN.c: 158: fact = 0x01;
	sub	a, #0x02
	jrne	00108$
	inc	a
	ld	(0x02, sp), a
;	HAL_CAN.c: 159: fsc = 0x00;
	clr	(0x03, sp)
;	HAL_CAN.c: 160: fmhl = 0x30;
	ld	a, #0x30
	ld	xl, a
;	HAL_CAN.c: 162: can_page_filter = CAN_Page_Filter23;
	ld	a, #0x03
	ld	xh, a
	jra	00115$
00108$:
;	HAL_CAN.c: 164: else if (CAN_FilterNumber == CAN_FilterNumber_3)
	ld	a, (0x0c, sp)
	cp	a, #0x03
	jrne	00105$
;	HAL_CAN.c: 166: fact = 0x10;
	ld	a, #0x10
	ld	(0x02, sp), a
;	HAL_CAN.c: 167: fsc = 0x04;
	ld	a, #0x04
	ld	(0x03, sp), a
;	HAL_CAN.c: 168: fmhl = 0xC0;
	ld	a, #0xc0
	ld	xl, a
;	HAL_CAN.c: 170: can_page_filter = CAN_Page_Filter23;
	ld	a, #0x03
	ld	xh, a
	jra	00115$
00105$:
;	HAL_CAN.c: 172: else if (CAN_FilterNumber == CAN_FilterNumber_4)
	ld	a, (0x0c, sp)
;	HAL_CAN.c: 174: fact = 0x01;
	sub	a, #0x04
	jrne	00102$
	inc	a
	ld	(0x02, sp), a
;	HAL_CAN.c: 175: fsc = 0x00;
	clr	(0x03, sp)
;	HAL_CAN.c: 176: fmhl = 0x03;
	ld	a, #0x03
	ld	xl, a
;	HAL_CAN.c: 178: can_page_filter = CAN_Page_Filter45;
	ld	a, #0x04
	ld	xh, a
	jra	00115$
00102$:
;	HAL_CAN.c: 182: fact = 0x10;
	ld	a, #0x10
	ld	(0x02, sp), a
;	HAL_CAN.c: 183: fsc = 0x04;
	ld	a, #0x04
	ld	(0x03, sp), a
;	HAL_CAN.c: 184: fmhl = 0x0C;
	ld	a, #0x0c
	ld	xl, a
;	HAL_CAN.c: 186: can_page_filter = CAN_Page_Filter45;
	ld	a, #0x04
	ld	xh, a
00115$:
;	HAL_CAN.c: 190: CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
	pushw	x
	push	#0x00
	call	_CAN_OperatingModeRequest
	pop	a
	popw	x
;	HAL_CAN.c: 192: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
	ld	a, #0x06
	push	a
	ld	a, (0x04, sp)
	jreq	00322$
00321$:
	sll	(1, sp)
	dec	a
	jrne	00321$
00322$:
	ld	a, (0x10, sp)
	ld	(0x09, sp), a
	ld	a, (0x04, sp)
	jreq	00324$
00323$:
	sll	(0x09, sp)
	dec	a
	jrne	00323$
00324$:
	pop	a
;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
	or	a, (0x02, sp)
	cpl	a
	ld	(0x09, sp), a
;	HAL_CAN.c: 197: if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
	ld	a, xh
	cp	a, #0x02
	jrne	00120$
;	HAL_CAN.c: 200: CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc)));
	ld	a, 0x5432
	and	a, (0x09, sp)
	ld	0x5432, a
;	HAL_CAN.c: 202: CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
	ld	a, 0x5432
	or	a, (0x08, sp)
	ld	0x5432, a
	jra	00121$
00120$:
;	HAL_CAN.c: 204: else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
	ld	a, xh
	cp	a, #0x03
	jrne	00117$
;	HAL_CAN.c: 207: CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));
	ld	a, 0x5433
	and	a, (0x09, sp)
	ld	0x5433, a
;	HAL_CAN.c: 210: CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
	ld	a, 0x5433
	or	a, (0x08, sp)
	ld	0x5433, a
	jra	00121$
00117$:
;	HAL_CAN.c: 216: CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00 | CAN_FCR1_FSC01) << fsc));
	ld	a, 0x5434
	and	a, (0x09, sp)
	ld	0x5434, a
;	HAL_CAN.c: 219: CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
	ld	a, 0x5434
	or	a, (0x08, sp)
	ld	0x5434, a
00121$:
;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
	ld	a, xl
	cpl	a
	ld	(0x04, sp), a
;	HAL_CAN.c: 233: else if (CAN_FilterMode == CAN_FilterMode_IdList)
	ld	a, (0x0e, sp)
	dec	a
	jrne	00332$
	ld	a, #0x01
	ld	(0x05, sp), a
	.byte 0xc5
00332$:
	clr	(0x05, sp)
00333$:
;	HAL_CAN.c: 238: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
	ld	a, (0x0e, sp)
	sub	a, #0x11
	jrne	00335$
	inc	a
	ld	(0x06, sp), a
	.byte 0xc5
00335$:
	clr	(0x06, sp)
00336$:
;	HAL_CAN.c: 241: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
	ld	a, xl
	and	a, #0x55
	ld	(0x07, sp), a
;	HAL_CAN.c: 246: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
	ld	a, xl
	and	a, #0xaa
	ld	(0x08, sp), a
;	HAL_CAN.c: 225: if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
	ld	a, xh
	cp	a, #0x04
	jreq	00141$
;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
	ld	a, 0x5430
;	HAL_CAN.c: 228: if (CAN_FilterMode == CAN_FilterMode_IdMask)
	tnz	(0x0e, sp)
	jrne	00129$
;	HAL_CAN.c: 231: CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
	and	a, (0x04, sp)
	ld	0x5430, a
	jra	00142$
00129$:
;	HAL_CAN.c: 233: else if (CAN_FilterMode == CAN_FilterMode_IdList)
	tnz	(0x05, sp)
	jreq	00126$
;	HAL_CAN.c: 236: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	0x5430, a
	jra	00142$
00126$:
;	HAL_CAN.c: 238: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
	tnz	(0x06, sp)
	jreq	00123$
;	HAL_CAN.c: 241: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
	or	a, (0x07, sp)
	ld	0x5430, a
	jra	00142$
00123$:
;	HAL_CAN.c: 246: CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
	or	a, (0x08, sp)
	ld	0x5430, a
	jra	00142$
00141$:
;	HAL_CAN.c: 258: CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
	ld	a, 0x5431
	ld	(0x09, sp), a
;	HAL_CAN.c: 255: if (CAN_FilterMode == CAN_FilterMode_IdMask)
	tnz	(0x0e, sp)
	jrne	00138$
;	HAL_CAN.c: 258: CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
	ld	a, (0x09, sp)
	and	a, (0x04, sp)
	ld	0x5431, a
	jra	00142$
00138$:
;	HAL_CAN.c: 260: else if (CAN_FilterMode == CAN_FilterMode_IdList)
	tnz	(0x05, sp)
	jreq	00135$
;	HAL_CAN.c: 263: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
	pushw	x
	ld	a, (0x0b, sp)
	or	a, (2, sp)
	popw	x
	ld	0x5431, a
	jra	00142$
00135$:
;	HAL_CAN.c: 265: else if (CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
	tnz	(0x06, sp)
	jreq	00132$
;	HAL_CAN.c: 268: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
	ld	a, (0x09, sp)
	or	a, (0x07, sp)
	ld	0x5431, a
	jra	00142$
00132$:
;	HAL_CAN.c: 273: CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
	ld	a, (0x09, sp)
	or	a, (0x08, sp)
	ld	0x5431, a
00142$:
;	HAL_CAN.c: 279: CAN->PSR = (uint8_t)can_page_filter;
	ldw	y, #0x5427
	ld	a, xh
	ld	(y), a
;	HAL_CAN.c: 294: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
	ld	a, (0x0f, sp)
	sub	a, #0x02
	jrne	00347$
	inc	a
	ld	(0x08, sp), a
	.byte 0xc5
00347$:
	clr	(0x08, sp)
00348$:
;	HAL_CAN.c: 305: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
	ld	a, (0x0f, sp)
	sub	a, #0x04
	jrne	00350$
	inc	a
	ld	(0x09, sp), a
	.byte 0xc5
00350$:
	clr	(0x09, sp)
00351$:
;	HAL_CAN.c: 316: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
	ld	a, (0x0f, sp)
	sub	a, #0x06
	jrne	00353$
	inc	a
	.byte 0x21
00353$:
	clr	a
00354$:
;	HAL_CAN.c: 280: if (fsc != 0)
	tnz	(0x03, sp)
	jrne	00355$
	jp	00166$
00355$:
;	HAL_CAN.c: 283: if (CAN_FilterScale == CAN_FilterScale_8Bit)
	tnz	(0x0f, sp)
	jrne	00152$
;	HAL_CAN.c: 285: CAN->Page.Filter.FR09 = CAN_FilterID1;
	ldw	x, #0x5430
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 286: CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
	ldw	x, #0x5431
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 287: CAN->Page.Filter.FR11 = CAN_FilterID2;
	ldw	x, #0x5432
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 288: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
	ldw	x, #0x5433
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 289: CAN->Page.Filter.FR13 = CAN_FilterID3;
	ldw	x, #0x5434
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 290: CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
	ldw	x, #0x5435
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 291: CAN->Page.Filter.FR15 = CAN_FilterID4;
	ldw	x, #0x5436
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 292: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
	ldw	x, #0x5437
	ld	a, (0x17, sp)
	ld	(x), a
	jp	00167$
00152$:
;	HAL_CAN.c: 294: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
	tnz	(0x08, sp)
	jreq	00149$
;	HAL_CAN.c: 296: CAN->Page.Filter.FR09 = CAN_FilterID1;
	ldw	x, #0x5430
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 297: CAN->Page.Filter.FR10 = CAN_FilterID2;
	ldw	x, #0x5431
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 298: CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
	ldw	x, #0x5432
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 299: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
	ldw	x, #0x5433
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 300: CAN->Page.Filter.FR13 = CAN_FilterID3;
	ldw	x, #0x5434
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 301: CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
	ldw	x, #0x5435
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 302: CAN->Page.Filter.FR15 = CAN_FilterID4;
	ldw	x, #0x5436
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 303: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
	ldw	x, #0x5437
	ld	a, (0x17, sp)
	ld	(x), a
	jp	00167$
00149$:
;	HAL_CAN.c: 305: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
	tnz	(0x09, sp)
	jreq	00146$
;	HAL_CAN.c: 307: CAN->Page.Filter.FR09 = CAN_FilterID1;
	ldw	x, #0x5430
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 308: CAN->Page.Filter.FR10 = CAN_FilterID2;
	ldw	x, #0x5431
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 309: CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
	ldw	x, #0x5432
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 310: CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
	ldw	x, #0x5433
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 311: CAN->Page.Filter.FR13 = CAN_FilterID3;
	ldw	x, #0x5434
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 312: CAN->Page.Filter.FR14 = CAN_FilterID4;
	ldw	x, #0x5435
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 313: CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
	ldw	x, #0x5436
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 314: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
	ldw	x, #0x5437
	ld	a, (0x17, sp)
	ld	(x), a
	jp	00167$
00146$:
;	HAL_CAN.c: 316: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
	tnz	a
	jrne	00359$
	jp	00167$
00359$:
;	HAL_CAN.c: 318: CAN->Page.Filter.FR09 = CAN_FilterID1;
	ldw	x, #0x5430
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 319: CAN->Page.Filter.FR10 = CAN_FilterID2;
	ldw	x, #0x5431
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 320: CAN->Page.Filter.FR11 = CAN_FilterID3;
	ldw	x, #0x5432
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 321: CAN->Page.Filter.FR12 = CAN_FilterID4;
	ldw	x, #0x5433
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 322: CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
	ldw	x, #0x5434
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 323: CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
	ldw	x, #0x5435
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 324: CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
	ldw	x, #0x5436
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 325: CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
	ldw	x, #0x5437
	ld	a, (0x17, sp)
	ld	(x), a
	jp	00167$
00166$:
;	HAL_CAN.c: 331: if (CAN_FilterScale == CAN_FilterScale_8Bit)
	tnz	(0x0f, sp)
	jrne	00163$
;	HAL_CAN.c: 333: CAN->Page.Filter.FR01 = CAN_FilterID1;
	ldw	x, #0x5428
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 334: CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
	ldw	x, #0x5429
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 335: CAN->Page.Filter.FR03 = CAN_FilterID2;
	ldw	x, #0x542a
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 336: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
	ldw	x, #0x542b
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 337: CAN->Page.Filter.FR05 = CAN_FilterID3;
	ldw	x, #0x542c
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 338: CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
	ldw	x, #0x542d
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 339: CAN->Page.Filter.FR07 = CAN_FilterID4;
	ldw	x, #0x542e
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 340: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
	ldw	x, #0x542f
	ld	a, (0x17, sp)
	ld	(x), a
	jp	00167$
00163$:
;	HAL_CAN.c: 342: else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
	tnz	(0x08, sp)
	jreq	00160$
;	HAL_CAN.c: 344: CAN->Page.Filter.FR01 = CAN_FilterID1;
	ldw	x, #0x5428
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 345: CAN->Page.Filter.FR02 = CAN_FilterID2;
	ldw	x, #0x5429
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 346: CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
	ldw	x, #0x542a
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 347: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
	ldw	x, #0x542b
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 348: CAN->Page.Filter.FR05 = CAN_FilterID3;
	ldw	x, #0x542c
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 349: CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
	ldw	x, #0x542d
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 350: CAN->Page.Filter.FR07 = CAN_FilterID4;
	ldw	x, #0x542e
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 351: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
	ldw	x, #0x542f
	ld	a, (0x17, sp)
	ld	(x), a
	jra	00167$
00160$:
;	HAL_CAN.c: 353: else if (CAN_FilterScale == CAN_FilterScale_16Bit)
	tnz	(0x09, sp)
	jreq	00157$
;	HAL_CAN.c: 355: CAN->Page.Filter.FR01 = CAN_FilterID1;
	ldw	x, #0x5428
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 356: CAN->Page.Filter.FR02 = CAN_FilterID2;
	ldw	x, #0x5429
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 357: CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
	ldw	x, #0x542a
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 358: CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
	ldw	x, #0x542b
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 359: CAN->Page.Filter.FR05 = CAN_FilterID3;
	ldw	x, #0x542c
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 360: CAN->Page.Filter.FR06 = CAN_FilterID4;
	ldw	x, #0x542d
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 361: CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
	ldw	x, #0x542e
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 362: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
	ldw	x, #0x542f
	ld	a, (0x17, sp)
	ld	(x), a
	jra	00167$
00157$:
;	HAL_CAN.c: 364: else if (CAN_FilterScale == CAN_FilterScale_32Bit)
	tnz	a
	jreq	00167$
;	HAL_CAN.c: 366: CAN->Page.Filter.FR01 = CAN_FilterID1;
	ldw	x, #0x5428
	ld	a, (0x10, sp)
	ld	(x), a
;	HAL_CAN.c: 367: CAN->Page.Filter.FR02 = CAN_FilterID2;
	ldw	x, #0x5429
	ld	a, (0x11, sp)
	ld	(x), a
;	HAL_CAN.c: 368: CAN->Page.Filter.FR03 = CAN_FilterID3;
	ldw	x, #0x542a
	ld	a, (0x12, sp)
	ld	(x), a
;	HAL_CAN.c: 369: CAN->Page.Filter.FR04 = CAN_FilterID4;
	ldw	x, #0x542b
	ld	a, (0x13, sp)
	ld	(x), a
;	HAL_CAN.c: 370: CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
	ldw	x, #0x542c
	ld	a, (0x14, sp)
	ld	(x), a
;	HAL_CAN.c: 371: CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
	ldw	x, #0x542d
	ld	a, (0x15, sp)
	ld	(x), a
;	HAL_CAN.c: 372: CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
	ldw	x, #0x542e
	ld	a, (0x16, sp)
	ld	(x), a
;	HAL_CAN.c: 373: CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
	ldw	x, #0x542f
	ld	a, (0x17, sp)
	ld	(x), a
00167$:
;	HAL_CAN.c: 382: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 383: if (CAN_FilterActivation != 0)
	tnz	(0x0d, sp)
	jreq	00175$
;	HAL_CAN.c: 385: if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
	ld	a, (0x0c, sp)
	bcp	a, #0x06
	jrne	00172$
;	HAL_CAN.c: 387: CAN->Page.Config.FCR1 |= (uint8_t)fact;
	ld	a, 0x5432
	or	a, (0x02, sp)
	ld	0x5432, a
	jra	00175$
00172$:
;	HAL_CAN.c: 389: else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
	and	a, #0x06
	ld	xl, a
	clr	a
	ld	xh, a
	cpw	x, #0x0002
	jrne	00169$
;	HAL_CAN.c: 391: CAN->Page.Config.FCR2 |= (uint8_t)fact;
	ld	a, 0x5433
	or	a, (0x02, sp)
	ld	0x5433, a
	jra	00175$
00169$:
;	HAL_CAN.c: 395: CAN->Page.Config.FCR3 |= (uint8_t)fact;
	ld	a, 0x5434
	or	a, (0x02, sp)
	ld	0x5434, a
00175$:
;	HAL_CAN.c: 398: CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
	push	#0x01
	call	_CAN_OperatingModeRequest
	pop	a
;	HAL_CAN.c: 400: CAN_SelectPage(can_page);
	ld	a, (0x01, sp)
	push	a
	call	_CAN_SelectPage
;	HAL_CAN.c: 401: }
	addw	sp, #10
	ret
;	HAL_CAN.c: 403: void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, uint8_t NewState)
;	-----------------------------------------
;	 function CAN_ITConfig
;	-----------------------------------------
_CAN_ITConfig:
	sub	sp, #2
;	HAL_CAN.c: 406: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	yl, a
;	HAL_CAN.c: 408: tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >> 7);
	ldw	x, (0x05, sp)
	ld	a, #0x80
	div	x, a
;	HAL_CAN.c: 409: tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) |
	ld	a, xl
	and	a, #0xf0
	ld	(0x02, sp), a
;	HAL_CAN.c: 410: (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >> 1));
	ld	a, xl
	and	a, #0x0f
	srl	a
	or	a, (0x02, sp)
	ld	(0x01, sp), a
;	HAL_CAN.c: 412: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 416: CAN->IER |= (uint8_t)(CAN_IT);
	ld	a, 0x5425
	ld	(0x02, sp), a
;	HAL_CAN.c: 413: if (NewState != 0)
	tnz	(0x07, sp)
	jreq	00102$
;	HAL_CAN.c: 416: CAN->IER |= (uint8_t)(CAN_IT);
	ld	a, (0x06, sp)
	or	a, (0x02, sp)
	ld	0x5425, a
;	HAL_CAN.c: 417: CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
	ld	a, 0x5429
	or	a, (0x01, sp)
	ld	0x5429, a
	jra	00103$
00102$:
;	HAL_CAN.c: 422: CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
	ld	a, (0x06, sp)
	cpl	a
	and	a, (0x02, sp)
	ld	0x5425, a
;	HAL_CAN.c: 423: CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
	ld	a, 0x5429
	ld	(0x02, sp), a
	ld	a, (0x01, sp)
	cpl	a
	and	a, (0x02, sp)
	ld	0x5429, a
00103$:
;	HAL_CAN.c: 426: CAN_SelectPage(can_page);
	ld	a, yl
	push	a
	call	_CAN_SelectPage
;	HAL_CAN.c: 427: }
	addw	sp, #3
	ret
;	HAL_CAN.c: 429: void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
;	-----------------------------------------
;	 function CAN_ST7CompatibilityCmd
;	-----------------------------------------
_CAN_ST7CompatibilityCmd:
;	HAL_CAN.c: 432: CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
	bres	21542, #4
;	HAL_CAN.c: 435: CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
	ld	a, 0x5426
	or	a, (0x03, sp)
	ld	0x5426, a
;	HAL_CAN.c: 436: }
	ret
;	HAL_CAN.c: 438: void CAN_TTComModeCmd(uint8_t NewState)
;	-----------------------------------------
;	 function CAN_TTComModeCmd
;	-----------------------------------------
_CAN_TTComModeCmd:
;	HAL_CAN.c: 440: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	xl, a
;	HAL_CAN.c: 444: CAN->MCR |= CAN_MCR_TTCM;
	ld	a, 0x5420
;	HAL_CAN.c: 441: if (NewState != 0)
	tnz	(0x03, sp)
	jreq	00102$
;	HAL_CAN.c: 444: CAN->MCR |= CAN_MCR_TTCM;
	or	a, #0x80
	ld	0x5420, a
;	HAL_CAN.c: 446: CAN->PSR = CAN_Page_TxMailBox0;
	mov	0x5427+0, #0x00
;	HAL_CAN.c: 447: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
	bset	21545, #7
;	HAL_CAN.c: 448: CAN->PSR = CAN_Page_TxMailBox1;
	mov	0x5427+0, #0x01
;	HAL_CAN.c: 449: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
	bset	21545, #7
;	HAL_CAN.c: 450: CAN->PSR = CAN_Page_TxMailBox2;
	mov	0x5427+0, #0x05
;	HAL_CAN.c: 451: CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
	bset	21545, #7
;	HAL_CAN.c: 452: CAN->PSR = CAN_Page_RxFifo;
	mov	0x5427+0, #0x07
;	HAL_CAN.c: 453: CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
	bset	21545, #7
	jra	00103$
00102$:
;	HAL_CAN.c: 458: CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
	and	a, #0x7f
	ld	0x5420, a
;	HAL_CAN.c: 460: CAN->PSR = CAN_Page_TxMailBox0;
	mov	0x5427+0, #0x00
;	HAL_CAN.c: 461: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
	bres	21545, #7
;	HAL_CAN.c: 462: CAN->PSR = CAN_Page_TxMailBox1;
	mov	0x5427+0, #0x01
;	HAL_CAN.c: 463: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
	bres	21545, #7
;	HAL_CAN.c: 464: CAN->PSR = CAN_Page_TxMailBox2;
	mov	0x5427+0, #0x05
;	HAL_CAN.c: 465: CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
	bres	21545, #7
;	HAL_CAN.c: 466: CAN->PSR = CAN_Page_RxFifo;
	mov	0x5427+0, #0x07
;	HAL_CAN.c: 467: CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
	bres	21545, #7
00103$:
;	HAL_CAN.c: 470: CAN_SelectPage(can_page);
	ld	a, xl
	push	a
	call	_CAN_SelectPage
	pop	a
;	HAL_CAN.c: 471: }
	ret
;	HAL_CAN.c: 473: CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
;	-----------------------------------------
;	 function CAN_Transmit
;	-----------------------------------------
_CAN_Transmit:
	sub	sp, #4
;	HAL_CAN.c: 480: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x01, sp), a
;	HAL_CAN.c: 482: if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
	ld	a, 0x5423
	and	a, #0x04
	cp	a, #0x04
	jrne	00108$
;	HAL_CAN.c: 484: CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
	clr	(0x02, sp)
	jra	00109$
00108$:
;	HAL_CAN.c: 486: else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
	ld	a, 0x5423
	and	a, #0x08
;	HAL_CAN.c: 488: CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
	sub	a, #0x08
	jrne	00105$
	inc	a
	ld	(0x02, sp), a
	jra	00109$
00105$:
;	HAL_CAN.c: 490: else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
	ld	a, 0x5423
	and	a, #0x10
	cp	a, #0x10
	jrne	00102$
;	HAL_CAN.c: 492: CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
	ld	a, #0x05
	ld	(0x02, sp), a
	jra	00109$
00102$:
;	HAL_CAN.c: 496: CAN_TxStatus = CAN_TxStatus_NoMailBox;
	ld	a, #0xf4
	ld	(0x02, sp), a
00109$:
;	HAL_CAN.c: 498: if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
	ld	a, (0x02, sp)
	cp	a, #0xf4
	jrne	00152$
	jp	00114$
00152$:
;	HAL_CAN.c: 500: CAN->PSR = (uint8_t)CAN_TxStatus;
	ldw	x, #0x5427
	ld	a, (0x02, sp)
	ld	(x), a
;	HAL_CAN.c: 511: CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id | CAN_IDE | CAN_RTR);
	ld	a, (0x0c, sp)
	ld	(0x03, sp), a
;	HAL_CAN.c: 502: if (CAN_IDE != CAN_Id_Standard)
	tnz	(0x0b, sp)
	jreq	00111$
;	HAL_CAN.c: 504: CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
	ldw	y, (0x09, sp)
	ld	a, (0x08, sp)
	ld	xl, a
	ld	a, (0x07, sp)
	and	a, #0x1f
	ld	xh, a
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
;	HAL_CAN.c: 505: CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
	ld	a, (0x0a, sp)
	ld	0x542d, a
;	HAL_CAN.c: 506: CAN_Id = CAN_Id >> 8;
	ldw	y, (0x08, sp)
	ld	a, (0x07, sp)
	ld	xl, a
	clr	a
	ld	xh, a
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
;	HAL_CAN.c: 507: CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
	ld	a, (0x0a, sp)
	ld	0x542c, a
;	HAL_CAN.c: 508: CAN_Id = CAN_Id >> 8;
	ldw	y, (0x08, sp)
	ld	a, (0x07, sp)
	ld	xl, a
	clr	a
	ld	xh, a
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
;	HAL_CAN.c: 509: CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
	ld	a, (0x0a, sp)
	ld	0x542b, a
;	HAL_CAN.c: 510: CAN_Id = CAN_Id >> 8;
	ldw	y, (0x08, sp)
	ld	a, (0x07, sp)
	ld	xl, a
	clr	a
	ld	xh, a
	ldw	(0x09, sp), y
	ldw	(0x07, sp), x
;	HAL_CAN.c: 511: CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id | CAN_IDE | CAN_RTR);
	ld	a, (0x0b, sp)
	ld	(0x04, sp), a
	ld	a, (0x0a, sp)
	or	a, (0x04, sp)
	or	a, (0x03, sp)
	ld	0x542a, a
	jra	00112$
00111$:
;	HAL_CAN.c: 515: CAN_Id &= (uint16_t)CAN_STDID_SIZE;
	ld	a, (0x0a, sp)
	ld	xl, a
	ld	a, (0x09, sp)
	and	a, #0x07
	ld	xh, a
	clrw	y
	ldw	(0x09, sp), x
	ldw	(0x07, sp), y
;	HAL_CAN.c: 516: CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id >> 6) | (CAN_RTR));
	ldw	x, (0x09, sp)
	ld	a, #0x40
	div	x, a
	ld	a, xl
	or	a, (0x03, sp)
	ld	0x542a, a
;	HAL_CAN.c: 517: CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id << 2);
	ld	a, (0x0a, sp)
	sll	a
	sll	a
	ld	0x542b, a
00112$:
;	HAL_CAN.c: 521: CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
	ld	a, 0x5429
	and	a, #0xf0
	ld	0x5429, a
;	HAL_CAN.c: 523: CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
	ld	a, 0x5429
	or	a, (0x0d, sp)
	ld	0x5429, a
;	HAL_CAN.c: 525: CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
	ldw	y, (0x0e, sp)
	ld	a, (y)
	ld	0x542e, a
;	HAL_CAN.c: 526: CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
	ldw	x, y
	ld	a, (0x1, x)
	ld	0x542f, a
;	HAL_CAN.c: 527: CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
	ldw	x, y
	ld	a, (0x2, x)
	ld	0x5430, a
;	HAL_CAN.c: 528: CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
	ldw	x, y
	ld	a, (0x3, x)
	ld	0x5431, a
;	HAL_CAN.c: 529: CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
	ldw	x, y
	ld	a, (0x4, x)
	ld	0x5432, a
;	HAL_CAN.c: 530: CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
	ldw	x, y
	ld	a, (0x5, x)
	ld	0x5433, a
;	HAL_CAN.c: 531: CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
	ldw	x, y
	ld	a, (0x6, x)
	ld	0x5434, a
;	HAL_CAN.c: 532: CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
	ld	a, (0x7, y)
	ld	0x5435, a
;	HAL_CAN.c: 534: CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
	bset	21544, #0
00114$:
;	HAL_CAN.c: 537: CAN_SelectPage(can_page);
	ld	a, (0x01, sp)
	push	a
	call	_CAN_SelectPage
	pop	a
;	HAL_CAN.c: 538: return (CAN_TxStatus_TypeDef)CAN_TxStatus;
	ld	a, (0x02, sp)
;	HAL_CAN.c: 539: }
	addw	sp, #4
	ret
;	HAL_CAN.c: 541: CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
;	-----------------------------------------
;	 function CAN_TransmitStatus
;	-----------------------------------------
_CAN_TransmitStatus:
	push	a
;	HAL_CAN.c: 545: uint8_t tmpstate = 0;
	clr	a
;	HAL_CAN.c: 547: switch (CAN_TransmitMailbox)
	push	a
	ld	a, (0x05, sp)
	cp	a, #0x00
	pop	a
	jreq	00101$
	push	a
	ld	a, (0x05, sp)
	dec	a
	pop	a
	jreq	00102$
	push	a
	ld	a, (0x05, sp)
	cp	a, #0x05
	pop	a
	jreq	00103$
	jra	00105$
;	HAL_CAN.c: 549: case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0 | CAN_TSR_TXOK0)));
00101$:
	ld	a, 0x5422
	and	a, #0x11
	ld	(0x01, sp), a
;	HAL_CAN.c: 550: tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
	ld	a, 0x5423
	and	a, #0x04
	or	a, (0x01, sp)
;	HAL_CAN.c: 551: break;
	jra	00105$
;	HAL_CAN.c: 552: case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1 | CAN_TSR_TXOK1)) >> 1);
00102$:
	ld	a, 0x5422
	and	a, #0x22
	srl	a
	ld	(0x01, sp), a
;	HAL_CAN.c: 553: tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
	ld	a, 0x5423
	and	a, #0x08
	srl	a
	or	a, (0x01, sp)
;	HAL_CAN.c: 554: break;
	jra	00105$
;	HAL_CAN.c: 555: case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2 | CAN_TSR_TXOK2)) >> 2);
00103$:
	ld	a, 0x5422
	and	a, #0x44
	srl	a
	srl	a
	ld	(0x01, sp), a
;	HAL_CAN.c: 556: tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
	ld	a, 0x5423
	and	a, #0x10
	srl	a
	srl	a
	or	a, (0x01, sp)
;	HAL_CAN.c: 561: }
00105$:
;	HAL_CAN.c: 563: switch (tmpstate)
	cp	a, #0x00
	jreq	00106$
	cp	a, #0x04
	jreq	00109$
	cp	a, #0x05
	jreq	00107$
	cp	a, #0x15
	jreq	00108$
	jra	00110$
;	HAL_CAN.c: 566: case (0x00): tstate = CAN_TxStatus_Pending;
00106$:
	ld	a, #0xf2
;	HAL_CAN.c: 567: break;
	jra	00111$
;	HAL_CAN.c: 569: case (0x05): tstate = CAN_TxStatus_Failed;
00107$:
	ld	a, #0xf0
;	HAL_CAN.c: 570: break;
	jra	00111$
;	HAL_CAN.c: 572: case (0x15): tstate = CAN_TxStatus_Ok;
00108$:
	ld	a, #0xf1
;	HAL_CAN.c: 573: break;
	jra	00111$
;	HAL_CAN.c: 575: case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
00109$:
	ld	a, #0xf5
;	HAL_CAN.c: 576: break;
;	HAL_CAN.c: 577: default:
;	HAL_CAN.c: 578: tstate = CAN_TxStatus_Failed;
;	HAL_CAN.c: 580: }
	.byte 0xc5
00110$:
	ld	a, #0xf0
00111$:
;	HAL_CAN.c: 582: return (CAN_TxStatus_TypeDef)tstate;
;	HAL_CAN.c: 583: }
	addw	sp, #1
	ret
;	HAL_CAN.c: 585: void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
;	-----------------------------------------
;	 function CAN_CancelTransmit
;	-----------------------------------------
_CAN_CancelTransmit:
	push	a
;	HAL_CAN.c: 587: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x01, sp), a
;	HAL_CAN.c: 589: CAN->PSR = (uint8_t)CAN_TransmitMailbox;
	ldw	x, #0x5427
	ld	a, (0x04, sp)
	ld	(x), a
;	HAL_CAN.c: 591: CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
	bset	21544, #1
;	HAL_CAN.c: 593: CAN_SelectPage(can_page);
	ld	a, (0x01, sp)
	push	a
	call	_CAN_SelectPage
;	HAL_CAN.c: 594: }
	popw	x
	ret
;	HAL_CAN.c: 596: void CAN_FIFORelease(void)
;	-----------------------------------------
;	 function CAN_FIFORelease
;	-----------------------------------------
_CAN_FIFORelease:
;	HAL_CAN.c: 599: CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
	mov	0x5424+0, #0x20
;	HAL_CAN.c: 600: }
	ret
;	HAL_CAN.c: 602: CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
;	-----------------------------------------
;	 function CAN_MessagePending
;	-----------------------------------------
_CAN_MessagePending:
;	HAL_CAN.c: 605: msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
	ld	a, 0x5424
	and	a, #0x03
;	HAL_CAN.c: 606: return (CAN_NbrPendingMessage_TypeDef)msgpending;
;	HAL_CAN.c: 607: }
	ret
;	HAL_CAN.c: 609: void CAN_Receive(void)
;	-----------------------------------------
;	 function CAN_Receive
;	-----------------------------------------
_CAN_Receive:
	sub	sp, #21
;	HAL_CAN.c: 611: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x01, sp), a
;	HAL_CAN.c: 615: CAN->PSR = CAN_Page_RxFifo;
	mov	0x5427+0, #0x07
;	HAL_CAN.c: 618: _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
	ld	a, 0x542a
	and	a, #0x40
	ld	__IDE+0, a
;	HAL_CAN.c: 619: if (_IDE != CAN_Id_Standard)
	tnz	__IDE+0
	jrne	00111$
	jp	00102$
00111$:
;	HAL_CAN.c: 621: temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
	ld	a, 0x542c
	ld	(0x15, sp), a
	clr	(0x14, sp)
	clr	(0x13, sp)
	clr	(0x12, sp)
	ldw	y, (0x14, sp)
	ldw	(0x13, sp), y
	ld	a, (0x13, sp)
	ld	(0x12, sp), a
	clr	(0x15, sp)
	ldw	y, (0x14, sp)
	ldw	(0x04, sp), y
	ldw	y, (0x12, sp)
	ldw	(0x02, sp), y
;	HAL_CAN.c: 622: temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);
	ld	a, 0x542b
	ld	(0x15, sp), a
	clr	(0x14, sp)
	clr	(0x13, sp)
	clr	(0x12, sp)
	ldw	y, (0x14, sp)
	ldw	(0x12, sp), y
	clrw	x
	ldw	(0x14, sp), x
	ldw	(0x08, sp), x
	ldw	y, (0x12, sp)
	ldw	(0x06, sp), y
;	HAL_CAN.c: 623: temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
	ld	a, 0x542a
	ld	(0x15, sp), a
	ld	(0x11, sp), a
	clr	(0x10, sp)
	clr	(0x0f, sp)
	clr	(0x0e, sp)
	ld	a, (0x11, sp)
	and	a, #0x1f
	ld	(0x15, sp), a
	clrw	x
	ldw	(0x13, sp), x
	clr	(0x12, sp)
	ld	a, (0x15, sp)
	ld	(0x12, sp), a
	clrw	x
	ldw	(0x14, sp), x
	clr	(0x13, sp)
	ldw	y, (0x14, sp)
	ldw	(0x0c, sp), y
	ldw	y, (0x12, sp)
	ldw	(0x0a, sp), y
;	HAL_CAN.c: 625: _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3);
	ld	a, 0x542d
	ld	(0x15, sp), a
	ld	(0x11, sp), a
	clr	(0x10, sp)
	clr	(0x0f, sp)
	clr	(0x0e, sp)
	ld	a, (0x11, sp)
	or	a, (0x05, sp)
	ld	(0x15, sp), a
	ld	a, (0x10, sp)
	or	a, (0x04, sp)
	ld	(0x14, sp), a
	ld	a, (0x0f, sp)
	or	a, (0x03, sp)
	ld	(0x13, sp), a
	ld	a, (0x0e, sp)
	or	a, (0x02, sp)
	ld	(0x12, sp), a
	ld	a, (0x15, sp)
	or	a, (0x09, sp)
	ld	(0x11, sp), a
	ld	a, (0x14, sp)
	or	a, (0x08, sp)
	ld	(0x10, sp), a
	ld	a, (0x13, sp)
	or	a, (0x07, sp)
	ld	(0x0f, sp), a
	ld	a, (0x12, sp)
	or	a, (0x06, sp)
	ld	(0x0e, sp), a
	ld	a, (0x11, sp)
	or	a, (0x0d, sp)
	ld	(0x15, sp), a
	ld	a, (0x10, sp)
	or	a, (0x0c, sp)
	ld	(0x14, sp), a
	ld	a, (0x0f, sp)
	or	a, (0x0b, sp)
	ld	(0x13, sp), a
	ld	a, (0x0e, sp)
	or	a, (0x0a, sp)
	ld	(0x12, sp), a
	ldw	y, (0x14, sp)
	ldw	(0x10, sp), y
	ld	a, (0x13, sp)
	ld	(0x0f, sp), a
	ld	a, (0x12, sp)
	and	a, #0x1f
	ld	(0x0e, sp), a
	ldw	x, (0x10, sp)
	ldw	__Id+2, x
	ldw	x, (0x0e, sp)
	ldw	__Id+0, x
	jra	00103$
00102$:
;	HAL_CAN.c: 629: temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
	ld	a, 0x542a
	and	a, #0x1f
	ld	xl, a
	clr	a
	ld	xh, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	clrw	y
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
;	HAL_CAN.c: 630: temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2) & 0x3F);
	ld	a, 0x542b
	clrw	x
	ld	xl, a
	srlw	x
	srlw	x
	ld	a, xl
	and	a, #0x3f
	ld	xl, a
	clr	a
	clrw	y
	exg	a, xl
	ld	(0x15, sp), a
	exg	a, xl
	ldw	(0x12, sp), y
;	HAL_CAN.c: 632: _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2);
	or	a, (0x10, sp)
	push	a
	ld	a, (0x12, sp)
	or	a, (0x16, sp)
	ld	yl, a
	ld	a, (0x10, sp)
	or	a, (0x14, sp)
	ld	a, (0x0f, sp)
	or	a, (0x13, sp)
	pop	a
	and	a, #0x07
	ld	yh, a
	clrw	x
	ldw	__Id+2, y
	ldw	__Id+0, x
00103$:
;	HAL_CAN.c: 635: _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
	ld	a, 0x542a
	and	a, #0x20
	ld	__RTR+0, a
;	HAL_CAN.c: 638: _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
	ld	a, 0x5429
	and	a, #0x0f
	ld	__DLC+0, a
;	HAL_CAN.c: 641: _FMI = CAN->Page.RxFIFO.MFMI;
	ld	a, 0x5428
	ld	__FMI+0, a
;	HAL_CAN.c: 644: _Data[0] = CAN->Page.RxFIFO.MDAR1;
	ld	a, 0x542e
	ld	__Data+0, a
;	HAL_CAN.c: 645: _Data[1] = CAN->Page.RxFIFO.MDAR2;
	ld	a, 0x542f
	ld	__Data+1, a
;	HAL_CAN.c: 646: _Data[2] = CAN->Page.RxFIFO.MDAR3;
	ld	a, 0x5430
	ld	__Data+2, a
;	HAL_CAN.c: 647: _Data[3] = CAN->Page.RxFIFO.MDAR4;
	ld	a, 0x5431
	ld	__Data+3, a
;	HAL_CAN.c: 648: _Data[4] = CAN->Page.RxFIFO.MDAR5;
	ld	a, 0x5432
	ld	__Data+4, a
;	HAL_CAN.c: 649: _Data[5] = CAN->Page.RxFIFO.MDAR6;
	ld	a, 0x5433
	ld	__Data+5, a
;	HAL_CAN.c: 650: _Data[6] = CAN->Page.RxFIFO.MDAR7;
	ld	a, 0x5434
	ld	__Data+6, a
;	HAL_CAN.c: 651: _Data[7] = CAN->Page.RxFIFO.MDAR8;
	ld	a, 0x5435
	ld	__Data+7, a
;	HAL_CAN.c: 654: CAN_FIFORelease();
	call	_CAN_FIFORelease
;	HAL_CAN.c: 656: CAN_SelectPage(can_page);
	ld	a, (0x01, sp)
	push	a
	call	_CAN_SelectPage
;	HAL_CAN.c: 657: }
	addw	sp, #22
	ret
;	HAL_CAN.c: 659: uint32_t CAN_GetReceivedId(void)
;	-----------------------------------------
;	 function CAN_GetReceivedId
;	-----------------------------------------
_CAN_GetReceivedId:
;	HAL_CAN.c: 661: return (_Id);
	ldw	x, __Id+2
	ldw	y, __Id+0
;	HAL_CAN.c: 662: }
	ret
;	HAL_CAN.c: 664: CAN_Id_TypeDef CAN_GetReceivedIDE(void)
;	-----------------------------------------
;	 function CAN_GetReceivedIDE
;	-----------------------------------------
_CAN_GetReceivedIDE:
;	HAL_CAN.c: 666: return (CAN_Id_TypeDef)(_IDE);
	ld	a, __IDE+0
;	HAL_CAN.c: 667: }
	ret
;	HAL_CAN.c: 669: CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
;	-----------------------------------------
;	 function CAN_GetReceivedRTR
;	-----------------------------------------
_CAN_GetReceivedRTR:
;	HAL_CAN.c: 671: return (CAN_RTR_TypeDef)(_RTR);
	ld	a, __RTR+0
;	HAL_CAN.c: 672: }
	ret
;	HAL_CAN.c: 674: uint8_t CAN_GetReceivedDLC(void)
;	-----------------------------------------
;	 function CAN_GetReceivedDLC
;	-----------------------------------------
_CAN_GetReceivedDLC:
;	HAL_CAN.c: 676: return (_DLC);
	ld	a, __DLC+0
;	HAL_CAN.c: 677: }
	ret
;	HAL_CAN.c: 679: uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
;	-----------------------------------------
;	 function CAN_GetReceivedData
;	-----------------------------------------
_CAN_GetReceivedData:
;	HAL_CAN.c: 681: return (_Data[CAN_DataIndex]);
	clrw	x
	ld	a, (0x03, sp)
	ld	xl, a
	addw	x, #(__Data + 0)
	ld	a, (x)
;	HAL_CAN.c: 682: }
	ret
;	HAL_CAN.c: 684: uint8_t CAN_GetReceivedFMI(void)
;	-----------------------------------------
;	 function CAN_GetReceivedFMI
;	-----------------------------------------
_CAN_GetReceivedFMI:
;	HAL_CAN.c: 686: return (_FMI);
	ld	a, __FMI+0
;	HAL_CAN.c: 687: }
	ret
;	HAL_CAN.c: 689: uint16_t CAN_GetMessageTimeStamp(void)
;	-----------------------------------------
;	 function CAN_GetMessageTimeStamp
;	-----------------------------------------
_CAN_GetMessageTimeStamp:
	sub	sp, #2
;	HAL_CAN.c: 692: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	yl, a
;	HAL_CAN.c: 695: CAN->PSR = CAN_Page_RxFifo;
	mov	0x5427+0, #0x07
;	HAL_CAN.c: 697: timestamp = CAN->Page.RxFIFO.MTSRL;
	ld	a, 0x5436
	clrw	x
	ld	xl, a
;	HAL_CAN.c: 698: timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH) << 8);
	ld	a, 0x5437
	clr	(0x01, sp)
	clr	(0x02, sp)
	pushw	x
	or	a, (1, sp)
	popw	x
	rrwa	x
	or	a, (0x02, sp)
	ld	xl, a
;	HAL_CAN.c: 701: CAN_SelectPage(can_page);
	pushw	x
	ld	a, yl
	push	a
	call	_CAN_SelectPage
	pop	a
	popw	x
;	HAL_CAN.c: 703: return (uint16_t)(timestamp);
;	HAL_CAN.c: 704: }
	addw	sp, #2
	ret
;	HAL_CAN.c: 706: CAN_Sleep_TypeDef CAN_Sleep(void)
;	-----------------------------------------
;	 function CAN_Sleep
;	-----------------------------------------
_CAN_Sleep:
;	HAL_CAN.c: 709: CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
	clrw	x
;	HAL_CAN.c: 712: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
	ld	a, 0x5420
	and	a, #0xfe
	or	a, #0x02
	ld	0x5420, a
;	HAL_CAN.c: 715: if ((CAN->MSR & (CAN_MSR_SLAK | CAN_MSR_INAK)) == CAN_MSR_SLAK)
	ld	a, 0x5421
	and	a, #0x03
;	HAL_CAN.c: 718: sleepstatus = CAN_Sleep_Ok;
	sub	a, #0x02
	jrne	00102$
	inc	a
	ld	xl, a
00102$:
;	HAL_CAN.c: 722: return (CAN_Sleep_TypeDef)sleepstatus;
	ld	a, xl
;	HAL_CAN.c: 723: }
	ret
;	HAL_CAN.c: 730: CAN_WakeUp_TypeDef CAN_WakeUp(void)
;	-----------------------------------------
;	 function CAN_WakeUp
;	-----------------------------------------
_CAN_WakeUp:
;	HAL_CAN.c: 732: CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
	clrw	x
;	HAL_CAN.c: 735: CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
	bres	21536, #1
;	HAL_CAN.c: 738: if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
	ld	a, 0x5421
	and	a, #0x02
	cp	a, #0x02
	jreq	00102$
;	HAL_CAN.c: 741: wakeupstatus = CAN_WakeUp_Ok;
	ld	a, #0x01
	ld	xl, a
00102$:
;	HAL_CAN.c: 745: return (CAN_WakeUp_TypeDef)wakeupstatus;
	ld	a, xl
;	HAL_CAN.c: 746: }
	ret
;	HAL_CAN.c: 748: CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
;	-----------------------------------------
;	 function CAN_OperatingModeRequest
;	-----------------------------------------
_CAN_OperatingModeRequest:
;	HAL_CAN.c: 754: if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
	tnz	(0x03, sp)
	jrne	00129$
;	HAL_CAN.c: 757: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
	ld	a, 0x5420
	and	a, #0xfd
	or	a, #0x01
	ld	0x5420, a
;	HAL_CAN.c: 760: while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
	clrw	x
	decw	x
00102$:
	ld	a, 0x5421
	and	a, #0x03
	dec	a
	jreq	00104$
	tnzw	x
	jreq	00104$
;	HAL_CAN.c: 762: timeout--;
	decw	x
	jra	00102$
00104$:
;	HAL_CAN.c: 764: if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
	ld	a, 0x5421
	and	a, #0x03
	dec	a
	jreq	00106$
;	HAL_CAN.c: 766: modestatus = CAN_ModeStatus_Failed;
	clr	a
	ret
00106$:
;	HAL_CAN.c: 770: modestatus = CAN_ModeStatus_Success;
	ld	a, #0x01
	ret
00129$:
;	HAL_CAN.c: 774: else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
	ld	a, (0x03, sp)
	dec	a
	jrne	00126$
;	HAL_CAN.c: 777: CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP | CAN_MCR_INRQ));
	ld	a, 0x5420
	and	a, #0xfc
	ld	0x5420, a
;	HAL_CAN.c: 780: while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout != 0))
	clrw	x
	decw	x
00109$:
	ld	a, 0x5421
	bcp	a, #0x03
	jreq	00111$
	tnzw	x
	jreq	00111$
;	HAL_CAN.c: 782: timeout--;
	decw	x
	jra	00109$
00111$:
;	HAL_CAN.c: 784: if ((CAN->MSR & CAN_MODE_MASK) != 0)
	ld	a, 0x5421
	bcp	a, #0x03
	jreq	00113$
;	HAL_CAN.c: 786: modestatus = CAN_ModeStatus_Failed;
	clr	a
	ret
00113$:
;	HAL_CAN.c: 790: modestatus = CAN_ModeStatus_Success;
	ld	a, #0x01
	ret
00126$:
;	HAL_CAN.c: 793: else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
	ld	a, (0x03, sp)
	cp	a, #0x02
	jrne	00123$
;	HAL_CAN.c: 796: CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
	ld	a, 0x5420
	and	a, #0xfe
	or	a, #0x02
	ld	0x5420, a
;	HAL_CAN.c: 799: while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout != 0))
	clrw	x
	decw	x
00116$:
	ld	a, 0x5421
	and	a, #0x03
	cp	a, #0x02
	jreq	00118$
	tnzw	x
	jreq	00118$
;	HAL_CAN.c: 801: timeout--;
	decw	x
	jra	00116$
00118$:
;	HAL_CAN.c: 803: if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
	ld	a, 0x5421
	and	a, #0x03
	cp	a, #0x02
	jreq	00120$
;	HAL_CAN.c: 805: modestatus = CAN_ModeStatus_Failed;
	clr	a
	ret
00120$:
;	HAL_CAN.c: 809: modestatus = CAN_ModeStatus_Success;
	ld	a, #0x01
	ret
00123$:
;	HAL_CAN.c: 814: modestatus = CAN_ModeStatus_Failed;
	clr	a
;	HAL_CAN.c: 816: return (CAN_ModeStatus_TypeDef)(modestatus);
;	HAL_CAN.c: 817: }
	ret
;	HAL_CAN.c: 819: CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
;	-----------------------------------------
;	 function CAN_GetLastErrorCode
;	-----------------------------------------
_CAN_GetLastErrorCode:
;	HAL_CAN.c: 822: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	xl, a
;	HAL_CAN.c: 824: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 825: errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
	ld	a, 0x5428
	and	a, #0x70
;	HAL_CAN.c: 828: CAN_SelectPage(can_page);
	push	a
	pushw	x
	addw	sp, #1
	call	_CAN_SelectPage
	pop	a
	pop	a
;	HAL_CAN.c: 830: return (CAN_ErrorCode_TypeDef)(errcode);
;	HAL_CAN.c: 831: }
	ret
;	HAL_CAN.c: 833: void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
;	-----------------------------------------
;	 function CAN_ClearFlag
;	-----------------------------------------
_CAN_ClearFlag:
	sub	sp, #2
;	HAL_CAN.c: 836: if (((uint16_t)CAN_Flag & 0x0700) != 0)
	ldw	x, (0x05, sp)
	ld	a, xh
	bcp	a, #0x07
	jreq	00108$
;	HAL_CAN.c: 841: CAN->RFR = (uint8_t)(CAN_Flag);
	ld	a, xl
;	HAL_CAN.c: 838: if (((uint16_t)CAN_Flag & 0x020B) != 0)
	push	a
	ld	a, xl
	and	a, #0x0b
	ld	(0x03, sp), a
	ld	a, xh
	and	a, #0x02
	ld	(0x02, sp), a
	pop	a
	ldw	y, (0x01, sp)
	jreq	00105$
;	HAL_CAN.c: 841: CAN->RFR = (uint8_t)(CAN_Flag);
	ld	0x5424, a
	jra	00110$
00105$:
;	HAL_CAN.c: 843: else if (((uint16_t)CAN_Flag & 0x0403) != 0)
	push	a
	ld	a, xl
	and	a, #0x03
	rlwa	x
	and	a, #0x04
	ld	xh, a
	pop	a
	tnzw	x
	jreq	00102$
;	HAL_CAN.c: 846: CAN->TSR = (uint8_t)(CAN_Flag);
	ld	0x5422, a
	jra	00110$
00102$:
;	HAL_CAN.c: 851: CAN->MSR = (uint8_t)(CAN_Flag);
	ld	0x5421, a
	jra	00110$
00108$:
;	HAL_CAN.c: 857: can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
;	HAL_CAN.c: 860: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 861: CAN->Page.Config.ESR = (uint8_t)0;
	mov	0x5428+0, #0x00
;	HAL_CAN.c: 864: CAN_SelectPage(can_page);
	push	a
	call	_CAN_SelectPage
	pop	a
00110$:
;	HAL_CAN.c: 866: }
	addw	sp, #2
	ret
;	HAL_CAN.c: 868: uint8_t CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
;	-----------------------------------------
;	 function CAN_GetFlagStatus
;	-----------------------------------------
_CAN_GetFlagStatus:
	sub	sp, #5
;	HAL_CAN.c: 873: if (((uint16_t)CAN_Flag & 0x0700) != 0)
	ldw	y, (0x08, sp)
;	HAL_CAN.c: 878: if ((CAN->RFR & (uint16_t)CAN_Flag) != 0)
	ldw	(0x04, sp), y
	ldw	(0x01, sp), y
;	HAL_CAN.c: 873: if (((uint16_t)CAN_Flag & 0x0700) != 0)
	ld	a, (0x04, sp)
	bcp	a, #0x07
	jreq	00120$
;	HAL_CAN.c: 875: if (((uint16_t)CAN_Flag & 0x020B) != 0)
	ld	a, (0x05, sp)
	and	a, #0x0b
	ld	xl, a
	ld	a, (0x04, sp)
	and	a, #0x02
	ld	xh, a
	tnzw	x
	jreq	00114$
;	HAL_CAN.c: 878: if ((CAN->RFR & (uint16_t)CAN_Flag) != 0)
	ld	a, 0x5424
	clrw	x
	and	a, (0x02, sp)
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	tnzw	x
	jreq	00102$
;	HAL_CAN.c: 881: bitstatus = 1;
	ld	a, #0x01
	ld	(0x05, sp), a
	jra	00121$
00102$:
;	HAL_CAN.c: 886: bitstatus = 0;
	clr	(0x05, sp)
	jra	00121$
00114$:
;	HAL_CAN.c: 890: else if (((uint16_t)CAN_Flag & 0x0403) != 0)
	ld	a, (0x05, sp)
	and	a, #0x03
	ld	xl, a
	ld	a, (0x04, sp)
	and	a, #0x04
	ld	xh, a
	tnzw	x
	jreq	00111$
;	HAL_CAN.c: 893: if ((CAN->TSR & (uint16_t)CAN_Flag) != 0)
	ld	a, 0x5422
	clrw	x
	and	a, (0x02, sp)
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	tnzw	x
	jreq	00105$
;	HAL_CAN.c: 896: bitstatus = 1;
	ld	a, #0x01
	ld	(0x05, sp), a
	jra	00121$
00105$:
;	HAL_CAN.c: 901: bitstatus = 0;
	clr	(0x05, sp)
	jra	00121$
00111$:
;	HAL_CAN.c: 907: if ((CAN->MSR & (uint16_t)CAN_Flag) != 0)
	ld	a, 0x5421
	clrw	x
	and	a, (0x02, sp)
	rlwa	x
	and	a, (0x01, sp)
	ld	xh, a
	tnzw	x
	jreq	00108$
;	HAL_CAN.c: 910: bitstatus = 1;
	ld	a, #0x01
	ld	(0x05, sp), a
	jra	00121$
00108$:
;	HAL_CAN.c: 915: bitstatus = 0;
	clr	(0x05, sp)
	jra	00121$
00120$:
;	HAL_CAN.c: 922: can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x03, sp), a
;	HAL_CAN.c: 924: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 925: if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != 0)
	ld	a, 0x5428
	clrw	x
	and	a, (0x02, sp)
	ld	(0x05, sp), a
	ld	a, xl
	and	a, (0x01, sp)
	ld	(0x04, sp), a
	ldw	x, (0x04, sp)
	jreq	00117$
;	HAL_CAN.c: 928: bitstatus = 1;
	ld	a, #0x01
	ld	(0x05, sp), a
;	HAL_CAN.c: 933: bitstatus = 0;
	.byte 0xc5
00117$:
	clr	(0x05, sp)
00118$:
;	HAL_CAN.c: 936: CAN_SelectPage(can_page);
	ld	a, (0x03, sp)
	push	a
	call	_CAN_SelectPage
	pop	a
00121$:
;	HAL_CAN.c: 941: return  (uint8_t)bitstatus;
	ld	a, (0x05, sp)
;	HAL_CAN.c: 942: }
	addw	sp, #5
	ret
;	HAL_CAN.c: 944: uint8_t CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
;	-----------------------------------------
;	 function CAN_GetITStatus
;	-----------------------------------------
_CAN_GetITStatus:
	sub	sp, #3
;	HAL_CAN.c: 947: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
	ld	(0x01, sp), a
;	HAL_CAN.c: 949: switch (CAN_IT)
	ldw	y, (0x06, sp)
	ldw	(0x02, sp), y
	ldw	x, y
	decw	x
	jreq	00101$
	ldw	x, (0x02, sp)
	cpw	x, #0x0002
	jreq	00105$
	ldw	x, (0x02, sp)
	cpw	x, #0x0004
	jreq	00109$
	ldw	x, (0x02, sp)
	cpw	x, #0x0008
	jrne	00255$
	jp	00113$
00255$:
	ldw	x, (0x02, sp)
	cpw	x, #0x0080
	jrne	00258$
	jp	00117$
00258$:
	ldw	x, (0x02, sp)
	cpw	x, #0x0100
	jrne	00261$
	jp	00125$
00261$:
	ldw	x, (0x02, sp)
	cpw	x, #0x0200
	jrne	00264$
	jp	00129$
00264$:
	ldw	x, (0x02, sp)
	cpw	x, #0x0400
	jrne	00267$
	jp	00133$
00267$:
	ldw	x, (0x02, sp)
	cpw	x, #0x0800
	jrne	00270$
	jp	00137$
00270$:
	ldw	x, (0x02, sp)
	cpw	x, #0x4000
	jrne	00273$
	jp	00121$
00273$:
	jp	00141$
;	HAL_CAN.c: 951: case CAN_IT_TME:
00101$:
;	HAL_CAN.c: 952: if ((CAN->IER & CAN_IER_TMEIE) != 0)
	ld	a, 0x5425
	srl	a
	jrnc	00103$
;	HAL_CAN.c: 954: pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
	ld	a, 0x5422
	push	#0x07
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jp	00142$
00103$:
;	HAL_CAN.c: 958: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 960: break;
	jp	00142$
;	HAL_CAN.c: 962: case CAN_IT_FMP:
00105$:
;	HAL_CAN.c: 963: if ((CAN->IER & CAN_IER_FMPIE) != 0)
	ld	a, 0x5425
	bcp	a, #0x02
	jreq	00107$
;	HAL_CAN.c: 965: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
	ld	a, 0x5424
	push	#0x03
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jp	00142$
00107$:
;	HAL_CAN.c: 969: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 971: break;
	jp	00142$
;	HAL_CAN.c: 972: case CAN_IT_FF:
00109$:
;	HAL_CAN.c: 973: if ((CAN->IER & CAN_IER_FFIE) != 0)
	ld	a, 0x5425
	bcp	a, #0x04
	jreq	00111$
;	HAL_CAN.c: 975: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
	ld	a, 0x5424
	push	#0x08
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jp	00142$
00111$:
;	HAL_CAN.c: 979: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 981: break;
	jp	00142$
;	HAL_CAN.c: 982: case CAN_IT_FOV:
00113$:
;	HAL_CAN.c: 983: if ((CAN->IER & CAN_IER_FOVIE) != 0)
	ld	a, 0x5425
	bcp	a, #0x08
	jreq	00115$
;	HAL_CAN.c: 985: pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
	ld	a, 0x5424
	push	#0x10
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jp	00142$
00115$:
;	HAL_CAN.c: 989: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 991: break;
	jp	00142$
;	HAL_CAN.c: 992: case CAN_IT_WKU:
00117$:
;	HAL_CAN.c: 993: if ((CAN->IER & CAN_IER_WKUIE) != 0)
	ld	a, 0x5425
	jrpl	00119$
;	HAL_CAN.c: 995: pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
	ld	a, 0x5421
	push	#0x08
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jp	00142$
00119$:
;	HAL_CAN.c: 999: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1001: break;
	jp	00142$
;	HAL_CAN.c: 1003: case CAN_IT_ERR:
00121$:
;	HAL_CAN.c: 1004: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1005: if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) != 0)
	ld	a, 0x5429
	jrpl	00123$
;	HAL_CAN.c: 1007: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF | CAN_ESR_EPVF | CAN_ESR_BOFF | CAN_ESR_LEC);
	ld	a, 0x5428
	push	#0x77
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jra	00142$
00123$:
;	HAL_CAN.c: 1011: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1013: break;
	jra	00142$
;	HAL_CAN.c: 1015: case CAN_IT_EWG:
00125$:
;	HAL_CAN.c: 1016: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1017: if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) != 0)
	ld	a, 0x5429
	srl	a
	jrnc	00127$
;	HAL_CAN.c: 1019: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
	ld	a, 0x5428
	push	#0x01
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jra	00142$
00127$:
;	HAL_CAN.c: 1023: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1025: break;
	jra	00142$
;	HAL_CAN.c: 1027: case CAN_IT_EPV:
00129$:
;	HAL_CAN.c: 1028: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1029: if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) != 0)
	ld	a, 0x5429
	bcp	a, #0x02
	jreq	00131$
;	HAL_CAN.c: 1031: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
	ld	a, 0x5428
	push	#0x02
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jra	00142$
00131$:
;	HAL_CAN.c: 1035: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1037: break;
	jra	00142$
;	HAL_CAN.c: 1038: case CAN_IT_BOF:
00133$:
;	HAL_CAN.c: 1039: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1040: if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) != 0)
	ld	a, 0x5429
	bcp	a, #0x04
	jreq	00135$
;	HAL_CAN.c: 1042: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
	ld	a, 0x5428
	push	#0x04
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jra	00142$
00135$:
;	HAL_CAN.c: 1046: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1048: break;
	jra	00142$
;	HAL_CAN.c: 1049: case CAN_IT_LEC:
00137$:
;	HAL_CAN.c: 1050: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1051: if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) != 0)
	ld	a, 0x5429
	bcp	a, #0x10
	jreq	00139$
;	HAL_CAN.c: 1053: pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
	ld	a, 0x5428
	push	#0x70
	push	a
	call	_CheckITStatus
	addw	sp, #2
	jra	00142$
00139$:
;	HAL_CAN.c: 1057: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1059: break;
;	HAL_CAN.c: 1060: default:
;	HAL_CAN.c: 1061: pendingbitstatus = 0;
;	HAL_CAN.c: 1063: }
	.byte 0x21
00141$:
	clr	a
00142$:
;	HAL_CAN.c: 1065: CAN_SelectPage(can_page);
	push	a
	exg	a, xl
	ld	a, (0x02, sp)
	exg	a, xl
	pushw	x
	addw	sp, #1
	call	_CAN_SelectPage
	pop	a
	pop	a
;	HAL_CAN.c: 1067: return  (uint8_t)pendingbitstatus;
;	HAL_CAN.c: 1068: }
	addw	sp, #3
	ret
;	HAL_CAN.c: 1070: void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
;	-----------------------------------------
;	 function CAN_ClearITPendingBit
;	-----------------------------------------
_CAN_ClearITPendingBit:
;	HAL_CAN.c: 1072: CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
	call	_CAN_GetSelectedPage
;	HAL_CAN.c: 1074: switch (CAN_IT)
	ldw	x, (0x03, sp)
	cpw	x, #0x0001
	jreq	00101$
	cpw	x, #0x0004
	jreq	00102$
	cpw	x, #0x0008
	jreq	00103$
	cpw	x, #0x0080
	jreq	00104$
	cpw	x, #0x0100
	jreq	00106$
	cpw	x, #0x0200
	jreq	00107$
	cpw	x, #0x0400
	jreq	00108$
	cpw	x, #0x0800
	jreq	00109$
	cpw	x, #0x4000
	jreq	00105$
	jra	00111$
;	HAL_CAN.c: 1076: case CAN_IT_TME:
00101$:
;	HAL_CAN.c: 1077: CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
	mov	0x5422+0, #0x07
;	HAL_CAN.c: 1078: break;
	jra	00111$
;	HAL_CAN.c: 1080: case CAN_IT_FF:
00102$:
;	HAL_CAN.c: 1081: CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
	mov	0x5424+0, #0x08
;	HAL_CAN.c: 1082: break;
	jra	00111$
;	HAL_CAN.c: 1084: case CAN_IT_FOV:
00103$:
;	HAL_CAN.c: 1085: CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
	mov	0x5424+0, #0x10
;	HAL_CAN.c: 1086: break;
	jra	00111$
;	HAL_CAN.c: 1088: case CAN_IT_WKU:
00104$:
;	HAL_CAN.c: 1089: CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
	mov	0x5421+0, #0x08
;	HAL_CAN.c: 1090: break;
	jra	00111$
;	HAL_CAN.c: 1092: case CAN_IT_ERR:
00105$:
;	HAL_CAN.c: 1093: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1094: CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
	mov	0x5428+0, #0x00
;	HAL_CAN.c: 1095: CAN->MSR = CAN_MSR_ERRI;
	mov	0x5421+0, #0x04
;	HAL_CAN.c: 1096: break;
	jra	00111$
;	HAL_CAN.c: 1098: case CAN_IT_EWG:
00106$:
;	HAL_CAN.c: 1099: CAN->MSR = CAN_MSR_ERRI;
	mov	0x5421+0, #0x04
;	HAL_CAN.c: 1100: break;
	jra	00111$
;	HAL_CAN.c: 1102: case CAN_IT_EPV:
00107$:
;	HAL_CAN.c: 1103: CAN->MSR = CAN_MSR_ERRI;
	mov	0x5421+0, #0x04
;	HAL_CAN.c: 1104: break;
	jra	00111$
;	HAL_CAN.c: 1106: case CAN_IT_BOF:
00108$:
;	HAL_CAN.c: 1107: CAN->MSR = CAN_MSR_ERRI;
	mov	0x5421+0, #0x04
;	HAL_CAN.c: 1108: break;
	jra	00111$
;	HAL_CAN.c: 1110: case CAN_IT_LEC:
00109$:
;	HAL_CAN.c: 1111: CAN->PSR = CAN_Page_Config;
	mov	0x5427+0, #0x06
;	HAL_CAN.c: 1112: CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
	mov	0x5428+0, #0x00
;	HAL_CAN.c: 1119: }
00111$:
;	HAL_CAN.c: 1121: CAN_SelectPage(can_page);
	push	a
	call	_CAN_SelectPage
	pop	a
;	HAL_CAN.c: 1122: }
	ret
;	HAL_CAN.c: 1124: CAN_Page_TypeDef CAN_GetSelectedPage(void)
;	-----------------------------------------
;	 function CAN_GetSelectedPage
;	-----------------------------------------
_CAN_GetSelectedPage:
;	HAL_CAN.c: 1126: return (CAN_Page_TypeDef)(CAN->PSR);
	ld	a, 0x5427
;	HAL_CAN.c: 1127: }
	ret
;	HAL_CAN.c: 1129: void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
;	-----------------------------------------
;	 function CAN_SelectPage
;	-----------------------------------------
_CAN_SelectPage:
;	HAL_CAN.c: 1131: CAN->PSR = (uint8_t)CAN_Page;
	ldw	x, #0x5427
	ld	a, (0x03, sp)
	ld	(x), a
;	HAL_CAN.c: 1132: }
	ret
;	HAL_CAN.c: 1134: static uint8_t CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
;	-----------------------------------------
;	 function CheckITStatus
;	-----------------------------------------
_CheckITStatus:
;	HAL_CAN.c: 1137: if ((CAN_Reg & It_Bit) != (uint8_t)0)
	ld	a, (0x03, sp)
	and	a, (0x04, sp)
	jreq	00102$
;	HAL_CAN.c: 1140: pendingbitstatus = 1;
	ld	a, #0x01
	ret
00102$:
;	HAL_CAN.c: 1145: pendingbitstatus = 0;
	clr	a
;	HAL_CAN.c: 1147: return (uint8_t)pendingbitstatus;
;	HAL_CAN.c: 1148: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit___Id:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit___IDE:
	.db #0x00	; 0
__xinit___RTR:
	.db #0x00	; 0
__xinit___DLC:
	.db #0x00	; 0
__xinit___Data:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit___FMI:
	.db #0x00	; 0
	.area CABS (ABS)
