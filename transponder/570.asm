;______________________________________________________________________________
;
; PROGRAM     : Si570.asm
;
; DATE        : 14/08/08
; LAST UPDATE : 14/08/08
;
; HARDWARE    : 12F509 @ 4 MHz
; ASSEMBLER   : MPASM v5.01  / case sensitive
;
; NEEDS       : P12F509.INC
;
; AUTHOR      : Cesco HB9TLK
;             : Francis F6HSI (tnx for the hints)
;______________________________________________________________________________
;
;                                 DIRECTIVES
;______________________________________________________________________________

  list       p = 16F876A, n = 0 , r = dec , x = OFF, st = ON

  include    P16F876A.INC

  __CONFIG  _MCLRE_OFF & _CP_OFF & _WDT_OFF & _IntRC_OSC
;______________________________________________________________________________
;
;                                 CONSTANTS
;______________________________________________________________________________

START_OF_RAM = 0x10
;______________________________________________________________________________
;
;                                 VARIABLES
;______________________________________________________________________________

  cblock START_OF_RAM

I2C_Buffer
I2C_Bit_Count
Switch_BackUp
Qrg_Pointer

  endc
;______________________________________________________________________________
;
;                                   PORTS
;______________________________________________________________________________

#define SCL GPIO,5 ; IIC Clock (pin 2)
#define SDA GPIO,4 ; IIC Data  (pin 3)
;______________________________________________________________________________
;
;                                 INIT RESET
;______________________________________________________________________________

  ORG  0
  movwf	OSCCAL 
  goto Main
;______________________________________________________________________________
;
;                                   TABLES
;______________________________________________________________________________

GetFreq

  movfw Qrg_Pointer
  incf  Qrg_Pointer,f   ; Update pointer for next time
  addwf PCL,F           ; Jump in the table

Freq1 dt 0xa8,0x42,0xaa,0xdf,0xb5,0xd0

Freq2 dt 0xe6,0xc2,0xaa,0x29,0xa4,0x51

Freq3 dt 0x29,0xc2,0xa9,0x86,0x35,0xdf

Freq4 dt 0x29,0xc2,0xa8,0x67,0x7d,0x18

Freq5 dt 0x29,0xc2,0xad,0x71,0xbc,0x99

Freq6 dt 0xf1,0xc2,0xad,0xcc,0x0d,0xd8

Freq7 dt 0x7b,0xc2,0xaf,0x1a,0x15,0xc0

Freq8 dt 0x5f,0xc2,0xb0,0x8f,0xf8,0x5e

;______________________________________________________________________________
;
;                                   MACROS
;______________________________________________________________________________

;------------------------------------------------------------------------------
Init macro
;------------------------------------------------------------------------------
;         76543210
  movlw B'11000000'
;         |||||^^^----- Prescaler Rate = 1/2
;         ||||^-------- Prescaler assigned to Timer0
;         |||^--------- Increment on low-to-high transition on the T0CKI pin
;         ||^---------- Transition on internal instruction cycle clock, FOSC/4
;         |^----------- Disable Weak Pull-ups on GP0, GP1 and GP3
;         ^------------ DisEnable Wake-up on Pin Change on GP0, GP1 and GP3
  option

;         76543210
  movlw B'00010000'
;           |^--------- SDA line as input
;           ^---------- SCL line as output
  TRIS  GPIO            ; Set SDA as input, confirm SCL as output

;         76543210
  movlw B'00110000'
  movwf GPIO

  movlw 0xff
  movwf Switch_BackUp  ;inital value to provoke default run

  endm
;------------------------------------------------------------------------------
#define SCL_High bsf SCL
#define SCL_Low  bcf SCL
;------------------------------------------------------------------------------
SDA_High_Z  macro
;------------------------------------------------------------------------------
;           543210
;           ||
  movlw B'00011111'
  TRIS  GPIO            ; Set SDA as input, confirm SCL as output

  endm
;------------------------------------------------------------------------------
SDA_Low  macro
;------------------------------------------------------------------------------
  bcf   SDA             ; Clear latch
;           543210
;           ||
  movlw B'00001111'
  TRIS  GPIO            ; Set SDA as output, confirm SCL as output

  endm
;______________________________________________________________________________
;
;                                SUBROUTINES
;______________________________________________________________________________

;------------------------------------------------------------------------------
Freeze             ; Freeze the DCO (bit 4 of Register 137)
;------------------------------------------------------------------------------
  call I2C_Start

  ; Send slave address + write bit
  ;-------------------------------
  movlw 0xAA
  call  I2C_Tx

  ; Send register address
  ;----------------------
  movlw 137
  call  I2C_Tx

  ; Set bit 4
  ;----------
  ;       76543210
  movlw b'00010000'
  call  I2C_Tx

  call  I2C_Stop

  retlw 0
;------------------------------------------------------------------------------
I2C_Start          ; Wenn SDA und SCL beide High, dann SDA auf Low ziehen
;------------------------------------------------------------------------------
  SCL_High
  SDA_High_Z
  nop
  nop
  SDA_Low
  nop
  SCL_Low

  retlw 0
;------------------------------------------------------------------------------
I2C_Stop           ; SCL ist Low und SDA ist Low
;------------------------------------------------------------------------------
  nop
  nop
  SCL_High
  nop
  SDA_High_Z

  retlw 0
;------------------------------------------------------------------------------
I2C_Tx             ; Send a byte (in w) to the slave
;------------------------------------------------------------------------------
  ; Save data to send
  ;------------------
  movwf I2C_Buffer

  ; I2C_Bit_Count = 8
  ;------------------
  movlw 8
  movwf I2C_Bit_Count

Tx_Repeat

  ; SDA line = bit to send
  ;-----------------------
  SDA_Low               ; Assume 0
  rlf   I2C_Buffer,f
  btfsc STATUS,C
  SDA_High_Z            ; Sorry it was 1

  ; SCL pulse
  ;----------
  nop
  SCL_High
  nop
  nop
  nop
  SCL_Low

Tx_Until ; All bits have been processed

  decfsz I2C_Bit_Count,f
  goto   Tx_Repeat

  ; Get ACK from slave   <- to be done!
  ;-------------------
  SDA_High_Z
  SCL_High

  nop                   ; Replace by a Read_Bit
  nop
  nop

  SCL_Low
  SDA_Low

  retlw 0
;------------------------------------------------------------------------------
Newf               ; Assert the NewFreq bit (bit 6 of Register 135)
;------------------------------------------------------------------------------
  call I2C_Start

  ; Send slave address + write bit
  ;-------------------------------
  movlw 0xAA
  call  I2C_Tx

  ; Send register address
  ;----------------------
  movlw 135
  call  I2C_Tx

  ; Set bit 6
  ;----------
  ;       76543210
  movlw b'01000000'
  call  I2C_Tx

  call  I2C_Stop

  retlw 0
;------------------------------------------------------------------------------
Unfreeze           ; Freeze the DCO (bit 4 of Register 137)
;------------------------------------------------------------------------------
  call I2C_Start

  ; Send slave address + write bit
  ;-------------------------------
  movlw 0xAA
  call  I2C_Tx

  ; Send register address
  ;----------------------
  movlw 137
  call  I2C_Tx

  ; Clear bit 4
  ;------------
  ;       76543210
  movlw b'00000000'
  call  I2C_Tx

  call  I2C_Stop

  retlw 0
;______________________________________________________________________________
;______________________________________________________________________________
;
;                                MAIN PROGRAM
;______________________________________________________________________________
;______________________________________________________________________________

Main

  Init

Loop

  ; Look for any change
  ;--------------------
  movfw GPIO            ; Read switches
  andlw B'00000111'     ; mask 3 bits
  xorlw B'00000111'     ; Negate the stuff
  subwf Switch_BackUp,w ; Compare to old value

  ; If we need a new frequency
  ;---------------------------
  btfsc STATUS,Z
  goto  End_If

  ; Then

  ; Save switches state for next time
  ;----------------------------------
  movfw GPIO
  andlw B'00000111'
  xorlw B'00000111'
  movwf Switch_BackUp

  ; Qrg_Pointer = Switch_BackUp x 6
  ;----------------
  addwf Switch_BackUp,w
  addwf Switch_BackUp,w
  addwf Switch_BackUp,w
  addwf Switch_BackUp,w
  addwf Switch_BackUp,w
  movwf Qrg_Pointer

  ; Download values to the Si570
  ;-----------------------------
  call  Freeze

  call  I2C_Start

  ; Send slave address + write bit
  ;-------------------------------
  movlw 0xAA
  call  I2C_Tx

  ; Send register address
  ;----------------------
  movlw 7
  call  I2C_Tx

  ; Send register values
  ;---------------------
  call  GetFreq
  call  I2C_Tx          ; -> reg 7

  call  GetFreq
  call  I2C_Tx          ; -> reg 8

  call  GetFreq
  call  I2C_Tx          ; -> reg 9

  call  GetFreq
  call  I2C_Tx          ; -> reg 10

  call  GetFreq
  call  I2C_Tx          ; -> reg 11

  call  GetFreq
  call  I2C_Tx          ; -> reg 12

  call  I2C_Stop

  ; Unfreeze the DCO and assert the NewFreq bit
  ;--------------------------------------------
  call  Unfreeze
  call  Newf

End_If

  ; Loop forever
  ;-------------
  goto  Loop
;______________________________________________________________________________
  end


