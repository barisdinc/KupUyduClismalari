'program src11_set_reg.bas
'Thomas MARTIN, DF7TV
'date 080405
'main hardware used:
'uP: Picaxe 28X1
'DCO: SI570 chip 570CAC000141DG (CMOS)
'Si570 board by WB6DHW 
'
'Values for Registers 7 to 12 of the SI570 are entered
'directly in this program code at the lines
'"let b21 = ..." (= register 7) to "let b26 = ..." (= register 12).
'
'This program is used here to find out the appropriate "fxtal" setting
'in the "Si57xProgrammer" (Silicon Laboratories) software which leads
'to the correct calculation of register values 7 to 12 
'for new frequencies.
'It may also be used to set the registers 7 to 12 for
'other purposes.
' 
main: pause 500                             'time for initialising

'set the register values to be sent to the DCO:

Let b21 = $E1                               'reg 7
Let b22 = $C2
Let b23 = $B5
Let b24 = $DD
Let b25 = $40
Let b26 = $F8                               'reg 12

      
st570:                                      'set SI570  frequency
  i2cslave %10101010,i2cslow,i2cbyte        'initialize I2C for SI570 I2C
                                            'address 85 decimal = 1010101 bin
  pause 10                                  '-> slave address 10101010 (bit 0
                                            'set to 0 as "don't care"-bit)
  writei2c 137,($10)                        'freeze DCO so freq can be modified
  pause 10                                  'wait for write
  writei2c 7,(b21, b22, b23, b24, b25, b26) 'write SI570 registers 7-12
  pause 10                                  'wait for write
  writei2c 137,($00)                        'unfreeze DCO
  pause 10
  writei2c 135,($40)                        'newfreq
  pause 1000
  GoTo st570
End

