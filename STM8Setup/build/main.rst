                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _Delay
                                     13 	.globl _I2C_CheckEvent
                                     14 	.globl _I2C_SendData
                                     15 	.globl _I2C_Send7bitAddress
                                     16 	.globl _I2C_GenerateSTOP
                                     17 	.globl _I2C_GenerateSTART
                                     18 	.globl _I2C_Cmd
                                     19 	.globl _I2C_Init
                                     20 	.globl _I2C_DeInit
                                     21 	.globl _GetTimerTick
                                     22 	.globl _SetTimerTick
                                     23 	.globl _CLK_GetClockFreq
                                     24 	.globl _CLK_HSIPrescalerConfig
                                     25 	.globl _CLK_ClockSwitchConfig
                                     26 	.globl _CLK_PeripheralClockConfig
                                     27 	.globl _TIM4_ClearFlag
                                     28 	.globl _TIM4_ITConfig
                                     29 	.globl _TIM4_Cmd
                                     30 	.globl _TIM4_TimeBaseInit
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; Stack segment in internal ram 
                                     41 ;--------------------------------------------------------
                                     42 	.area	SSEG
      FFFFFF                         43 __start__stack:
      FFFFFF                         44 	.ds	1
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 
                                     51 ; default segment ordering for linker
                                     52 	.area HOME
                                     53 	.area GSINIT
                                     54 	.area GSFINAL
                                     55 	.area CONST
                                     56 	.area INITIALIZER
                                     57 	.area CODE
                                     58 
                                     59 ;--------------------------------------------------------
                                     60 ; interrupt vector 
                                     61 ;--------------------------------------------------------
                                     62 	.area HOME
      008000                         63 __interrupt_vect:
      008000 82 00 80 6B             64 	int s_GSINIT ; reset
      008004 82 00 00 00             65 	int 0x000000 ; trap
      008008 82 00 00 00             66 	int 0x000000 ; int0
      00800C 82 00 00 00             67 	int 0x000000 ; int1
      008010 82 00 00 00             68 	int 0x000000 ; int2
      008014 82 00 00 00             69 	int 0x000000 ; int3
      008018 82 00 00 00             70 	int 0x000000 ; int4
      00801C 82 00 00 00             71 	int 0x000000 ; int5
      008020 82 00 00 00             72 	int 0x000000 ; int6
      008024 82 00 00 00             73 	int 0x000000 ; int7
      008028 82 00 00 00             74 	int 0x000000 ; int8
      00802C 82 00 00 00             75 	int 0x000000 ; int9
      008030 82 00 00 00             76 	int 0x000000 ; int10
      008034 82 00 00 00             77 	int 0x000000 ; int11
      008038 82 00 00 00             78 	int 0x000000 ; int12
      00803C 82 00 00 00             79 	int 0x000000 ; int13
      008040 82 00 00 00             80 	int 0x000000 ; int14
      008044 82 00 00 00             81 	int 0x000000 ; int15
      008048 82 00 00 00             82 	int 0x000000 ; int16
      00804C 82 00 00 00             83 	int 0x000000 ; int17
      008050 82 00 00 00             84 	int 0x000000 ; int18
      008054 82 00 00 00             85 	int 0x000000 ; int19
      008058 82 00 00 00             86 	int 0x000000 ; int20
      00805C 82 00 00 00             87 	int 0x000000 ; int21
      008060 82 00 00 00             88 	int 0x000000 ; int22
      008064 82 00 82 47             89 	int _TIM4_UPD_OVF_IRQHandler ; int23
                                     90 ;--------------------------------------------------------
                                     91 ; global & static initialisations
                                     92 ;--------------------------------------------------------
                                     93 	.area HOME
                                     94 	.area GSINIT
                                     95 	.area GSFINAL
                                     96 	.area GSINIT
      00806B                         97 __sdcc_gs_init_startup:
      00806B                         98 __sdcc_init_data:
                                     99 ; stm8_genXINIT() start
      00806B AE 00 00         [ 2]  100 	ldw x, #l_DATA
      00806E 27 07            [ 1]  101 	jreq	00002$
      008070                        102 00001$:
      008070 72 4F 00 00      [ 1]  103 	clr (s_DATA - 1, x)
      008074 5A               [ 2]  104 	decw x
      008075 26 F9            [ 1]  105 	jrne	00001$
      008077                        106 00002$:
      008077 AE 00 14         [ 2]  107 	ldw	x, #l_INITIALIZER
      00807A 27 09            [ 1]  108 	jreq	00004$
      00807C                        109 00003$:
      00807C D6 80 93         [ 1]  110 	ld	a, (s_INITIALIZER - 1, x)
      00807F D7 00 00         [ 1]  111 	ld	(s_INITIALIZED - 1, x), a
      008082 5A               [ 2]  112 	decw	x
      008083 26 F7            [ 1]  113 	jrne	00003$
      008085                        114 00004$:
                                    115 ; stm8_genXINIT() end
                                    116 	.area GSFINAL
      008085 CC 80 68         [ 2]  117 	jp	__sdcc_program_startup
                                    118 ;--------------------------------------------------------
                                    119 ; Home
                                    120 ;--------------------------------------------------------
                                    121 	.area HOME
                                    122 	.area HOME
      008068                        123 __sdcc_program_startup:
      008068 CC 80 BE         [ 2]  124 	jp	_main
                                    125 ;	return from main will return to caller
                                    126 ;--------------------------------------------------------
                                    127 ; code
                                    128 ;--------------------------------------------------------
                                    129 	.area CODE
                                    130 ;	main.c: 19: void Delay(uint32_t n)
                                    131 ;	-----------------------------------------
                                    132 ;	 function Delay
                                    133 ;	-----------------------------------------
      0080A8                        134 _Delay:
                                    135 ;	main.c: 21: SetTimerTick(n);
      0080A8 1E 05            [ 2]  136 	ldw	x, (0x05, sp)
      0080AA 89               [ 2]  137 	pushw	x
      0080AB 1E 05            [ 2]  138 	ldw	x, (0x05, sp)
      0080AD 89               [ 2]  139 	pushw	x
      0080AE CD 82 34         [ 4]  140 	call	_SetTimerTick
      0080B1 5B 04            [ 2]  141 	addw	sp, #4
                                    142 ;	main.c: 22: while(GetTimerTick() != 0);
      0080B3                        143 00101$:
      0080B3 CD 82 3F         [ 4]  144 	call	_GetTimerTick
      0080B6 5D               [ 2]  145 	tnzw	x
      0080B7 26 FA            [ 1]  146 	jrne	00101$
      0080B9 90 5D            [ 2]  147 	tnzw	y
      0080BB 26 F6            [ 1]  148 	jrne	00101$
                                    149 ;	main.c: 23: }
      0080BD 81               [ 4]  150 	ret
                                    151 ;	main.c: 25: uint32_t main(void)
                                    152 ;	-----------------------------------------
                                    153 ;	 function main
                                    154 ;	-----------------------------------------
      0080BE                        155 _main:
                                    156 ;	main.c: 28: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0080BE 4B 00            [ 1]  157 	push	#0x00
      0080C0 CD 84 ED         [ 4]  158 	call	_CLK_HSIPrescalerConfig
      0080C3 84               [ 1]  159 	pop	a
                                    160 ;	main.c: 29: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, 0, CLK_CURRENTCLOCKSTATE_DISABLE);
      0080C4 4B 00            [ 1]  161 	push	#0x00
      0080C6 4B 00            [ 1]  162 	push	#0x00
      0080C8 4B B4            [ 1]  163 	push	#0xb4
      0080CA 4B 01            [ 1]  164 	push	#0x01
      0080CC CD 84 5D         [ 4]  165 	call	_CLK_ClockSwitchConfig
      0080CF 5B 04            [ 2]  166 	addw	sp, #4
                                    167 ;	main.c: 30: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, 1);
      0080D1 4B 01            [ 1]  168 	push	#0x01
      0080D3 4B 00            [ 1]  169 	push	#0x00
      0080D5 CD 84 13         [ 4]  170 	call	_CLK_PeripheralClockConfig
      0080D8 5B 02            [ 2]  171 	addw	sp, #2
                                    172 ;	main.c: 31: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, 1);
      0080DA 4B 01            [ 1]  173 	push	#0x01
      0080DC 4B 04            [ 1]  174 	push	#0x04
      0080DE CD 84 13         [ 4]  175 	call	_CLK_PeripheralClockConfig
      0080E1 5B 02            [ 2]  176 	addw	sp, #2
                                    177 ;	main.c: 34: TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
      0080E3 4B 7C            [ 1]  178 	push	#0x7c
      0080E5 4B 07            [ 1]  179 	push	#0x07
      0080E7 CD 82 6F         [ 4]  180 	call	_TIM4_TimeBaseInit
      0080EA 5B 02            [ 2]  181 	addw	sp, #2
                                    182 ;	main.c: 35: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0080EC 4B 01            [ 1]  183 	push	#0x01
      0080EE CD 83 2E         [ 4]  184 	call	_TIM4_ClearFlag
      0080F1 84               [ 1]  185 	pop	a
                                    186 ;	main.c: 36: TIM4_ITConfig(TIM4_IT_UPDATE, 1);
      0080F2 4B 01            [ 1]  187 	push	#0x01
      0080F4 4B 01            [ 1]  188 	push	#0x01
      0080F6 CD 82 8F         [ 4]  189 	call	_TIM4_ITConfig
      0080F9 5B 02            [ 2]  190 	addw	sp, #2
                                    191 ;	main.c: 37: TIM4_Cmd(1);
      0080FB 4B 01            [ 1]  192 	push	#0x01
      0080FD CD 82 7C         [ 4]  193 	call	_TIM4_Cmd
      008100 84               [ 1]  194 	pop	a
                                    195 ;	main.c: 40: I2C_DeInit();
      008101 CD 96 FE         [ 4]  196 	call	_I2C_DeInit
                                    197 ;	main.c: 42: clock = CLK_GetClockFreq() / 1000000;
      008104 CD 85 A1         [ 4]  198 	call	_CLK_GetClockFreq
      008107 4B 40            [ 1]  199 	push	#0x40
      008109 4B 42            [ 1]  200 	push	#0x42
      00810B 4B 0F            [ 1]  201 	push	#0x0f
      00810D 4B 00            [ 1]  202 	push	#0x00
      00810F 89               [ 2]  203 	pushw	x
      008110 90 89            [ 2]  204 	pushw	y
      008112 CD 9A 2E         [ 4]  205 	call	__divulong
      008115 5B 08            [ 2]  206 	addw	sp, #8
      008117 9F               [ 1]  207 	ld	a, xl
                                    208 ;	main.c: 43: I2C_Cmd(1);
      008118 88               [ 1]  209 	push	a
      008119 4B 01            [ 1]  210 	push	#0x01
      00811B CD 98 4B         [ 4]  211 	call	_I2C_Cmd
      00811E 84               [ 1]  212 	pop	a
      00811F 84               [ 1]  213 	pop	a
                                    214 ;	main.c: 45: I2C_Init(I2C_MAX_STANDARD_FREQ, 0x3C, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, clock);
      008120 88               [ 1]  215 	push	a
      008121 4B 00            [ 1]  216 	push	#0x00
      008123 4B 01            [ 1]  217 	push	#0x01
      008125 4B 00            [ 1]  218 	push	#0x00
      008127 4B 3C            [ 1]  219 	push	#0x3c
      008129 4B 00            [ 1]  220 	push	#0x00
      00812B 4B A0            [ 1]  221 	push	#0xa0
      00812D 4B 86            [ 1]  222 	push	#0x86
      00812F 4B 01            [ 1]  223 	push	#0x01
      008131 4B 00            [ 1]  224 	push	#0x00
      008133 CD 97 23         [ 4]  225 	call	_I2C_Init
      008136 5B 0A            [ 2]  226 	addw	sp, #10
                                    227 ;	main.c: 48: enableInterrupts();
      008138 9A               [ 1]  228 	rim
                                    229 ;	main.c: 50: while(1)
      008139                        230 00111$:
                                    231 ;	main.c: 52: I2C_GenerateSTART(1);
      008139 4B 01            [ 1]  232 	push	#0x01
      00813B CD 98 71         [ 4]  233 	call	_I2C_GenerateSTART
      00813E 84               [ 1]  234 	pop	a
                                    235 ;	main.c: 53: while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
      00813F                        236 00101$:
      00813F 4B 01            [ 1]  237 	push	#0x01
      008141 4B 03            [ 1]  238 	push	#0x03
      008143 CD 99 30         [ 4]  239 	call	_I2C_CheckEvent
      008146 5B 02            [ 2]  240 	addw	sp, #2
      008148 4D               [ 1]  241 	tnz	a
      008149 27 F4            [ 1]  242 	jreq	00101$
                                    243 ;	main.c: 54: I2C_Send7bitAddress(0x3C, I2C_DIRECTION_TX);
      00814B 4B 00            [ 1]  244 	push	#0x00
      00814D 4B 3C            [ 1]  245 	push	#0x3c
      00814F CD 99 1D         [ 4]  246 	call	_I2C_Send7bitAddress
      008152 5B 02            [ 2]  247 	addw	sp, #2
                                    248 ;	main.c: 55: while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
      008154                        249 00104$:
      008154 4B 82            [ 1]  250 	push	#0x82
      008156 4B 07            [ 1]  251 	push	#0x07
      008158 CD 99 30         [ 4]  252 	call	_I2C_CheckEvent
      00815B 5B 02            [ 2]  253 	addw	sp, #2
      00815D 4D               [ 1]  254 	tnz	a
      00815E 27 F4            [ 1]  255 	jreq	00104$
                                    256 ;	main.c: 56: I2C_SendData(0x06);
      008160 4B 06            [ 1]  257 	push	#0x06
      008162 CD 99 29         [ 4]  258 	call	_I2C_SendData
      008165 84               [ 1]  259 	pop	a
                                    260 ;	main.c: 57: while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
      008166                        261 00107$:
      008166 4B 84            [ 1]  262 	push	#0x84
      008168 4B 07            [ 1]  263 	push	#0x07
      00816A CD 99 30         [ 4]  264 	call	_I2C_CheckEvent
      00816D 5B 02            [ 2]  265 	addw	sp, #2
      00816F 4D               [ 1]  266 	tnz	a
      008170 27 F4            [ 1]  267 	jreq	00107$
                                    268 ;	main.c: 58: I2C_GenerateSTOP(1);
      008172 4B 01            [ 1]  269 	push	#0x01
      008174 CD 98 84         [ 4]  270 	call	_I2C_GenerateSTOP
      008177 84               [ 1]  271 	pop	a
                                    272 ;	main.c: 59: Delay(500);
      008178 4B F4            [ 1]  273 	push	#0xf4
      00817A 4B 01            [ 1]  274 	push	#0x01
      00817C 5F               [ 1]  275 	clrw	x
      00817D 89               [ 2]  276 	pushw	x
      00817E CD 80 A8         [ 4]  277 	call	_Delay
      008181 5B 04            [ 2]  278 	addw	sp, #4
      008183 20 B4            [ 2]  279 	jra	00111$
                                    280 ;	main.c: 61: }
      008185 81               [ 4]  281 	ret
                                    282 	.area CODE
                                    283 	.area CONST
                                    284 	.area INITIALIZER
                                    285 	.area CABS (ABS)
