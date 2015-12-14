;----------------------------------------------------------
; Code Produced by the PROTON+ Compiler. Version 3.2.5.5
; Copyright Rosetta Technologies/Crownhill Associates
; Written by Les Johnson. February 2007
;----------------------------------------------------------
 NOLIST
 #include "C:\PROJELER\TRANSPONDER\SI570+TEST.PBP"
 LIST

 TEMP1 = 54
 TEMP2 = 55
 TEMPVAL = 56
 SECS = 57
 MINS = 58
 HRS = 59
 DAY = 60
 DATE = 61
 MONTH = 62
 YEAR = 63
 CTRL = 64
 SECS_LAST = 65
	#Define __LCD_DTPORT PORTB
	#Define __LCD_RSPORT PORTB
	#Define __LCD_ENPORT PORTB
	#Define __SDA_PORT PORTA
	#Define __SCL_PORT PORTA
F2_SOF equ $ ; SI570+TEST.PRP
F2_EOF equ $ ; SI570+TEST.PRP
F1_SOF equ $ ; SI570+TEST.BAS
F1_000003 equ $ ; in [SI570+TEST.BAS] ALL_DIGITAL = True
	Movlw 7
	Bsf STATUS,5
ram_bank = 1
	Movwf CMCON
	Movlw 7
	Movwf ADCON1
F1_000004 equ $ ; in [SI570+TEST.BAS] PORTB_PULLUPS = True
	Bcf OPTION_REG,7
F1_000035 equ $ ; in [SI570+TEST.BAS] DelayMS 100
	Movlw 100
	Bcf STATUS,5
ram_bank = 0
	F@Call dl@ms
F1_000036 equ $ ; in [SI570+TEST.BAS] Cls
	F@Call Lcd@Cls
F1_000040 equ $ ; in [SI570+TEST.BAS] Secs = 0 ' Set seconds
	Clrf SECS
F1_000041 equ $ ; in [SI570+TEST.BAS] Mins = 30 ' Set minutes
	Movlw 30
	Movwf MINS
F1_000042 equ $ ; in [SI570+TEST.BAS] Hrs = 12 ' Set hours
	Movlw 12
	Movwf HRS
F1_000044 equ $ ; in [SI570+TEST.BAS] day = 1 ' Set day of week value
	Movlw 1
	Movwf DAY
F1_000046 equ $ ; in [SI570+TEST.BAS] Date = 30 ' Day of month value
	Movlw 30
	Movwf DATE
F1_000047 equ $ ; in [SI570+TEST.BAS] Month = 11 ' Month value
	Movlw 11
	Movwf MONTH
F1_000048 equ $ ; in [SI570+TEST.BAS] Year = 6 ' Year value
	Movlw 6
	Movwf YEAR
F1_000050 equ $ ; in [SI570+TEST.BAS] Ctrl = 0 ' Set the control byte (leave as 0 in this example)
	Clrf CTRL
F1_000055 equ $ ; in [SI570+TEST.BAS] TempVal=Secs
	Movf SECS,W
	Movwf TEMPVAL
F1_000056 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000057 equ $ ; in [SI570+TEST.BAS] Secs=TempVal
	Movf TEMPVAL,W
	Movwf SECS
F1_000059 equ $ ; in [SI570+TEST.BAS] TempVal=Mins
	Movf MINS,W
	Movwf TEMPVAL
F1_000060 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000061 equ $ ; in [SI570+TEST.BAS] Mins=TempVal
	Movf TEMPVAL,W
	Movwf MINS
F1_000063 equ $ ; in [SI570+TEST.BAS] TempVal=Hrs
	Movf HRS,W
	Movwf TEMPVAL
F1_000064 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000065 equ $ ; in [SI570+TEST.BAS] Hrs=TempVal
	Movf TEMPVAL,W
	Movwf HRS
F1_000067 equ $ ; in [SI570+TEST.BAS] TempVal=day
	Movf DAY,W
	Movwf TEMPVAL
F1_000068 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000069 equ $ ; in [SI570+TEST.BAS] day=TempVal
	Movf TEMPVAL,W
	Movwf DAY
F1_000071 equ $ ; in [SI570+TEST.BAS] TempVal=Date
	Movf DATE,W
	Movwf TEMPVAL
F1_000072 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000073 equ $ ; in [SI570+TEST.BAS] Date=TempVal
	Movf TEMPVAL,W
	Movwf DATE
F1_000075 equ $ ; in [SI570+TEST.BAS] TempVal=Month
	Movf MONTH,W
	Movwf TEMPVAL
F1_000076 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000077 equ $ ; in [SI570+TEST.BAS] Month=TempVal
	Movf TEMPVAL,W
	Movwf MONTH
F1_000079 equ $ ; in [SI570+TEST.BAS] TempVal=Year
	Movf YEAR,W
	Movwf TEMPVAL
F1_000080 equ $ ; in [SI570+TEST.BAS] GoSub BIN_TO_BCD
	F@Call BIN_TO_BCD
F1_000081 equ $ ; in [SI570+TEST.BAS] Year=TempVal
	Movf TEMPVAL,W
	Movwf YEAR
F1_000083 equ $ ; in [SI570+TEST.BAS] BStart
	F@Call bus@strt
F1_000088 equ $ ; in [SI570+TEST.BAS] BusOut 11010000, 0, [Secs, Mins, Hrs, day, Date, Month, Year, Ctrl]
	Movlw 208
	F@Call Busout
	Movlw 0
	F@Call Busout
	Movf SECS,W
	F@Call Busout
	Movf MINS,W
	F@Call Busout
	Movf HRS,W
	F@Call Busout
	Movf DAY,W
	F@Call Busout
	Movf DATE,W
	F@Call Busout
	Movf MONTH,W
	F@Call Busout
	Movf YEAR,W
	F@Call Busout
	Movf CTRL,W
	F@Call Busout2
F1_000091 equ $ ; in [SI570+TEST.BAS] BStop
	F@Call bus@stp
F1_000093 equ $ ; in [SI570+TEST.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
MAIN
F1_000097 equ $ ; in [SI570+TEST.BAS] BStart
	F@Call bus@strt
F1_000100 equ $ ; in [SI570+TEST.BAS] BusIn 11010001, 0, [Secs, Mins, Hrs, day, Date, Month, Year, Ctrl]
	Movlw 209
	F@Call Busout
	Movlw 0
	F@Call Busout
	F@Call Busin
	Movwf SECS
	F@Call Busin
	Movwf MINS
	F@Call Busin
	Movwf HRS
	F@Call Busin
	Movwf DAY
	F@Call Busin
	Movwf DATE
	F@Call Busin
	Movwf MONTH
	F@Call Busin
	Movwf YEAR
	F@Call Busin2
	Movwf CTRL
F1_000102 equ $ ; in [SI570+TEST.BAS] BStop
	F@Call bus@stp
F1_000107 equ $ ; in [SI570+TEST.BAS] TempVal=Secs
	Movf SECS,W
	Movwf TEMPVAL
F1_000108 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000109 equ $ ; in [SI570+TEST.BAS] Secs=TempVal
	Movf TEMPVAL,W
	Movwf SECS
F1_000111 equ $ ; in [SI570+TEST.BAS] TempVal=Mins
	Movf MINS,W
	Movwf TEMPVAL
F1_000112 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000113 equ $ ; in [SI570+TEST.BAS] Mins=TempVal
	Movf TEMPVAL,W
	Movwf MINS
F1_000115 equ $ ; in [SI570+TEST.BAS] TempVal=Hrs
	Movf HRS,W
	Movwf TEMPVAL
F1_000116 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000117 equ $ ; in [SI570+TEST.BAS] Hrs=TempVal
	Movf TEMPVAL,W
	Movwf HRS
F1_000119 equ $ ; in [SI570+TEST.BAS] TempVal=Date
	Movf DATE,W
	Movwf TEMPVAL
F1_000120 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000121 equ $ ; in [SI570+TEST.BAS] Date=TempVal
	Movf TEMPVAL,W
	Movwf DATE
F1_000123 equ $ ; in [SI570+TEST.BAS] TempVal=Month
	Movf MONTH,W
	Movwf TEMPVAL
F1_000124 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000125 equ $ ; in [SI570+TEST.BAS] Month=TempVal
	Movf TEMPVAL,W
	Movwf MONTH
F1_000127 equ $ ; in [SI570+TEST.BAS] TempVal=Year
	Movf YEAR,W
	Movwf TEMPVAL
F1_000128 equ $ ; in [SI570+TEST.BAS] GoSub BCD_TO_BIN
	F@Call BCD_TO_BIN
F1_000129 equ $ ; in [SI570+TEST.BAS] Year=TempVal
	Movf TEMPVAL,W
	Movwf YEAR
F1_000134 equ $ ; in [SI570+TEST.BAS] If Secs - Secs_last = 0 Then GoTo Main
	Movf SECS_LAST,W
	Subwf SECS,W
	Movwf PBP#VAR0
	Clrf PBP#VAR0H
	Btfss STATUS,0
	Decf PBP#VAR0H,F
	Movf PBP#VAR0H,W
	Iorwf PBP#VAR0,W
	set@page bc@LL2
	Btfss STATUS,2
	Goto bc@LL2
	F@Jump MAIN
bc@LL2
F1_000137 equ $ ; in [SI570+TEST.BAS] Print At 1,1,"Time: ",DEC2 Hrs, ":", DEC2 Mins,":", DEC2 Secs
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb1 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb1 & 255)
	F@Call c@strout
	Movlw 2
	Movwf GEN4H
	Movf HRS,W
	F@Call out@decc
	Movlw 58
	F@Call Print
	Movlw 2
	Movwf GEN4H
	Movf MINS,W
	F@Call out@decc
	Movlw 58
	F@Call Print
	Movlw 2
	Movwf GEN4H
	Movf SECS,W
	F@Call out@decc
F1_000138 equ $ ; in [SI570+TEST.BAS] Print At 2,1,"Date: ", DEC2 Date, "-", DEC2 Month, "-", DEC2 Year
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb2 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb2 & 255)
	F@Call c@strout
	Movlw 2
	Movwf GEN4H
	Movf DATE,W
	F@Call out@decc
	Movlw 45
	F@Call Print
	Movlw 2
	Movwf GEN4H
	Movf MONTH,W
	F@Call out@decc
	Movlw 45
	F@Call Print
	Movlw 2
	Movwf GEN4H
	Movf YEAR,W
	F@Call out@decc
F1_000140 equ $ ; in [SI570+TEST.BAS] Secs_last = Secs
	Movf SECS,W
	Movwf SECS_LAST
F1_000142 equ $ ; in [SI570+TEST.BAS] GoTo Main
	F@Jump MAIN
BCD_TO_BIN
F1_000146 equ $ ; in [SI570+TEST.BAS] Temp1 = $0F & TempVal ' Clear off the top four bits
	Movlw 15
	Andwf TEMPVAL,W
	Movwf TEMP1
F1_000147 equ $ ; in [SI570+TEST.BAS] Temp1 = Dig Temp1, 0
	Clrf PP0H
	Movf TEMP1,W
	Movwf PP0
	Movlw 0
	F@Call Dig
	Movwf TEMP1
F1_000148 equ $ ; in [SI570+TEST.BAS] Temp2 = TempVal >> 4 ' Shift down four to read 2 BCD value
	Swapf TEMPVAL,W
	Andlw 15
	Movwf TEMP2
F1_000149 equ $ ; in [SI570+TEST.BAS] Temp2 = Dig Temp2, 0
	Clrf PP0H
	Movf TEMP2,W
	Movwf PP0
	Movlw 0
	F@Call Dig
	Movwf TEMP2
F1_000150 equ $ ; in [SI570+TEST.BAS] TempVal = Temp2 * 10 + Temp1
	Clrf PP3H
	Movf TEMP2,W
	Movwf PP3
	Clrf PP1H
	Movlw 10
	Movwf PP1
	F@Call m@py
	Movwf PP7
	Movf PP2H,W
	Movwf PP7H
	Movf TEMP1,W
	Addwf PP7,W
	Movwf TEMPVAL
F1_000152 equ $ ; in [SI570+TEST.BAS] Return
	Return
BIN_TO_BCD
F1_000156 equ $ ; in [SI570+TEST.BAS] Temp1 = Dig TempVal, 0 ' GET THE DEC DIGIT FOR THE FIRST NIBBLE
	Clrf PP0H
	Movf TEMPVAL,W
	Movwf PP0
	Movlw 0
	F@Call Dig
	Movwf TEMP1
F1_000157 equ $ ; in [SI570+TEST.BAS] Temp2 = Dig TempVal, 1 ' GET THE DEC DIGIT FOR THE FIRST NIBBLE
	Clrf PP0H
	Movf TEMPVAL,W
	Movwf PP0
	Movlw 1
	F@Call Dig
	Movwf TEMP2
F1_000158 equ $ ; in [SI570+TEST.BAS] Temp2 = Temp2 << 4 ' MOVE NUMBER OVER TO 2ND NIBBLE
	Swapf TEMP2,W
	Andlw 240
	Movwf TEMP2
F1_000161 equ $ ; in [SI570+TEST.BAS] TempVal = Temp1 ^ Temp2
	Movf TEMP2,W
	Xorwf TEMP1,W
	Movwf TEMPVAL
F1_000163 equ $ ; in [SI570+TEST.BAS] Return
	Return
F1_EOF equ $ ; SI570+TEST.BAS
 LIST
;---------------------------------------------
; Null Terminated Strings

; String Time: 
str@lb1
	DE 84,105,109,101,58,32,0
;---------------------------------------------
; String Date: 
str@lb2
	DE 68,97,116,101,58,32,0
;---------------------------------------------
	END

