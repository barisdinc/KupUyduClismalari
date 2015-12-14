Device = 16F876A
XTAL = 20
ALL_DIGITAL = True
PORTB_PULLUPS = True
 
' Setup the LCD
 LCD_DTPIN = PORTB.4
LCD_RSPIN = PORTB.2
LCD_ENPIN = PORTB.3
LCD_INTERFACE = 4
LCD_LINES = 2
LCD_TYPE = 0
 
' Define I2C bus ports
 SDA_PIN = PORTA.0 'DS1307 SDA pin
 SCL_PIN =PORTA.1 'DS1307 SCL pin
 
Dim Temp1 As Byte
Dim Temp2 As Byte
Dim TempVal As Byte
 
Dim Secs As Byte
Dim Mins As Byte
Dim Hrs As Byte
Dim day As Byte
Dim Date As Byte
Dim Month As Byte
Dim Year As Byte
Dim Ctrl As Byte
 
Dim Secs_last As Byte
 
'Initialize LCD
 
DelayMS 100
Cls
 
' Set initial DS1307 time / Date
 
Secs = 0 ' Set seconds
 Mins = 30 ' Set minutes
Hrs = 12 ' Set hours

day = 1 ' Set day of week value

Date = 30 ' Day of month value
Month = 11 ' Month value
Year = 6 ' Year value

Ctrl = 0 ' Set the control byte (leave as 0 in this example)

 
' The DS1307 works with data in BCD format, so convert BIN to BCD

TempVal=Secs
GoSub BIN_TO_BCD
Secs=TempVal
 
TempVal=Mins
GoSub BIN_TO_BCD
Mins=TempVal
 
TempVal=Hrs
GoSub BIN_TO_BCD
Hrs=TempVal
 
TempVal=day
GoSub BIN_TO_BCD
day=TempVal
 
TempVal=Date
GoSub BIN_TO_BCD
Date=TempVal
 
TempVal=Month
GoSub BIN_TO_BCD
Month=TempVal
 
TempVal=Year
GoSub BIN_TO_BCD
Year=TempVal
 
BStart
 
' The datasheet specifies the first byte is 1101000x where x is read(1) or write(0).
' The second byte tells the DS 1307 where to start reading, 0 is at the start.
' The Ctrl byte contains advanced features, read the datasheet for more info
BusOut 11010000, 0, [Secs, Mins, Hrs, day, Date, Month, Year, Ctrl]
'Write initial values for time / Date

BStop
 
DelayMS 20
 
Main:
 
BStart
' The datasheet specifies the first byte is 1101000x where x is read(1) or write(0).
' The second byte tells the DS 1307 where to start reading, 0 is at the start.
BusIn 11010001, 0, [Secs, Mins, Hrs, day, Date, Month, Year, Ctrl]
 
BStop
 
' The DS1307 sends it data in BCD, therefore it must be changed to
' BIN so that it can be easily used (eg, print onto an LCD)

TempVal=Secs
GoSub BCD_TO_BIN
Secs=TempVal
 
TempVal=Mins
GoSub BCD_TO_BIN
Mins=TempVal
 
TempVal=Hrs
GoSub BCD_TO_BIN
Hrs=TempVal
 
TempVal=Date
GoSub BCD_TO_BIN
Date=TempVal
 
TempVal=Month
GoSub BCD_TO_BIN
Month=TempVal
 
TempVal=Year
GoSub BCD_TO_BIN
Year=TempVal
 
 
 
'If there is update in Secs, display time and Date
If Secs - Secs_last = 0 Then GoTo Main
 
' The Dec2 modifier makes sure that each value will have 2 characters, eg 1 becomes 01
Print At 1,1,"Time: ",DEC2 Hrs, ":", DEC2 Mins,":", DEC2 Secs
Print At 2,1,"Date: ", DEC2 Date, "-", DEC2 Month, "-", DEC2 Year
 
Secs_last = Secs
 
GoTo Main
 
BCD_TO_BIN: ' Convert the BCD values into BIN

Temp1 = $0F & TempVal ' Clear off the top four bits
Temp1 = Dig Temp1, 0
Temp2 = TempVal >> 4 ' Shift down four to read 2 BCD value
Temp2 = Dig Temp2, 0
TempVal = Temp2 * 10 + Temp1
 
Return
 
BIN_TO_BCD:
 
Temp1 = Dig TempVal, 0 ' GET THE DEC DIGIT FOR THE FIRST NIBBLE
Temp2 = Dig TempVal, 1 ' GET THE DEC DIGIT FOR THE FIRST NIBBLE
Temp2 = Temp2 << 4 ' MOVE NUMBER OVER TO 2ND NIBBLE

' XOR THEM TOGTHER TO MAKE THE WHOLE BCD NUMBER
TempVal = Temp1 ^ Temp2 
 
Return
