start /B /wait "" %~dp0STVP_CmdLine.lnk -BoardName=ST-LINK -Tool_ID=0 -Port=USB -ProgMode=SWIM -Device=STM8AF528 -verbose -progress -verif -no_loop -FileProg=%cd%/main.hex
