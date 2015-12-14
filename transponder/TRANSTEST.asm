;----------------------------------------------------------
; Code Produced by the Proton Compiler. Ver 3.5.4.5
; Copyright Rosetta Technologies/Crownhill Associates Ltd
; Written by Les Johnson. May 2012
;----------------------------------------------------------
;
#define CONFIG_REQ 1
 LIST  P = 18F24K20, F = INHX32, W = 2, X = ON, R = DEC, MM = ON, N = 0, C = 255, T=ON
SSPMSK equ 0X0F77
SLRCON equ 0X0F78
CM2CON1 equ 0X0F79
CM2CON0 equ 0X0F7A
CM1CON0 equ 0X0F7B
WPUB equ 0X0F7C
IOCB equ 0X0F7D
ANSEL equ 0X0F7E
ANSELH equ 0X0F7F
PORTA equ 0X0F80
PORTB equ 0X0F81
PORTC equ 0X0F82
PORTE equ 0X0F84
LATA equ 0X0F89
LATB equ 0X0F8A
LATC equ 0X0F8B
DDRA equ 0X0F92
TRISA equ 0X0F92
DDRB equ 0X0F93
TRISB equ 0X0F93
DDRC equ 0X0F94
TRISC equ 0X0F94
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
EEDAT equ 0X0FA8
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
CVRCON2 equ 0X0FB4
CVRCON equ 0X0FB5
ECCP1AS equ 0X0FB6
PWM1CON equ 0X0FB7
BAUDCON equ 0X0FB8
BAUDCTL equ 0X0FB8
PSTRCON equ 0X0FB9
CCP2CON equ 0X0FBA
CCPR2 equ 0X0FBB
CCPR2L equ 0X0FBB
CCPR2LH equ 0X0FBC
CCPR2H equ 0X0FBC
CCP1CON equ 0X0FBD
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
_I2C_SCL_PORT=TRISC
_I2C_SCL_PIN=3
_I2C_SDA_PORT=TRISC
_I2C_SDA_PIN=4
MSK0=0
MSK1=1
MSK2=2
MSK3=3
MSK4=4
MSK5=5
MSK6=6
MSK7=7
SLRA=0
SLRB=1
SLRC=2
SLRD=3
SLRE=4
C2RSEL=4
C1RSEL=5
MC2OUT=6
MC1OUT=7
C2CH0=0
C2CH1=1
C2R=2
C2SP=3
C2POL=4
C2OE=5
C2OUT_CM2CON0=6
C2ON=7
C1CH0=0
C1CH1=1
C1R=2
C1SP=3
C1POL=4
C1OE=5
C1OUT_CM1CON0=6
C1ON=7
WPUB0=0
WPUB1=1
WPUB2=2
WPUB3=3
WPUB4=4
WPUB5=5
WPUB6=6
WPUB7=7
IOCB4=4
IOCB5=5
IOCB6=6
IOCB7=7
ANS0=0
ANS1=1
ANS2=2
ANS3=3
ANS4=4
ANS5=5
ANS6=6
ANS7=7
ANS8=0
ANS9=1
ANS10=2
ANS11=3
ANS12=4
RA0=0
RA1=1
RA2=2
RA3=3
RA4=4
RA5=5
RA6=6
RA7=7
AN0=0
AN1=1
AN2=2
AN3=3
AN4=5
C12IN0M=0
C12IN1M=1
C2INP=2
C1INP=3
C1OUT_PORTA=4
C2OUT_PORTA=5
C12IN0N=0
C12IN1N=1
VREFM=2
VREFP=3
T0CKI=4
SS=5
VREFN=2
NOT_SS=5
CVREF=2
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
CCP2_PORTB=3
KBI0=4
KBI1=5
KBI2=6
KBI3=7
AN12=0
AN10=1
AN8=2
AN9=3
AN11=4
PGM=5
PGC=6
PGD=7
FLT0=0
C12IN3M=1
C12IN2M=3
C12IN3N=1
C12IN2N=3
P1C=1
P1B=2
P1D=4
RC0=0
RC1=1
RC2=2
RC3=3
RC4=4
RC5=5
RC6=6
RC7=7
T1OSO=0
T1OSI=1
CCP1=2
SCK=3
SDI=4
SDO=5
TX=6
RX=7
T13CKI=0
CCP2_PORTC=1
P1A=2
SCL=3
SDA=4
CK=6
T1CKI=0
T3CKI=0
RE3=3
MCLR=3
NOT_MCLR=3
VPP=3
LATA0=0
LATA1=1
LATA2=2
LATA3=3
LATA4=4
LATA5=5
LATA6=6
LATA7=7
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
LATC3=3
LATC4=4
LATC5=5
LATC6=6
LATC7=7
RA0=0
RA1=1
RA2=2
RA3=3
RA4=4
RA5=5
RA6=6
RA7=7
TRISA0=0
TRISA1=1
TRISA2=2
TRISA3=3
TRISA4=4
TRISA5=5
TRISA6=6
TRISA7=7
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
RC3=3
RC4=4
RC5=5
RC6=6
RC7=7
TRISC0=0
TRISC1=1
TRISC2=2
TRISC3=3
TRISC4=4
TRISC5=5
TRISC6=6
TRISC7=7
TUN0=0
TUN1=1
TUN2=2
TUN3=3
TUN4=4
TUN5=5
PLLEN=6
INTSRC=7
TMR1IE=0
TMR2IE=1
CCP1IE=2
SSPIE=3
TXIE=4
RCIE=5
ADIE=6
PSPIE=7
TMR1IF=0
TMR2IF=1
CCP1IF=2
SSPIF=3
TXIF=4
PP_TXIF=4
RCIF=5
PP_RCIF=5
ADIF=6
PSPIF=7
TMR1IP=0
TMR2IP=1
CCP1IP=2
SSPIP=3
TXIP=4
RCIP=5
ADIP=6
PSPIP=7
CCP2IE=0
TMR3IE=1
LVDIE=2
BCLIE=3
EEIE=4
C2IE=5
C1IE=6
OSCFIE=7
HLVDIE=2
CCP2IF=0
TMR3IF=1
LVDIF=2
BCLIF=3
EEIF=4
C2IF=5
C1IF=6
OSCFIF=7
HLVDIF=2
CCP2IP=0
TMR3IP=1
LVDIP=2
BCLIP=3
EEIP=4
C2IP=5
C1IP=6
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
ADEN=3
CREN=4
PP_CREN=4
SREN=5
RX9=6
SPEN=7
ADDEN=3
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
NOT_T3SYNC=2
FVRST=6
FVREN=7
CVR0=0
CVR1=1
CVR2=2
CVR3=3
CVRSS=4
CVRR=5
CVROE=6
CVREN=7
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
ABDEN=0
WUE=1
BRG16=3
CKTXP=4
DTRXP=5
RCIDL=6
ABDOVF=7
SCKP=4
ABDEN=0
WUE=1
BRG16=3
CKTXP=4
DTRXP=5
RCIDL=6
ABDOVF=7
SCKP=4
STRA=0
STRB=1
STRC=2
STRD=3
STRSYNC=4
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
ADCS0=0
ADCS1=1
ADCS2=2
ACQT0=3
ACQT1=4
ACQT2=5
ADFM=7
VCFG0=4
VCFG1=5
ADON=0
PP_ADON=0
GO=1
CHS0=2
CHS1=3
CHS2=4
CHS3=5
DONE=1
NOT_DONE=1
GO_DONE=1
PP_GO_DONE=1
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
CKE=6
SMP=7
NOT_W=2
NOT_A=5
R_W=2
PP_R_W=2
D_A=5
NOT_WRITE=2
NOT_ADDRESS=5
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
BOR=0
POR=1
PD=2
TO=3
RI=4
SBOREN=6
IPEN=7
NOT_BOR=0
NOT_POR=1
NOT_PD=2
NOT_TO=3
NOT_RI=4
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
INT1F=0
INT2F=1
INT1E=3
INT2E=4
INT1P=6
INT2P=7
INT1IF=0
INT2IF=1
INT1IE=3
INT2IE=4
INT1IP=6
INT2IP=7
RBIP=0
TMR0IP=2
INTEDG2=4
INTEDG1=5
INTEDG0=6
RBPU=7
NOT_RBPU=7
RBIF=0
INT0F=1
TMR0IF=2
RBIE=3
INT0E=4
TMR0IE=5
PEIE=6
GIE=7
INT0IF=1
T0IF=2
INT0IE=4
T0IE=5
GIEL=6
GIEH=7
SP0=0
SP1=1
SP2=2
SP3=3
SP4=4
STKUNF=6
STKOVF=7
STKFUL=7
  __MAXRAM  0X0FFF
  __BADRAM  0X0300-0X0F5F
  __BADRAM  0X0F83
  __BADRAM  0X0F85-0X0F88
  __BADRAM  0X0F8C-0X0F91
  __BADRAM  0X0F95-0X0F9A
  __BADRAM  0X0F9C
  __BADRAM  0X0FA3-0X0FA5
  __BADRAM  0X0FAA
  __BADRAM  0X0FD4
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
FOSC_LP_1 equ 0XF0
FOSC_XT_1 equ 0XF1
FOSC_HS_1 equ 0XF2
FOSC_RC_1 equ 0XF3
FOSC_EC_1 equ 0XF4
FOSC_ECIO6_1 equ 0XF5
FOSC_HSPLL_1 equ 0XF6
FOSC_RCIO6_1 equ 0XF7
FOSC_INTIO67_1 equ 0XF8
FOSC_INTIO7_1 equ 0XF9
FCMEN_OFF_1 equ 0XBF
FCMEN_ON_1 equ 0XFF
IESO_OFF_1 equ 0X7F
IESO_ON_1 equ 0XFF
PWRT_ON_2 equ 0XFE
PWRT_OFF_2 equ 0XFF
BOREN_OFF_2 equ 0XF9
BOREN_ON_2 equ 0XFB
BOREN_NOSLP_2 equ 0XFD
BOREN_SBORDIS_2 equ 0XFF
BORV_30_2 equ 0XE7
BORV_27_2 equ 0XEF
BORV_22_2 equ 0XF7
BORV_18_2 equ 0XFF
WDTEN_OFF_2 equ 0XFE
WDTEN_ON_2 equ 0XFF
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
HFOFST_OFF_3 equ 0XF7
HFOFST_ON_3 equ 0XFF
LPT1OSC_OFF_3 equ 0XFB
LPT1OSC_ON_3 equ 0XFF
PBADEN_OFF_3 equ 0XFD
PBADEN_ON_3 equ 0XFF
CCP2MX_PORTBE_3 equ 0XFE
CCP2MX_PORTC_3 equ 0XFF
STVREN_OFF_4 equ 0XFE
STVREN_ON_4 equ 0XFF
LVP_OFF_4 equ 0XFB
LVP_ON_4 equ 0XFF
XINST_OFF_4 equ 0XBF
XINST_ON_4 equ 0XFF
DEBUG_ON_4 equ 0X7F
DEBUG_OFF_4 equ 0XFF
CP0_ON_5 equ 0XFE
CP0_OFF_5 equ 0XFF
CP1_ON_5 equ 0XFD
CP1_OFF_5 equ 0XFF
CPB_ON_5 equ 0XBF
CPB_OFF_5 equ 0XFF
CPD_ON_5 equ 0X7F
CPD_OFF_5 equ 0XFF
WRT0_ON_6 equ 0XFE
WRT0_OFF_6 equ 0XFF
WRT1_ON_6 equ 0XFD
WRT1_OFF_6 equ 0XFF
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
#define __18F24K20 1
#define XTAL 4
#define _CORE 16
#define _MAXRAM 768
#define _RAM_END 768
#define _MAXMEM 0X4000
#define _ADC 11
#define _ADC_RES 10
#define _EEPROM 256
#define RAM_BANKS 3
#define _USART 1
#define _USB 0
#define _USB#RAM_START 0
#define _FLASH 1
#define _CWRITE_BLOCK 32
#define BANK0_START 96
#define BANK0_END 255
#define BANK1_START 256
#define BANK1_END 511
#define BANK2_START 512
#define BANK2_END 767
#define bankA_Start 0
#define bankA_End 95
#define _SYSTEM_VARIABLE_COUNT 16
ram_bank = 0
#define LCD#TYPE 0
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
GEN = 0
PBP#VAR0 = 1
PBP#VAR0H = 2
PBP#VAR0HH = 3
PBP#VAR0HHH = 4
PP0 = 5
PP0H = 6
PP1 = 7
PP1H = 8
PP2 = 9
PP2H = 10
PP3 = 11
PP3H = 12
PP4 = 13
PP4H = 14
PP5 = 15
FREK1 = 16
FREK1H = 17
FREK2 = 18
FREK2H = 19
STP = 20
STPH = 21
REF = 22
REFH = 23
_A = 24
_AH = 25
_N = 26
_NH = 27
_R = 28
_RH = 29
_X = 30
_XH = 31
PRE = 32
PRE2 = 33
DataOut = 34
DataOutH = 35
DataOutHH = 36
DataOutHHH = 37
sayac = 38
DutyCycle = 39
Sayi = 40
#define __CCP1_PIN PORTC,2
#define AGC8317in PORTA,1
#define ACS714_5V PORTA,2
#define pllLD PORTA,3
#define TPS2421en PORTA,4
#define PWRled PORTA,5
#define mySCL2 PORTB,1
#define mySDA2 PORTB,2
#define pllCLK PORTB,3
#define pllDATA PORTB,4
#define pllLE PORTB,5
#define pllPSRF PORTB,6
#define pllPSIF PORTB,7
#define LD29300enable PORTC,0
#define TPS3823WDI PORTC,1
#define AD8317AGCset PORTC,2
#define mySCL1 PORTB,3
#define mySDA1 PORTB,4
#define AD8317final PORTC,7
#define __XTAL 4
proton#code#start
        org 0
        goto proton#main#start
        org 8
__HPWM_
        movwf 14,0
        movlw 66
        movwf 5,0
        movlw 15
        movwf 6,0
        call __DIVIDE_U1616_
        btfsc 4056,2,0
        bcf 4042,PP_T2CKPS0,0
        btfss 4056,2,0
        bsf 4042,PP_T2CKPS0,0
        addlw 252
        btfss 4056,0,0
        bcf 4042,PP_T2CKPS1,0
        btfsc 4056,0,0
        bsf 4042,PP_T2CKPS1,0
        movlw 64
        movwf 5,0
        movlw 66
        movwf 6,0
        movlw 15
        movwf 9,0
        clrf 10,0
        btfsc 4042,PP_T2CKPS0,0
        rcall HPW@2S
        btfsc 4042,PP_T2CKPS1,0
        rcall HPW@2S
        call __DIVIDE_INT_U1616_
        decf 5,W,0
        movwf 4043,0
        movff 5,7
        movff 6,8
        movf 0,W,0
        movwf 11,0
        movwf 12,0
        incfsz 0,W,0
        clrf 12,0
        call __MULTIPLY_U1616_
        movf 10,W,0
        decfsz 14,F,0
        bra HPW@SK1
        movwf 4030,0
        movlw 12
        movwf 4029,0
        btfsc 9,7,0
        bsf 4029,5,0
        btfsc 9,6,0
        bsf 4029,4,0
        bcf TRISC,2,0
HPWM@FIN
        bsf 4042,PP_TMR2ON,0
        return
HPW@SK1
        movwf 4027,0
        movlw 12
        movwf 4026,0
        btfsc 9,7,0
        bsf 4026,5,0
        btfsc 9,6,0
        bsf 4026,4,0
        bcf TRISC,1,0
        bra HPWM@FIN
HPW@2S
        rcall HPW@2L
HPW@2L
        bcf 4056,0,0
        rrcf 9,F,0
        rrcf 6,F,0
        rrcf 5,F,0
        return
__DELAY_MS_
        clrf 8,0
__DELAY_MS_W_
        movwf 7,0
DLY@P
        movlw 255
        addwf 7,F,0
        addwfc 8,F,0
        bra $ + 2
        btfss 4056,0,0
        return
        movlw 3
        movwf 6,0
        movlw 222
        rcall __DELAY_US_W_
        bra DLY@P
__DELAY_US_
        clrf 6,0
__DELAY_US_W_
        addlw 233
        movwf 5,0
        movlw 252
        bnc $ + 12
        nop
        nop
        addwf 5,F,0
        bc $ - 4
        nop
        addwf 5,F,0
        decf 6,F,0
        bc $ - 12
        btfsc 5,0,0
        bra $ + 2
        btfss 5,1,0
        bra $ + 6
        bra $ + 2
        nop
        return
__DIVIDE_U1616_
        clrf 10,0
        clrf 9,0
__DIVIDE_INT_U1616_
        movlw 16
        movwf 4083,0
DV@LP
        rlcf 6,W,0
        rlcf 9,F,0
        rlcf 10,F,0
        movf 7,W,0
        subwf 9,W,0
        movf 8,W,0
        subwfb 10,W,0
        bnc D@K
        movf 7,W,0
        subwf 9,F,0
        movf 8,W,0
        subwfb 10,F,0
        bsf 4056,0,0
D@K
        rlcf 5,F,0
        rlcf 6,F,0
        decfsz 4083,F,0
        bra DV@LP
        movf 5,W,0
        return
__MULTIPLY_U1616_
        movf 7,W,0
        mulwf 11,0
        movff 4083,9
        movff 4084,10
        movf 8,W,0
        mulwf 11,0
        movf 4083,W,0
        addwf 10,F,0
        movf 7,W,0
        mulwf 12,0
        movf 4083,W,0
        addwf 10,F,0
        movf 9,W,0
        return
proton#main#start
        movlb 0
F2_SOF equ $ ; TRANSTEST.PRP
F2_EOF equ $ ; TRANSTEST.PRP
F1_SOF equ $ ; TRANSTEST.BAS
F1_000054 equ $ ; IN [TRANSTEST.BAS] ALL_DIGITAL   = TRUE
        clrf CM1CON0,0
        clrf CM2CON0,0
        clrf ANSEL,0
        clrf ANSELH,0
        movlw 15
        movwf ADCON1,0
F1_000060 equ $ ; IN [TRANSTEST.BAS] TRISA.0 = 1
        bsf TRISA,0,0
F1_000061 equ $ ; IN [TRANSTEST.BAS] TRISA.1 = 1
        bsf TRISA,1,0
F1_000062 equ $ ; IN [TRANSTEST.BAS] TRISA.2 = 1
        bsf TRISA,2,0
F1_000063 equ $ ; IN [TRANSTEST.BAS] TRISA.3 = 1
        bsf TRISA,3,0
F1_000064 equ $ ; IN [TRANSTEST.BAS] TRISA.4 = 0
        bcf TRISA,4,0
F1_000065 equ $ ; IN [TRANSTEST.BAS] TRISA.5 = 0
        bcf TRISA,5,0
F1_000067 equ $ ; IN [TRANSTEST.BAS] TRISB.0 = 1
        bsf TRISB,0,0
F1_000068 equ $ ; IN [TRANSTEST.BAS] TRISB.1 = 1
        bsf TRISB,1,0
F1_000069 equ $ ; IN [TRANSTEST.BAS] TRISB.2 = 1
        bsf TRISB,2,0
F1_000070 equ $ ; IN [TRANSTEST.BAS] TRISB.3 = 0
        bcf TRISB,3,0
F1_000071 equ $ ; IN [TRANSTEST.BAS] TRISB.4 = 0
        bcf TRISB,4,0
F1_000072 equ $ ; IN [TRANSTEST.BAS] TRISB.5 = 0
        bcf TRISB,5,0
F1_000073 equ $ ; IN [TRANSTEST.BAS] TRISB.6 = 0
        bcf TRISB,6,0
F1_000074 equ $ ; IN [TRANSTEST.BAS] TRISB.6 = 0
        bcf TRISB,6,0
F1_000076 equ $ ; IN [TRANSTEST.BAS] TRISC.0 = 0
        bcf TRISC,0,0
F1_000077 equ $ ; IN [TRANSTEST.BAS] TRISC.1 = 0
        bcf TRISC,1,0
F1_000078 equ $ ; IN [TRANSTEST.BAS] TRISC.2 = 0
        bcf TRISC,2,0
F1_000079 equ $ ; IN [TRANSTEST.BAS] TRISC.3 = 1
        bsf TRISC,3,0
F1_000080 equ $ ; IN [TRANSTEST.BAS] TRISC.4 = 1
        bsf TRISC,4,0
F1_000081 equ $ ; IN [TRANSTEST.BAS] TRISC.5 = 1
        bsf TRISC,5,0
F1_000082 equ $ ; IN [TRANSTEST.BAS] TRISC.6 = 1
        bsf TRISC,6,0
F1_000083 equ $ ; IN [TRANSTEST.BAS] TRISC.7 = 0
        bcf TRISC,7,0
F1_000122 equ $ ; IN [TRANSTEST.BAS] LOW PLLPSRF
        bcf TRISB,6,0
        bcf LATB,6,0
F1_000123 equ $ ; IN [TRANSTEST.BAS] LOW PLLPSIF
        bcf TRISB,7,0
        bcf LATB,7,0
F1_000124 equ $ ; IN [TRANSTEST.BAS] LOW  TPS2421EN
        bcf TRISA,4,0
        bcf LATA,4,0
F1_000125 equ $ ; IN [TRANSTEST.BAS] HIGH LD29300ENABLE
        bcf TRISC,0,0
        bsf LATC,0,0
F1_000126 equ $ ; IN [TRANSTEST.BAS] LOW PLLLE
        bcf TRISB,5,0
        bcf LATB,5,0
F1_000127 equ $ ; IN [TRANSTEST.BAS] HIGH PLLPSRF
        bcf TRISB,6,0
        bsf LATB,6,0
F1_000128 equ $ ; IN [TRANSTEST.BAS] HIGH PLLPSIF
        bcf TRISB,7,0
        bsf LATB,7,0
F1_000132 equ $ ; IN [TRANSTEST.BAS] DUTYCYCLE = 0
        clrf DutyCycle,0
F1_000135 equ $ ; IN [TRANSTEST.BAS] HPWM 1,10,2000
        movlw 10
        movwf GEN,0
        movlw 7
        movwf PP1H,0
        movlw 208
        movwf PP1,0
        movlw 1
        f@call __HPWM_
Main
F1_000143 equ $ ; IN [TRANSTEST.BAS] DATAOUT =  %000000000000000100110000010000
        clrf DataOutHHH,0
        clrf DataOutHH,0
        movlw 76
        movwf DataOutH,0
        movlw 16
        movwf DataOut,0
F1_000144 equ $ ; IN [TRANSTEST.BAS] GOSUB PLLGONDER
        f@call Pllgonder
F1_000147 equ $ ; IN [TRANSTEST.BAS] DATAOUT =  %000000001101100000011110101101
        clrf DataOutHHH,0
        movlw 54
        movwf DataOutHH,0
        movlw 7
        movwf DataOutH,0
        movlw 173
        movwf DataOut,0
F1_000148 equ $ ; IN [TRANSTEST.BAS] GOSUB     PLLGONDER
        f@call Pllgonder
F1_000153 equ $ ; IN [TRANSTEST.BAS] DATAOUT =  %000000010000000010100000010000
        clrf DataOutHHH,0
        movlw 64
        movwf DataOutHH,0
        movlw 40
        movwf DataOutH,0
        movlw 16
        movwf DataOut,0
F1_000154 equ $ ; IN [TRANSTEST.BAS] GOSUB PLLGONDER
        f@call Pllgonder
F1_000157 equ $ ; IN [TRANSTEST.BAS] DATAOUT =  %000000011011111101010011011000
        clrf DataOutHHH,0
        movlw 111
        movwf DataOutHH,0
        movlw 212
        movwf DataOutH,0
        movlw 216
        movwf DataOut,0
F1_000158 equ $ ; IN [TRANSTEST.BAS] GOSUB     PLLGONDER
        f@call Pllgonder
F1_000162 equ $ ; IN [TRANSTEST.BAS] DELAYMS 1000
        movlw 3
        movwf PP1H,0
        movlw 232
        f@call __DELAY_MS_W_
F1_000164 equ $ ; IN [TRANSTEST.BAS] FOR SAYI = 1 TO 5
        movlw 1
        movwf Sayi,0
FR@LB2
        movlw 6
        cpfslt Sayi,0
        f@jump NX@LB3
F1_000165 equ $ ; IN [TRANSTEST.BAS] DELAYMS 1000
        movlw 3
        movwf PP1H,0
        movlw 232
        f@call __DELAY_MS_W_
CT@LB4
F1_000166 equ $ ; IN [TRANSTEST.BAS] NEXT SAYI
        incf Sayi,F,0
        btfss STATUS,0,0
        go@to FR@LB2
NX@LB3
F1_000167 equ $ ; IN [TRANSTEST.BAS] TOGGLE TPS3823WDI
        btg PORTC,1,0
        bcf TRISC,1,0
F1_000169 equ $ ; IN [TRANSTEST.BAS] GOTO MAIN
        f@jump Main
Pllgonder
F1_000182 equ $ ; IN [TRANSTEST.BAS] FOR SAYAC = 1 TO 23
        movlw 1
        movwf sayac,0
FR@LB5
        movlw 24
        cpfslt sayac,0
        f@jump NX@LB6
F1_000183 equ $ ; IN [TRANSTEST.BAS] LOW PLLDATA
        bcf TRISB,4,0
        bcf LATB,4,0
F1_000184 equ $ ; IN [TRANSTEST.BAS] IF (DATAOUT & 1) = 1 THEN HIGH PLLDATA
        movlw 1
        andwf DataOut,W,0
        clrf PBP#VAR0HHH,0
        clrf PBP#VAR0HH,0
        clrf PBP#VAR0H,0
        movwf PBP#VAR0,0
        decf PBP#VAR0,W,0
        iorwf PBP#VAR0H,W,0
        iorwf PBP#VAR0HH,W,0
        iorwf PBP#VAR0HHH,W,0
        btfss STATUS,2,0
        go@to BC@LL9
        bcf TRISB,4,0
        bsf LATB,4,0
BC@LL9
F1_000185 equ $ ; IN [TRANSTEST.BAS] DATAOUT = DATAOUT >> 1
        bcf STATUS,0,0
        rrcf DataOutHHH,F,0
        rrcf DataOutHH,F,0
        rrcf DataOutH,F,0
        rrcf DataOut,F,0
F1_000186 equ $ ; IN [TRANSTEST.BAS] DELAYUS 10
        movlw 3
        decfsz WREG,F,0
        bra $ - 2
        nop
        nop
F1_000187 equ $ ; IN [TRANSTEST.BAS] HIGH PLLCLK
        bcf TRISB,3,0
        bsf LATB,3,0
F1_000188 equ $ ; IN [TRANSTEST.BAS] DELAYUS 10
        movlw 3
        decfsz WREG,F,0
        bra $ - 2
        nop
        nop
F1_000189 equ $ ; IN [TRANSTEST.BAS] LOW PLLCLK
        bcf TRISB,3,0
        bcf LATB,3,0
F1_000190 equ $ ; IN [TRANSTEST.BAS] DELAYUS 10
        movlw 3
        decfsz WREG,F,0
        bra $ - 2
        nop
        nop
CT@LB7
F1_000191 equ $ ; IN [TRANSTEST.BAS] NEXT SAYAC
        incf sayac,F,0
        btfss STATUS,0,0
        go@to FR@LB5
NX@LB6
F1_000193 equ $ ; IN [TRANSTEST.BAS] HIGH PLLLE
        bcf TRISB,5,0
        bsf LATB,5,0
F1_000194 equ $ ; IN [TRANSTEST.BAS] DELAYUS 10
        movlw 3
        decfsz WREG,F,0
        bra $ - 2
        nop
        nop
F1_000195 equ $ ; IN [TRANSTEST.BAS] LOW PLLLE
        bcf TRISB,5,0
        bcf LATB,5,0
F1_000196 equ $ ; IN [TRANSTEST.BAS] DELAYUS 10
        movlw 3
        decfsz WREG,F,0
        bra $ - 2
        nop
        nop
F1_000198 equ $ ; IN [TRANSTEST.BAS] RETURN
        return 0
F1_EOF equ $ ; TRANSTEST.BAS
PB@LB10
        bra PB@LB10
__EOF
config FOSC = XT
config FCMEN = off
config IESO = off
config BOREN = SBORDIS
config WDTEN = off
config WDTPS = 128
config STVREN = off
config LVP = off
config CP0 = off
config CP1 = off
config CPB = off
config CPD = off
config WRT0 = off
config WRT1 = off
config WRTB = off
config WRTC = off
config WRTD = off
config EBTR0 = off
config EBTR1 = off
config EBTRB = off
        end
