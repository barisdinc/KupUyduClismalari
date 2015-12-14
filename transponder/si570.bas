Device = 16F876A
XTAL = 20
ALL_DIGITAL = True
PORTB_PULLUPS = True
 
 
SDA_PIN = PORTC.3 'DS1307 SDA pin
SCL_PIN = PORTC.4 'DS1307 SCL pin
 
Symbol SDA = PORTC.3
Symbol SCL = PORTC.4

 
TRISB = 0 
'TRISC = %00010000
PORTB = 0


Dim b21 As Byte
Dim b22 As Byte
Dim b23 As Byte
Dim b24 As Byte
Dim b25 As Byte
Dim b26 As Byte

b21 = $E1                               'reg 7
b22 = $C2
b23 = $B5
b24 = $DD
b25 = $40
b26 = $F8                               'reg 12


      
st570:

    BStart
    BusOut $AA
    BusOut 137
    BusOut $10
    BStop
    DelayMS 10

'    hbstart
'    hbusout $AA
'    hbusout 7
'    HBusOut b21
'    HBusOut b22
'    HBusOut b23
'    HBusOut b24
'    HBusOut b25
'    HBusOut b26
'    hbstop
'    delayms 10
    BStart
    BusOut $AA, 7, [b21, b22, b23, b24, b25, b26]
    BStop
    DelayMS 10
        
    BStart
    BusOut $AA
    BusOut 137
    BusOut 0
    BStop
    DelayMS 10

    BStart
    BusOut $AA
    BusOut 135
    BusOut $40
    BStop
    DelayMS 10
    
    DelayMS 1000
    Toggle PORTB.7
  GoTo st570
  
  
  
 
 
I2C_START: 
    High SDA
    High SCL
    Low SDA
    Low SCL
    Return
 
I2C_STOP:  
    Low SDA
    High SCL
    High SDA
    PAUSE 1
    Return
 
'I2C_RX:                           'I2C receive -> receive data from slave
'    SHIFTIN SDA,SCL,0,[i2c_in[0]] 'Shift in first byte MSBpre
'    SHIFTOUT SDA,SCL,1,[%0\1]     'Send acknowledge (ACK) = 0
'    SHIFTIN SDA,SCL,0,[i2c_in[1]] 'Shift in second byte MSBpre
'    SHIFTOUT SDA,SCL,1,[%1\1]     'Send not acknowledge (NACK) = 1
'    RETURN
 
I2C_TX:                           'I2C transmit -> send data to the slave
    SHIFTOUT SDA,SCL,1,[i2c_out]  'Shift out “i2c_out” MSBfirst
    SHIFTIN SDA,SCL,0,[i2c_ack\1] 'Receive ACK bit          
    Return
  
  
End












 
