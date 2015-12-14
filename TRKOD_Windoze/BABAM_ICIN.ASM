;----------------------------------------------------------
; Code Produced by the PROTON+ Compiler. Version 3.2.5.5
; Copyright Rosetta Technologies/Crownhill Associates
; Written by Les Johnson. February 2007
;----------------------------------------------------------
 NOLIST
 #include "C:\DOCUMENTS AND SETTINGS\METALMAN\DESKTOP\BABAM_ICIN.PBP"
 LIST

 MODE = 60
 SAYI = 61
 ILKKEZ = 62
 SURE1 = 63
 SURE2 = 64
 SURE3 = 65
 LCD_V = 66
 Variable LCD_V#0=66,LCD_V#1=67,LCD_V#2=68,LCD_V#3=69
 LCD_V1 = 70
 Variable LCD_V1#0=70,LCD_V1#1=71,LCD_V1#2=72,LCD_V1#3=73
 Variable LCD_V1#4=74
 LCD_A = 75
 Variable LCD_A#0=75,LCD_A#1=76,LCD_A#2=77,LCD_A#3=78
 Variable LCD_A#4=79
 LCD_A1 = 80
 Variable LCD_A1#0=80,LCD_A1#1=81,LCD_A1#2=82,LCD_A1#3=83
 Variable LCD_A1#4=84
 BUTON_OLD = 85
 BUTON_NEW = 86
 DCNT = 87
 BTNSURE = 89
 VOLT_ORT = 90
 VOLT_ORTH = 91
 Variable VOLT_ORT#0=90,VOLT_ORT#0H=91,VOLT_ORT#1=92,VOLT_ORT#1H=93
 Variable VOLT_ORT#2=94,VOLT_ORT#2H=95,VOLT_ORT#3=96,VOLT_ORT#3H=97
 Variable VOLT_ORT#4=98,VOLT_ORT#4H=99,VOLT_ORT#5=100,VOLT_ORT#5H=101
 Variable VOLT_ORT#6=102,VOLT_ORT#6H=103,VOLT_ORT#7=104,VOLT_ORT#7H=105
 VOLT_AYARLANAN = 106
 VOLT_AYARLANANH = 107
 P_VOLT_AYARLANAN = 108
 P_VOLT_AYARLANANH = 109
 VOLT_OKUNAN = 110
 VOLT_OKUNANH = 111
 VOLT_OKUNAN_OLD = 112
 VOLT_OKUNAN_OLDH = 113
 VOLT_ORTALAMA_OLD = 114
 VOLT_ORTALAMA_OLDH = 115
 VOLT_TOPLAM = 116
 VOLT_TOPLAMH = 117
 VOLT_TOPLAMHH = 118
 VOLT_TOPLAMHHH = 119
 VOLT_ORTALAMA = 120
 VOLT_ORTALAMAH = 121
 AKIM_ORT = 122
 AKIM_ORTH = 123
 Variable AKIM_ORT#0=122,AKIM_ORT#0H=123,AKIM_ORT#1=160,AKIM_ORT#1H=161
 Variable AKIM_ORT#2=162,AKIM_ORT#2H=163,AKIM_ORT#3=164,AKIM_ORT#3H=165
 Variable AKIM_ORT#4=166,AKIM_ORT#4H=167,AKIM_ORT#5=168,AKIM_ORT#5H=169
 Variable AKIM_ORT#6=170,AKIM_ORT#6H=171,AKIM_ORT#7=172,AKIM_ORT#7H=173
 AKIM_AYARLANAN = 174
 AKIM_AYARLANANH = 175
 P_AKIM_AYARLANAN = 176
 P_AKIM_AYARLANANH = 177
 AKIM_OKUNAN = 179
 AKIM_OKUNANH = 180
 AKIM_OKUNAN_OLD = 181
 AKIM_OKUNAN_OLDH = 182
 AKIM_ORTALAMA_OLD = 183
 AKIM_ORTALAMA_OLDH = 184
 AKIM_TOPLAM = 185
 AKIM_TOPLAMH = 186
 AKIM_TOPLAMHH = 187
 AKIM_TOPLAMHHH = 188
 AKIM_ORTALAMA = 189
 AKIM_ORTALAMAH = 190
 SAYOKU = 191
 ADBEKLET = 192
 V1 = 193
 V1H = 194
 A1 = 195
 A1H = 196
 AYARSEC = 197
 VAAYAR = 198
 AAAYAR = 199
 VMAYAR = 200
 AMAYAR = 201
 VADIM = 202
 AADIM = 203
	#Define VASEC _B#VR1,0
	#Define VASECYAZ _B#VR1,1
	#Define PILVASEC _B#VR1,2
	#Define PILVASECYAZ _B#VR1,3
	#Define BTNTGGL _B#VR1,4
	#Define VOLT_AYARLANAN_YAZ _B#VR1,5
	#Define P_VOLT_AYARLANAN_YAZ _B#VR1,6
	#Define AKIM_AYARLANAN_YAZ _B#VR1,7
	#Define P_AKIM_AYARLANAN_YAZ _B#VR2,0
	#Define AKIM_LATCH _B#VR2,1
	#Define AYARYAZ _B#VR2,2
	#Define __LCD_DTPORT PORTC
	#Define __LCD_ENPORT PORTA
	#Define __LCD_RSPORT PORTC
	#Define LCD_RW PORTC,0
F2_SOF equ $ ; BABAM_ICIN.PRP
F2_EOF equ $ ; BABAM_ICIN.PRP
F1_SOF equ $ ; BABAM_ICIN.BAS
F1_000020 equ $ ; in [BABAM_ICIN.BAS] ALL_DIGITAL   = true
	Movlw 7
	Bsf STATUS,5
ram_bank = 1
	Movwf CMCON
	Movlw 7
	Movwf ADCON1
F1_000023 equ $ ; in [BABAM_ICIN.BAS] GoTo Set_Registers
	Bcf STATUS,5
ram_bank = 0
	F@Jump SET_REGISTERS
SET_VARIABLES
F1_000094 equ $ ; in [BABAM_ICIN.BAS] Clear 'tum degiskenleri sifirla
	Movlw 32
	Movwf FSR
	Movlw 92
	F@Call cl@r
	Movlw 160
	Movwf FSR
	Movlw 80
	F@Call cl@r
	Movlw 16
	Movwf FSR
	Movlw 96
	F@Call cl@rh
	Movlw 144
	Movwf FSR
	Movlw 96
	F@Call cl@rh
F1_000096 equ $ ; in [BABAM_ICIN.BAS] p_akim_ayarlanan = 700
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Movwf P_AKIM_AYARLANANH
	Movlw 188
	Movwf P_AKIM_AYARLANAN
F1_000097 equ $ ; in [BABAM_ICIN.BAS] p_volt_ayarlanan = 48
	Bcf STATUS,5
ram_bank = 0
	Clrf P_VOLT_AYARLANANH
	Movlw 48
	Movwf P_VOLT_AYARLANAN
F1_000109 equ $ ; in [BABAM_ICIN.BAS] GoTo Memory_Defaults
	F@Jump MEMORY_DEFAULTS
F1_000114 equ $ ; in [BABAM_ICIN.BAS] Disable
INT_SUB
F1_000118 equ $ ; in [BABAM_ICIN.BAS] If INTCON.3 = 1 Then INTCON.3 = 0 'clear PBIF 'PortB0 Change Interrupt
	set@page bc@LL2
	Btfss INTCON,3
	Goto bc@LL2
	Bcf INTCON,3
bc@LL2
F1_000120 equ $ ; in [BABAM_ICIN.BAS] If INTCON.0 = 1 Then   'portb change interrupt flag
	set@page bc@LL4
	Btfss INTCON,0
	Goto bc@LL4
F1_000121 equ $ ; in [BABAM_ICIN.BAS] INTCON.0 = 0
	Bcf INTCON,0
F1_000127 equ $ ; in [BABAM_ICIN.BAS] If PORTB.5 = 0 Then BtnTggl = 1
	set@page bc@LL6
	Btfsc PORTB,5
	Goto bc@LL6
	Bsf _B#VR1,4
bc@LL6
F1_000128 equ $ ; in [BABAM_ICIN.BAS] If PORTB.5 = 1 And BtnTggl = 1 Then
	Clrw
	Btfsc PORTB,5
	Movlw 1
	Movwf SP#P9
	Clrw
	Btfsc _B#VR1,4
	Movlw 1
	Andwf SP#P9,W
	set@page bc@LL8
	Btfsc STATUS,2
	Goto bc@LL8
F1_000129 equ $ ; in [BABAM_ICIN.BAS] If Mode = 0 Then VAsec   = VAsec + 1    'normal ekran Volt/akim secimi
	Movf MODE,F
	set@page bc@LL10
	Btfss STATUS,2
	Goto bc@LL10
	Bcf STATUS,1
	Btfss _B#VR1,0
	Bsf STATUS,1
	Btfsc STATUS,1
	Bsf _B#VR1,0
	Btfss STATUS,1
	Bcf _B#VR1,0
bc@LL10
F1_000130 equ $ ; in [BABAM_ICIN.BAS] If Mode = 1 Then PilVAsec = PilVAsec + 1    'Pilin AKim Voltaj secimi
	Movlw 1
	Subwf MODE,W
	set@page bc@LL12
	Btfss STATUS,2
	Goto bc@LL12
	Bcf STATUS,1
	Btfss _B#VR1,2
	Bsf STATUS,1
	Btfsc STATUS,1
	Bsf _B#VR1,2
	Btfss STATUS,1
	Bcf _B#VR1,2
bc@LL12
F1_000131 equ $ ; in [BABAM_ICIN.BAS] If Mode = 2 Then AyarSec = AyarSec + 1  'ayar ekrani secimleri
	Movlw 2
	Subwf MODE,W
	set@page bc@LL14
	Btfss STATUS,2
	Goto bc@LL14
	Bsf STATUS,5
ram_bank = 1
	Incf AYARSEC,F
bc@LL14
	Bcf STATUS,5
ram_bank = 0
F1_000132 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 4 Then AyarSec = 0
	Movlw 4
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL16
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL16
	Bsf STATUS,5
ram_bank = 1
	Clrf AYARSEC
bc@LL16
	Bcf STATUS,5
ram_bank = 0
F1_000133 equ $ ; in [BABAM_ICIN.BAS] VAsecyaz = 1 ' her halukarda donuste ekrani guncelle
	Bsf _B#VR1,1
F1_000134 equ $ ; in [BABAM_ICIN.BAS] AyarYaz  = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
F1_000135 equ $ ; in [BABAM_ICIN.BAS] PilVAsecyaz = 1
	Bcf STATUS,5
ram_bank = 0
	Bsf _B#VR1,3
F1_000136 equ $ ; in [BABAM_ICIN.BAS] BtnTggl = 0
	Bcf _B#VR1,4
F1_000137 equ $ ; in [BABAM_ICIN.BAS] BtnSure = 0 'butona basilma suresini de sifirla
	Clrf BTNSURE
F1_000138 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL8
F1_000140 equ $ ; in [BABAM_ICIN.BAS] buton_new = PORTB & %11000000
	Movlw 192
	Andwf PORTB,W
	Movwf BUTON_NEW
F1_000142 equ $ ; in [BABAM_ICIN.BAS] If buton_old = %00000000  Then    'bu satir  yuzey monte olan tip icin acik olacak (turuncu)
	Movf BUTON_OLD,F
	set@page bc@LL18
	Btfss STATUS,2
	Goto bc@LL18
F1_000143 equ $ ; in [BABAM_ICIN.BAS] If dcnt > 10 Then dcnt = 10 'yanlislikla artmis olma ihtimaline karsi
	Movlw 11
	Subwf DCNT,W
	set@page bc@LL20
	Btfss STATUS,0
	Goto bc@LL20
	Movlw 10
	Movwf DCNT
bc@LL20
F1_000144 equ $ ; in [BABAM_ICIN.BAS] If Mode = 0 Then 'Normal mode da isek, encoder Volt ve akim ayarlayaacak
	Movf MODE,F
	set@page bc@LL22
	Btfss STATUS,2
	Goto bc@LL22
F1_000145 equ $ ; in [BABAM_ICIN.BAS] If VAsec = 0 Then
	set@page bc@LL24
	Btfsc _B#VR1,0
	Goto bc@LL24
F1_000146 equ $ ; in [BABAM_ICIN.BAS] If volt_ayarlanan + (buton_new.7 * (dcnt) * VAdim) < 1023 Then volt_ayarlanan = volt_ayarlanan + (buton_new.7 * (dcnt) * VAdim)
	Movf VOLT_AYARLANANH,W
	Movwf PP7H
	Movf VOLT_AYARLANAN,W
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,7
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP7,W
	Addwf PP8,W
	Movwf PBP#VAR0
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Addwf PP8H,W
	Movwf PBP#VAR0H
	Movlw 3
	Subwf PBP#VAR0H,W
	Movlw 255
	Btfsc STATUS,2
	Subwf PBP#VAR0,W
	set@page bc@LL26
	Btfsc STATUS,0
	Goto bc@LL26
	Movf VOLT_AYARLANANH,W
	Movwf PP7H
	Movf VOLT_AYARLANAN,W
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,7
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP7,W
	Addwf PP8,W
	Movwf VOLT_AYARLANAN
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Addwf PP8H,W
	Movwf VOLT_AYARLANANH
bc@LL26
F1_000147 equ $ ; in [BABAM_ICIN.BAS] If volt_ayarlanan - (buton_new.6 * (dcnt) * VAdim) > 3    Then volt_ayarlanan = volt_ayarlanan - (buton_new.6 * (dcnt) * VAdim)
	Movf VOLT_AYARLANANH,W
	Movwf PP7H
	Movf VOLT_AYARLANAN,W
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,6
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP8,W
	Subwf PP7,W
	Movwf PBP#VAR0
	Movf PP8H,W
	Btfss STATUS,0
	Addlw 1
	Subwf PP7H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page cp@lb3
	Btfss STATUS,2
	Goto cp@lb3
	Movlw 4
	Subwf PBP#VAR0,W
	set@page bc@LL28
	Btfss STATUS,0
	Goto bc@LL28
cp@lb3
	Movf VOLT_AYARLANANH,W
	Movwf PP7H
	Movf VOLT_AYARLANAN,W
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,6
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP8,W
	Subwf PP7,W
	Movwf VOLT_AYARLANAN
	Movf PP8H,W
	Btfss STATUS,0
	Addlw 1
	Subwf PP7H,W
	Movwf VOLT_AYARLANANH
bc@LL28
F1_000148 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan_yaz = 1
	Bsf _B#VR1,5
	F@Jump bc@LL29
bc@LL24
F1_000149 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000150 equ $ ; in [BABAM_ICIN.BAS] If akim_ayarlanan + (buton_new.7 * (dcnt) * AAdim) < 1023 Then akim_ayarlanan = akim_ayarlanan + (buton_new.7 * (dcnt) * AAdim)
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,7
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP7,W
	Addwf PP8,W
	Movwf PBP#VAR0
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Addwf PP8H,W
	Movwf PBP#VAR0H
	Movlw 3
	Subwf PBP#VAR0H,W
	Movlw 255
	Btfsc STATUS,2
	Subwf PBP#VAR0,W
	set@page bc@LL31
	Btfsc STATUS,0
	Goto bc@LL31
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,7
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP7,W
	Addwf PP8,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANAN
	Bcf STATUS,5
ram_bank = 0
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Addwf PP8H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANANH
bc@LL31
	Bcf STATUS,5
ram_bank = 0
F1_000151 equ $ ; in [BABAM_ICIN.BAS] If akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim) > 3    Then akim_ayarlanan = akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim)
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,6
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP8,W
	Subwf PP7,W
	Movwf PBP#VAR0
	Movf PP8H,W
	Btfss STATUS,0
	Addlw 1
	Subwf PP7H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page cp@lb5
	Btfss STATUS,2
	Goto cp@lb5
	Movlw 4
	Subwf PBP#VAR0,W
	set@page bc@LL33
	Btfss STATUS,0
	Goto bc@LL33
cp@lb5
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,6
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP8,W
	Subwf PP7,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANAN
	Bcf STATUS,5
ram_bank = 0
	Movf PP8H,W
	Btfss STATUS,0
	Addlw 1
	Subwf PP7H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANANH
bc@LL33
	Bcf STATUS,5
ram_bank = 0
F1_000152 equ $ ; in [BABAM_ICIN.BAS] If akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim) < 4    Then akim_ayarlanan = 1 'en alt degere gelince bitir
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP7
	Clrw
	Btfsc BUTON_NEW,6
	Movlw 1
	Clrf PP8H
	Movwf PP8
	Clrf PP3H
	Movf DCNT,W
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AADIM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP8H,W
	Movwf PP1H
	Movf PP8,W
	Movwf PP1
	F@Call m@py
	Movwf PP8
	Movf PP2H,W
	Movwf PP8H
	Movf PP8,W
	Subwf PP7,W
	Movwf PBP#VAR0
	Movf PP8H,W
	Btfss STATUS,0
	Addlw 1
	Subwf PP7H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page bc@LL35
	Btfss STATUS,2
	Goto bc@LL35
	Movlw 4
	Subwf PBP#VAR0,W
	set@page bc@LL35
	Btfsc STATUS,0
	Goto bc@LL35
	Bsf STATUS,5
ram_bank = 1
	Clrf AKIM_AYARLANANH
	Movlw 1
	Movwf AKIM_AYARLANAN
bc@LL35
	Bcf STATUS,5
ram_bank = 0
F1_000153 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan_yaz = 1
	Bsf _B#VR1,7
F1_000154 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL29
	F@Jump bc@LL21
F1_000155 equ $ ; in [BABAM_ICIN.BAS] Else If Mode = 1 Then 'Pil Sarj modunda isek, encoder pilin Volt ve akimini ayarlayaacak
bc@LL22
	Movlw 1
	Subwf MODE,W
	set@page bc@LL36
	Btfss STATUS,2
	Goto bc@LL36
F1_000156 equ $ ; in [BABAM_ICIN.BAS] If PilVAsec = 1 Then
	set@page bc@LL38
	Btfss _B#VR1,2
	Goto bc@LL38
F1_000157 equ $ ; in [BABAM_ICIN.BAS] If p_volt_ayarlanan + (buton_new.7 * 12) < 240 Then p_volt_ayarlanan = p_volt_ayarlanan + (buton_new.7 * 12)
	Movlw 12
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7H
	Movf P_VOLT_AYARLANAN,W
	Addwf PP7,W
	Movwf PBP#VAR0
	Movf P_VOLT_AYARLANANH,W
	Btfsc STATUS,0
	Addlw 1
	Addwf PP7H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page bc@LL40
	Btfss STATUS,2
	Goto bc@LL40
	Movlw 240
	Subwf PBP#VAR0,W
	set@page bc@LL40
	Btfsc STATUS,0
	Goto bc@LL40
	Movlw 12
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7H
	Movf PP7,W
	Addwf P_VOLT_AYARLANAN,F
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Addwf P_VOLT_AYARLANANH,F
bc@LL40
F1_000158 equ $ ; in [BABAM_ICIN.BAS] If p_volt_ayarlanan - (buton_new.6 * 12) > 12  Then p_volt_ayarlanan = p_volt_ayarlanan - (buton_new.6 * 12)
	Movlw 12
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7H
	Movf PP7,W
	Subwf P_VOLT_AYARLANAN,W
	Movwf PBP#VAR0
	Movf PP7H,W
	Btfss STATUS,0
	Addlw 1
	Subwf P_VOLT_AYARLANANH,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page cp@lb8
	Btfss STATUS,2
	Goto cp@lb8
	Movlw 13
	Subwf PBP#VAR0,W
	set@page bc@LL42
	Btfss STATUS,0
	Goto bc@LL42
cp@lb8
	Movlw 12
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7H
	Movf PP7,W
	Subwf P_VOLT_AYARLANAN,F
	Movf PP7H,W
	Btfss STATUS,0
	Addlw 1
	Subwf P_VOLT_AYARLANANH,F
bc@LL42
F1_000159 equ $ ; in [BABAM_ICIN.BAS] p_volt_ayarlanan_yaz = 1
	Bsf _B#VR1,6
	F@Jump bc@LL43
bc@LL38
F1_000160 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000161 equ $ ; in [BABAM_ICIN.BAS] If p_akim_ayarlanan + (buton_new.7 * 50) < 10000 Then p_akim_ayarlanan = p_akim_ayarlanan + (buton_new.7 * 50)
	Movlw 50
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Addwf PP7,W
	Movwf PBP#VAR0
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Btfsc STATUS,0
	Addlw 1
	Bcf STATUS,5
ram_bank = 0
	Addwf PP7H,W
	Movwf PBP#VAR0H
	Movlw 39
	Subwf PBP#VAR0H,W
	Movlw 16
	Btfsc STATUS,2
	Subwf PBP#VAR0,W
	set@page bc@LL45
	Btfsc STATUS,0
	Goto bc@LL45
	Movlw 50
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,7
	Clrw
	Movwf PP7H
	Movf PP7,W
	Bsf STATUS,5
ram_bank = 1
	Addwf P_AKIM_AYARLANAN,F
	Bcf STATUS,5
ram_bank = 0
	Movf PP7H,W
	Btfsc STATUS,0
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Addwf P_AKIM_AYARLANANH,F
bc@LL45
	Bcf STATUS,5
ram_bank = 0
F1_000162 equ $ ; in [BABAM_ICIN.BAS] If p_akim_ayarlanan - (buton_new.6 * 50) > 50    Then p_akim_ayarlanan = p_akim_ayarlanan - (buton_new.6 * 50)
	Movlw 50
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7H
	Movf PP7,W
	Bsf STATUS,5
ram_bank = 1
	Subwf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PBP#VAR0
	Movf PP7H,W
	Btfss STATUS,0
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PBP#VAR0H
	Movf PBP#VAR0H,F
	set@page cp@lb10
	Btfss STATUS,2
	Goto cp@lb10
	Movlw 51
	Subwf PBP#VAR0,W
	set@page bc@LL47
	Btfss STATUS,0
	Goto bc@LL47
cp@lb10
	Movlw 50
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7
	Movlw 0
	Btfss BUTON_NEW,6
	Clrw
	Movwf PP7H
	Movf PP7,W
	Bsf STATUS,5
ram_bank = 1
	Subwf P_AKIM_AYARLANAN,F
	Bcf STATUS,5
ram_bank = 0
	Movf PP7H,W
	Btfss STATUS,0
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf P_AKIM_AYARLANANH,F
bc@LL47
	Bcf STATUS,5
ram_bank = 0
F1_000163 equ $ ; in [BABAM_ICIN.BAS] p_akim_ayarlanan_yaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,0
F1_000164 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL43
	Bcf STATUS,5
ram_bank = 0
	F@Jump bc@LL48
bc@LL36
F1_000165 equ $ ; in [BABAM_ICIN.BAS] Else 'Ayar Degistirme Modunda encoder'in gorevi secimleri ayarlamak
F1_000167 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 0 Then
	Bsf STATUS,5
ram_bank = 1
	Movf AYARSEC,F
	set@page bc@LL50
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL50
F1_000168 equ $ ; in [BABAM_ICIN.BAS] VAayar = VAayar + buton_new.7
	Bsf STATUS,5
ram_bank = 1
	Movf VAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,7
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Movwf VAAYAR
F1_000169 equ $ ; in [BABAM_ICIN.BAS] VAayar = VAayar - buton_new.6
	Movf VAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,6
	Addlw 255
	Bsf STATUS,5
ram_bank = 1
	Movwf VAAYAR
F1_000170 equ $ ; in [BABAM_ICIN.BAS] If VAayar > 2 Then VAayar = 0
	Movlw 3
	Subwf VAAYAR,W
	set@page bc@LL52
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL52
	Bsf STATUS,5
ram_bank = 1
	Clrf VAAYAR
bc@LL52
	Bcf STATUS,5
ram_bank = 0
F1_000171 equ $ ; in [BABAM_ICIN.BAS] AyarYaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
	Bcf STATUS,5
ram_bank = 0
	F@Jump bc@LL49
F1_000172 equ $ ; in [BABAM_ICIN.BAS] ElseIf AyarSec = 1 Then
bc@LL50
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL53
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL53
F1_000173 equ $ ; in [BABAM_ICIN.BAS] AAayar = AAayar + buton_new.7
	Bsf STATUS,5
ram_bank = 1
	Movf AAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,7
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Movwf AAAYAR
F1_000174 equ $ ; in [BABAM_ICIN.BAS] AAayar = AAayar - buton_new.6
	Movf AAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,6
	Addlw 255
	Bsf STATUS,5
ram_bank = 1
	Movwf AAAYAR
F1_000175 equ $ ; in [BABAM_ICIN.BAS] If AAayar > 2 Then AAayar = 0
	Movlw 3
	Subwf AAAYAR,W
	set@page bc@LL55
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL55
	Bsf STATUS,5
ram_bank = 1
	Clrf AAAYAR
bc@LL55
	Bcf STATUS,5
ram_bank = 0
F1_000176 equ $ ; in [BABAM_ICIN.BAS] AyarYaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
	Bcf STATUS,5
ram_bank = 0
	F@Jump bc@LL49
F1_000177 equ $ ; in [BABAM_ICIN.BAS] ElseIf AyarSec = 2 Then
bc@LL53
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL56
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL56
F1_000178 equ $ ; in [BABAM_ICIN.BAS] VMayar = VMayar + buton_new.7
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,7
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Movwf VMAYAR
F1_000179 equ $ ; in [BABAM_ICIN.BAS] VMayar = VMayar - buton_new.6
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,6
	Addlw 255
	Bsf STATUS,5
ram_bank = 1
	Movwf VMAYAR
F1_000180 equ $ ; in [BABAM_ICIN.BAS] If VMayar > 50 Then VMayar = 0
	Movlw 51
	Subwf VMAYAR,W
	set@page bc@LL58
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL58
	Bsf STATUS,5
ram_bank = 1
	Clrf VMAYAR
bc@LL58
	Bcf STATUS,5
ram_bank = 0
F1_000181 equ $ ; in [BABAM_ICIN.BAS] AyarYaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
	Bcf STATUS,5
ram_bank = 0
	F@Jump bc@LL49
F1_000182 equ $ ; in [BABAM_ICIN.BAS] ElseIf AyarSec = 3 Then
bc@LL56
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL59
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL59
F1_000183 equ $ ; in [BABAM_ICIN.BAS] AMayar = AMayar + buton_new.7
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,7
	Addlw 1
	Bsf STATUS,5
ram_bank = 1
	Movwf AMAYAR
F1_000184 equ $ ; in [BABAM_ICIN.BAS] AMayar = AMayar - buton_new.6
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Btfsc BUTON_NEW,6
	Addlw 255
	Bsf STATUS,5
ram_bank = 1
	Movwf AMAYAR
F1_000185 equ $ ; in [BABAM_ICIN.BAS] If AMayar > 30 Then AMayar = 0
	Movlw 31
	Subwf AMAYAR,W
	set@page bc@LL61
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL61
	Bsf STATUS,5
ram_bank = 1
	Clrf AMAYAR
bc@LL61
	Bcf STATUS,5
ram_bank = 0
F1_000186 equ $ ; in [BABAM_ICIN.BAS] AyarYaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
F1_000187 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL59
	Bcf STATUS,5
ram_bank = 0
bc@LL49
F1_000189 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL48
bc@LL21
F1_000190 equ $ ; in [BABAM_ICIN.BAS] dcnt = 10
	Movlw 10
	Movwf DCNT
F1_000191 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL18
F1_000192 equ $ ; in [BABAM_ICIN.BAS] buton_old = buton_new
	Movf BUTON_NEW,W
	Movwf BUTON_OLD
F1_000193 equ $ ; in [BABAM_ICIN.BAS] If volt_ayarlanan > 5000 Then volt_ayarlanan = 10 'yanlislikla - (eksi) degere gecersek diye
	Movlw 19
	Subwf VOLT_AYARLANANH,W
	set@page bc@LL63
	Btfss STATUS,0
	Goto bc@LL63
	set@page cp@lb11
	Btfss STATUS,2
	Goto cp@lb11
	Movlw 137
	Subwf VOLT_AYARLANAN,W
	set@page bc@LL63
	Btfss STATUS,0
	Goto bc@LL63
cp@lb11
	Clrf VOLT_AYARLANANH
	Movlw 10
	Movwf VOLT_AYARLANAN
bc@LL63
F1_000194 equ $ ; in [BABAM_ICIN.BAS] If akim_ayarlanan > 5000 Then akim_ayarlanan = 10
	Movlw 19
	Bsf STATUS,5
ram_bank = 1
	Subwf AKIM_AYARLANANH,W
	set@page bc@LL65
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL65
	set@page cp@lb12
	Btfss STATUS,2
	Goto cp@lb12
	Movlw 137
	Bsf STATUS,5
ram_bank = 1
	Subwf AKIM_AYARLANAN,W
	set@page bc@LL65
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL65
cp@lb12
	Bsf STATUS,5
ram_bank = 1
	Clrf AKIM_AYARLANANH
	Movlw 10
	Movwf AKIM_AYARLANAN
bc@LL65
	Bcf STATUS,5
ram_bank = 0
F1_000195 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL4
F1_000197 equ $ ; in [BABAM_ICIN.BAS] If INTCON.2 = 1 Then   'Timer0 Interrupt Flag
	set@page bc@LL67
	Btfss INTCON,2
	Goto bc@LL67
F1_000198 equ $ ; in [BABAM_ICIN.BAS] INTCON.2 = 0
	Bcf INTCON,2
F1_000199 equ $ ; in [BABAM_ICIN.BAS] adbeklet = adbeklet + 1
	Bsf STATUS,5
ram_bank = 1
	Incf ADBEKLET,F
F1_000200 equ $ ; in [BABAM_ICIN.BAS] If adbeklet = 10 Then adbeklet = 0
	Movlw 10
	Subwf ADBEKLET,W
	set@page bc@LL69
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL69
	Bsf STATUS,5
ram_bank = 1
	Clrf ADBEKLET
bc@LL69
	Bcf STATUS,5
ram_bank = 0
F1_000201 equ $ ; in [BABAM_ICIN.BAS] If ADCON0.2 = 0 And adbeklet = 0 Then ADCON0.2 = 1
	Movlw 1
	Btfsc ADCON0,2
	Clrw
	Movwf SP#P9
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Movf ADBEKLET,F
	Btfss STATUS,2
	Movlw 0
	Bcf STATUS,5
ram_bank = 0
	Andwf SP#P9,W
	set@page bc@LL71
	Btfsc STATUS,2
	Goto bc@LL71
	Bsf ADCON0,2
bc@LL71
F1_000202 equ $ ; in [BABAM_ICIN.BAS] If BtnTggl = 1 And BtnSure < 100 Then BtnSure = BtnSure + 1 Else BtnSure = 0
	Clrw
	Btfsc _B#VR1,4
	Movlw 1
	Movwf SP#P9
	Movlw 100
	Subwf BTNSURE,W
	Movlw 1
	Btfsc STATUS,0
	Clrw
	Andwf SP#P9,W
	set@page bc@LL73
	Btfsc STATUS,2
	Goto bc@LL73
	Incf BTNSURE,F
bc@LL73
F1_000203 equ $ ; in [BABAM_ICIN.BAS] If BtnSure > 99 Then
	Movlw 100
	Subwf BTNSURE,W
	set@page bc@LL75
	Btfss STATUS,0
	Goto bc@LL75
F1_000204 equ $ ; in [BABAM_ICIN.BAS] Mode = Mode + 1 'Menu Modu degistiriyoruz
	Incf MODE,F
F1_000205 equ $ ; in [BABAM_ICIN.BAS] If Mode = 3 Then Mode = 0
	Movlw 3
	Subwf MODE,W
	set@page bc@LL77
	Btfss STATUS,2
	Goto bc@LL77
	Clrf MODE
bc@LL77
F1_000206 equ $ ; in [BABAM_ICIN.BAS] BtnTggl = 0
	Bcf _B#VR1,4
F1_000207 equ $ ; in [BABAM_ICIN.BAS] BtnSure = 0
	Clrf BTNSURE
F1_000208 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL75
F1_000210 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL67
F1_000212 equ $ ; in [BABAM_ICIN.BAS] If PIR1.0 = 1 Then 'Timer1 interrupt routine
	set@page bc@LL79
	Btfss PIR1,0
	Goto bc@LL79
F1_000213 equ $ ; in [BABAM_ICIN.BAS] PIR1.0 = 0
	Bcf PIR1,0
F1_000214 equ $ ; in [BABAM_ICIN.BAS] TMR1H = $FF     'timer1 in sayma degerini azaltmak icin
	Movlw 255
	Movwf TMR1H
F1_000215 equ $ ; in [BABAM_ICIN.BAS] TMR1L = $00     'tmr1h ve tmr1l yi set ediyoruz interrupt icinde
	Clrf TMR1L
F1_000217 equ $ ; in [BABAM_ICIN.BAS] If dcnt > 1 Then dcnt = dcnt - 1 'ne kadar hizli donuyoruz onu anlamak icin
	Movlw 2
	Subwf DCNT,W
	set@page bc@LL81
	Btfss STATUS,0
	Goto bc@LL81
	Decf DCNT,F
bc@LL81
F1_000218 equ $ ; in [BABAM_ICIN.BAS] Sure1 = Sure1 + 1
	Incf SURE1,F
F1_000219 equ $ ; in [BABAM_ICIN.BAS] If Sure1 = 255 Then
	Incf SURE1,W
	set@page bc@LL83
	Btfss STATUS,2
	Goto bc@LL83
F1_000220 equ $ ; in [BABAM_ICIN.BAS] Sure2 = Sure2 + 1
	Incf SURE2,F
F1_000221 equ $ ; in [BABAM_ICIN.BAS] If Sure2 = 20 Then
	Movlw 20
	Subwf SURE2,W
	set@page bc@LL85
	Btfss STATUS,2
	Goto bc@LL85
F1_000222 equ $ ; in [BABAM_ICIN.BAS] VAsecyaz = 1            'ekranda saniyede bir refresh islemi yapmak icin
	Bsf _B#VR1,1
F1_000223 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan_yaz = 1
	Bsf _B#VR1,5
F1_000224 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan_yaz = 1
	Bsf _B#VR1,7
F1_000225 equ $ ; in [BABAM_ICIN.BAS] Sure2 = 0
	Clrf SURE2
F1_000227 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL85
F1_000228 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL83
F1_000229 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL79
F1_000231 equ $ ; in [BABAM_ICIN.BAS] If PIR1.6 = 1 Then                      'AD bitirdi
	set@page bc@LL87
	Btfss PIR1,6
	Goto bc@LL87
F1_000232 equ $ ; in [BABAM_ICIN.BAS] If ADCON0.3 = 0 Then
	set@page bc@LL89
	Btfsc ADCON0,3
	Goto bc@LL89
F1_000233 equ $ ; in [BABAM_ICIN.BAS] volt_okunan.BYTE0 = ADRESL  'veriyi oku
	Bsf STATUS,5
ram_bank = 1
	Movf ADRESL,W
	Bcf STATUS,5
ram_bank = 0
	Movwf VOLT_OKUNAN
F1_000234 equ $ ; in [BABAM_ICIN.BAS] volt_okunan.BYTE1 = ADRESH  'veriyi oku
	Movf ADRESH,W
	Movwf VOLT_OKUNANH
F1_000235 equ $ ; in [BABAM_ICIN.BAS] ADCON0.3 = 1                'simdi RA1 i oku
	Bsf ADCON0,3
F1_000236 equ $ ; in [BABAM_ICIN.BAS] If volt_okunan > volt_ayarlanan Then volt_okunan = volt_ayarlanan 'okunan deger ayarlananin ustune zaten cikamaz ama...
	Movf VOLT_OKUNANH,W
	Subwf VOLT_AYARLANANH,W
	set@page cp@lb13
	Btfss STATUS,0
	Goto cp@lb13
	set@page bc@LL91
	Btfss STATUS,2
	Goto bc@LL91
	Movf VOLT_OKUNAN,W
	Subwf VOLT_AYARLANAN,W
	set@page bc@LL91
	Btfsc STATUS,0
	Goto bc@LL91
cp@lb13
	Movf VOLT_AYARLANANH,W
	Movwf VOLT_OKUNANH
	Movf VOLT_AYARLANAN,W
	Movwf VOLT_OKUNAN
bc@LL91
F1_000237 equ $ ; in [BABAM_ICIN.BAS] volt_toplam = volt_toplam - volt_ort[SayOku]
	Bcf STATUS,0
	Bsf STATUS,5
ram_bank = 1
	Rlf SAYOKU,W
	Addlw VOLT_ORT
	Movwf FSR
	Movf INDF,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PBP#VAR0
	Incf FSR,F
	Movf INDF,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0,W
	Subwf VOLT_TOPLAM,F
	Movf PBP#VAR0H,W
	Btfss STATUS,0
	Incfsz PBP#VAR0H,W
	Subwf VOLT_TOPLAMH,F
	Clrw
	Btfss STATUS,0
	Movlw 1
	Subwf VOLT_TOPLAMHH,F
	Clrw
	Btfss STATUS,0
	Movlw 1
	Subwf VOLT_TOPLAMHHH,F
F1_000238 equ $ ; in [BABAM_ICIN.BAS] volt_ort[SayOku] = volt_okunan
	Bcf STATUS,0
	Bsf STATUS,5
ram_bank = 1
	Rlf SAYOKU,W
	Addlw VOLT_ORT
	Movwf FSR
	Bcf STATUS,5
ram_bank = 0
	Movf VOLT_OKUNAN,W
	Movwf INDF
	Incf FSR,F
	Movf VOLT_OKUNANH,W
	Movwf INDF
F1_000239 equ $ ; in [BABAM_ICIN.BAS] volt_toplam = volt_toplam + volt_ort[SayOku]
	Bcf STATUS,0
	Bsf STATUS,5
ram_bank = 1
	Rlf SAYOKU,W
	Addlw VOLT_ORT
	Movwf FSR
	Movf INDF,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PBP#VAR0
	Incf FSR,F
	Movf INDF,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0,W
	Addwf VOLT_TOPLAM,F
	Movf PBP#VAR0H,W
	Btfsc STATUS,0
	Incfsz PBP#VAR0H,W
	Addwf VOLT_TOPLAMH,F
	Movlw 0
	Btfsc STATUS,0
	Movlw 1
	Addwf VOLT_TOPLAMHH,F
	Movlw 0
	Btfsc STATUS,0
	Movlw 1
	Addwf VOLT_TOPLAMHHH,F
F1_000240 equ $ ; in [BABAM_ICIN.BAS] volt_ortalama = volt_toplam >> 2
	Movf VOLT_TOPLAMHHH,W
	Movwf PP2HHH
	Movf VOLT_TOPLAMHH,W
	Movwf PP2HH
	Movf VOLT_TOPLAMH,W
	Movwf PP2H
	Movf VOLT_TOPLAM,W
	Movwf PP2
	Movlw 2
	F@Call ll@slr
	Movf PP2H,W
	Movwf VOLT_ORTALAMAH
	Movf PP2,W
	Movwf VOLT_ORTALAMA
	F@Jump bc@LL88
F1_000241 equ $ ; in [BABAM_ICIN.BAS] ElseIf ADCON0.3 = 1 Then
bc@LL89
	set@page bc@LL92
	Btfss ADCON0,3
	Goto bc@LL92
F1_000242 equ $ ; in [BABAM_ICIN.BAS] akim_okunan.BYTE0 = ADRESL 'veriyi oku
	Bsf STATUS,5
ram_bank = 1
	Movf ADRESL,W
	Movwf AKIM_OKUNAN
F1_000243 equ $ ; in [BABAM_ICIN.BAS] akim_okunan.BYTE1 = ADRESH 'veriyi oku
	Bcf STATUS,5
ram_bank = 0
	Movf ADRESH,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_OKUNANH
F1_000244 equ $ ; in [BABAM_ICIN.BAS] ADCON0.3 = 0               'simdi RA0 i oku
	Bcf STATUS,5
ram_bank = 0
	Bcf ADCON0,3
F1_000245 equ $ ; in [BABAM_ICIN.BAS] akim_toplam = akim_toplam - akim_ort[SayOku]
	Movlw 122
	Movwf GEN3H
	Bsf STATUS,5
ram_bank = 1
	Movf SAYOKU,W
	Bcf STATUS,5
ram_bank = 0
	F@Call get@warray
	Movwf PBP#VAR0
	Movf PP0H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0,W
	Bsf STATUS,5
ram_bank = 1
	Subwf AKIM_TOPLAM,F
	Bcf STATUS,5
ram_bank = 0
	Movf PBP#VAR0H,W
	set@page E@LB2
	Btfsc STATUS,0
	Goto E@LB2
	Incf PBP#VAR0H,W
	set@page E@LB3
	Btfsc STATUS,2
	Goto E@LB3
E@LB2
	Bsf STATUS,5
ram_bank = 1
	Subwf AKIM_TOPLAMH,F
E@LB3
	Clrw
	Btfss STATUS,0
	Movlw 1
	Subwf AKIM_TOPLAMHH,F
	Clrw
	Btfss STATUS,0
	Movlw 1
	Subwf AKIM_TOPLAMHHH,F
F1_000246 equ $ ; in [BABAM_ICIN.BAS] akim_ort[SayOku] = akim_okunan
	Movf SAYOKU,W
	Bcf STATUS,5
ram_bank = 0
	Movwf GEN4H
	Movlw 122
	Movwf GEN4
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_OKUNANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP0
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_OKUNAN,W
	Bcf STATUS,5
ram_bank = 0
	F@Call put@warray
F1_000247 equ $ ; in [BABAM_ICIN.BAS] akim_toplam = akim_toplam + akim_ort[SayOku]
	Movlw 122
	Movwf GEN3H
	Bsf STATUS,5
ram_bank = 1
	Movf SAYOKU,W
	Bcf STATUS,5
ram_bank = 0
	F@Call get@warray
	Movwf PBP#VAR0
	Movf PP0H,W
	Movwf PBP#VAR0H
	Movf PBP#VAR0,W
	Bsf STATUS,5
ram_bank = 1
	Addwf AKIM_TOPLAM,F
	Bcf STATUS,5
ram_bank = 0
	Movf PBP#VAR0H,W
	Btfsc STATUS,0
	Incfsz PBP#VAR0H,W
	Bsf STATUS,5
ram_bank = 1
	Addwf AKIM_TOPLAMH,F
	Movlw 0
	Btfsc STATUS,0
	Movlw 1
	Addwf AKIM_TOPLAMHH,F
	Movlw 0
	Btfsc STATUS,0
	Movlw 1
	Addwf AKIM_TOPLAMHHH,F
F1_000248 equ $ ; in [BABAM_ICIN.BAS] akim_ortalama = akim_toplam >> 2
	Movf AKIM_TOPLAMHHH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2HHH
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_TOPLAMHH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2HH
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_TOPLAMH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_TOPLAM,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	Movlw 2
	F@Call ll@slr
	Movf PP2H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_ORTALAMAH
	Bcf STATUS,5
ram_bank = 0
	Movf PP2,W
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_ORTALAMA
F1_000249 equ $ ; in [BABAM_ICIN.BAS] SayOku = SayOku + 1
	Incf SAYOKU,F
F1_000250 equ $ ; in [BABAM_ICIN.BAS] If SayOku = 4 Then SayOku = 0 'her akim okumadan sonra sayaci arttir
	Movlw 4
	Subwf SAYOKU,W
	set@page bc@LL94
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL94
	Bsf STATUS,5
ram_bank = 1
	Clrf SAYOKU
bc@LL94
	Bcf STATUS,5
ram_bank = 0
F1_000251 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL92
bc@LL88
F1_000253 equ $ ; in [BABAM_ICIN.BAS] PIR1.6 = 0      'AD cevrim resetle
	Bcf PIR1,6
F1_000256 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL87
F1_000258 equ $ ; in [BABAM_ICIN.BAS] Enable
F1_000259 equ $ ; in [BABAM_ICIN.BAS] Context Restore
	Movf PSAVE,W
	Movwf PCLATH
	Movf FSRSAVE,W
	Movwf FSR
	Movf SSAVE,W
	Movwf STATUS
	Swapf WSAVE,F
	Swapf WSAVE,W
	Retfie
EKRANKUR
F1_000264 equ $ ; in [BABAM_ICIN.BAS] VAsecyaz = 1            'ekrana ilk acilis degerlerini yazdirmak icin
	Bsf _B#VR1,1
F1_000265 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan_yaz = 1
	Bsf _B#VR1,5
F1_000266 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan_yaz = 1
	Bsf _B#VR1,7
F1_000267 equ $ ; in [BABAM_ICIN.BAS] Cls
	F@Call Lcd@Cls
F1_000268 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000269 equ $ ; in [BABAM_ICIN.BAS] Mode = 0 'sistemi normal mode'a getir
	Clrf MODE
F1_000270 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1, "A:  0.0V  0.00A "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb1 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb1 & 255)
	F@Call c@strout
F1_000271 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1, "O:  0.0V  0.00A "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb2 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb2 & 255)
	F@Call c@strout
ANAPROGRAM
F1_000273 equ $ ; in [BABAM_ICIN.BAS] If Mode = 0 Then 'Normal Sistem Modu
	Movf MODE,F
	set@page bc@LL96
	Btfss STATUS,2
	Goto bc@LL96
F1_000274 equ $ ; in [BABAM_ICIN.BAS] If Sure2 = 0 Then 'sabit nesneler icinekran tazeleme suremiz
	Movf SURE2,F
	set@page bc@LL98
	Btfss STATUS,2
	Goto bc@LL98
F1_000275 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1, "A:" : Print At 1,6,"." : Print At 1,8,"V"  : Print At 1,12,"." : Print At 1,15,"A"   'Ekrandaki sabit nesleri yenile
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw 65
	F@Call Print
	Movlw 58
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 133
	F@Call LCD@crs
	Movlw 46
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 86
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 139
	F@Call LCD@crs
	Movlw 46
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 142
	F@Call LCD@crs
	Movlw 65
	F@Call Print
F1_000276 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1, "O:" : Print At 2,6,"." : Print At 2,8,"V " : Print At 2,12,"." : Print At 2,15,"A "  'Ekrandaki sabit nesleri yenile
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 79
	F@Call Print
	Movlw 58
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 197
	F@Call LCD@crs
	Movlw 46
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw 86
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 203
	F@Call LCD@crs
	Movlw 46
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 206
	F@Call LCD@crs
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000277 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL98
F1_000278 equ $ ; in [BABAM_ICIN.BAS] If VAsec = 0  Then 'And VAsecyaz = 1 Then
	set@page bc@LL100
	Btfsc _B#VR1,0
	Goto bc@LL100
F1_000279 equ $ ; in [BABAM_ICIN.BAS] Print At 1,3 , 201
	Movlw 128
	Movwf BPFH
	Movlw 130
	F@Call LCD@crs
	Movlw 201
	F@Call Print
F1_000280 equ $ ; in [BABAM_ICIN.BAS] Print At 1,9 , 200
	Movlw 128
	Movwf BPFH
	Movlw 136
	F@Call LCD@crs
	Movlw 200
	F@Call Print
F1_000281 equ $ ; in [BABAM_ICIN.BAS] Print At 1,16, " "
	Movlw 128
	Movwf BPFH
	Movlw 143
	F@Call LCD@crs
	Movlw 32
	F@Call Print
F1_000282 equ $ ; in [BABAM_ICIN.BAS] VAsecyaz = 0
	Bcf _B#VR1,1
F1_000283 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL100
F1_000284 equ $ ; in [BABAM_ICIN.BAS] If VAsec = 1  Then 'And VAsecyaz = 1 Then
	set@page bc@LL102
	Btfss _B#VR1,0
	Goto bc@LL102
F1_000285 equ $ ; in [BABAM_ICIN.BAS] Print At 1,3 , " "
	Movlw 128
	Movwf BPFH
	Movlw 130
	F@Call LCD@crs
	Movlw 32
	F@Call Print
F1_000286 equ $ ; in [BABAM_ICIN.BAS] Print At 1,9 , 201
	Movlw 128
	Movwf BPFH
	Movlw 136
	F@Call LCD@crs
	Movlw 201
	F@Call Print
F1_000287 equ $ ; in [BABAM_ICIN.BAS] Print At 1,16, 200
	Movlw 128
	Movwf BPFH
	Movlw 143
	F@Call LCD@crs
	Movlw 200
	F@Call Print
F1_000288 equ $ ; in [BABAM_ICIN.BAS] VAsecyaz = 0
	Bcf _B#VR1,1
F1_000289 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL102
F1_000290 equ $ ; in [BABAM_ICIN.BAS] If volt_ayarlanan_yaz = 1 Then
	set@page bc@LL104
	Btfss _B#VR1,5
	Goto bc@LL104
F1_000291 equ $ ; in [BABAM_ICIN.BAS] V1 = volt_ayarlanan * VMayar
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf VOLT_AYARLANANH,W
	Movwf PP1H
	Movf VOLT_AYARLANAN,W
	Movwf PP1
	F@Call m@py
	Bsf STATUS,5
ram_bank = 1
	Movwf V1
	Bcf STATUS,5
ram_bank = 0
	Movf PP2H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf V1H
F1_000292 equ $ ; in [BABAM_ICIN.BAS] StrN LCD_V1 = Str$(Dec V1)
	Movlw 2
	Bcf STATUS,5
ram_bank = 0
	Movwf BPFH
	Movlw 70
	Movwf FSR
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf V1H,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf V1,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Clrf INDF
F1_000293 equ $ ; in [BABAM_ICIN.BAS] LCD_V[2] = "."
	Movlw 46
	Movwf LCD_V#2
F1_000294 equ $ ; in [BABAM_ICIN.BAS] If V1 > 9999  Then
	Movlw 39
	Bsf STATUS,5
ram_bank = 1
	Subwf V1H,W
	set@page bc@LL106
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL106
	set@page cp@lb14
	Btfss STATUS,2
	Goto cp@lb14
	Movlw 16
	Bsf STATUS,5
ram_bank = 1
	Subwf V1,W
	set@page bc@LL106
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL106
cp@lb14
F1_000295 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#0
F1_000296 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = LCD_V1[1]
	Movf LCD_V1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#1
F1_000297 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[2]
	Movf LCD_V1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
	F@Jump bc@LL105
F1_000298 equ $ ; in [BABAM_ICIN.BAS] ElseIf V1 > 999 Then
bc@LL106
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf V1H,W
	set@page bc@LL107
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL107
	set@page cp@lb15
	Btfss STATUS,2
	Goto cp@lb15
	Movlw 232
	Bsf STATUS,5
ram_bank = 1
	Subwf V1,W
	set@page bc@LL107
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL107
cp@lb15
F1_000299 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = " "
	Movlw 32
	Movwf LCD_V#0
F1_000300 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#1
F1_000301 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[1]
	Movf LCD_V1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
	F@Jump bc@LL108
bc@LL107
F1_000302 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000303 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = " "
	Movlw 32
	Movwf LCD_V#0
F1_000304 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = "0"
	Movlw 48
	Movwf LCD_V#1
F1_000305 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
F1_000306 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL108
bc@LL105
F1_000307 equ $ ; in [BABAM_ICIN.BAS] Print At 1,4,Str LCD_V,"V"
	Movlw 128
	Movwf BPFH
	Movlw 131
	F@Call LCD@crs
	Movlw 4
	Movwf GEN4
	Clrf PP2H
	Movlw 66
	F@Call sb@strout
	Movlw 86
	F@Call Print
F1_000308 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL104
F1_000310 equ $ ; in [BABAM_ICIN.BAS] If akim_ayarlanan_yaz = 1 Then
	set@page bc@LL112
	Btfss _B#VR1,7
	Goto bc@LL112
F1_000311 equ $ ; in [BABAM_ICIN.BAS] A1 = akim_ayarlanan * AMayar
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1
	F@Call m@py
	Bsf STATUS,5
ram_bank = 1
	Movwf A1
	Bcf STATUS,5
ram_bank = 0
	Movf PP2H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf A1H
F1_000312 equ $ ; in [BABAM_ICIN.BAS] StrN LCD_A1 = Str$(Dec A1)
	Movlw 2
	Bcf STATUS,5
ram_bank = 0
	Movwf BPFH
	Movlw 80
	Movwf FSR
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf A1H,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf A1,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Clrf INDF
F1_000313 equ $ ; in [BABAM_ICIN.BAS] LCD_A[2] = "."
	Movlw 46
	Movwf LCD_A#2
F1_000314 equ $ ; in [BABAM_ICIN.BAS] If A1 > 9999  Then
	Movlw 39
	Bsf STATUS,5
ram_bank = 1
	Subwf A1H,W
	set@page bc@LL114
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL114
	set@page cp@lb16
	Btfss STATUS,2
	Goto cp@lb16
	Movlw 16
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL114
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL114
cp@lb16
F1_000315 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#0
F1_000316 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#1
F1_000317 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[2]
	Movf LCD_A1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000318 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[3]
	Movf LCD_A1#3,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL113
F1_000319 equ $ ; in [BABAM_ICIN.BAS] ElseIf A1 > 999 Then
bc@LL114
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf A1H,W
	set@page bc@LL115
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL115
	set@page cp@lb17
	Btfss STATUS,2
	Goto cp@lb17
	Movlw 232
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL115
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL115
cp@lb17
F1_000320 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000321 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#1
F1_000322 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000323 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[2]
	Movf LCD_A1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL113
F1_000324 equ $ ; in [BABAM_ICIN.BAS] ElseIf A1 > 99 Then
bc@LL115
	Bsf STATUS,5
ram_bank = 1
	Movf A1H,F
	set@page cp@lb18
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto cp@lb18
	Movlw 100
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL116
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL116
cp@lb18
F1_000325 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000326 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = "0"
	Movlw 48
	Movwf LCD_A#1
F1_000327 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000328 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL117
bc@LL116
F1_000329 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000330 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000331 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = "0"
	Movlw 48
	Movwf LCD_A#1
F1_000332 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = "0"
	Movlw 48
	Movwf LCD_A#3
F1_000333 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
F1_000334 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL117
bc@LL113
F1_000335 equ $ ; in [BABAM_ICIN.BAS] Print At 1,10,Str LCD_A,"A"
	Movlw 128
	Movwf BPFH
	Movlw 137
	F@Call LCD@crs
	Movlw 5
	Movwf GEN4
	Clrf PP2H
	Movlw 75
	F@Call sb@strout
	Movlw 65
	F@Call Print
F1_000336 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL112
F1_000338 equ $ ; in [BABAM_ICIN.BAS] If Sure2 = 0 Then
	Movf SURE2,F
	set@page bc@LL121
	Btfss STATUS,2
	Goto bc@LL121
F1_000339 equ $ ; in [BABAM_ICIN.BAS] DelayMS 2 'hafizaya almasi icin sure ver
	Movlw 2
	F@Call dl@ms
F1_000340 equ $ ; in [BABAM_ICIN.BAS] If volt_ayarlanan_yaz = 1 Or akim_ayarlanan_yaz = 1 Then EWrite 1,[volt_ayarlanan,akim_ayarlanan] 'degerleri hafizaya al
	Clrw
	Btfsc _B#VR1,5
	Movlw 1
	Movwf SP#P9
	Clrw
	Btfsc _B#VR1,7
	Movlw 1
	Iorwf SP#P9,W
	set@page bc@LL123
	Btfsc STATUS,2
	Goto bc@LL123
	Movlw 1
	Bsf STATUS,6
ram_bank = 2
	Movwf EEADR
	Bcf STATUS,6
ram_bank = 0
	Movf VOLT_AYARLANAN,W
	F@Call ee@wr
	Movf VOLT_AYARLANANH,W
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
bc@LL123
F1_000341 equ $ ; in [BABAM_ICIN.BAS] DelayMS 2
	Movlw 2
	F@Call dl@ms
F1_000342 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL121
F1_000344 equ $ ; in [BABAM_ICIN.BAS] If volt_ortalama_old != volt_ortalama Then  'ekranda oynamalari engellemek icin aradaki fark
	Movf VOLT_ORTALAMAH,W
	Subwf VOLT_ORTALAMA_OLDH,W
	set@page cp@lb19
	Btfss STATUS,2
	Goto cp@lb19
	Movf VOLT_ORTALAMA,W
	Subwf VOLT_ORTALAMA_OLD,W
	set@page bc@LL125
	Btfsc STATUS,2
	Goto bc@LL125
cp@lb19
F1_000345 equ $ ; in [BABAM_ICIN.BAS] V1 = (volt_ortalama+2) * VMayar              'belli bir degerin uzerinde ise guncelleme yap
	Movlw 2
	Addwf VOLT_ORTALAMA,W
	Movwf PP7
	Movf VOLT_ORTALAMAH,W
	Btfsc STATUS,0
	Addlw 1
	Movwf PP7H
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Movf PP7H,W
	Movwf PP1H
	Movf PP7,W
	Movwf PP1
	F@Call m@py
	Bsf STATUS,5
ram_bank = 1
	Movwf V1
	Bcf STATUS,5
ram_bank = 0
	Movf PP2H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf V1H
F1_000346 equ $ ; in [BABAM_ICIN.BAS] StrN LCD_V1 = Str$(Dec V1)
	Movlw 2
	Bcf STATUS,5
ram_bank = 0
	Movwf BPFH
	Movlw 70
	Movwf FSR
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf V1H,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf V1,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Clrf INDF
F1_000347 equ $ ; in [BABAM_ICIN.BAS] If V1 > 9999  Then
	Movlw 39
	Bsf STATUS,5
ram_bank = 1
	Subwf V1H,W
	set@page bc@LL127
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL127
	set@page cp@lb20
	Btfss STATUS,2
	Goto cp@lb20
	Movlw 16
	Bsf STATUS,5
ram_bank = 1
	Subwf V1,W
	set@page bc@LL127
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL127
cp@lb20
F1_000348 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#0
F1_000349 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = LCD_V1[1]
	Movf LCD_V1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#1
F1_000350 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[2]
	Movf LCD_V1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
	F@Jump bc@LL126
F1_000351 equ $ ; in [BABAM_ICIN.BAS] ElseIf V1 > 999 Then
bc@LL127
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf V1H,W
	set@page bc@LL128
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL128
	set@page cp@lb21
	Btfss STATUS,2
	Goto cp@lb21
	Movlw 232
	Bsf STATUS,5
ram_bank = 1
	Subwf V1,W
	set@page bc@LL128
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL128
cp@lb21
F1_000352 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = " "
	Movlw 32
	Movwf LCD_V#0
F1_000353 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#1
F1_000354 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[1]
	Movf LCD_V1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
	F@Jump bc@LL129
bc@LL128
F1_000355 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000356 equ $ ; in [BABAM_ICIN.BAS] LCD_V[0] = " "
	Movlw 32
	Movwf LCD_V#0
F1_000357 equ $ ; in [BABAM_ICIN.BAS] LCD_V[1] = "0"
	Movlw 48
	Movwf LCD_V#1
F1_000358 equ $ ; in [BABAM_ICIN.BAS] LCD_V[3] = LCD_V1[0]
	Movf LCD_V1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_V#3
F1_000359 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL129
bc@LL126
F1_000360 equ $ ; in [BABAM_ICIN.BAS] Print At 2,4,Str LCD_V,"V"
	Movlw 128
	Movwf BPFH
	Movlw 195
	F@Call LCD@crs
	Movlw 4
	Movwf GEN4
	Clrf PP2H
	Movlw 66
	F@Call sb@strout
	Movlw 86
	F@Call Print
F1_000361 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL125
F1_000362 equ $ ; in [BABAM_ICIN.BAS] If akim_ortalama_old != akim_ortalama Then
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_ORTALAMAH,W
	Subwf AKIM_ORTALAMA_OLDH,W
	set@page cp@lb22
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto cp@lb22
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_ORTALAMA,W
	Subwf AKIM_ORTALAMA_OLD,W
	set@page bc@LL133
	Bcf STATUS,5
ram_bank = 0
	Btfsc STATUS,2
	Goto bc@LL133
cp@lb22
F1_000363 equ $ ; in [BABAM_ICIN.BAS] A1 = akim_ortalama * AMayar
	Clrf PP3H
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP3
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_ORTALAMAH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1H
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_ORTALAMA,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1
	F@Call m@py
	Bsf STATUS,5
ram_bank = 1
	Movwf A1
	Bcf STATUS,5
ram_bank = 0
	Movf PP2H,W
	Bsf STATUS,5
ram_bank = 1
	Movwf A1H
F1_000364 equ $ ; in [BABAM_ICIN.BAS] StrN LCD_A1 = Str$(Dec A1)
	Movlw 2
	Bcf STATUS,5
ram_bank = 0
	Movwf BPFH
	Movlw 80
	Movwf FSR
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf A1H,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf A1,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Clrf INDF
F1_000365 equ $ ; in [BABAM_ICIN.BAS] LCD_A[2] = "."
	Movlw 46
	Movwf LCD_A#2
F1_000366 equ $ ; in [BABAM_ICIN.BAS] If A1 > 9999  Then
	Movlw 39
	Bsf STATUS,5
ram_bank = 1
	Subwf A1H,W
	set@page bc@LL135
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL135
	set@page cp@lb23
	Btfss STATUS,2
	Goto cp@lb23
	Movlw 16
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL135
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL135
cp@lb23
F1_000367 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#0
F1_000368 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#1
F1_000369 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[2]
	Movf LCD_A1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000370 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[3]
	Movf LCD_A1#3,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL134
F1_000371 equ $ ; in [BABAM_ICIN.BAS] ElseIf A1 > 999 Then
bc@LL135
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf A1H,W
	set@page bc@LL136
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL136
	set@page cp@lb24
	Btfss STATUS,2
	Goto cp@lb24
	Movlw 232
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL136
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL136
cp@lb24
F1_000372 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000373 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#1
F1_000374 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000375 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[2]
	Movf LCD_A1#2,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL134
F1_000376 equ $ ; in [BABAM_ICIN.BAS] ElseIf A1 > 99 Then
bc@LL136
	Bsf STATUS,5
ram_bank = 1
	Movf A1H,F
	set@page cp@lb25
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto cp@lb25
	Movlw 100
	Bsf STATUS,5
ram_bank = 1
	Subwf A1,W
	set@page bc@LL137
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,0
	Goto bc@LL137
cp@lb25
F1_000377 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000378 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = "0"
	Movlw 48
	Movwf LCD_A#1
F1_000379 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#3
F1_000380 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[1]
	Movf LCD_A1#1,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
	F@Jump bc@LL138
bc@LL137
F1_000381 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000382 equ $ ; in [BABAM_ICIN.BAS] LCD_A[0] = " "
	Movlw 32
	Movwf LCD_A#0
F1_000383 equ $ ; in [BABAM_ICIN.BAS] LCD_A[1] = "0"
	Movlw 48
	Movwf LCD_A#1
F1_000384 equ $ ; in [BABAM_ICIN.BAS] LCD_A[3] = "0"
	Movlw 48
	Movwf LCD_A#3
F1_000385 equ $ ; in [BABAM_ICIN.BAS] LCD_A[4] = LCD_A1[0]
	Movf LCD_A1#0,W
	Movwf PBP#VAR0
	Movf PBP#VAR0,W
	Movwf LCD_A#4
F1_000386 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL138
bc@LL134
F1_000387 equ $ ; in [BABAM_ICIN.BAS] Print At 2,10,Str LCD_A,"A"
	Movlw 128
	Movwf BPFH
	Movlw 201
	F@Call LCD@crs
	Movlw 5
	Movwf GEN4
	Clrf PP2H
	Movlw 75
	F@Call sb@strout
	Movlw 65
	F@Call Print
F1_000388 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL133
F1_000389 equ $ ; in [BABAM_ICIN.BAS] volt_ortalama_old = volt_ortalama
	Movf VOLT_ORTALAMAH,W
	Movwf VOLT_ORTALAMA_OLDH
	Movf VOLT_ORTALAMA,W
	Movwf VOLT_ORTALAMA_OLD
F1_000390 equ $ ; in [BABAM_ICIN.BAS] akim_ortalama_old = akim_ortalama
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_ORTALAMAH,W
	Movwf AKIM_ORTALAMA_OLDH
	Movf AKIM_ORTALAMA,W
	Movwf AKIM_ORTALAMA_OLD
F1_000391 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan_yaz = 0
	Bcf STATUS,5
ram_bank = 0
	Bcf _B#VR1,5
F1_000392 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan_yaz = 0
	Bcf _B#VR1,7
	F@Jump bc@LL95
F1_000395 equ $ ; in [BABAM_ICIN.BAS] Else If Mode = 1 Then   'Pil sarj modu
bc@LL96
	Movlw 1
	Subwf MODE,W
	set@page bc@LL141
	Btfss STATUS,2
	Goto bc@LL141
F1_000396 equ $ ; in [BABAM_ICIN.BAS] Cls
	F@Call Lcd@Cls
F1_000397 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb143
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb144
	Btfsc STATUS,0
	Goto nx@lb144
F1_000398 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000399 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000400 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000401 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb143
	Btfss STATUS,2
	Goto fr@lb143
nx@lb144
F1_000402 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb145
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb146
	Btfsc STATUS,0
	Goto nx@lb146
F1_000403 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000404 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000405 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000406 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb145
	Btfss STATUS,2
	Goto fr@lb145
nx@lb146
F1_000407 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1," PIL SARJ MENU  "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb3 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb3 & 255)
	F@Call c@strout
F1_000408 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1," -------------  "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb4 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb4 & 255)
	F@Call c@strout
F1_000409 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
PILSARJMENU
F1_000411 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$40,$07,$04,$1C,$10,$10,$1C,$04,$07
	Movlw 254
	F@Call Print
	Movlw 64
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 4
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 16
	F@Call Print
	Movlw 16
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 4
	F@Call Print
	Movlw 7
	F@Call Print
F1_000412 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$48,$1F,$00,$00,$00,$00,$00,$00,$1F
	Movlw 254
	F@Call Print
	Movlw 72
	F@Call Print
	Movlw 31
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 31
	F@Call Print
F1_000413 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$50,$1F,$01,$01,$01,$01,$01,$01,$1F
	Movlw 254
	F@Call Print
	Movlw 80
	F@Call Print
	Movlw 31
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 31
	F@Call Print
F1_000414 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$58,$1F,$07,$07,$07,$07,$07,$07,$1F
	Movlw 254
	F@Call Print
	Movlw 88
	F@Call Print
	Movlw 31
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 31
	F@Call Print
F1_000415 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb5 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb5 & 255)
	F@Call c@strout
F1_000416 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000417 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$1,$1,$2," %00"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 2
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 48
	F@Call Print
	F@Call Print
F1_000418 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 8 Sa"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb6 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb6 & 255)
	F@Call c@strout
F1_000419 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL147
	Btfsc STATUS,2
	Goto bc@LL147
	F@Jump DONGUDENCIK
bc@LL147
F1_000420 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000421 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb7 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb7 & 255)
	F@Call c@strout
F1_000422 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000423 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$1,$1,$3," %10"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 49
	F@Call Print
	Movlw 48
	F@Call Print
F1_000424 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 6 Sa"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb8 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb8 & 255)
	F@Call c@strout
F1_000425 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL149
	Btfsc STATUS,2
	Goto bc@LL149
	F@Jump DONGUDENCIK
bc@LL149
F1_000426 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000427 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb9 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb9 & 255)
	F@Call c@strout
F1_000428 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000429 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$1,$1,$FF," %20"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 50
	F@Call Print
	Movlw 48
	F@Call Print
F1_000430 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 4 Sa"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb10 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb10 & 255)
	F@Call c@strout
F1_000431 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL151
	Btfsc STATUS,2
	Goto bc@LL151
	F@Jump DONGUDENCIK
bc@LL151
F1_000432 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000433 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb11 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb11 & 255)
	F@Call c@strout
F1_000434 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000435 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$1,$3,$FF," %40"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 52
	F@Call Print
	Movlw 48
	F@Call Print
F1_000436 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 2 Sa"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb12 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb12 & 255)
	F@Call c@strout
F1_000437 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL153
	Btfsc STATUS,2
	Goto bc@LL153
	F@Jump DONGUDENCIK
bc@LL153
F1_000438 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000439 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb13 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb13 & 255)
	F@Call c@strout
F1_000440 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000441 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$1,$FF,$FF," %50"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 53
	F@Call Print
	Movlw 48
	F@Call Print
F1_000442 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 1 Sa"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb14 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb14 & 255)
	F@Call c@strout
F1_000443 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL155
	Btfsc STATUS,2
	Goto bc@LL155
	F@Jump DONGUDENCIK
bc@LL155
F1_000444 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000445 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb15 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb15 & 255)
	F@Call c@strout
F1_000446 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000447 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$3,$FF,$FF," %60"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 54
	F@Call Print
	Movlw 48
	F@Call Print
F1_000448 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 40dk"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb16 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb16 & 255)
	F@Call c@strout
F1_000449 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL157
	Btfsc STATUS,2
	Goto bc@LL157
	F@Jump DONGUDENCIK
bc@LL157
F1_000450 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000451 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb17 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb17 & 255)
	F@Call c@strout
F1_000452 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000453 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$1,$FF,$FF,$FF," %70"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 55
	F@Call Print
	Movlw 48
	F@Call Print
F1_000454 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS: 20dk"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb18 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb18 & 255)
	F@Call c@strout
F1_000455 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL159
	Btfsc STATUS,2
	Goto bc@LL159
	F@Jump DONGUDENCIK
bc@LL159
F1_000456 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000457 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb19 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb19 & 255)
	F@Call c@strout
F1_000458 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000459 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$3,$FF,$FF,$FF," %80"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 56
	F@Call Print
	Movlw 48
	F@Call Print
F1_000460 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS:  5dk"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb20 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb20 & 255)
	F@Call c@strout
F1_000461 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL161
	Btfsc STATUS,2
	Goto bc@LL161
	F@Jump DONGUDENCIK
bc@LL161
F1_000462 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000463 equ $ ; in [BABAM_ICIN.BAS] Print At 1,2,"4.8 V  "
	Movlw 128
	Movwf BPFH
	Movlw 129
	F@Call LCD@crs
	Movlw ((str@lb21 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb21 & 255)
	F@Call c@strout
F1_000464 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Clrf GEN4H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2H
	Bsf STATUS,5
ram_bank = 1
	Movf P_AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP2
	F@Call out@dec
	Movlw 109
	F@Call Print
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000465 equ $ ; in [BABAM_ICIN.BAS] Print At 1,8,$0,$FF,$FF,$FF,$FF," %99"
	Movlw 128
	Movwf BPFH
	Movlw 135
	F@Call LCD@crs
	Movlw 0
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 255
	F@Call Print
	Movlw 32
	F@Call Print
	Movlw 37
	F@Call Print
	Movlw 57
	F@Call Print
	F@Call Print
F1_000466 equ $ ; in [BABAM_ICIN.BAS] Print At 2,8,"TKS:  1dk"
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw ((str@lb22 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb22 & 255)
	F@Call c@strout
F1_000467 equ $ ; in [BABAM_ICIN.BAS] If Mode != 1 Then GoTo DongudenCik
	Movlw 1
	Subwf MODE,W
	set@page bc@LL163
	Btfsc STATUS,2
	Goto bc@LL163
	F@Jump DONGUDENCIK
bc@LL163
F1_000468 equ $ ; in [BABAM_ICIN.BAS] GoSub Beklet
	F@Call BEKLET
F1_000470 equ $ ; in [BABAM_ICIN.BAS] If Mode = 1 Then GoTo PilSarjMenu
	Movlw 1
	Subwf MODE,W
	set@page bc@LL165
	Btfss STATUS,2
	Goto bc@LL165
	F@Jump PILSARJMENU
bc@LL165
DONGUDENCIK
	F@Jump bc@LL166
bc@LL141
F1_000474 equ $ ; in [BABAM_ICIN.BAS] Else 'menu Modu
F1_000475 equ $ ; in [BABAM_ICIN.BAS] Cls
	F@Call Lcd@Cls
F1_000476 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb168
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb169
	Btfsc STATUS,0
	Goto nx@lb169
F1_000477 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000478 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000479 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000480 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb168
	Btfss STATUS,2
	Goto fr@lb168
nx@lb169
F1_000481 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb170
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb171
	Btfsc STATUS,0
	Goto nx@lb171
F1_000482 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000483 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000484 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000485 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb170
	Btfss STATUS,2
	Goto fr@lb170
nx@lb171
F1_000486 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1," AYARLAR  MENU  "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb23 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb23 & 255)
	F@Call c@strout
F1_000487 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1," -------------  "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb24 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb24 & 255)
	F@Call c@strout
F1_000488 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000490 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1,   "AYAR:          "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb25 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb25 & 255)
	F@Call c@strout
MENUMODU
F1_000493 equ $ ; in [BABAM_ICIN.BAS] If AyarYaz = 1 Then
	set@page bc@LL172
	Bsf STATUS,5
ram_bank = 1
	Bcf STATUS,1
	Btfss _B#VR2,2
	Bsf STATUS,1
	Bcf STATUS,5
ram_bank = 0
	Btfsc STATUS,1
	Goto bc@LL172
F1_000494 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 0 Then Print At 2,1,201,"." : Print At 1,6," Volt Adim" : Else : Print At 2,1," ."
	Bsf STATUS,5
ram_bank = 1
	Movf AYARSEC,F
	set@page bc@LL174
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL174
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Movlw 46
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 133
	F@Call LCD@crs
	Movlw ((str@lb26 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb26 & 255)
	F@Call c@strout
	F@Jump bc@LL175
bc@LL174
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw 32
	F@Call Print
	Movlw 46
	F@Call Print
bc@LL175
F1_000495 equ $ ; in [BABAM_ICIN.BAS] If VAayar  = 0 Then Print At 2,3,"1"
	Bsf STATUS,5
ram_bank = 1
	Movf VAAYAR,F
	set@page bc@LL177
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL177
	Movlw 128
	Movwf BPFH
	Movlw 194
	F@Call LCD@crs
	Movlw 49
	F@Call Print
bc@LL177
F1_000496 equ $ ; in [BABAM_ICIN.BAS] If VAayar  = 1 Then Print At 2,3,"2"
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf VAAYAR,W
	set@page bc@LL179
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL179
	Movlw 128
	Movwf BPFH
	Movlw 194
	F@Call LCD@crs
	Movlw 50
	F@Call Print
bc@LL179
F1_000497 equ $ ; in [BABAM_ICIN.BAS] If VAayar  = 2 Then Print At 2,3,"5"
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf VAAYAR,W
	set@page bc@LL181
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL181
	Movlw 128
	Movwf BPFH
	Movlw 194
	F@Call LCD@crs
	Movlw 53
	F@Call Print
bc@LL181
F1_000498 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 1 Then Print At 2,4,201 : Print At 1,6," Akim Adim" : Else : Print At 2,4," "
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL183
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL183
	Movlw 128
	Movwf BPFH
	Movlw 195
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 133
	F@Call LCD@crs
	Movlw ((str@lb27 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb27 & 255)
	F@Call c@strout
	F@Jump bc@LL184
bc@LL183
	Movlw 128
	Movwf BPFH
	Movlw 195
	F@Call LCD@crs
	Movlw 32
	F@Call Print
bc@LL184
F1_000499 equ $ ; in [BABAM_ICIN.BAS] If AAayar  = 0 Then Print At 2,5,"Yav"
	Bsf STATUS,5
ram_bank = 1
	Movf AAAYAR,F
	set@page bc@LL186
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL186
	Movlw 128
	Movwf BPFH
	Movlw 196
	F@Call LCD@crs
	Movlw 89
	F@Call Print
	Movlw 97
	F@Call Print
	Movlw 118
	F@Call Print
bc@LL186
F1_000500 equ $ ; in [BABAM_ICIN.BAS] If AAayar  = 1 Then Print At 2,5,"Ort"
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf AAAYAR,W
	set@page bc@LL188
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL188
	Movlw 128
	Movwf BPFH
	Movlw 196
	F@Call LCD@crs
	Movlw 79
	F@Call Print
	Movlw 114
	F@Call Print
	Movlw 116
	F@Call Print
bc@LL188
F1_000501 equ $ ; in [BABAM_ICIN.BAS] If AAayar  = 2 Then Print At 2,5,"Hiz"
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf AAAYAR,W
	set@page bc@LL190
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL190
	Movlw 128
	Movwf BPFH
	Movlw 196
	F@Call LCD@crs
	Movlw 72
	F@Call Print
	Movlw 105
	F@Call Print
	Movlw 122
	F@Call Print
bc@LL190
F1_000502 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 2 Then Print At 2,8,201 : Print At 1,6," Max Volt " : Else : Print At 2,8," "
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL192
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL192
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 133
	F@Call LCD@crs
	Movlw ((str@lb28 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb28 & 255)
	F@Call c@strout
	F@Jump bc@LL193
bc@LL192
	Movlw 128
	Movwf BPFH
	Movlw 199
	F@Call LCD@crs
	Movlw 32
	F@Call Print
bc@LL193
F1_000503 equ $ ; in [BABAM_ICIN.BAS] Print At 2,9,Dec VMayar,"V "
	Movlw 128
	Movwf BPFH
	Movlw 200
	F@Call LCD@crs
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call out@decb
	Movlw 86
	F@Call Print
	Movlw 32
	F@Call Print
F1_000504 equ $ ; in [BABAM_ICIN.BAS] If AyarSec = 3 Then Print At 2,12,201: Print At 1,6," Max Akim " : Else : Print At 2,12," "
	Movlw 3
	Bsf STATUS,5
ram_bank = 1
	Subwf AYARSEC,W
	set@page bc@LL195
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL195
	Movlw 128
	Movwf BPFH
	Movlw 203
	F@Call LCD@crs
	Movlw 201
	F@Call Print
	Movlw 128
	Movwf BPFH
	Movlw 133
	F@Call LCD@crs
	Movlw ((str@lb29 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb29 & 255)
	F@Call c@strout
	F@Jump bc@LL196
bc@LL195
	Movlw 128
	Movwf BPFH
	Movlw 203
	F@Call LCD@crs
	Movlw 32
	F@Call Print
bc@LL196
F1_000505 equ $ ; in [BABAM_ICIN.BAS] Print At 2,13,Dec AMayar,"A "
	Movlw 128
	Movwf BPFH
	Movlw 204
	F@Call LCD@crs
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call out@decb
	Movlw 65
	F@Call Print
	Movlw 32
	F@Call Print
F1_000506 equ $ ; in [BABAM_ICIN.BAS] EWrite 5,[VAayar,AAayar,VMayar,AMayar]
	Movlw 5
	Bsf STATUS,6
ram_bank = 2
	Movwf EEADR
	Bsf STATUS,5
	Bcf STATUS,6
ram_bank = 1
	Movf VAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
F1_000507 equ $ ; in [BABAM_ICIN.BAS] GoSub AdimAyarla
	F@Call ADIMAYARLA
F1_000508 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL172
F1_000510 equ $ ; in [BABAM_ICIN.BAS] DelayMS 200
	Movlw 200
	F@Call dl@ms
F1_000512 equ $ ; in [BABAM_ICIN.BAS] If Mode = 2 Then GoTo MenuModu
	Movlw 2
	Subwf MODE,W
	set@page bc@LL198
	Btfss STATUS,2
	Goto bc@LL198
	F@Jump MENUMODU
bc@LL198
F1_000513 equ $ ; in [BABAM_ICIN.BAS] Cls
	F@Call Lcd@Cls
F1_000514 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb200
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb201
	Btfsc STATUS,0
	Goto nx@lb201
F1_000515 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000516 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi,255
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 255
	F@Call Print
F1_000517 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000518 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb200
	Btfss STATUS,2
	Goto fr@lb200
nx@lb201
F1_000519 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb202
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb203
	Btfsc STATUS,0
	Goto nx@lb203
F1_000520 equ $ ; in [BABAM_ICIN.BAS] Print At 1,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000521 equ $ ; in [BABAM_ICIN.BAS] Print At 2,sayi," "
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	F@Call Cursor
	Movlw 32
	F@Call Print
F1_000522 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000523 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb202
	Btfss STATUS,2
	Goto fr@lb202
nx@lb203
F1_000524 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1," ADAPTOR  MENU  "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb30 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb30 & 255)
	F@Call c@strout
F1_000525 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1," -------------  "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb31 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb31 & 255)
	F@Call c@strout
F1_000526 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000528 equ $ ; in [BABAM_ICIN.BAS] GoTo EkranKur
	F@Jump EKRANKUR
F1_000529 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL166
bc@LL95
F1_000531 equ $ ; in [BABAM_ICIN.BAS] CCPR1L = akim_ayarlanan >> 2
	Bsf STATUS,5
ram_bank = 1
	Rrf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP4
	Bsf STATUS,5
ram_bank = 1
	Rrf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	Movwf CCPR1L
	Rrf PP4,F
	Rrf CCPR1L,F
F1_000532 equ $ ; in [BABAM_ICIN.BAS] CCP1CON.4 = akim_ayarlanan.0
	Bsf STATUS,5
ram_bank = 1
	Bcf STATUS,1
	Btfsc AKIM_AYARLANAN,0
	Bsf STATUS,1
	Bcf STATUS,5
ram_bank = 0
	Btfsc STATUS,1
	Bsf CCP1CON,4
	Btfss STATUS,1
	Bcf CCP1CON,4
F1_000533 equ $ ; in [BABAM_ICIN.BAS] CCP1CON.5 = akim_ayarlanan.1
	Bsf STATUS,5
ram_bank = 1
	Bcf STATUS,1
	Btfsc AKIM_AYARLANAN,1
	Bsf STATUS,1
	Bcf STATUS,5
ram_bank = 0
	Btfsc STATUS,1
	Bsf CCP1CON,5
	Btfss STATUS,1
	Bcf CCP1CON,5
F1_000535 equ $ ; in [BABAM_ICIN.BAS] CCPR2L = volt_ayarlanan >> 2
	Rrf VOLT_AYARLANANH,W
	Movwf PP4
	Rrf VOLT_AYARLANAN,W
	Movwf CCPR2L
	Rrf PP4,F
	Rrf CCPR2L,F
F1_000536 equ $ ; in [BABAM_ICIN.BAS] CCP2CON.4 = volt_ayarlanan.0
	Bcf STATUS,1
	Btfsc VOLT_AYARLANAN,0
	Bsf STATUS,1
	Btfsc STATUS,1
	Bsf CCP2CON,4
	Btfss STATUS,1
	Bcf CCP2CON,4
F1_000537 equ $ ; in [BABAM_ICIN.BAS] CCP2CON.5 = volt_ayarlanan.1
	Bcf STATUS,1
	Btfsc VOLT_AYARLANAN,1
	Bsf STATUS,1
	Btfsc STATUS,1
	Bsf CCP2CON,5
	Btfss STATUS,1
	Bcf CCP2CON,5
F1_000539 equ $ ; in [BABAM_ICIN.BAS] DelayMS 50
	Movlw 50
	F@Call dl@ms
F1_000540 equ $ ; in [BABAM_ICIN.BAS] GoTo AnaProgram
	F@Jump ANAPROGRAM
F1_000543 equ $ ; in [BABAM_ICIN.BAS] Disable
SET_REGISTERS
F1_000545 equ $ ; in [BABAM_ICIN.BAS] TRISA      = %11001011
	Movlw 203
	Bsf STATUS,5
ram_bank = 1
	Movwf TRISA
F1_000546 equ $ ; in [BABAM_ICIN.BAS] TRISB      = %11100000
	Movlw 224
	Movwf TRISB
F1_000547 equ $ ; in [BABAM_ICIN.BAS] TRISC      = %00000000
	Clrf TRISC
F1_000549 equ $ ; in [BABAM_ICIN.BAS] OPTION_REG = %00000111 'prescaler 1:256 timer0
	Movlw 7
	Movwf OPTION_REG
F1_000551 equ $ ; in [BABAM_ICIN.BAS] INTCON     = %11101000
	Movlw 232
	Movwf INTCON
F1_000554 equ $ ; in [BABAM_ICIN.BAS] ADCON0     = %10000001
	Movlw 129
	Bcf STATUS,5
ram_bank = 0
	Movwf ADCON0
F1_000555 equ $ ; in [BABAM_ICIN.BAS] ADCON1     = %10000100 'RA0_RA1_RA3_ANALOG
	Movlw 132
	Bsf STATUS,5
ram_bank = 1
	Movwf ADCON1
F1_000558 equ $ ; in [BABAM_ICIN.BAS] CCP1CON    = %00001100 ' !!!!5. ve 4. biti i pwm e gore ayarlayacagim
	Movlw 12
	Bcf STATUS,5
ram_bank = 0
	Movwf CCP1CON
F1_000559 equ $ ; in [BABAM_ICIN.BAS] CCP2CON    = %00001100 ' lsb tarafini CCPR1L ye yazacagiz
	Movlw 12
	Movwf CCP2CON
F1_000561 equ $ ; in [BABAM_ICIN.BAS] CCPR1L     = %00000000 'duty cycle baslangic olarak 0 set ediliyor (AKIM)
	Clrf CCPR1L
F1_000562 equ $ ; in [BABAM_ICIN.BAS] CCPR2L     = %00000000 'duty cycle baslangic olarak 0 Set ediliyor (VOLTAJ)
	Clrf CCPR2L
F1_000566 equ $ ; in [BABAM_ICIN.BAS] T1CON      = %00110001 ' TImer 1S
	Movlw 49
	Movwf T1CON
F1_000567 equ $ ; in [BABAM_ICIN.BAS] T2CON      = %00001111 ' Timer 2 prescaler 1:16 postscaler 1:16  t2enabled (bit2)
	Movlw 15
	Movwf T2CON
F1_000568 equ $ ; in [BABAM_ICIN.BAS] PR2        = %11111111 ' PWM peryodu
	Bsf STATUS,5
ram_bank = 1
	Movlw 255
	Movwf PR2
F1_000573 equ $ ; in [BABAM_ICIN.BAS] PIE1 = %01000001 'ADIE  T1IE
	Movlw 65
	Movwf PIE1
F1_000576 equ $ ; in [BABAM_ICIN.BAS] PORTB.3 = 0            'B portundaki pulluplar sorun cikarmasin diye
	Bcf STATUS,5
ram_bank = 0
	Bcf PORTB,3
F1_000579 equ $ ; in [BABAM_ICIN.BAS] GoTo Set_Variables
	F@Jump SET_VARIABLES
MEMORY_DEFAULTS
F1_000582 equ $ ; in [BABAM_ICIN.BAS] GoSub Acilis
	F@Call ACILIS
F1_000584 equ $ ; in [BABAM_ICIN.BAS] ilkkez = ERead 0
	Movlw 0
	F@Call Ee@rd
	Movwf ILKKEZ
F1_000585 equ $ ; in [BABAM_ICIN.BAS] If ilkkez != 104 Then '104 rastgele secilmis bir sayidir, daha once hic hafiza kaydi yapmadiysak ilk degerleri yaz
	Movlw 104
	Subwf ILKKEZ,W
	set@page bc@LL204
	Btfsc STATUS,2
	Goto bc@LL204
F1_000586 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan = 100 'yaklasik 2,5 volt
	Clrf VOLT_AYARLANANH
	Movlw 100
	Movwf VOLT_AYARLANAN
F1_000587 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan = 100 'yaklasik 1,5 amper
	Bsf STATUS,5
ram_bank = 1
	Clrf AKIM_AYARLANANH
	Movlw 100
	Movwf AKIM_AYARLANAN
F1_000588 equ $ ; in [BABAM_ICIN.BAS] VAayar         = 0   '.1 adim araligi (voltaj)
	Clrf VAAYAR
F1_000589 equ $ ; in [BABAM_ICIN.BAS] AAayar         = 0   '.1 adim araligi (akim)
	Clrf AAAYAR
F1_000590 equ $ ; in [BABAM_ICIN.BAS] VMayar         = 25  'maksimum 25V.. 0-25v ayarli
	Movlw 25
	Movwf VMAYAR
F1_000591 equ $ ; in [BABAM_ICIN.BAS] AMayar         = 15  'maksimum 15A.. 0-12A ayarli
	Movlw 15
	Movwf AMAYAR
F1_000593 equ $ ; in [BABAM_ICIN.BAS] EWrite 0,[104,volt_ayarlanan,akim_ayarlanan,VAayar,AAayar,VMayar,AMayar]
	Bcf STATUS,5
	Bsf STATUS,6
ram_bank = 2
	Clrf EEADR
	Movlw 104
	Bcf STATUS,6
ram_bank = 0
	F@Call ee@wr
	Movf VOLT_AYARLANAN,W
	F@Call ee@wr
	Movf VOLT_AYARLANANH,W
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANAN,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AKIM_AYARLANANH,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf VAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AAAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
	Bsf STATUS,5
ram_bank = 1
	Movf AMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	F@Call ee@wr
F1_000594 equ $ ; in [BABAM_ICIN.BAS] DelayMS 500 'yazma isleminin tamamlanmasini bekle
	Movlw 1
	Movwf PP1H
	Movlw 244
	F@Call dly@w
	F@Jump bc@LL205
bc@LL204
F1_000595 equ $ ; in [BABAM_ICIN.BAS] Else
F1_000596 equ $ ; in [BABAM_ICIN.BAS] volt_ayarlanan = ERead 1
	Movlw 1
	F@Call Ee@rd
	Movwf VOLT_AYARLANAN
	F@Call Ee@rd@w
	Movwf VOLT_AYARLANANH
F1_000597 equ $ ; in [BABAM_ICIN.BAS] akim_ayarlanan = ERead 3
	Movlw 3
	F@Call Ee@rd
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANAN
	Bcf STATUS,5
ram_bank = 0
	F@Call Ee@rd@w
	Bsf STATUS,5
ram_bank = 1
	Movwf AKIM_AYARLANANH
F1_000598 equ $ ; in [BABAM_ICIN.BAS] VAayar         = ERead 5
	Movlw 5
	Bcf STATUS,5
ram_bank = 0
	F@Call Ee@rd
	Bsf STATUS,5
ram_bank = 1
	Movwf VAAYAR
F1_000599 equ $ ; in [BABAM_ICIN.BAS] AAayar         = ERead 6
	Movlw 6
	Bcf STATUS,5
ram_bank = 0
	F@Call Ee@rd
	Bsf STATUS,5
ram_bank = 1
	Movwf AAAYAR
F1_000600 equ $ ; in [BABAM_ICIN.BAS] VMayar         = ERead 7
	Movlw 7
	Bcf STATUS,5
ram_bank = 0
	F@Call Ee@rd
	Bsf STATUS,5
ram_bank = 1
	Movwf VMAYAR
F1_000601 equ $ ; in [BABAM_ICIN.BAS] AMayar         = ERead 8
	Movlw 8
	Bcf STATUS,5
ram_bank = 0
	F@Call Ee@rd
	Bsf STATUS,5
ram_bank = 1
	Movwf AMAYAR
F1_000602 equ $ ; in [BABAM_ICIN.BAS] EndIf
bc@LL205
	Bcf STATUS,5
ram_bank = 0
F1_000603 equ $ ; in [BABAM_ICIN.BAS] GoSub AdimAyarla
	F@Call ADIMAYARLA
F1_000604 equ $ ; in [BABAM_ICIN.BAS] GoTo EkranKur
	F@Jump EKRANKUR
ADIMAYARLA
F1_000607 equ $ ; in [BABAM_ICIN.BAS] AyarYaz = 1
	Bsf STATUS,5
ram_bank = 1
	Bsf _B#VR2,2
F1_000608 equ $ ; in [BABAM_ICIN.BAS] If VAayar = 0 Then VAdim = 100 / VMayar   '.1 (100mV) adim araligi icin, Ornek : VMax=25V iken her adim 4 artiracak
	Movf VAAYAR,F
	set@page bc@LL207
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL207
	Clrf PP0H
	Movlw 100
	Movwf PP0
	Clrf PP1H
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1
	F@Call d@vd
	Bsf STATUS,5
ram_bank = 1
	Movwf VADIM
bc@LL207
	Bcf STATUS,5
ram_bank = 0
F1_000609 equ $ ; in [BABAM_ICIN.BAS] If VAayar = 1 Then VAdim = 200 / VMayar   '.2 (200mV) adim araligi icin, Ornek : VMax=25V iken her adim 8 artiracak
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf VAAYAR,W
	set@page bc@LL209
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL209
	Clrf PP0H
	Movlw 200
	Movwf PP0
	Clrf PP1H
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1
	F@Call d@vd
	Bsf STATUS,5
ram_bank = 1
	Movwf VADIM
bc@LL209
	Bcf STATUS,5
ram_bank = 0
F1_000610 equ $ ; in [BABAM_ICIN.BAS] If VAayar = 2 Then VAdim = 500 / VMayar   '.5 (500mV)
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf VAAYAR,W
	set@page bc@LL211
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL211
	Movlw 1
	Movwf PP0H
	Movlw 244
	Movwf PP0
	Clrf PP1H
	Bsf STATUS,5
ram_bank = 1
	Movf VMAYAR,W
	Bcf STATUS,5
ram_bank = 0
	Movwf PP1
	F@Call d@vd
	Bsf STATUS,5
ram_bank = 1
	Movwf VADIM
bc@LL211
	Bcf STATUS,5
ram_bank = 0
F1_000611 equ $ ; in [BABAM_ICIN.BAS] If AAayar = 0 Then AAdim = 1
	Bsf STATUS,5
ram_bank = 1
	Movf AAAYAR,F
	set@page bc@LL213
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL213
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Movwf AADIM
bc@LL213
	Bcf STATUS,5
ram_bank = 0
F1_000612 equ $ ; in [BABAM_ICIN.BAS] If AAayar = 1 Then AAdim = 4
	Movlw 1
	Bsf STATUS,5
ram_bank = 1
	Subwf AAAYAR,W
	set@page bc@LL215
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL215
	Movlw 4
	Bsf STATUS,5
ram_bank = 1
	Movwf AADIM
bc@LL215
	Bcf STATUS,5
ram_bank = 0
F1_000613 equ $ ; in [BABAM_ICIN.BAS] If AAayar = 2 Then AAdim = 10
	Movlw 2
	Bsf STATUS,5
ram_bank = 1
	Subwf AAAYAR,W
	set@page bc@LL217
	Bcf STATUS,5
ram_bank = 0
	Btfss STATUS,2
	Goto bc@LL217
	Movlw 10
	Bsf STATUS,5
ram_bank = 1
	Movwf AADIM
bc@LL217
	Bcf STATUS,5
ram_bank = 0
F1_000615 equ $ ; in [BABAM_ICIN.BAS] Return
	Return
ACILIS
F1_000619 equ $ ; in [BABAM_ICIN.BAS] Low LCD_RW    'PORTC.0 bunu direkt kart uzerinde saseye cekersek bir port bosaltiriz
	Bsf STATUS,5
ram_bank = 1
	Bcf TRISC,0
	Bcf STATUS,5
ram_bank = 0
	Bcf PORTC,0
F1_000620 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000621 equ $ ; in [BABAM_ICIN.BAS] Cls
	F@Call Lcd@Cls
F1_000622 equ $ ; in [BABAM_ICIN.BAS] DelayMS 20
	Movlw 20
	F@Call dl@ms
F1_000623 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$40,$00,$0F,$0F,$0F,$00,$01,$03,$07    '7W nin grafiksel gosterimi icin character map e eklenti
	Movlw 254
	F@Call Print
	Movlw 64
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 15
	F@Call Print
	Movlw 15
	F@Call Print
	Movlw 15
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 7
	F@Call Print
F1_000624 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$48,$00,$1C,$1C,$1C,$1C,$18,$17,$07
	Movlw 254
	F@Call Print
	Movlw 72
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 28
	F@Call Print
	Movlw 24
	F@Call Print
	Movlw 23
	F@Call Print
	Movlw 7
	F@Call Print
F1_000625 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$50,$00,$00,$00,$00,$00,$00,$00,$03
	Movlw 254
	F@Call Print
	Movlw 80
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 3
	F@Call Print
F1_000626 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$58,$00,$00,$03,$03,$07,$06,$06,$06
	Movlw 254
	F@Call Print
	Movlw 88
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 6
	F@Call Print
	Movlw 6
	F@Call Print
	Movlw 6
	F@Call Print
F1_000627 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$60,$07,$0E,$0E,$0E,$0E,$0E,$00,$00
	Movlw 254
	F@Call Print
	Movlw 96
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
F1_000628 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$68,$03,$03,$01,$01,$00,$00,$00,$00
	Movlw 254
	F@Call Print
	Movlw 104
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
F1_000629 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$70,$13,$13,$1B,$1B,$1F,$0E,$00,$00
	Movlw 254
	F@Call Print
	Movlw 112
	F@Call Print
	Movlw 19
	F@Call Print
	Movlw 19
	F@Call Print
	Movlw 27
	F@Call Print
	Movlw 27
	F@Call Print
	Movlw 31
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
F1_000630 equ $ ; in [BABAM_ICIN.BAS] Print $FE,$78,$1E,$1E,$1E,$0E,$04,$00,$00,$00
	Movlw 254
	F@Call Print
	Movlw 120
	F@Call Print
	Movlw 30
	F@Call Print
	Movlw 30
	F@Call Print
	Movlw 30
	F@Call Print
	Movlw 14
	F@Call Print
	Movlw 4
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 0
	F@Call Print
F1_000632 equ $ ; in [BABAM_ICIN.BAS] For sayi = 1 To 16
	Movlw 1
	Movwf SAYI
fr@lb219
	Movlw 17
	Subwf SAYI,W
	set@page nx@lb220
	Btfsc STATUS,0
	Goto nx@lb220
F1_000633 equ $ ; in [BABAM_ICIN.BAS] Print At 1,16-sayi," ",$00,$01,$02,$03,"PicPSU v.35"
	Movlw 128
	Movwf BPFH
	Movlw 1
	Movwf GEN
	Movf SAYI,W
	Sublw 16
	F@Call Cursor
	Movlw 32
	F@Call Print
	Movlw 0
	F@Call Print
	Movlw 1
	F@Call Print
	Movlw 2
	F@Call Print
	Movlw 3
	F@Call Print
	Movlw ((str@lb32 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb32 & 255)
	F@Call c@strout
F1_000634 equ $ ; in [BABAM_ICIN.BAS] Print At 2,16-sayi," ",$04,$05,$06,$07,"Yavuz Dinc "
	Movlw 128
	Movwf BPFH
	Movlw 2
	Movwf GEN
	Movf SAYI,W
	Sublw 16
	F@Call Cursor
	Movlw 32
	F@Call Print
	Movlw 4
	F@Call Print
	Movlw 5
	F@Call Print
	Movlw 6
	F@Call Print
	Movlw 7
	F@Call Print
	Movlw ((str@lb33 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb33 & 255)
	F@Call c@strout
F1_000635 equ $ ; in [BABAM_ICIN.BAS] DelayMS 100
	Movlw 100
	F@Call dl@ms
F1_000636 equ $ ; in [BABAM_ICIN.BAS] Next sayi
	Incf SAYI,F
	set@page fr@lb219
	Btfss STATUS,2
	Goto fr@lb219
nx@lb220
F1_000638 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000642 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000643 equ $ ; in [BABAM_ICIN.BAS] Print At 1,1,"A: Ayarlanan    "
	Movlw 128
	Movwf BPFH
	Movlw 128
	F@Call LCD@crs
	Movlw ((str@lb34 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb34 & 255)
	F@Call c@strout
F1_000644 equ $ ; in [BABAM_ICIN.BAS] Print At 2,1,"O: Olculen      "
	Movlw 128
	Movwf BPFH
	Movlw 192
	F@Call LCD@crs
	Movlw ((str@lb35 >> 8) & 255)
	Movwf GEN4H
	Movlw (str@lb35 & 255)
	F@Call c@strout
F1_000645 equ $ ; in [BABAM_ICIN.BAS] DelayMS 1000
	Movlw 3
	Movwf PP1H
	Movlw 232
	F@Call dly@w
F1_000647 equ $ ; in [BABAM_ICIN.BAS] Return
	Return
BEKLET
F1_000651 equ $ ; in [BABAM_ICIN.BAS] For Sure3 = 1 To 255
	Movlw 1
	Movwf SURE3
fr@lb221
F1_000652 equ $ ; in [BABAM_ICIN.BAS] DelayMS 10
	Movlw 10
	F@Call dl@ms
F1_000653 equ $ ; in [BABAM_ICIN.BAS] Next Sure3
	Incf SURE3,F
	set@page fr@lb221
	Btfss STATUS,2
	Goto fr@lb221
nx@lb222
F1_000654 equ $ ; in [BABAM_ICIN.BAS] Return
	Return
F1_000656 equ $ ; in [BABAM_ICIN.BAS] Enable
F1_EOF equ $ ; BABAM_ICIN.BAS
 LIST
;---------------------------------------------
; Null Terminated Strings

; String A:  0.0V  0.00A 
str@lb1
	DE 65,58,32,32,48,46,48,86,32,32,48,46,48,48,65,32,0
;---------------------------------------------
; String O:  0.0V  0.00A 
str@lb2
	DE 79,58,32,32,48,46,48,86,32,32,48,46,48,48,65,32,0
;---------------------------------------------
; String  PIL SARJ MENU  
str@lb3
	DE 32,80,73,76,32,83,65,82,74,32,77,69,78,85,32,32,0
;---------------------------------------------
; String  -------------  
str@lb4
	DE 32,45,45,45,45,45,45,45,45,45,45,45,45,45,32,32,0
;---------------------------------------------
; String 4.8 V  
str@lb5
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 8 Sa
str@lb6
	DE 84,75,83,58,32,56,32,83,97,0
;---------------------------------------------
; String 4.8 V  
str@lb7
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 6 Sa
str@lb8
	DE 84,75,83,58,32,54,32,83,97,0
;---------------------------------------------
; String 4.8 V  
str@lb9
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 4 Sa
str@lb10
	DE 84,75,83,58,32,52,32,83,97,0
;---------------------------------------------
; String 4.8 V  
str@lb11
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 2 Sa
str@lb12
	DE 84,75,83,58,32,50,32,83,97,0
;---------------------------------------------
; String 4.8 V  
str@lb13
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 1 Sa
str@lb14
	DE 84,75,83,58,32,49,32,83,97,0
;---------------------------------------------
; String 4.8 V  
str@lb15
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 40dk
str@lb16
	DE 84,75,83,58,32,52,48,100,107,0
;---------------------------------------------
; String 4.8 V  
str@lb17
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS: 20dk
str@lb18
	DE 84,75,83,58,32,50,48,100,107,0
;---------------------------------------------
; String 4.8 V  
str@lb19
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS:  5dk
str@lb20
	DE 84,75,83,58,32,32,53,100,107,0
;---------------------------------------------
; String 4.8 V  
str@lb21
	DE 52,46,56,32,86,32,32,0
;---------------------------------------------
; String TKS:  1dk
str@lb22
	DE 84,75,83,58,32,32,49,100,107,0
;---------------------------------------------
; String  AYARLAR  MENU  
str@lb23
	DE 32,65,89,65,82,76,65,82,32,32,77,69,78,85,32,32,0
;---------------------------------------------
; String  -------------  
str@lb24
	DE 32,45,45,45,45,45,45,45,45,45,45,45,45,45,32,32,0
;---------------------------------------------
; String AYAR:          
str@lb25
	DE 65,89,65,82,58,32,32,32,32,32,32,32,32,32,32,0
;---------------------------------------------
; String  Volt Adim
str@lb26
	DE 32,86,111,108,116,32,65,100,105,109,0
;---------------------------------------------
; String  Akim Adim
str@lb27
	DE 32,65,107,105,109,32,65,100,105,109,0
;---------------------------------------------
; String  Max Volt 
str@lb28
	DE 32,77,97,120,32,86,111,108,116,32,0
;---------------------------------------------
; String  Max Akim 
str@lb29
	DE 32,77,97,120,32,65,107,105,109,32,0
;---------------------------------------------
; String  ADAPTOR  MENU  
str@lb30
	DE 32,65,68,65,80,84,79,82,32,32,77,69,78,85,32,32,0
;---------------------------------------------
; String  -------------  
str@lb31
	DE 32,45,45,45,45,45,45,45,45,45,45,45,45,45,32,32,0
;---------------------------------------------
; String PicPSU v.35
str@lb32
	DE 80,105,99,80,83,85,32,118,46,51,53,0
;---------------------------------------------
; String Yavuz Dinc 
str@lb33
	DE 89,97,118,117,122,32,68,105,110,99,32,0
;---------------------------------------------
; String A: Ayarlanan    
str@lb34
	DE 65,58,32,65,121,97,114,108,97,110,97,110,32,32,32,32,0
;---------------------------------------------
; String O: Olculen      
str@lb35
	DE 79,58,32,79,108,99,117,108,101,110,32,32,32,32,32,32,0
;---------------------------------------------
	END

