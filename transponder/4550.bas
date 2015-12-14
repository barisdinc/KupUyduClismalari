Device 16F88
Xtal = 8

CMCON = 7
ADCON1 = 0 ' Disable A/D converter
ADCON0 = 0
ANSEL = 0 ' all analog pins to digital

TRISB.1 = 1
TRISB.4 = 1


Symbol SDADIR = TRISB.1
Symbol SCLDIR = TRISB.4


Symbol LEDT = PORTA.2
Symbol LEDL = PORTB.7
Symbol LEDM = PORTB.6
Symbol LEDR = PORTB.5
Dim readcnt As Byte
Dim datain  As Byte
Dim WrData  As Byte


Symbol SSPIF               = PIR1.3    ' SSP (I2C) interrupt flag
Symbol SSPIE               = PIE1.3 
Symbol BF                  = SSPSTAT.0 ' SSP (I2C) Buffer Full
Symbol R_W                 = SSPSTAT.2 ' SSP (I2C) Read/Write
Symbol D_A                 = SSPSTAT.5 ' SSP (I2C) Data/Address
Symbol CKP                 = SSPCON.4  ' SSP (I2C) SCK Release Control
Symbol SSPEN               = SSPCON.5  ' SSP (I2C) Enable
Symbol SSPOV               = SSPCON.6  ' SSP (I2C) Receive Overflow Indicator
Symbol WCOL                = SSPCON.7  ' SSP (I2C) Write Collision Detect
Symbol STAT_BF             = SSPSTAT.0 ' SSP (I2C) Buffer Full
Symbol STAT_RW             = SSPSTAT.2 ' SSP (I2C) Read/Write
Symbol STAT_DA             = SSPSTAT.5 ' SSP (I2C) Data/Address
Symbol CKE                 = SSPSTAT.6 ' SSP (I2C) Data/Address

'--- Rx Buffer defintion  ------------------------------------------------------

Dim RxBufferLEN  As Byte
    RxBufferLEN = 1       
Dim RxBuffer     As Byte[RxBufferLEN]
Dim RxBufferIndex  As Byte

'--- Tx Buffer defintion  ------------------------------------------------------

Dim TxBufferLEN  As Byte
    TxBufferLEN = 1       
Dim TxBuffer     As Byte[TxBufferLEN]
Dim TxBufferIndex  As Byte

'--- Define constants  ---------------------------------------------------------

Dim I2Caddress   As Byte
    I2Caddress   = $3 ' Make address = 3

'--- Initialize I2C slave mode  ------------------------------------------------

SCLDIR = 1          ' SCL must be an input before enabling interrupts
SDADIR = 1   
SSPADD = I2Caddress ' Set our address
SSPCON = $36        ' Set to I2C slave with 7-bit address
SSPSTAT = 0
SSPIE = 1 
SSPIF = 0 
RxBufferIndex = 0
TxBufferIndex = 0

'--- Initialization Done!  -----------------------------------------------------

GoTo Main

'--- I2C subroutine   ----------------------------------------------------------

i2cslave:                                      ' I2C slave subroutine
          SSPIF = 0                            ' Clear interrupt flag
          If R_W = 1 Then i2crd                ' Read data from us
          If BF = 0 Then i2cexit               ' Nothing in buffer so  exit
          If D_A = 1 Then i2cwr                ' Data for us (not  address)
          If SSPBUF != I2Caddress Then i2cexit ' Clear the address from  the buffer
          readcnt = 0                          ' Mark as first read
          GoTo i2cexit

i2cwr:                                ' I2C write data to us
       datain = SSPBUF                ' Put buffer data into array
       RxBuffer[RxBufferIndex]=datain
       RxBufferIndex=rxbufferindex+1

       If RxBufferIndex=RxBufferLEN Then           ' end of buffer  transfer 
          WrData=1
          RxBufferIndex=0
       EndIf

       GoTo i2cexit

i2crd:                                      ' I2C read data from us
       If D_A = 0 Then
          TxBufferIndex = 0
       EndIf

       While STAT_BF : Wend                        ' loop while buffer  is full

       WCOL = 0                                    ' clear collision  flag
       SSPBUF = TxBuffer[TxBufferIndex]

       While WCOL 
             WCOL = 0
             SSPBUF = TxBuffer[TxBufferIndex]
       Wend

       CKP = 1                                     ' release clock,  allowing read by master
       TxBufferIndex = TxBufferIndex + 1           ' increment index
       If TxBufferIndex = TxBufferLEN Then         ' all bytes have been  tx
          TxBufferIndex = 0                           ' reset index             
       EndIf
             
i2cexit:
         Return

'--- End I2C subroutine   ------------------------------------------------------

Main:
      TxBuffer = 12

      If SSPIF = 1 Then
         GoSub i2cslave
      EndIf

      SSPOV = 0
      WCOL = 0

      Select Case RxBuffer[0]
             Case 6
                     High LEDT
             Case 8
                     Low LEDT
      End Select

      WrData=0  
      GoTo Main


'------------------------------------------------------------------------------

End

'------------------------------------------------------------------------------
'------------------------------------------------------------------------------
