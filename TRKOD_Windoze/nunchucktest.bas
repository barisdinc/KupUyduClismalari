'****************************************************************
'*  Name    : Nunchucktest.BAS                                  *
'*  Author  : Lucas Volwater                                    *
'*  Notice  : Copyright (c) 2010 Lucas Volwater                 *
'*          : All Rights Reserved                               *
'*  Date    : 15-8-2010                                         *
'*  Version : 1.0                                               *
'*  Notes   : wii nunchuck test on DB-001, LCD at BUSB          *
'*          : I2C at BUSC (PORTC.3=scl, portc.4=sda)            *
'****************************************************************

DEVICE 16F887
CONFIG1 debug_off, lvp_off, fcmen_on, ieso_on, bor_on, cp_off, cpd_off, MCLRE_on, pwrte_on, wdt_off, HS_osc   
CONFIG2 WRT_off, BOR40V
ALL_DIGITAL = true
XTAL = 10

DIM i AS BYTE
DIM NunchuckData[6] AS BYTE

LCD_INTERFACE = 4 '4 bits
LCD_DTPIN = PORTB.0 'rb0-rb3
LCD_ENPIN = PORTB.4
DECLARE LCD_RSPIN = PORTB.5
DECLARE LCD_LINES = 4

DECLARE HBUS_BITRATE 100 ; 100Khz I2C

TRISC = 255; all pins portC input (SCL/SDA are located here, I don't want 5V on them)
; Nunchuck is 3,3V!

CLS
PRINT AT 1,1, "Wii Nunchuk test"
PRINT AT 2,1, "(c)L.J.P. Volwater"
DELAYMS 1000
PRINT AT 2,16, "   " ; clear last characters, "ter", as they are not overwritten
; Hbusout 0xA4h, [0x40h, 0x00h]; Initialize nunchuck.  

HBUSOUT 0xA4h, [0xf0h, 0x55h] ; initialize Dealextreme Nunchuck

  WHILE 1=1
  HBUSOUT 0xA5h, [0x00h] ; request data  
    FOR i = 0 TO 5
    HBUSIN 0xA5h, [NunchuckData[i]]
    NEXT 
  PRINT AT 2,1, "XA: ", DEC3 NunchuckData[0], " YA: ", DEC3 NunchuckData[1]
  PRINT AT 3,1, "Ax: ", DEC3 NunchuckData[2], " Ay: ", DEC3 NunchuckData[3]
  PRINT AT 4,1, "Az: ", DEC3 NunchuckData[4], " B: ", BIN8 NunchuckData[5]
  DELAYMS 10
  WEND

; Xa = X analog joystick, Ya = Y analog joystick, Ax,y,z = Acelerometer X, Y, Z (only most significant 8 bits)
; B = Least significant bits accelerometer / buttons.

' NunchuckData[]
'Byte  Description
' 0 	 Analog stick x-axis value
' 1 	 Analog stick y-axis value
' 2 	 X-axis acceleration bits 9:2
' 3 	 Y-axis acceleration bits 9:2
' 4 	 Z-axis acceleration bits 9:2
' 5 	 Bit 0 	Z button (0=pressed)
'      Bit 1 	C button (0=pressed)
'      Bits 3:2 	X-axis acceleration bits 1:0
'      Bits 5:4 	Y-axis acceleration bits 1:0
'      Bits 7:6 	Z-axis acceleration bits 1:0  

