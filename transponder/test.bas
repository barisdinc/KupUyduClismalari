Device = 18F2550
XTAL 20


Declare sda_port PORTC.7
Declare scl_port PORTC.6

TRISC      = %00000000

Dim b21 As Byte
Dim b22 As Byte
Dim b23 As Byte
Dim b24 As Byte
Dim b25 As Byte
Dim b26 As Byte

Dim a As Byte

ALL_DIGITAL = TRUE

main: 
DelayMS 500                             'time for initialising'set the register values to be sent to the DCO:

b21 = $E1                               'reg 7
b22 = $C2
b23 = $B5
b24 = $DD
b25 = $40
b26 = $F8                               'reg 12      

Low PORTC
High PORTB
DelayMS 500
Low PORTB
High PORTC
GoTo main


Symbol sda = PORTC.7
Symbol scl = PORTC.6


st570:                                      'set SI570  frequency  



'i2cslave 85,i2cfast,i2cbyte        'initialize I2C for SI570 I2C                                           
                                          'address 85 decimal = 1010101 bin  
'pause 10       
                                          '-> slave address 10101010 (bit 0    
                                          'set to 0 as "don't care"-bit)  

I2COUT sda, scl, 85 , 137,[16]
DelayMS 10                                  'wait for write  
I2COUT sda, scl, 85 , 7,[b21, b22, b23, b24, b25, b26] 'write SI570 registers 7-12  
DelayMS 10                                  'wait for write  
I2COUT sda, scl, 85 , 137,[0]                        'unfreeze DCO  
DelayMS 10  
I2COUT sda, scl, 85 , 135,[64]                        'newfreq
DelayMS 100
'High PORTC.4
'High PORTC.5


a = 0

yaksondur:
    a= a + 1
    High PORTA.3
    DelayMS 500
    Low PORTA.3
    DelayMS 500
    'If a = 10 Then 
    GoTo st570
    GoTo yaksondur
    
    
    
    
    
    
    
    
    
    
    
    
