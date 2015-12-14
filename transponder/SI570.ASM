;----------------------------------------------------------
; Code Produced by the PROTON+ Compiler. Version 3.2.5.5
; Copyright Rosetta Technologies/Crownhill Associates
; Written by Les Johnson. February 2007
;----------------------------------------------------------
 NOLIST
 #include "C:\PROJELER\TRANSPONDER\SI570.PBP"
 LIST

 B21 = 41
 B22 = 42
 B23 = 43
 B24 = 44
 B25 = 45
 B26 = 46
	#Define __SDA_PORT PORTC
	#Define __SCL_PORT PORTC
F2_SOF equ $ ; SI570.PRP
F2_EOF equ $ ; SI570.PRP
F1_SOF equ $ ; SI570.BAS
F1_000003 equ $ ; in [SI570.BAS] ALL_DIGITAL = True
	Movlw 7
	Bsf STATUS,5
ram_bank = 1
	Movwf CMCON
	Movlw 7
	Movwf ADCON1
F1_000004 equ $ ; in [SI570.BAS] PORTB_PULLUPS = True
	Bcf OPTION_REG,7
F1_000011 equ $ ; in [SI570.BAS] TRISB = 0
	Clrf TRISB
F1_000013 equ $ ; in [SI570.BAS] PORTB = 0
	Bcf STATUS,5
ram_bank = 0
	Clrf PORTB
F1_000023 equ $ ; in [SI570.BAS] b21 = $E1                               'reg 7
	Movlw 225
	Movwf B21
F1_000024 equ $ ; in [SI570.BAS] b22 = $C2
	Movlw 194
	Movwf B22
F1_000025 equ $ ; in [SI570.BAS] b23 = $B5
	Movlw 181
	Movwf B23
F1_000026 equ $ ; in [SI570.BAS] b24 = $DD
	Movlw 221
	Movwf B24
F1_000027 equ $ ; in [SI570.BAS] b25 = $40
	Movlw 64
	Movwf B25
F1_000028 equ $ ; in [SI570.BAS] b26 = $F8                               'reg 12
	Movlw 248
	Movwf B26
ST570
F1_000034 equ $ ; in [SI570.BAS] BStart
	F@Call bus@strt
F1_000035 equ $ ; in [SI570.BAS] BusOut $AA
	Movlw 170
	F@Call Busoutb
F1_000036 equ $ ; in [SI570.BAS] BusOut 137
	Movlw 137
	F@Call Busoutb
F1_000037 equ $ ; in [SI570.BAS] BusOut $10
	Movlw 16
	F@Call Busoutb
F1_000038 equ $ ; in [SI570.BAS] BStop
	F@Call bus@stp
F1_000039 equ $ ; in [SI570.BAS] DelayMS 10
	Movlw 10
	F@Call dl@ms
F1_000052 equ $ ; in [SI570.BAS] BStart
	F@Call bus@strt
F1_000053 equ $ ; in [SI570.BAS] BusOut $AA, 7, [b21, b22, b23, b24, b25, b26]
	Movlw 170
	F@Call Busout
	Movlw 7
	F@Call Busout
	Movf B21,W
	F@Call Busout
	Movf B22,W
	F@Call Busout
	Movf B23,W
	F@Call Busout
	Movf B24,W
	F@Call Busout
	Movf B25,W
	F@Call Busout
	Movf B26,W
	F@Call Busout2
F1_000054 equ $ ; in [SI570.BAS] BStop
	F@Call bus@stp
F1_000055 equ $ ; in [SI570.BAS] DelayMS 10
	Movlw 10
	F@Call dl@ms
F1_000057 equ $ ; in [SI570.BAS] BStart
	F@Call bus@strt
F1_000058 equ $ ; in [SI570.BAS] BusOut $AA
	Movlw 170
	F@Call Busoutb
F1_000059 equ $ ; in [SI570.BAS] BusOut 137
	Movlw 137
	F@Call Busoutb
F1_000060 equ $ ; in [SI570.BAS] BusOut 0
	Movlw 0
	F@Call Busoutb
F1_000061 equ $ ; in [SI570.BAS] BStop
	F@Call bus@stp
F1_000062 equ $ ; in [SI570.BAS] DelayMS 10
	Movlw 10
	F@Call dl@ms
F1_000064 equ $ ; in [SI570.BAS] BStart
	F@Call bus@strt
F1_000065 equ $ ; in [SI570.BAS] BusOut $AA
	Movlw 170
	F@Call Busoutb
F1_000066 equ $ ; in [SI570.BAS] BusOut 135
	Movlw 135
	F@Call Busoutb
F1_000067 equ $ ; in [SI570.BAS] BusOut $40
	Movlw 64
	F@Call Busoutb
F1_000068 equ $ ; in [SI570.BAS] BStop
	F@Call bus@stp
F1_000069 equ $ ; in [SI570.BAS] DelayMS 10
	Movlw 10
	F@Call dl@ms
F1_000071 equ $ ; in [SI570.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000072 equ $ ; in [SI570.BAS] Toggle PORTB.7
	Movlw 128
	Xorwf PORTB,F
	Bsf STATUS,5
ram_bank = 1
	Bcf TRISB,7
F1_000073 equ $ ; in [SI570.BAS] GoTo st570
	Bcf STATUS,5
ram_bank = 0
	F@Jump ST570
F1_000074 equ $ ; in [SI570.BAS] End
Pb@lb2
	Sleep
	F@Jump Pb@lb2
F1_EOF equ $ ; SI570.BAS
 LIST
	END

