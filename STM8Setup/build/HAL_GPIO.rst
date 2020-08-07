                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module HAL_GPIO
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_ReadOutputData
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; absolute external ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DABS (ABS)
                                     31 
                                     32 ; default segment ordering for linker
                                     33 	.area HOME
                                     34 	.area GSINIT
                                     35 	.area GSFINAL
                                     36 	.area CONST
                                     37 	.area INITIALIZER
                                     38 	.area CODE
                                     39 
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                                     56 ;	HAL_GPIO.c: 9: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     57 ;	-----------------------------------------
                                     58 ;	 function GPIO_Init
                                     59 ;	-----------------------------------------
      008186                         60 _GPIO_Init:
      008186 52 05            [ 2]   61 	sub	sp, #5
                                     62 ;	HAL_GPIO.c: 11: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008188 16 08            [ 2]   63 	ldw	y, (0x08, sp)
      00818A 93               [ 1]   64 	ldw	x, y
      00818B 1C 00 04         [ 2]   65 	addw	x, #0x0004
      00818E 1F 01            [ 2]   66 	ldw	(0x01, sp), x
      008190 F6               [ 1]   67 	ld	a, (x)
      008191 88               [ 1]   68 	push	a
      008192 7B 0B            [ 1]   69 	ld	a, (0x0b, sp)
      008194 43               [ 1]   70 	cpl	a
      008195 6B 04            [ 1]   71 	ld	(0x04, sp), a
      008197 84               [ 1]   72 	pop	a
      008198 14 03            [ 1]   73 	and	a, (0x03, sp)
      00819A 1E 01            [ 2]   74 	ldw	x, (0x01, sp)
      00819C F7               [ 1]   75 	ld	(x), a
                                     76 ;	HAL_GPIO.c: 22: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      00819D 93               [ 1]   77 	ldw	x, y
      00819E 5C               [ 1]   78 	incw	x
      00819F 5C               [ 1]   79 	incw	x
      0081A0 1F 04            [ 2]   80 	ldw	(0x04, sp), x
                                     81 ;	HAL_GPIO.c: 12: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      0081A2 0D 0B            [ 1]   82 	tnz	(0x0b, sp)
      0081A4 2A 1E            [ 1]   83 	jrpl	00105$
                                     84 ;	HAL_GPIO.c: 16: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0081A6 90 F6            [ 1]   85 	ld	a, (y)
                                     86 ;	HAL_GPIO.c: 14: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00)
      0081A8 88               [ 1]   87 	push	a
      0081A9 7B 0C            [ 1]   88 	ld	a, (0x0c, sp)
      0081AB A5 10            [ 1]   89 	bcp	a, #0x10
      0081AD 84               [ 1]   90 	pop	a
      0081AE 27 06            [ 1]   91 	jreq	00102$
                                     92 ;	HAL_GPIO.c: 16: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      0081B0 1A 0A            [ 1]   93 	or	a, (0x0a, sp)
      0081B2 90 F7            [ 1]   94 	ld	(y), a
      0081B4 20 04            [ 2]   95 	jra	00103$
      0081B6                         96 00102$:
                                     97 ;	HAL_GPIO.c: 20: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0081B6 14 03            [ 1]   98 	and	a, (0x03, sp)
      0081B8 90 F7            [ 1]   99 	ld	(y), a
      0081BA                        100 00103$:
                                    101 ;	HAL_GPIO.c: 22: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0081BA 1E 04            [ 2]  102 	ldw	x, (0x04, sp)
      0081BC F6               [ 1]  103 	ld	a, (x)
      0081BD 1A 0A            [ 1]  104 	or	a, (0x0a, sp)
      0081BF 1E 04            [ 2]  105 	ldw	x, (0x04, sp)
      0081C1 F7               [ 1]  106 	ld	(x), a
      0081C2 20 08            [ 2]  107 	jra	00106$
      0081C4                        108 00105$:
                                    109 ;	HAL_GPIO.c: 26: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0081C4 1E 04            [ 2]  110 	ldw	x, (0x04, sp)
      0081C6 F6               [ 1]  111 	ld	a, (x)
      0081C7 14 03            [ 1]  112 	and	a, (0x03, sp)
      0081C9 1E 04            [ 2]  113 	ldw	x, (0x04, sp)
      0081CB F7               [ 1]  114 	ld	(x), a
      0081CC                        115 00106$:
                                    116 ;	HAL_GPIO.c: 31: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0081CC 93               [ 1]  117 	ldw	x, y
      0081CD 1C 00 03         [ 2]  118 	addw	x, #0x0003
      0081D0 F6               [ 1]  119 	ld	a, (x)
                                    120 ;	HAL_GPIO.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00)
      0081D1 88               [ 1]  121 	push	a
      0081D2 7B 0C            [ 1]  122 	ld	a, (0x0c, sp)
      0081D4 A5 40            [ 1]  123 	bcp	a, #0x40
      0081D6 84               [ 1]  124 	pop	a
      0081D7 27 05            [ 1]  125 	jreq	00108$
                                    126 ;	HAL_GPIO.c: 31: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0081D9 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      0081DB F7               [ 1]  128 	ld	(x), a
      0081DC 20 03            [ 2]  129 	jra	00109$
      0081DE                        130 00108$:
                                    131 ;	HAL_GPIO.c: 35: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0081DE 14 03            [ 1]  132 	and	a, (0x03, sp)
      0081E0 F7               [ 1]  133 	ld	(x), a
      0081E1                        134 00109$:
                                    135 ;	HAL_GPIO.c: 11: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0081E1 1E 01            [ 2]  136 	ldw	x, (0x01, sp)
      0081E3 F6               [ 1]  137 	ld	a, (x)
                                    138 ;	HAL_GPIO.c: 38: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00)
      0081E4 88               [ 1]  139 	push	a
      0081E5 7B 0C            [ 1]  140 	ld	a, (0x0c, sp)
      0081E7 A5 20            [ 1]  141 	bcp	a, #0x20
      0081E9 84               [ 1]  142 	pop	a
      0081EA 27 07            [ 1]  143 	jreq	00111$
                                    144 ;	HAL_GPIO.c: 40: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0081EC 1A 0A            [ 1]  145 	or	a, (0x0a, sp)
      0081EE 1E 01            [ 2]  146 	ldw	x, (0x01, sp)
      0081F0 F7               [ 1]  147 	ld	(x), a
      0081F1 20 05            [ 2]  148 	jra	00113$
      0081F3                        149 00111$:
                                    150 ;	HAL_GPIO.c: 44: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0081F3 14 03            [ 1]  151 	and	a, (0x03, sp)
      0081F5 1E 01            [ 2]  152 	ldw	x, (0x01, sp)
      0081F7 F7               [ 1]  153 	ld	(x), a
      0081F8                        154 00113$:
                                    155 ;	HAL_GPIO.c: 46: }
      0081F8 5B 05            [ 2]  156 	addw	sp, #5
      0081FA 81               [ 4]  157 	ret
                                    158 ;	HAL_GPIO.c: 48: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      0081FB                        162 _GPIO_Write:
                                    163 ;	HAL_GPIO.c: 50: GPIOx->ODR = PortVal;
      0081FB 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      0081FD 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      0081FF F7               [ 1]  166 	ld	(x), a
                                    167 ;	HAL_GPIO.c: 51: }
      008200 81               [ 4]  168 	ret
                                    169 ;	HAL_GPIO.c: 53: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    170 ;	-----------------------------------------
                                    171 ;	 function GPIO_WriteHigh
                                    172 ;	-----------------------------------------
      008201                        173 _GPIO_WriteHigh:
                                    174 ;	HAL_GPIO.c: 55: GPIOx->ODR |= (uint8_t)PortPins;
      008201 1E 03            [ 2]  175 	ldw	x, (0x03, sp)
      008203 F6               [ 1]  176 	ld	a, (x)
      008204 1A 05            [ 1]  177 	or	a, (0x05, sp)
      008206 F7               [ 1]  178 	ld	(x), a
                                    179 ;	HAL_GPIO.c: 56: }
      008207 81               [ 4]  180 	ret
                                    181 ;	HAL_GPIO.c: 58: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_WriteLow
                                    184 ;	-----------------------------------------
      008208                        185 _GPIO_WriteLow:
      008208 88               [ 1]  186 	push	a
                                    187 ;	HAL_GPIO.c: 60: GPIOx->ODR &= (uint8_t)(~PortPins);
      008209 1E 04            [ 2]  188 	ldw	x, (0x04, sp)
      00820B F6               [ 1]  189 	ld	a, (x)
      00820C 6B 01            [ 1]  190 	ld	(0x01, sp), a
      00820E 7B 06            [ 1]  191 	ld	a, (0x06, sp)
      008210 43               [ 1]  192 	cpl	a
      008211 14 01            [ 1]  193 	and	a, (0x01, sp)
      008213 F7               [ 1]  194 	ld	(x), a
                                    195 ;	HAL_GPIO.c: 61: }
      008214 84               [ 1]  196 	pop	a
      008215 81               [ 4]  197 	ret
                                    198 ;	HAL_GPIO.c: 63: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    199 ;	-----------------------------------------
                                    200 ;	 function GPIO_WriteReverse
                                    201 ;	-----------------------------------------
      008216                        202 _GPIO_WriteReverse:
                                    203 ;	HAL_GPIO.c: 65: GPIOx->ODR ^= (uint8_t)PortPins;
      008216 1E 03            [ 2]  204 	ldw	x, (0x03, sp)
      008218 F6               [ 1]  205 	ld	a, (x)
      008219 18 05            [ 1]  206 	xor	a, (0x05, sp)
      00821B F7               [ 1]  207 	ld	(x), a
                                    208 ;	HAL_GPIO.c: 66: }
      00821C 81               [ 4]  209 	ret
                                    210 ;	HAL_GPIO.c: 68: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    211 ;	-----------------------------------------
                                    212 ;	 function GPIO_ReadOutputData
                                    213 ;	-----------------------------------------
      00821D                        214 _GPIO_ReadOutputData:
                                    215 ;	HAL_GPIO.c: 70: return ((uint8_t)GPIOx->ODR);
      00821D 1E 03            [ 2]  216 	ldw	x, (0x03, sp)
      00821F F6               [ 1]  217 	ld	a, (x)
                                    218 ;	HAL_GPIO.c: 71: }
      008220 81               [ 4]  219 	ret
                                    220 ;	HAL_GPIO.c: 73: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    221 ;	-----------------------------------------
                                    222 ;	 function GPIO_ReadInputData
                                    223 ;	-----------------------------------------
      008221                        224 _GPIO_ReadInputData:
                                    225 ;	HAL_GPIO.c: 75: return ((uint8_t)GPIOx->IDR);
      008221 1E 03            [ 2]  226 	ldw	x, (0x03, sp)
      008223 E6 01            [ 1]  227 	ld	a, (0x1, x)
                                    228 ;	HAL_GPIO.c: 76: }
      008225 81               [ 4]  229 	ret
                                    230 ;	HAL_GPIO.c: 78: uint8_t GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    231 ;	-----------------------------------------
                                    232 ;	 function GPIO_ReadInputPin
                                    233 ;	-----------------------------------------
      008226                        234 _GPIO_ReadInputPin:
                                    235 ;	HAL_GPIO.c: 80: uint8_t state = (uint8_t)(GPIOx->IDR & (uint8_t)GPIO_Pin);
      008226 1E 03            [ 2]  236 	ldw	x, (0x03, sp)
      008228 E6 01            [ 1]  237 	ld	a, (0x1, x)
      00822A 14 05            [ 1]  238 	and	a, (0x05, sp)
                                    239 ;	HAL_GPIO.c: 81: if(state == GPIO_Pin)
                                    240 ;	HAL_GPIO.c: 82: return 0x1;
      00822C 10 05            [ 1]  241 	sub	a, (0x05, sp)
      00822E 26 02            [ 1]  242 	jrne	00102$
      008230 4C               [ 1]  243 	inc	a
      008231 81               [ 4]  244 	ret
      008232                        245 00102$:
                                    246 ;	HAL_GPIO.c: 84: return 0x0;
      008232 4F               [ 1]  247 	clr	a
                                    248 ;	HAL_GPIO.c: 85: }
      008233 81               [ 4]  249 	ret
                                    250 	.area CODE
                                    251 	.area CONST
                                    252 	.area INITIALIZER
                                    253 	.area CABS (ABS)
