@echo off

:: configuration
SET CC=sdcc
SET CFLAGS=-mstm8 
SET INCLUDEPATH=%cd%
:: mcu type defined in stm8s.h file
SET CPU=STM8AF52Ax
SET SDCCFLAG=SDCC
SET SOURCE=main
SET GPIO_SRC=HAL_GPIO
SET INTERRUPT_SRC=interrupts
SET TIM4_SRC=HAL_TIM4
SET CLK_SRC=HAL_CLK
SET UART_SRC=HAL_UART1
SET CAN_SRC=HAL_CAN
SET I2C_SRC=HAL_I2C
SET OUTPUT_DIR=build

:test_prerequisites
call %CC% -v || goto :failed
goto :clean

:failed
echo ERROR - SDCC compiler is not installed or not included in system PATH!
goto :exit

:clean
echo INFO - Cleaning up...
del %SOURCE%.hex /f /q
rd /s /q %OUTPUT_DIR%
echo INFO - Cleanup complete

:compile
echo INFO - Compiling...
mkdir %OUTPUT_DIR% 
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %GPIO_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %INTERRUPT_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %TIM4_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %CLK_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %UART_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %CAN_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -c %I2C_SRC%.c -o %OUTPUT_DIR%/ || goto :compile_failed
%CC% %CFLAGS% -I%INCLUDEPATH% -D%CPU% -D%SDCCFLAG% -o %OUTPUT_DIR%/ %SOURCE%.c %OUTPUT_DIR%/%GPIO_SRC%.rel %OUTPUT_DIR%/%INTERRUPT_SRC%.rel %OUTPUT_DIR%/%TIM4_SRC%.rel %OUTPUT_DIR%/%CLK_SRC%.rel %OUTPUT_DIR%/%UART_SRC%.rel %OUTPUT_DIR%/%CAN_SRC%.rel %OUTPUT_DIR%/%I2C_SRC%.rel || goto :compile_failed
echo INFO - Compile complete
goto :makehex

:compile_failed
echo ERROR - Compilation failure
goto :exit

:makehex
echo INFO - Generating HEX file...
packihx %OUTPUT_DIR%/%SOURCE%.ihx > %SOURCE%.hex
echo INFO - Generate complete
echo INFO - Done. OK

:exit