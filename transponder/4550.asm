;----------------------------------------------------------
; Code Produced by the Proton Compiler. Ver 3.5.4.5
; Copyright Rosetta Technologies/Crownhill Associates Ltd
; Written by Les Johnson. May 2012
;----------------------------------------------------------
;
 LIST  P = 18F4550, F = INHX32, W = 2, X = ON, R = DEC, MM = ON, N = 0, C = 255, T=ON
SPPDATA equ 0X0F62
SPPCFG equ 0X0F63
SPPEPS equ 0X0F64
SPPCON equ 0X0F65
UFRM equ 0X0F66
UFRML equ 0X0F66
UFRMLH equ 0X0F67
UFRMH equ 0X0F67
UIR equ 0X0F68
UIE equ 0X0F69
UEIR equ 0X0F6A
UEIE equ 0X0F6B
USTAT equ 0X0F6C
UCON equ 0X0F6D
UADDR equ 0X0F6E
UCFG equ 0X0F6F
UEP0 equ 0X0F70
UEP1 equ 0X0F71
UEP2 equ 0X0F72
UEP3 equ 0X0F73
UEP4 equ 0X0F74
UEP5 equ 0X0F75
UEP6 equ 0X0F76
UEP7 equ 0X0F77
UEP8 equ 0X0F78
UEP9 equ 0X0F79
UEP10 equ 0X0F7A
UEP11 equ 0X0F7B
UEP12 equ 0X0F7C
UEP13 equ 0X0F7D
UEP14 equ 0X0F7E
UEP15 equ 0X0F7F
PORTA equ 0X0F80
PORTB equ 0X0F81
PORTC equ 0X0F82
PORTD equ 0X0F83
PORTE equ 0X0F84
LATA equ 0X0F89
LATB equ 0X0F8A
LATC equ 0X0F8B
LATD equ 0X0F8C
LATE equ 0X0F8D
DDRA equ 0X0F92
TRISA equ 0X0F92
DDRB equ 0X0F93
TRISB equ 0X0F93
DDRC equ 0X0F94
TRISC equ 0X0F94
DDRD equ 0X0F95
TRISD equ 0X0F95
DDRE equ 0X0F96
TRISE equ 0X0F96
OSCTUNE equ 0X0F9B
PIE1 equ 0X0F9D
PIR1 equ 0X0F9E
IPR1 equ 0X0F9F
PIE2 equ 0X0FA0
PIR2 equ 0X0FA1
IPR2 equ 0X0FA2
EECON1 equ 0X0FA6
EECON2 equ 0X0FA7
EEDATL equ 0X0FA8
EEDATA equ 0X0FA8
EEADR equ 0X0FA9
RCSTA equ 0X0FAB
TXSTA equ 0X0FAC
TXREG equ 0X0FAD
RCREG equ 0X0FAE
SPBRG equ 0X0FAF
SPBRGH equ 0X0FB0
T3CON equ 0X0FB1
TMR3L equ 0X0FB2
TMR3LH equ 0X0FB3
TMR3H equ 0X0FB3
CMCON equ 0X0FB4
CVRCON equ 0X0FB5
CCP1AS equ 0X0FB6
ECCP1AS equ 0X0FB6
CCP1DEL equ 0X0FB7
ECCP1DEL equ 0X0FB7
BAUDCON equ 0X0FB8
CCP2CON equ 0X0FBA
CCPR2 equ 0X0FBB
CCPR2L equ 0X0FBB
CCPR2LH equ 0X0FBC
CCPR2H equ 0X0FBC
CCP1CON equ 0X0FBD
ECCP1CON equ 0X0FBD
CCPR1 equ 0X0FBE
CCPR1L equ 0X0FBE
CCPR1LH equ 0X0FBF
CCPR1H equ 0X0FBF
ADCON2 equ 0X0FC0
ADCON1 equ 0X0FC1
ADCON0 equ 0X0FC2
ADRES equ 0X0FC3
ADRESL equ 0X0FC3
ADRESLH equ 0X0FC4
ADRESH equ 0X0FC4
SSPCON2 equ 0X0FC5
SSPCON1 equ 0X0FC6
SSPSTAT equ 0X0FC7
SSPADD equ 0X0FC8
SSPBUF equ 0X0FC9
T2CON equ 0X0FCA
PR2 equ 0X0FCB
TMR2 equ 0X0FCC
T1CON equ 0X0FCD
TMR1L equ 0X0FCE
TMR1LH equ 0X0FCF
TMR1H equ 0X0FCF
RCON equ 0X0FD0
WDTCON equ 0X0FD1
HLVDCON equ 0X0FD2
LVDCON equ 0X0FD2
OSCCON equ 0X0FD3
T0CON equ 0X0FD5
TMR0L equ 0X0FD6
TMR0LH equ 0X0FD7
TMR0H equ 0X0FD7
STATUS equ 0X0FD8
FSR2L equ 0X0FD9
FSR2LH equ 0X0FDA
FSR2H equ 0X0FDA
PLUSW2 equ 0X0FDB
PREINC2 equ 0X0FDC
POSTDEC2 equ 0X0FDD
POSTINC2 equ 0X0FDE
INDF2 equ 0X0FDF
BSR equ 0X0FE0
FSR1L equ 0X0FE1
FSR1LH equ 0X0FE2
FSR1H equ 0X0FE2
PLUSW1 equ 0X0FE3
PREINC1 equ 0X0FE4
POSTDEC1 equ 0X0FE5
POSTINC1 equ 0X0FE6
INDF1 equ 0X0FE7
WREG equ 0X0FE8
FSR0L equ 0X0FE9
FSR0LH equ 0X0FEA
FSR0H equ 0X0FEA
PLUSW0 equ 0X0FEB
PREINC0 equ 0X0FEC
POSTDEC0 equ 0X0FED
POSTINC0 equ 0X0FEE
INDF0 equ 0X0FEF
INTCON3 equ 0X0FF0
INTCON2 equ 0X0FF1
INTCON equ 0X0FF2
PRODL equ 0X0FF3
PRODLH equ 0X0FF4
PRODH equ 0X0FF4
TABLAT equ 0X0FF5
TBLPTRL equ 0X0FF6
TBLPTRLH equ 0X0FF7
TBLPTRH equ 0X0FF7
TBLPTRU equ 0X0FF8
TBLPTRLHH equ 0X0FF8
PC equ 0X0FF9
PCL equ 0X0FF9
PCLATH equ 0X0FFA
PCLATU equ 0X0FFB
STKPTR equ 0X0FFC
TOS equ 0X0FFD
TOSL equ 0X0FFD
TOSLH equ 0X0FFE
TOSH equ 0X0FFE
TOSU equ 0X0FFF
_I2C_SCL_PORT=TRISB
_I2C_SCL_PIN=1
_I2C_SDA_PORT=TRISB
_I2C_SDA_PIN=0
WS0=0
WS1=1
WS2=2
WS3=3
CLK1EN=4
CSEN=5
CLKCFG0=6
CLKCFG1=7
ADDR0=0
ADDR1=1
ADDR2=2
ADDR3=3
SPPBUSY=4
WRSPP=6
PP_WRSPP=6
RDSPP=7
PP_RDSPP=7
SPPEN=0
SPPOWN=1
FRM0=0
FRM1=1
FRM2=2
FRM3=3
FRM4=4
FRM5=5
FRM6=6
FRM7=7
FRM8=0
FRM9=1
FRM10=2
URSTIF=0
PP_URSTIF=0
UERRIF=1
PP_UERRIF=1
ACTVIF=2
PP_ACTVIF=2
TRNIF=3
PP_TRNIF=3
IDLEIF=4
PP_IDLEIF=4
STALLIF=5
PP_STALLIF=5
SOFIF=6
PP_SOFIF=6
URSTIE=0
PP_URSTIE=0
UERRIE=1
PP_UERRIE=1
ACTVIE=2
PP_ACTVIE=2
TRNIE=3
PP_TRNIE=3
IDLEIE=4
PP_IDLEIE=4
STALLIE=5
PP_STALLIE=5
SOFIE=6
PP_SOFIE=6
PIDEF=0
CRC5EF=1
CRC16EF=2
DFN8EF=3
BTOEF=4
BTSEF=7
PIDEE=0
CRC5EE=1
CRC16EE=2
DFN8EE=3
BTOEE=4
BTSEE=7
PPBI=1
DIR=2
ENDP0=3
ENDP1=4
ENDP2=5
ENDP3=6
SUSPND=1
PP_SUSPND=1
RESUME=2
PP_RESUME=2
USBEN=3
PP_USBEN=3
PKTDIS=4
PP_PKTDIS=4
SE0=5
PP_SE0=5
PPBRST=6
ADDR0=0
ADDR1=1
ADDR2=2
ADDR3=3
ADDR4=4
ADDR5=5
ADDR6=6
PPB0=0
PPB1=1
FSEN=2
UTRDIS=3
UPUEN=4
UOEMON=6
UTEYE=7
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
EPSTALL=0
PP_EPSTALL=0
EPINEN=1
EPOUTEN=2
EPCONDIS=3
EPHSHK=4
RA0=0
RA1=1
RA2=2
RA3=3
RA4=4
RA5=5
RA6=6
AN0=0
AN1=1
AN2=2
AN3=3
T0CKI=4
AN4=5
OSC2=6
VREFM=2
VREFP=3
LVDIN=5
HLVDIN=5
RB0=0
RB1=1
RB2=2
RB3=3
RB4=4
RB5=5
RB6=6
RB7=7
INT0=0
INT1=1
INT2=2
PGM=5
PGC=6
PGD=7
RC0=0
RC1=1
RC2=2
RC4=4
RC5=5
RC6=6
RC7=7
T1OSO=0
T1OSI=1
CCP1=2
TX=6
RX=7
T13CKI=0
P1A=2
CK=6
RD0=0
PP_RD0=0
RD1=1
PP_RD1=1
RD2=2
PP_RD2=2
RD3=3
PP_RD3=3
RD4=4
PP_RD4=4
RD5=5
PP_RD5=5
RD6=6
PP_RD6=6
RD7=7
PP_RD7=7
SPP0=0
SPP1=1
SPP2=2
SPP3=3
SPP4=4
SPP5=5
SPP6=6
SPP7=7
RE0=0
RE1=1
RE2=2
RE3=3
RDPU=7
PP_RDPU=7
CK1SPP=0
CK2SPP=1
OESPP=2
LATA0=0
LATA1=1
LATA2=2
LATA3=3
LATA4=4
LATA5=5
LATA6=6
LATB0=0
LATB1=1
LATB2=2
LATB3=3
LATB4=4
LATB5=5
LATB6=6
LATB7=7
LATC0=0
LATC1=1
LATC2=2
LATC6=6
LATC7=7
LATD0=0
LATD1=1
LATD2=2
LATD3=3
LATD4=4
LATD5=5
LATD6=6
LATD7=7
LATE0=0
LATE1=1
LATE2=2
RA0=0
RA1=1
RA2=2
RA3=3
RA4=4
RA5=5
RA6=6
TRISA0=0
TRISA1=1
TRISA2=2
TRISA3=3
TRISA4=4
TRISA5=5
TRISA6=6
RB0=0
RB1=1
RB2=2
RB3=3
RB4=4
RB5=5
RB6=6
RB7=7
TRISB0=0
TRISB1=1
TRISB2=2
TRISB3=3
TRISB4=4
TRISB5=5
TRISB6=6
TRISB7=7
RC0=0
RC1=1
RC2=2
RC6=6
RC7=7
TRISC0=0
TRISC1=1
TRISC2=2
TRISC6=6
TRISC7=7
RD0=0
PP_RD0=0
RD1=1
PP_RD1=1
RD2=2
PP_RD2=2
RD3=3
PP_RD3=3
RD4=4
PP_RD4=4
RD5=5
PP_RD5=5
RD6=6
PP_RD6=6
RD7=7
PP_RD7=7
TRISD0=0
TRISD1=1
TRISD2=2
TRISD3=3
TRISD4=4
TRISD5=5
TRISD6=6
TRISD7=7
RE0=0
RE1=1
RE2=2
TRISE0=0
TRISE1=1
TRISE2=2
TUN0=0
TUN1=1
TUN2=2
TUN3=3
TUN4=4
INTSRC=7
TMR1IE=0
TMR2IE=1
CCP1IE=2
SSPIE=3
TXIE=4
RCIE=5
ADIE=6
SPPIE=7
TMR1IF=0
TMR2IF=1
CCP1IF=2
SSPIF=3
TXIF=4
PP_TXIF=4
RCIF=5
PP_RCIF=5
ADIF=6
SPPIF=7
TMR1IP=0
TMR2IP=1
CCP1IP=2
SSPIP=3
TXIP=4
RCIP=5
ADIP=6
SPPIP=7
CCP2IE=0
TMR3IE=1
LVDIE=2
BCLIE=3
EEIE=4
USBIE=5
CMIE=6
OSCFIE=7
HLVDIE=2
CCP2IF=0
TMR3IF=1
LVDIF=2
BCLIF=3
EEIF=4
USBIF=5
CMIF=6
OSCFIF=7
HLVDIF=2
CCP2IP=0
TMR3IP=1
LVDIP=2
BCLIP=3
EEIP=4
USBIP=5
CMIP=6
OSCFIP=7
HLVDIP=2
RD=0
PP_RD=0
WR=1
PP_WR=1
WREN=2
PP_WREN=2
WRERR=3
PP_WRERR=3
FREE=4
CFGS=6
EEPGD=7
PP_EEPGD=7
RX9D=0
OERR=1
PP_OERR=1
FERR=2
ADDEN=3
CREN=4
PP_CREN=4
SREN=5
RX9=6
SPEN=7
ADEN=3
TX9D=0
TRMT=1
BRGH=2
SENDB=3
PP_SENDB=3
SYNC=4
TXEN=5
TX9=6
CSRC=7
TMR3ON=0
TMR3CS=1
T3SYNC=2
T3CCP1=3
PP_T3CCP1=3
T3CKPS0=4
T3CKPS1=5
T3CCP2=6
PP_T3CCP2=6
RD16=7
PP_RD16=7
T3NSYNC=2
NOT_T3SYNC=2
CM0=0
CM1=1
CM2=2
CIS=3
C1INV=4
C2INV=5
C1OUT=6
C2OUT=7
CVR0=0
CVR1=1
CVR2=2
CVR3=3
CVREF=4
CVRR=5
CVROE=6
CVREN=7
CVRSS=4
PSSBD0=0
PSSBD1=1
PSSAC0=2
PSSAC1=3
ECCPAS0=4
ECCPAS1=5
ECCPAS2=6
ECCPASE=7
PSSBD0=0
PSSBD1=1
PSSAC0=2
PSSAC1=3
ECCPAS0=4
ECCPAS1=5
ECCPAS2=6
ECCPASE=7
PDC0=0
PDC1=1
PDC2=2
PDC3=3
PDC4=4
PDC5=5
PDC6=6
PRSEN=7
PDC0=0
PDC1=1
PDC2=2
PDC3=3
PDC4=4
PDC5=5
PDC6=6
PRSEN=7
ABDEN=0
WUE=1
BRG16=3
SCKP=4
RCIDL=6
ABDOVF=7
TXCKP=4
RXDTP=5
RCMT=6
CCP2M0=0
CCP2M1=1
CCP2M2=2
CCP2M3=3
DC2B0=4
DC2B1=5
CCP1M0=0
CCP1M1=1
CCP1M2=2
CCP1M3=3
DC1B0=4
DC1B1=5
P1M0=6
P1M1=7
CCP1M0=0
CCP1M1=1
CCP1M2=2
CCP1M3=3
DC1B0=4
DC1B1=5
P1M0=6
P1M1=7
ADCS0=0
ADCS1=1
ADCS2=2
ACQT0=3
ACQT1=4
ACQT2=5
ADFM=7
PCFG0=0
PCFG1=1
PCFG2=2
PCFG3=3
VCFG0=4
VCFG1=5
ADON=0
PP_ADON=0
GO_DONE=1
PP_GO_DONE=1
CHS0=2
CHS1=3
CHS2=4
CHS3=5
DONE=1
GO=1
NOT_DONE=1
SEN=0
PP_SEN=0
RSEN=1
PP_RSEN=1
PEN=2
PP_PEN=2
RCEN=3
PP_RCEN=3
ACKEN=4
PP_ACKEN=4
ACKDT=5
PP_ACKDT=5
ACKSTAT=6
GCEN=7
SSPM0=0
SSPM1=1
SSPM2=2
SSPM3=3
CKP=4
SSPEN=5
SSPOV=6
WCOL=7
BF=0
UA=1
R_W=2
PP_R_W=2
D_A=5
CKE=6
SMP=7
I2C_READ=2
I2C_START=3
I2C_STOP=4
I2C_DAT=5
NOT_W=2
NOT_A=5
NOT_WRITE=2
NOT_ADDRESS=5
READ_WRITE=2
DATA_ADDRESS=5
T2CKPS0=0
PP_T2CKPS0=0
T2CKPS1=1
PP_T2CKPS1=1
TMR2ON=2
PP_TMR2ON=2
T2OUTPS0=3
T2OUTPS1=4
T2OUTPS2=5
T2OUTPS3=6
TMR1ON=0
TMR1CS=1
T1SYNC=2
T1OSCEN=3
T1CKPS0=4
T1CKPS1=5
T1RUN=6
RD16=7
PP_RD16=7
NOT_T1SYNC=2
NOT_BOR=0
NOT_POR=1
NOT_PD=2
NOT_TO=3
NOT_RI=4
SBOREN=6
NOT_IPEN=7
BOR=0
POR=1
PD=2
TO=3
RI=4
IPEN=7
SWDTEN=0
SWDTE=0
LVDL0=0
LVDL1=1
LVDL2=2
LVDL3=3
LVDEN=4
IRVST=5
LVV0=0
LVV1=1
LVV2=2
LVV3=3
BGST=5
HLVDL0=0
HLVDL1=1
HLVDL2=2
HLVDL3=3
HLVDEN=4
VDIRMAG=7
IVRST=5
LVDL0=0
LVDL1=1
LVDL2=2
LVDL3=3
LVDEN=4
IRVST=5
LVV0=0
LVV1=1
LVV2=2
LVV3=3
BGST=5
HLVDL0=0
HLVDL1=1
HLVDL2=2
HLVDL3=3
HLVDEN=4
VDIRMAG=7
IVRST=5
SCS0=0
SCS1=1
IOFS=2
OSTS=3
IRCF0=4
IRCF1=5
IRCF2=6
IDLEN=7
FLTS=2
T0PS0=0
T0PS1=1
T0PS2=2
PSA=3
T0SE=4
T0CS=5
T08BIT=6
TMR0ON=7
C=0
DC=1
Z=2
OV=3
N=4
INT1IF=0
INT2IF=1
INT1IE=3
INT2IE=4
INT1IP=6
INT2IP=7
INT1F=0
INT2F=1
INT1E=3
INT2E=4
INT1P=6
INT2P=7
RBIP=0
TMR0IP=2
INTEDG2=4
INTEDG1=5
INTEDG0=6
NOT_RBPU=7
T0IP=2
RBPU=7
RBIF=0
INT0IF=1
TMR0IF=2
RBIE=3
INT0IE=4
TMR0IE=5
PEIE=6
GIE=7
INT0F=1
T0IF=2
INT0E=4
T0IE=5
GIEL=6
GIEH=7
STKPTR0=0
STKPTR1=1
STKPTR2=2
STKPTR3=3
STKPTR4=4
STKUNF=6
STKFUL=7
  __MAXRAM  0X0FFF
  __BADRAM  0X0800-0X0F5F
  __BADRAM  0X0F85-0X0F88
  __BADRAM  0X0F8E-0X0F91
  __BADRAM  0X0F97-0X0F9A
  __BADRAM  0X0F9C
  __BADRAM  0X0FA3-0X0FA5
  __BADRAM  0X0FAA
  __BADRAM  0X0FB9
  __BADRAM  0X0FD4
config1l equ 0X300000
config1h equ 0X300001
config2l equ 0X300002
config2h equ 0X300003
config3h equ 0X300005
config4l equ 0X300006
config5l equ 0X300008
config5h equ 0X300009
config6l equ 0X30000A
config6h equ 0X30000B
config7l equ 0X30000C
config7h equ 0X30000D
PLLDIV_1_1 equ 0XF8
PLLDIV_2_1 equ 0XF9
PLLDIV_3_1 equ 0XFA
PLLDIV_4_1 equ 0XFB
PLLDIV_5_1 equ 0XFC
PLLDIV_6_1 equ 0XFD
PLLDIV_10_1 equ 0XFE
PLLDIV_12_1 equ 0XFF
CPUDIV_OSC1_PLL2_1 equ 0XE7
CPUDIV_OSC2_PLL3_1 equ 0XEF
CPUDIV_OSC3_PLL4_1 equ 0XF7
CPUDIV_OSC4_PLL6_1 equ 0XFF
USBDIV_1_1 equ 0XDF
USBDIV_2_1 equ 0XFF
FOSC_XT_XT_1 equ 0XF0
FOSC_XTPLL_XT_1 equ 0XF2
FOSC_ECIO_EC_1 equ 0XF4
FOSC_EC_EC_1 equ 0XF5
FOSC_ECPLLIO_EC_1 equ 0XF6
FOSC_ECPLL_EC_1 equ 0XF7
FOSC_INTOSCIO_EC_1 equ 0XF8
FOSC_INTOSC_EC_1 equ 0XF9
FOSC_INTOSC_XT_1 equ 0XFA
FOSC_INTOSC_HS_1 equ 0XFB
FOSC_HS_1 equ 0XFC
FOSC_HSPLL_HS_1 equ 0XFE
FCMEN_OFF_1 equ 0XBF
FCMEN_ON_1 equ 0XFF
IESO_OFF_1 equ 0X7F
IESO_ON_1 equ 0XFF
PWRT_ON_2 equ 0XFE
PWRT_OFF_2 equ 0XFF
BOR_OFF_2 equ 0XF9
BOR_SOFT_2 equ 0XFB
BOR_ON_ACTIVE_2 equ 0XFD
BOR_ON_2 equ 0XFF
BORV_0_2 equ 0XE7
BORV_1_2 equ 0XEF
BORV_2_2 equ 0XF7
BORV_3_2 equ 0XFF
VREGEN_OFF_2 equ 0XDF
VREGEN_ON_2 equ 0XFF
WDT_OFF_2 equ 0XFE
WDT_ON_2 equ 0XFF
WDTPS_1_2 equ 0XE1
WDTPS_2_2 equ 0XE3
WDTPS_4_2 equ 0XE5
WDTPS_8_2 equ 0XE7
WDTPS_16_2 equ 0XE9
WDTPS_32_2 equ 0XEB
WDTPS_64_2 equ 0XED
WDTPS_128_2 equ 0XEF
WDTPS_256_2 equ 0XF1
WDTPS_512_2 equ 0XF3
WDTPS_1024_2 equ 0XF5
WDTPS_2048_2 equ 0XF7
WDTPS_4096_2 equ 0XF9
WDTPS_8192_2 equ 0XFB
WDTPS_16384_2 equ 0XFD
WDTPS_32768_2 equ 0XFF
MCLRE_OFF_3 equ 0X7F
MCLRE_ON_3 equ 0XFF
LPT1OSC_OFF_3 equ 0XFB
LPT1OSC_ON_3 equ 0XFF
PBADEN_OFF_3 equ 0XFD
PBADEN_ON_3 equ 0XFF
CCP2MX_OFF_3 equ 0XFE
CCP2MX_ON_3 equ 0XFF
STVREN_OFF_4 equ 0XFE
STVREN_ON_4 equ 0XFF
LVP_OFF_4 equ 0XFB
LVP_ON_4 equ 0XFF
ICPRT_OFF_4 equ 0XDF
ICPRT_ON_4 equ 0XFF
XINST_OFF_4 equ 0XBF
XINST_ON_4 equ 0XFF
DEBUG_ON_4 equ 0X7F
DEBUG_OFF_4 equ 0XFF
CP0_ON_5 equ 0XFE
CP0_OFF_5 equ 0XFF
CP1_ON_5 equ 0XFD
CP1_OFF_5 equ 0XFF
CP2_ON_5 equ 0XFB
CP2_OFF_5 equ 0XFF
CP3_ON_5 equ 0XF7
CP3_OFF_5 equ 0XFF
CPB_ON_5 equ 0XBF
CPB_OFF_5 equ 0XFF
CPD_ON_5 equ 0X7F
CPD_OFF_5 equ 0XFF
WRT0_ON_6 equ 0XFE
WRT0_OFF_6 equ 0XFF
WRT1_ON_6 equ 0XFD
WRT1_OFF_6 equ 0XFF
WRT2_ON_6 equ 0XFB
WRT2_OFF_6 equ 0XFF
WRT3_ON_6 equ 0XF7
WRT3_OFF_6 equ 0XFF
WRTB_ON_6 equ 0XBF
WRTB_OFF_6 equ 0XFF
WRTC_ON_6 equ 0XDF
WRTC_OFF_6 equ 0XFF
WRTD_ON_6 equ 0X7F
WRTD_OFF_6 equ 0XFF
EBTR0_ON_7 equ 0XFE
EBTR0_OFF_7 equ 0XFF
EBTR1_ON_7 equ 0XFD
EBTR1_OFF_7 equ 0XFF
EBTR2_ON_7 equ 0XFB
EBTR2_OFF_7 equ 0XFF
EBTR3_ON_7 equ 0XF7
EBTR3_OFF_7 equ 0XFF
EBTRB_ON_7 equ 0XBF
EBTRB_OFF_7 equ 0XFF
DEVID1 equ 0X3FFFFE
DEVID2 equ 0X3FFFFF
IDLOC0 equ 0X200000
__IDLOC0 equ 0X200000
IDLOC1 equ 0X200001
__IDLOC1 equ 0X200001
IDLOC2 equ 0X200002
__IDLOC2 equ 0X200002
IDLOC3 equ 0X200003
__IDLOC3 equ 0X200003
IDLOC4 equ 0X200004
__IDLOC4 equ 0X200004
IDLOC5 equ 0X200005
__IDLOC5 equ 0X200005
IDLOC6 equ 0X200006
__IDLOC6 equ 0X200006
IDLOC7 equ 0X200007
__IDLOC7 equ 0X200007
#define __18F4550 1
#define XTAL 20
#define _CORE 16
#define _MAXRAM 1024
#define _RAM_END 2048
#define _MAXMEM 0X8000
#define _ADC 10
#define _ADC_RES 10
#define _EEPROM 256
#define RAM_BANKS 8
#define _USART 1
#define _USB 1
#define _USB#RAM_START 1024
#define _FLASH 1
#define _CWRITE_BLOCK 32
#define BANK0_START 96
#define BANK0_END 255
#define BANK1_START 256
#define BANK1_END 511
#define BANK2_START 512
#define BANK2_END 767
#define BANK3_START 768
#define BANK3_END 1023
#define BANK4_START 1024
#define BANK4_END 1279
#define BANK5_START 1280
#define BANK5_END 1535
#define BANK6_START 1536
#define BANK6_END 1791
#define BANK7_START 1792
#define BANK7_END 2047
#define bankA_Start 0
#define bankA_End 95
#define _SYSTEM_VARIABLE_COUNT 5
ram_bank = 0
#define LCD#TYPE 0
#define __INTERRUPTS_ENABLED 1
#define __HIGH_INTERRUPTS_ENABLED 1
#define clrw clrf WREG
#define negw negf WREG
#define skpc btfss STATUS,0
#define skpnc btfsc STATUS,0
#define clrc bcf STATUS,0
#define setc bsf STATUS,0
#define skpz btfss STATUS,2
#define skpnz btfsc STATUS,2
#define clrz bcf STATUS,2
#define setz bsf STATUS,2
MOVFW macro pVarin
    movf pVarin,W
    endm
rlf macro pVarin,pDestination
    rlcf pVarin,pDestination
    endm
rrf macro pVarin,pDestination
    rrcf pVarin,pDestination
    endm
jump macro pLabel
    goto pLabel
    endm
f@call macro pDestination
if (pDestination < 1)
    call pDestination
else
if (pDestination > $)
    call pDestination
else
if (pDestination < ($ - 0X03FF))
    call pDestination
else
    rcall pDestination
endif
endif
endif
    endm
f@jump macro pDestination
ifdef watchdog_req
if ($ == pDestination)
    clrwdt
endif
endif
if (pDestination < 1)
    goto pDestination
else
if ((pDestination) > $)
    goto pDestination
else
if ((pDestination) < ($ - 0X03FF))
    goto pDestination
else
    bra pDestination
endif
endif
endif
    endm
ifdef watchdog_req
    chk@slf macro pDestination
if ($ == pDestination)
    clrwdt
endif
    endm
endif
g@oto macro pDestination
if (pDestination < 1)
    btfsc STATUS,OV
    goto pDestination
else
if (pDestination > $)
    btfsc STATUS,OV
    goto pDestination
else
if (pDestination < ($ - 127))
    btfsc STATUS,OV
    goto pDestination
else
    bov pDestination
endif
endif
endif
    endm
go@to macro pDestination
if (pDestination < 1)
    goto pDestination
else
if (pDestination > $)
    goto pDestination
else
if (pDestination < ($ - 0X03FF))
    goto pDestination
else
    bra pDestination
endif
endif
endif
    endm
s@b macro pVarin
if ((pVarin > bankA_End) & (pVarin < 0X0F80))
if ((pVarin & 0X0F00) != (ram_bank << 8))
    movlb high (pVarin)
    ram_bank = (pVarin >> 8)
endif
endif
    endm
r@b macro
if(ram_bank != 0)
    movlb 0
    ram_bank = 0
endif
    endm
wreg_byte macro pByteOut
    movff WREG,pByteOut
    endm
wreg_bit macro pVarOut,pBitout
    s@b pVarOut
    btfsc WREG,0
    bsf pVarOut,pBitout
    btfss WREG,0
    bcf pVarOut,pBitout
    r@b
    endm
wreg_word macro pWordOut
    movff WREG,pWordOut
    movlw 0
    movff WREG,pWordOut+1
    endm
wreg_dword macro pDwordOut
    movff WREG,pDwordOut
    movlw 0
    movff WREG,pDwordOut+3
    movff WREG,pDwordOut+2
    movff WREG,pDwordOut+1
    endm
num_SFR macro pNumIn,pSFROut
    movlw pNumIn
    movwf pSFROut
    endm
NUM16_SFR macro pNumIn,pSFROut
    movlw (pNumIn & 255)
    movwf pSFROut
    movlw ((pNumIn >> 8) & 255)
    movwf pSFROut + 1
    endm
byte_wreg macro pByteIn
    movff pByteIn,WREG
    endm
num_wreg macro pNumIn
    movlw (pNumIn & 255)
    endm
num_byte macro pNumIn,pByteOut
    movlw (pNumIn & 255)
    movff WREG,pByteOut
    endm
num_bit macro pNumIn,pVarOut,pBitout
    s@b pVarOut
if((pNumIn & 1) == 1)
    bsf pVarOut,pBitout
else
    bcf pVarOut,pBitout
endif
    r@b
    endm
num_word macro pNumIn,pWordOut
ifdef _USELFSR
if(pWordOut == FSR0L)
    lfsr 0,pNumIn
    exitm
endif
if(pWordOut == FSR1L)
    lfsr 1,pNumIn
    exitm
endif
if(pWordOut == FSR2L)
    lfsr 2,pNumIn
    exitm
endif
endif
    s@b pWordOut
    movlw (pNumIn & 255)
    movwf pWordOut
    s@b pWordOut+1
    movlw high (pNumIn)
    movwf pWordOut+1
    r@b
    endm
num_dword macro pNumIn,pDwordOut
    s@b pDwordOut
    movlw low (pNumIn)
    movwf pDwordOut
    s@b pDwordOut+1
    movlw high (pNumIn)
    movwf pDwordOut+1
    s@b pDwordOut+2
    movlw ((pNumIn >> 16) & 255)
    movwf pDwordOut+2
    s@b pDwordOut+3
    movlw ((pNumIn >> 24) & 255)
    movwf pDwordOut+3
    r@b
    endm
bit_wreg macro pVarin,pBitIn
    s@b pVarin
    clrw
    btfsc pVarin,pBitIn
    movlw 1
    r@b
    endm
bit_byte macro pVarin,pBitIn,pByteOut
    s@b pVarin
    clrw
    btfsc pVarin,pBitIn
    movlw 1
    s@b pByteOut
    movwf pByteOut
    r@b
    endm
bit_bit macro pVarin,pBitIn,pVarOut,pBitout
if ((pVarin & 0X0F00) == (pVarOut & 0X0F00))
    s@b pVarin
    btfsc pVarin,pBitIn
    bsf pVarOut,pBitout
    btfss pVarin,pBitIn
    bcf pVarOut,pBitout
else
if ((pVarin <= bankA_End) | (pVarin >= 0X0F80))
    s@b pVarOut
    btfsc pVarin,pBitIn
    bsf pVarOut,pBitout
    btfss pVarin,pBitIn
    bcf pVarOut,pBitout
else
if ((pVarOut <= bankA_End) | (pVarOut >= 0X0F80))
    s@b pVarin
    btfsc pVarin,pBitIn
    bsf pVarOut,pBitout
    btfss pVarin,pBitIn
    bcf pVarOut,pBitout
else
    s@b pVarin
    clrdc
    btfsc pVarin,pBitIn
    setdc
    s@b pVarOut
    skpndc
    bsf pVarOut,pBitout
    skpdc
    bcf pVarOut,pBitout
endif
endif
endif
    r@b
    endm
bit_word macro pVarin,pBitIn,pWordOut
    s@b pWordOut+1
    clrf pWordOut+1
    bit_byte pVarin,pBitIn,pWordOut
    endm
bit_dword macro pVarin,pBitIn,pDwordOut
    s@b pDwordOut+3
    clrf pDwordOut+3
    s@b pDwordOut+2
    clrf pDwordOut+2
    s@b pDwordOut+1
    clrf pDwordOut+1
    bit_byte pVarin,pBitIn,pDwordOut
    endm
word_wreg macro pWordIn
    byte_wreg pWordIn
    endm
word_byte macro pWordIn,pByteOut
    byte_byte pWordIn,pByteOut
    endm
word_bit macro pWordIn,pVarOut,pBitout
    byte_bit pWordIn, pVarOut, pBitout
    endm
word_word macro pWordIn,pWordOut
    movff pWordIn+1,pWordOut+1
    movff pWordIn,pWordOut
    endm
word_dword macro pWordIn,pDwordOut
    movlw 0
    movff WREG,pDwordOut+3
    movff WREG,pDwordOut+2
    word_word pWordIn,pDwordOut
    endm
byte_byte macro pByteIn,pByteOut
    movff pByteIn,pByteOut
    endm
byte_word macro pByteIn,pWordOut
    movlw 0
    movff WREG,pWordOut+1
    byte_byte pByteIn,pWordOut
    endm
byte_dword macro pByteIn,pDwordOut
    movlw 0
    movff WREG,pDwordOut+3
    movff WREG,pDwordOut+2
    movff WREG,pDwordOut+1
    byte_byte pByteIn,pDwordOut
    endm
byte_bit macro pByteIn,pVarOut,pBitout
if ((pByteIn & 0X0F00) == (pVarOut & 0X0F00))
    s@b pByteIn
    btfsc pByteIn,0
    bsf pVarOut,pBitout
    btfss pByteIn,0
    bcf pVarOut,pBitout
else
if ((pByteIn <= bankA_End) | (pByteIn >= 0X0F80))
    s@b pVarOut
    btfsc pByteIn,0
    bsf pVarOut,pBitout
    btfss pByteIn,0
    bcf pVarOut,pBitout
else
if ((pVarOut <= bankA_End) | (pVarOut >= 0X0F80))
    s@b pByteIn
    btfsc pByteIn,0
    bsf pVarOut,pBitout
    btfss pByteIn,0
    bcf pVarOut,pBitout
else
    s@b pByteIn
    rrf pByteIn,W
    s@b pVarOut
    skpnc
    bsf pVarOut,pBitout
    skpc
    bcf pVarOut,pBitout
endif
endif
endif
    r@b
    endm
dword_wreg macro pDwordIn
    byte_wreg pDwordIn
    endm
dword_byte macro pDwordIn,pByteOut
    byte_byte pDwordIn,pByteOut
    endm
dword_word macro pDwordIn,pWordOut
    movff pDwordIn+1,pWordOut+1
    movff pDwordIn,pWordOut
    endm
dword_dword macro pDwordIn,pDwordOut
    movff pDwordIn+3,pDwordOut+3
    movff pDwordIn+2,pDwordOut+2
    movff pDwordIn+1,pDwordOut+1
    movff pDwordIn,pDwordOut
    endm
dword_bit macro pDwordIn,pVarOut,pBitout
    byte_bit pDwordIn,pVarOut,pBitout
    endm
num_float macro pNumIn,pFloatOut
    num_byte pNumIn,pFloatOut+3
    num_byte ((pNumIn >> 8) & 255),pFloatOut+2
    num_byte ((pNumIn >> 16) & 255),pFloatOut+1
    num_byte ((pNumIn >> 24) & 255),pFloatOut
    endm
wreg_float macro pFloatOut
    call INT08@TOFL32
    movff PP_AARG,pFloatOut
    movff PP_AARGH,pFloatOut+1
    movff PP_AARGHH,pFloatOut+2
    movff PP_AARGHHH,pFloatOut+3
    endm
bit_float macro pVarin,pBitIn,pFloatOut
    bit_wreg pVarin,pBitIn
    call INT08@TOFL32
    movff PP_AARG,pFloatOut
    movff PP_AARGH,pFloatOut+1
    movff PP_AARGHH,pFloatOut+2
    movff PP_AARGHHH,pFloatOut+3
    endm
byte_float macro pByteIn,pFloatOut
    byte_wreg pByteIn
    call INT08@TOFL32
    movff PP_AARG,pFloatOut
    movff PP_AARGH,pFloatOut+1
    movff PP_AARGHH,pFloatOut+2
    movff PP_AARGHHH,pFloatOut+3
    endm
word_float macro pWordIn,pFloatOut
    byte_byte pWordIn,PP_AARG
    byte_byte pWordIn+1,PP_AARGH
    call INT16@TOFL32
    movff PP_AARG,pFloatOut
    movff PP_AARGH,pFloatOut+1
    movff PP_AARGHH,pFloatOut+2
    movff PP_AARGHHH,pFloatOut+3
    endm
dword_float macro pDwordIn,pFloatOut
    movff pDwordIn,PP_AARG
    movff pDwordIn+1,PP_AARGH
    movff pDwordIn+2,PP_AARGHH
    movff pDwordIn+3,PP_AARGHHH
    call INT32@TOFL32
    movff PP_AARG,pFloatOut
    movff PP_AARGH,pFloatOut+1
    movff PP_AARGHH,pFloatOut+2
    movff PP_AARGHHH,pFloatOut+3
    endm
float_float macro pFloatIn,pFloatOut
    movff pFloatIn,pFloatOut
    movff pFloatIn+1,pFloatOut+1
    movff pFloatIn+2,pFloatOut+2
    movff pFloatIn+3,pFloatOut+3
    endm
float_wreg macro pFloatIn
    float_float pFloatIn,PP_AARG
    call FL32@TOINT32
    endm
float_bit macro pFloatIn,pVarOut,pBitout
    float_float pFloatIn,PP_AARG
    call FL32@TOINT32
    wreg_bit pVarOut,pBitout
    endm
float_byte macro pFloatIn,pByteOut
    float_float pFloatIn,PP_AARG
    call FL32@TOINT32
    wreg_byte pByteOut
    endm
float_word macro pFloatIn,pWordOut
    float_float pFloatIn,PP_AARG
    call FL32@TOINT32
    movff PP_AARGHHH,pWordOut
    movff PP_AARGHH,pWordOut+1
    endm
float_dword macro pFloatIn,pDwordOut
    float_float pFloatIn,PP_AARG
    call FL32@TOINT32
    movff PP_AARGHHH,pDwordOut
    movff PP_AARGHH,pDwordOut+1
    movff PP_AARGH,pDwordOut+2
    movff PP_AARG,pDwordOut+3
    endm
num_FSR0 macro pNumIn
    lfsr 0,pNumIn
    endm
num_FSR1 macro pNumIn
    lfsr 1,pNumIn
    endm
num_FSR2 macro pNumIn
    lfsr 2,pNumIn
    endm
label_word macro pLabelIn,pWordOut
    movlw (pLabelIn & 255)
    movff WREG, pWordOut
    movlw ((pLabelIn >> 8) & 255)
    movff WREG, pWordOut+1
    endm
label_pointer macro pLabelIn
    movlw (pLabelIn & 255)
    movwf TBLPTRL
    movlw ((pLabelIn >> 8) & 255)
    movwf TBLPTRH
    movlw ((pLabelIn >> 16) & 255)
    movwf TBLPTRU
    endm
wreg_sword macro pWordOut
    movff WREG,pWordOut
    s@b pWordOut+1
    clrf pWordOut+1
    btfsc WREG,7
    decf pWordOut+1,F
    r@b
    endm
wreg_sdword macro pDwordOut
    movff WREG,pDwordOut
    s@b pDwordOut
    movlw 0
    btfsc pDwordOut,7
    movlw 255
    movff WREG,pDwordOut+1
    movff WREG,pDwordOut+2
    movff WREG,pDwordOut+3
    r@b
    endm
byte_sword macro pByteIn,pWordOut
    movff pByteIn,pWordOut
    s@b pByteIn
    movlw 0
    btfsc pByteIn,7
    movlw 255
    movff WREG,pWordOut+1
    r@b
    endm
byte_sdword macro pByteIn,pDwordOut
    movff pByteIn,pDwordOut
    s@b pByteIn
    movlw 0
    btfsc pByteIn,7
    movlw 255
    movff WREG,pDwordOut+1
    movff WREG,pDwordOut+2
    movff WREG,pDwordOut+3
    r@b
    endm
word_sdword macro pWordIn,pDwordOut
    movff pWordIn,pDwordOut
    movff pWordIn+1,pDwordOut+1
    s@b pWordIn+1
    movlw 0
    btfsc pWordIn+1,7
    movlw 255
    movff WREG,pDwordOut+2
    movff WREG,pDwordOut+3
    r@b
    endm
PP0 = 0
PP0H = 1
PP1 = 2
PP1H = 3
SP#P9 = 4
DataIn = 5
variable DataIn#0=5,DataIn#1=6,DataIn#2=7,DataIn#3=8
variable DataIn#4=9,DataIn#5=10,DataIn#6=11,DataIn#7=12
variable DataIn#8=13,DataIn#9=14,DataIn#10=15,DataIn#11=16
variable DataIn#12=17,DataIn#13=18,DataIn#14=19,DataIn#15=20
variable DataIn#16=21,DataIn#17=22,DataIn#18=23,DataIn#19=24
variable DataIn#20=25,DataIn#21=26,DataIn#22=27,DataIn#23=28
variable DataIn#24=29,DataIn#25=30,DataIn#26=31,DataIn#27=32
variable DataIn#28=33,DataIn#29=34
_I = 35
_T = 36
__EP0BO = 1024
__EP0BOH = 1025
__EP0BOHH = 1026
__EP0BOHHH = 1027
__EP0BI = 1028
__EP0BIH = 1029
__EP0BIHH = 1030
__EP0BIHHH = 1031
__EP1BO = 1032
__EP1BOH = 1033
__EP1BOHH = 1034
__EP1BOHHH = 1035
__EP1BI = 1036
__EP1BIH = 1037
__EP1BIHH = 1038
__EP1BIHHH = 1039
__USB_TEMP_VAR = 1040
__USB_TEMP_VARH = 1041
__PSRC = 1042
__PSRCH = 1043
__PDST = 1044
__PDSTH = 1045
__CTRL_TRF_STATE = 1046
__CTRL_TRF_SESSION_OWNER = 1047
__WCOUNT = 1048
__WCOUNTH = 1049
__SHORT_PKT_STATUS = 1050
__TRNIFCLEARED = 1051
__BTRNIFCOUNT = 1052
__USB_DEVICE_STATE = 1053
__USB_ACTIVE_CFG = 1054
__USB_ALT_INTF = 1055
__USB_STAT = 1056
__SETUPPKT = 1057
variable __SETUPPKT#0=1057,__SETUPPKT#1=1058,__SETUPPKT#2=1059,__SETUPPKT#3=1060
variable __SETUPPKT#4=1061,__SETUPPKT#5=1062,__SETUPPKT#6=1063,__SETUPPKT#7=1064
__CTRLTRFDATA = 1065
variable __CTRLTRFDATA#0=1065,__CTRLTRFDATA#1=1066,__CTRLTRFDATA#2=1067,__CTRLTRFDATA#3=1068
variable __CTRLTRFDATA#4=1069,__CTRLTRFDATA#5=1070,__CTRLTRFDATA#6=1071,__CTRLTRFDATA#7=1072
__IDLE_RATE = 1073
__ACTIVE_PROTOCOL = 1074
__HID_REPORT_IN = 1075
__HID_REPORT_OUT = 1140
__USBOUT_BUFFER = 1076
__USBOUT_BUFFER_D = 1076
__USBOUT_BUFFERH = 1077
__USBOUT_BUFFER_DH = 1077
__USBOUT_BUFFERHH = 1078
__USBOUT_BUFFER_DHH = 1078
__USBOUT_BUFFERHHH = 1079
__USBOUT_BUFFER_DHHH = 1079
variable __USBOUT_BUFFER#0=1076,__USBOUT_BUFFER#1=1077,__USBOUT_BUFFER#2=1078,__USBOUT_BUFFER#3=1079
variable __USBOUT_BUFFER#4=1080,__USBOUT_BUFFER#5=1081,__USBOUT_BUFFER#6=1082,__USBOUT_BUFFER#7=1083
variable __USBOUT_BUFFER#8=1084,__USBOUT_BUFFER#9=1085,__USBOUT_BUFFER#10=1086,__USBOUT_BUFFER#11=1087
variable __USBOUT_BUFFER#12=1088,__USBOUT_BUFFER#13=1089,__USBOUT_BUFFER#14=1090,__USBOUT_BUFFER#15=1091
variable __USBOUT_BUFFER#16=1092,__USBOUT_BUFFER#17=1093,__USBOUT_BUFFER#18=1094,__USBOUT_BUFFER#19=1095
variable __USBOUT_BUFFER#20=1096,__USBOUT_BUFFER#21=1097,__USBOUT_BUFFER#22=1098,__USBOUT_BUFFER#23=1099
variable __USBOUT_BUFFER#24=1100,__USBOUT_BUFFER#25=1101,__USBOUT_BUFFER#26=1102,__USBOUT_BUFFER#27=1103
variable __USBOUT_BUFFER#28=1104,__USBOUT_BUFFER#29=1105,__USBOUT_BUFFER#30=1106,__USBOUT_BUFFER#31=1107
variable __USBOUT_BUFFER#32=1108,__USBOUT_BUFFER#33=1109,__USBOUT_BUFFER#34=1110,__USBOUT_BUFFER#35=1111
variable __USBOUT_BUFFER#36=1112,__USBOUT_BUFFER#37=1113,__USBOUT_BUFFER#38=1114,__USBOUT_BUFFER#39=1115
variable __USBOUT_BUFFER#40=1116,__USBOUT_BUFFER#41=1117,__USBOUT_BUFFER#42=1118,__USBOUT_BUFFER#43=1119
variable __USBOUT_BUFFER#44=1120,__USBOUT_BUFFER#45=1121,__USBOUT_BUFFER#46=1122,__USBOUT_BUFFER#47=1123
variable __USBOUT_BUFFER#48=1124,__USBOUT_BUFFER#49=1125,__USBOUT_BUFFER#50=1126,__USBOUT_BUFFER#51=1127
variable __USBOUT_BUFFER#52=1128,__USBOUT_BUFFER#53=1129,__USBOUT_BUFFER#54=1130,__USBOUT_BUFFER#55=1131
variable __USBOUT_BUFFER#56=1132,__USBOUT_BUFFER#57=1133,__USBOUT_BUFFER#58=1134,__USBOUT_BUFFER#59=1135
variable __USBOUT_BUFFER#60=1136,__USBOUT_BUFFER#61=1137,__USBOUT_BUFFER#62=1138,__USBOUT_BUFFER#63=1139
__USBIN_BUFFER = 1141
variable __USBIN_BUFFER#0=1141,__USBIN_BUFFER#1=1142,__USBIN_BUFFER#2=1143,__USBIN_BUFFER#3=1144
variable __USBIN_BUFFER#4=1145,__USBIN_BUFFER#5=1146,__USBIN_BUFFER#6=1147,__USBIN_BUFFER#7=1148
variable __USBIN_BUFFER#8=1149,__USBIN_BUFFER#9=1150,__USBIN_BUFFER#10=1151,__USBIN_BUFFER#11=1152
variable __USBIN_BUFFER#12=1153,__USBIN_BUFFER#13=1154,__USBIN_BUFFER#14=1155,__USBIN_BUFFER#15=1156
variable __USBIN_BUFFER#16=1157,__USBIN_BUFFER#17=1158,__USBIN_BUFFER#18=1159,__USBIN_BUFFER#19=1160
variable __USBIN_BUFFER#20=1161,__USBIN_BUFFER#21=1162,__USBIN_BUFFER#22=1163,__USBIN_BUFFER#23=1164
variable __USBIN_BUFFER#24=1165,__USBIN_BUFFER#25=1166,__USBIN_BUFFER#26=1167,__USBIN_BUFFER#27=1168
variable __USBIN_BUFFER#28=1169,__USBIN_BUFFER#29=1170,__USBIN_BUFFER#30=1171,__USBIN_BUFFER#31=1172
variable __USBIN_BUFFER#32=1173,__USBIN_BUFFER#33=1174,__USBIN_BUFFER#34=1175,__USBIN_BUFFER#35=1176
variable __USBIN_BUFFER#36=1177,__USBIN_BUFFER#37=1178,__USBIN_BUFFER#38=1179,__USBIN_BUFFER#39=1180
variable __USBIN_BUFFER#40=1181,__USBIN_BUFFER#41=1182,__USBIN_BUFFER#42=1183,__USBIN_BUFFER#43=1184
variable __USBIN_BUFFER#44=1185,__USBIN_BUFFER#45=1186,__USBIN_BUFFER#46=1187,__USBIN_BUFFER#47=1188
variable __USBIN_BUFFER#48=1189,__USBIN_BUFFER#49=1190,__USBIN_BUFFER#50=1191,__USBIN_BUFFER#51=1192
variable __USBIN_BUFFER#52=1193,__USBIN_BUFFER#53=1194,__USBIN_BUFFER#54=1195,__USBIN_BUFFER#55=1196
variable __USBIN_BUFFER#56=1197,__USBIN_BUFFER#57=1198,__USBIN_BUFFER#58=1199,__USBIN_BUFFER#59=1200
variable __USBIN_BUFFER#60=1201,__USBIN_BUFFER#61=1202,__USBIN_BUFFER#62=1203,__USBIN_BUFFER#63=1204
_High__Context_Store = 37
variable _High__Context_Store#0=37,_High__Context_Store#1=38,_High__Context_Store#2=39
#define SMP SSPSTAT,7
#define CKE SSPSTAT,6
#define DATA_ADDR SSPSTAT,5
#define _P SSPSTAT,4
#define _S SSPSTAT,3
#define R_W SSPSTAT,2
#define UA SSPSTAT,1
#define BF SSPSTAT,0
#define S_GCEN SSPCON2,7
#define S_ACKSTAT SSPCON2,6
#define S_ACKDT SSPCON2,5
#define S_ACKEN SSPCON2,4
#define S_RCEN SSPCON2,3
#define S_PEN SSPCON2,2
#define S_RSEN SSPCON2,1
#define S_SEN SSPCON2,0
#define SSPIF PIR1,3
#define SSPIE PIE1,3
#define GIE_GIEH INTCON,7
#define PEIE_GIEL INTCON,6
#define __XTAL 20
proton#code#start
        org 0
        goto proton#main#start
        org 8
        goto u
__DELAY_MS_
        clrf 3,0
__DELAY_MS_W_
        movwf 2,0
DLY@P
        movlw 255
        addwf 2,F,0
        addwfc 3,F,0
        bra $ + 2
        btfss 4056,0,0
        return
        movlw 3
        movwf 1,0
        movlw 229
        rcall __DELAY_US_W_
        bra DLY@P
__DELAY_US_
        clrf 1,0
__DELAY_US_W_
        addlw 252
        movwf 0,0
        nop
        clrf 4072,0
        bra $ + 4
        decf 0,F,0
        nop
        subwfb 1,F,0
        bc $ - 6
        return
proton#main#start
        movlb 0
F2_SOF equ $ ; 4550.PRP
F2_EOF equ $ ; 4550.PRP
F1_SOF equ $ ; 4550.BAS
F1_000003 equ $ ; IN [4550.BAS] OUTPUT PORTB.6
        bcf TRISB,6,0
F1_000004 equ $ ; IN [4550.BAS] OUTPUT PORTB.7
        bcf TRISB,7,0
F1_000008 equ $ ; IN [4550.BAS] INPUT PORTB.0
        bsf TRISB,0,0
F1_000009 equ $ ; IN [4550.BAS] INPUT PORTB.1
        bsf TRISB,1,0
F1_000012 equ $ ; IN [4550.BAS] SSPADD = 49
        movlw 49
        movwf SSPADD,0
F1_000034 equ $ ; IN [4550.BAS] SSPCON2=0B000000000
        clrf SSPCON2,0
F1_000040 equ $ ; IN [4550.BAS] GIE_GIEH=1
        bsf INTCON,7,0
F1_000041 equ $ ; IN [4550.BAS] PEIE_GIEL=1
        bsf INTCON,6,0
F1_000042 equ $ ; IN [4550.BAS] SSPIE=1
        bsf PIE1,3,0
F1_000047 equ $ ; IN [4550.BAS] SSPADD  = 0B10100000
        movlw 160
        movwf SSPADD,0
F1_000048 equ $ ; IN [4550.BAS] SSPSTAT = 0B00000000
        clrf SSPSTAT,0
F1_000049 equ $ ; IN [4550.BAS] SSPCON1 = 0B00111110
        movlw 62
        movwf SSPCON1,0
F1_000050 equ $ ; IN [4550.BAS] SSPCON2 = 0B00000000
        clrf SSPCON2,0
F1_000052 equ $ ; IN [4550.BAS] I=-1
        movlw 255
        movwf _I,0
F1_000054 equ $ ; IN [4550.BAS] DELAYMS 500
        movlw 1
        movwf PP1H,0
        movlw 244
        f@call __DELAY_MS_W_
main
F1_000056 equ $ ; IN [4550.BAS] DELAYMS 500
        movlw 1
        movwf PP1H,0
        movlw 244
        f@call __DELAY_MS_W_
F1_000057 equ $ ; IN [4550.BAS] TOGGLE PORTB.7
        btg PORTB,7,0
        bcf TRISB,7,0
F1_000058 equ $ ; IN [4550.BAS] GOTO MAIN
        f@jump main
u
F1_000061 equ $ ; IN [4550.BAS] CONTEXT SAVE
        movlb 0
        movff FSR0H,_High__Context_Store#0
        movff FSR0L,_High__Context_Store#1
        movff SP#P9,_High__Context_Store#2
F1_000062 equ $ ; IN [4550.BAS] TOGGLE PORTB.6
        btg PORTB,6,0
        bcf TRISB,6,0
F1_000063 equ $ ; IN [4550.BAS] IF SSPIF =1   THEN
        btfss PIR1,3,0
        go@to BC@LL3
F1_000064 equ $ ; IN [4550.BAS] T= SSPBUF
        movff SSPBUF,_T
F1_000065 equ $ ; IN [4550.BAS] IF S=1 AND T <> SSPADD  THEN
        movlw 0
        btfsc SSPSTAT,3,0
        movlw 1
        movwf SP#P9,0
        movf _T,W,0
        subwf SSPADD,W,0
        btfss STATUS,2,0
        movlw 1
        andwf SP#P9,F,0
        btfsc STATUS,2,0
        go@to BC@LL5
F1_000066 equ $ ; IN [4550.BAS] INC I
        incf _I,F,0
F1_000067 equ $ ; IN [4550.BAS] DATAIN[I] = T
        lfsr 0,DataIn
        movf _I,W,0
        movff _T,PLUSW0
F1_000068 equ $ ; IN [4550.BAS] SSPIF =0
        bcf PIR1,3,0
F1_000071 equ $ ; IN [4550.BAS] END IF
BC@LL5
F1_000072 equ $ ; IN [4550.BAS] IF P=1 THEN P=0 :I=-1
        btfss SSPSTAT,4,0
        go@to BC@LL7
        bcf SSPSTAT,4,0
        movlw 255
        movwf _I,0
BC@LL7
F1_000073 equ $ ; IN [4550.BAS] SSPIF=0
        bcf PIR1,3,0
F1_000074 equ $ ; IN [4550.BAS] END IF
BC@LL3
F1_000076 equ $ ; IN [4550.BAS] CONTEXT RESTORE
        movff _High__Context_Store#0,FSR0H
        movff _High__Context_Store#1,FSR0L
        movff _High__Context_Store#2,SP#P9
        retfie 1
F1_EOF equ $ ; 4550.BAS
PB@LB8
        bra PB@LB8
__EOF
__config config1l, PLLDIV_1_1 & CPUDIV_OSC1_PLL2_1 & USBDIV_1_1
__config config1h, FOSC_HS_1
__config config2l, PWRT_OFF_2 & BOR_ON_2 & BORV_3_2 & VREGEN_ON_2
__config config2h, WDT_OFF_2 & WDTPS_128_2
__config config3h, PBADEN_OFF_3
__config config4l, LVP_OFF_4 & ICPRT_OFF_4 & XINST_OFF_4 & DEBUG_OFF_4
        end
