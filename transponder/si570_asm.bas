Device = 16F876A
XTAL = 20
ALL_DIGITAL = True

Symbol SCL = PORTC.3
Symbol SDA = PORTC.4

Dim mData As Byte
Dim Sayac As Byte

main:

    GoSub Freeze
    mData = 12
    GoSub I2C_Tx
    GoSub Unfreeze
    GoSub Newf
    DelayMS 500
    GoTo main


    

  
    
I2C_Start:
  High SCL
  DelayMS 1
  TRISC = %00010000
  DelayMS 1
  TRISC = %00000000
  DelayMS 1
  Low SCL
  DelayMS 1
  Return
  
  
I2C_Stop:
  High SCL
  DelayMS 1
  TRISC = %00010000
  DelayMS 1
  Return
  
  
I2C_Tx:
  Sayac = 0
Tx_Repeat:
  If mData.0 = 0 Then 
      Low SDA
  Else
      TRISC = %00010000
      DelayMS 1
      High SCL
      DelayMS 1
      Low SCL
      DelayMS 1
  EndIf
  Sayac = Sayac + 1
  mData = mData >> 1
  If Sayac > 7 Then GoTo  Tx_Repeat

  TRISC = %00010000
  DelayMS 1
  High SCL
  DelayMS 1

  Low SCL
  TRISC = %00000000
  DelayMS 1

  Return
  
  
Newf:
  GoSub I2C_Start
  mData = $AA
  GoSub  I2C_Tx
  mData = 135
  GoSub  I2C_Tx
  mData = %01000000
  GoSub  I2C_Tx
  GoSub I2C_Stop
  Return
  

Freeze:
  GoSub I2C_Start
  mData =  $AA
  GoSub  I2C_Tx
  mData = 137
  GoSub  I2C_Tx
  mData = %00010000
  GoSub  I2C_Tx
  GoSub I2C_Stop
  Return
  

Unfreeze:
  GoSub I2C_Start
  mData = $AA
  GoSub  I2C_Tx
  mData = 137
  GoSub  I2C_Tx
  mData = %00000000
  GoSub  I2C_Tx
  GoSub  I2C_Stop
  Return








