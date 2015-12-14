                 '*************************`****************************************
'*  Name    : PowerSupply_v1.BAS                                  *
'*  Author  : Baris Dinc (TA7W)                                   *
'*  Notice  : Copyright (c) 2010                                  *
'*          : All Rights Reserved                                 *
'*  Date    : 7/16/2010                                           *
'*  Version : 1.0                                                 *
'*  Notes   : Baslangic olarak VE2EMM'nin C kodundan cevrilmistir *
'*          : Switch/Anahtar yerine Rotary Switch eklendi         *
'*          : Interrupt kullanimi eklendi                         *
'*          : VoltajAKim Secim butonu eklendi                     *
'*          : MaxVol, MaxAmp secimi Eklendi                       *
'*          : Ayar degistirme eklendi                             *
'*          : Cok bos yer kaldigi icin ekranlarda soparildi       *
'******************************************************************
Device  16F876A
Xtal = 20
'#fuses HS,NOWDT,PUT,BROWNOUT,NOPROTECT,NOLVP,NOCPD,NOWRT

All_Digital   = true
'portb_pullups = true

GoTo Set_Registers

Set_Variables:
    
    Dim Mode                As Byte  '1:Normal Mod, 0:Ayar Menusu Modu
    Dim sayi                As Byte
    Dim ilkkez              As Byte  'program ilk kez calistiirldiginda NVRAM i temizlemek icin    
    Dim Sure1               As Byte  'sure isleri icin kullanilacak degiskenlerden biri
    Dim Sure2               As Byte  'sure isleri icin kullanilacak degiskenlerden biri
    Dim Sure3               As Byte
    
    Dim LCD_V[4]            As Byte 'LCD ye voltaj yazmak icin XX.X
    Dim LCD_V1[5]           As Byte 'LCD ye voltaj yazmak icin, max Vmax * 1024 ... 50 * 1024
    Dim LCD_A[5]            As Byte 'LCD ye akim yazmak icin   XX.XXX
    Dim LCD_A1[5]           As Byte 'LCD ye akim yazmak icin , max  Amax * 1024 ... 30 * 1024

    Dim buton_old           As Byte 'portB eski durumu
    Dim buton_new           As Byte 'portB yeni durumu
    Dim dcnt                As Byte 'tus hizi icin arada kullanilan geri sayim
    Dim VAsec               As Bit  '0:volt, 1:akim (encoder uzerindeki butonun gorevi)
    Dim VAsecyaz            As Bit  'ekran guncelleme icin
    Dim PilVAsec            As Bit  'Pil icin 0:volt, 1:akim (encoder uzerindeki butonun gorevi)
    Dim PilVAsecyaz         As Bit  'Pil ekran guncelleme icin
    Dim BtnTggl             As Bit  'encoder butonu kontrolu icin
    Dim BtnSure             As Byte 'Butona ne kadar sure basildi
    
    

    Dim volt_ort[8]        As Word  'bunlar signed olmali

    Dim volt_ayarlanan      As Word
    Dim volt_ayarlanan_yaz  As Bit 
    Dim p_volt_ayarlanan      As Word 'pil icin
    Dim p_volt_ayarlanan_yaz  As Bit  'pil icin
    
    Dim volt_okunan         As Word
    Dim volt_okunan_old     As Word
    Dim volt_ortalama_old   As Word

    Dim volt_toplam         As Dword
    Dim volt_ortalama       As Word
        
    Dim akim_ort[8]        As Word  'bunlar signed olmali
    Dim akim_ayarlanan      As Word
    Dim akim_ayarlanan_yaz  As Bit 
    Dim p_akim_ayarlanan      As Word 'pil icin
    Dim p_akim_ayarlanan_yaz  As Bit  'pil icin
    Dim akim_okunan         As Word
    Dim akim_okunan_old     As Word
    Dim akim_ortalama_old   As Word
    
    Dim akim_toplam         As Dword
    Dim akim_ortalama       As Word
    Dim akim_latch          As Bit
    
    Dim SayOku              As Byte 'AD converter icin
    Dim adbeklet            As Byte 'AD cevriminin zmanini yavaslatmak icin

    Dim V1                  As Word 'Volt okunan icin 
    Dim A1                  As Word 'Akim okunan icin
    
    Dim AyarSec             As Byte 'secilen ayar
    Dim AyarYaz             As Bit  'ayar ekranini guncelle
    Dim VAayar              As Byte 'voltaj adim araligi (0,1,2), ekrana .1 .2 .5 yazdiracagim
    Dim AAayar              As Byte 'akim adim araligi (0,1,2), ekrana .1 .2 .5 yazdiracagim
    Dim VMayar              As Byte 'Maksimum Voltaj Ayari (0..40)
    Dim AMayar              As Byte 'Maksimum Akim ayari  (0..30)
    Dim VAdim               As Byte 'voltaj adim katsayisi
    Dim AAdim               As Byte 'Akim adim katsayisi
    
    
    Clear 'tum degiskenleri sifirla
    
    p_akim_ayarlanan = 700
    p_volt_ayarlanan = 48
       
    'LCD Tanimlama
    Declare LCD_Type  0  'ALPHANUMERIK
    Declare LCD_DTPin PORTC.4
    Declare LCD_ENPin PORTA.5
    Declare LCD_RSPin PORTC.3
    Declare LCD_Lines 4
    Declare LCD_Interface 4
    
    Symbol  LCD_RW = PORTC.0
    
    GoTo Memory_Defaults
    
    
    
'****** INTERRUPT RUTINI    
Disable
Int_Sub:


If INTCON.3 = 1 Then INTCON.3 = 0 'clear PBIF 'PortB0 Change Interrupt

If INTCON.0 = 1 Then   'portb change interrupt flag
    INTCON.0 = 0
    'sag  sol
    '11   11
    '01   10
    '00   00
    '10   01
     If PORTB.5 = 0 Then BtnTggl = 1
     If PORTB.5 = 1 And BtnTggl = 1 Then
        If Mode = 0 Then VAsec   = VAsec + 1    'normal ekran Volt/akim secimi
        If Mode = 1 Then PilVAsec = PilVAsec + 1    'Pilin AKim Voltaj secimi
        If Mode = 2 Then AyarSec = AyarSec + 1  'ayar ekrani secimleri
        If AyarSec = 4 Then AyarSec = 0
        VAsecyaz = 1 ' her halukarda donuste ekrani guncelle
        AyarYaz  = 1
        PilVAsecyaz = 1
        BtnTggl = 0
        BtnSure = 0 'butona basilma suresini de sifirla 
    EndIf

    buton_new = PORTB & %11000000

     If buton_old = %00000000  Then    'bu satir  yuzey monte olan tip icin acik olacak (turuncu)
        If dcnt > 10 Then dcnt = 10 'yanlislikla artmis olma ihtimaline karsi
        If Mode = 0 Then 'Normal mode da isek, encoder Volt ve akim ayarlayaacak
            If VAsec = 0 Then            
                If volt_ayarlanan + (buton_new.7 * (dcnt) * VAdim) < 1023 Then volt_ayarlanan = volt_ayarlanan + (buton_new.7 * (dcnt) * VAdim) 
                If volt_ayarlanan - (buton_new.6 * (dcnt) * VAdim) > 3    Then volt_ayarlanan = volt_ayarlanan - (buton_new.6 * (dcnt) * VAdim)
                volt_ayarlanan_yaz = 1
            Else 
                If akim_ayarlanan + (buton_new.7 * (dcnt) * AAdim) < 1023 Then akim_ayarlanan = akim_ayarlanan + (buton_new.7 * (dcnt) * AAdim) 
                If akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim) > 3    Then akim_ayarlanan = akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim)    
                If akim_ayarlanan - (buton_new.6 * (dcnt) * AAdim) < 4    Then akim_ayarlanan = 1 'en alt degere gelince bitir    
                akim_ayarlanan_yaz = 1
            EndIf
        Else If Mode = 1 Then 'Pil Sarj modunda isek, encoder pilin Volt ve akimini ayarlayaacak
            If PilVAsec = 1 Then            
                If p_volt_ayarlanan + (buton_new.7 * 12) < 240 Then p_volt_ayarlanan = p_volt_ayarlanan + (buton_new.7 * 12) 
                If p_volt_ayarlanan - (buton_new.6 * 12) > 12  Then p_volt_ayarlanan = p_volt_ayarlanan - (buton_new.6 * 12)
                p_volt_ayarlanan_yaz = 1
            Else 
                If p_akim_ayarlanan + (buton_new.7 * 50) < 10000 Then p_akim_ayarlanan = p_akim_ayarlanan + (buton_new.7 * 50) 
                If p_akim_ayarlanan - (buton_new.6 * 50) > 50    Then p_akim_ayarlanan = p_akim_ayarlanan - (buton_new.6 * 50)    
                p_akim_ayarlanan_yaz = 1
            EndIf
        Else 'Ayar Degistirme Modunda encoder'in gorevi secimleri ayarlamak
             'aslinda bunu tek bir IF icinde de yaapbilirim
            If AyarSec = 0 Then    
                VAayar = VAayar + buton_new.7
                VAayar = VAayar - buton_new.6            
                If VAayar > 2 Then VAayar = 0
                AyarYaz = 1
            ElseIf AyarSec = 1 Then    
                AAayar = AAayar + buton_new.7
                AAayar = AAayar - buton_new.6            
                If AAayar > 2 Then AAayar = 0
                AyarYaz = 1
            ElseIf AyarSec = 2 Then    
                VMayar = VMayar + buton_new.7
                VMayar = VMayar - buton_new.6            
                If VMayar > 50 Then VMayar = 0
                AyarYaz = 1
            ElseIf AyarSec = 3 Then    
                AMayar = AMayar + buton_new.7
                AMayar = AMayar - buton_new.6            
                If AMayar > 30 Then AMayar = 0
                AyarYaz = 1
            EndIf         
        
        EndIf
        dcnt = 10
    EndIf
    buton_old = buton_new    
    If volt_ayarlanan > 5000 Then volt_ayarlanan = 10 'yanlislikla - (eksi) degere gecersek diye
    If akim_ayarlanan > 5000 Then akim_ayarlanan = 10
EndIf

If INTCON.2 = 1 Then   'Timer0 Interrupt Flag
    INTCON.2 = 0
    adbeklet = adbeklet + 1
    If adbeklet = 10 Then adbeklet = 0
    If ADCON0.2 = 0 And adbeklet = 0 Then ADCON0.2 = 1
    If BtnTggl = 1 And BtnSure < 100 Then BtnSure = BtnSure + 1 Else BtnSure = 0
    If BtnSure > 99 Then 
        Mode = Mode + 1 'Menu Modu degistiriyoruz
        If Mode = 3 Then Mode = 0
        BtnTggl = 0
        BtnSure = 0
    EndIf
    
EndIf

If PIR1.0 = 1 Then 'Timer1 interrupt routine
    PIR1.0 = 0
    TMR1H = $FF     'timer1 in sayma degerini azaltmak icin 
    TMR1L = $00     'tmr1h ve tmr1l yi set ediyoruz interrupt icinde
'    If ADCON0.2 = 0 Then ADCON0.2 = 1
    If dcnt > 1 Then dcnt = dcnt - 1 'ne kadar hizli donuyoruz onu anlamak icin
    Sure1 = Sure1 + 1
    If Sure1 = 255 Then
        Sure2 = Sure2 + 1
        If Sure2 = 20 Then  
            VAsecyaz = 1            'ekranda saniyede bir refresh islemi yapmak icin
            volt_ayarlanan_yaz = 1
            akim_ayarlanan_yaz = 1
            Sure2 = 0
            'cls
        EndIf
    EndIf
EndIf 

If PIR1.6 = 1 Then                      'AD bitirdi
	If ADCON0.3 = 0 Then
    	volt_okunan.Byte0 = ADRESL  'veriyi oku
    	volt_okunan.Byte1 = ADRESH  'veriyi oku
    	ADCON0.3 = 1                'simdi RA1 i oku 
    	If volt_okunan > volt_ayarlanan Then volt_okunan = volt_ayarlanan 'okunan deger ayarlananin ustune zaten cikamaz ama...
    	volt_toplam = volt_toplam - volt_ort[SayOku]
    	volt_ort[SayOku] = volt_okunan
    	volt_toplam = volt_toplam + volt_ort[SayOku]    	        
        volt_ortalama = volt_toplam >> 2
	ElseIf ADCON0.3 = 1 Then
    	akim_okunan.Byte0 = ADRESL 'veriyi oku
    	akim_okunan.Byte1 = ADRESH 'veriyi oku
    	ADCON0.3 = 0               'simdi RA0 i oku 
    	akim_toplam = akim_toplam - akim_ort[SayOku]
    	akim_ort[SayOku] = akim_okunan
    	akim_toplam = akim_toplam + akim_ort[SayOku]
    	akim_ortalama = akim_toplam >> 2
        SayOku = SayOku + 1
        If SayOku = 4 Then SayOku = 0 'her akim okumadan sonra sayaci arttir
    EndIf

	PIR1.6 = 0      'AD cevrim resetle
'	ADCON0.2 = 1    'AD cevrimini baslat GO.... bunu timer'a tasidim

EndIf

Enable 
Context Restore

On_Interrupt GoTo Int_Sub

EkranKur:
    VAsecyaz = 1            'ekrana ilk acilis degerlerini yazdirmak icin
    volt_ayarlanan_yaz = 1
    akim_ayarlanan_yaz = 1
    Cls  
    DelayMS 20  
    Mode = 0 'sistemi normal mode'a getir   
    Print At 1,1, "A:  0.0V  0.00A "
    Print At 2,1, "O:  0.0V  0.00A "
AnaProgram:
    If Mode = 0 Then 'Normal Sistem Modu
        If Sure2 = 0 Then 'sabit nesneler icinekran tazeleme suremiz
            Print At 1,1, "A:" : Print At 1,6,"." : Print At 1,8,"V"  : Print At 1,12,"." : Print At 1,15,"A"   'Ekrandaki sabit nesleri yenile
            Print At 2,1, "O:" : Print At 2,6,"." : Print At 2,8,"V " : Print At 2,12,"." : Print At 2,15,"A "  'Ekrandaki sabit nesleri yenile
        EndIf
        If VAsec = 0  Then 'And VAsecyaz = 1 Then 
            Print At 1,3 , 201
            Print At 1,9 , 200
            Print At 1,16, " "            
            VAsecyaz = 0
        EndIf
        If VAsec = 1  Then 'And VAsecyaz = 1 Then 
            Print At 1,3 , " "
            Print At 1,9 , 201
            Print At 1,16, 200            
            VAsecyaz = 0
        EndIf                                
        If volt_ayarlanan_yaz = 1 Then 
            V1 = volt_ayarlanan * VMayar
            StrN LCD_V1 = Str$(Dec V1)
            LCD_V[2] = "."
            If V1 > 9999  Then
                LCD_V[0] = LCD_V1[0]
                LCD_V[1] = LCD_V1[1]
                LCD_V[3] = LCD_V1[2]
            ElseIf V1 > 999 Then
                LCD_V[0] = " "
                LCD_V[1] = LCD_V1[0]
                LCD_V[3] = LCD_V1[1]
            Else
                LCD_V[0] = " "
                LCD_V[1] = "0"
                LCD_V[3] = LCD_V1[0]
            EndIf   
            Print At 1,4,Str LCD_V,"V"         
        EndIf

        If akim_ayarlanan_yaz = 1 Then 
            A1 = akim_ayarlanan * AMayar
            StrN LCD_A1 = Str$(Dec A1)
            LCD_A[2] = "."
            If A1 > 9999  Then
                LCD_A[0] = LCD_A1[0]
                LCD_A[1] = LCD_A1[1]
                LCD_A[3] = LCD_A1[2]
                LCD_A[4] = LCD_A1[3]
            ElseIf A1 > 999 Then
                LCD_A[0] = " "
                LCD_A[1] = LCD_A1[0]
                LCD_A[3] = LCD_A1[1]
                LCD_A[4] = LCD_A1[2]
            ElseIf A1 > 99 Then
                LCD_A[0] = " "
                LCD_A[1] = "0"
                LCD_A[3] = LCD_A1[0]
                LCD_A[4] = LCD_A1[1]
            Else
                LCD_A[0] = " "
                LCD_A[1] = "0"
                LCD_A[3] = "0"
                LCD_A[4] = LCD_A1[0]
            EndIf   
            Print At 1,10,Str LCD_A,"A"         
        EndIf
                
        If Sure2 = 0 Then 
            DelayMS 2 'hafizaya almasi icin sure ver
            If volt_ayarlanan_yaz = 1 Or akim_ayarlanan_yaz = 1 Then EWrite 1,[volt_ayarlanan,akim_ayarlanan] 'degerleri hafizaya al
            DelayMS 2
        EndIf
        
        If volt_ortalama_old != volt_ortalama Then  'ekranda oynamalari engellemek icin aradaki fark
            V1 = (volt_ortalama+2) * VMayar              'belli bir degerin uzerinde ise guncelleme yap
            StrN LCD_V1 = Str$(Dec V1)
            If V1 > 9999  Then
                LCD_V[0] = LCD_V1[0]
                LCD_V[1] = LCD_V1[1]
                LCD_V[3] = LCD_V1[2]
            ElseIf V1 > 999 Then
                LCD_V[0] = " "
                LCD_V[1] = LCD_V1[0]
                LCD_V[3] = LCD_V1[1]
            Else
                LCD_V[0] = " "
                LCD_V[1] = "0"
                LCD_V[3] = LCD_V1[0]
            EndIf   
            Print At 2,4,Str LCD_V,"V"
        EndIf
        If akim_ortalama_old != akim_ortalama Then 
            A1 = akim_ortalama * AMayar
            StrN LCD_A1 = Str$(Dec A1)
            LCD_A[2] = "."
            If A1 > 9999  Then
                LCD_A[0] = LCD_A1[0]
                LCD_A[1] = LCD_A1[1]
                LCD_A[3] = LCD_A1[2]
                LCD_A[4] = LCD_A1[3]
            ElseIf A1 > 999 Then
                LCD_A[0] = " "
                LCD_A[1] = LCD_A1[0]
                LCD_A[3] = LCD_A1[1]
                LCD_A[4] = LCD_A1[2]
            ElseIf A1 > 99 Then
                LCD_A[0] = " "
                LCD_A[1] = "0"
                LCD_A[3] = LCD_A1[0]
                LCD_A[4] = LCD_A1[1]
            Else
                LCD_A[0] = " "
                LCD_A[1] = "0"
                LCD_A[3] = "0"
                LCD_A[4] = LCD_A1[0]
            EndIf   
            Print At 2,10,Str LCD_A,"A"         
        EndIf
        volt_ortalama_old = volt_ortalama
        akim_ortalama_old = akim_ortalama
        volt_ayarlanan_yaz = 0
        akim_ayarlanan_yaz = 0


    Else If Mode = 1 Then   'Pil sarj modu
            Cls
        For sayi = 1 To 16
            Print At 1,sayi,255
            Print At 2,sayi,255
            DelayMS 20
        Next sayi
        For sayi = 1 To 16
            Print At 1,sayi," "
            Print At 2,sayi," "
            DelayMS 20
        Next sayi
      Print At 1,1," PIL SARJ MENU  "
      Print At 2,1," -------------  "
      DelayMS 1000
      PilSarjMenu:
         Print $FE,$40,$07,$04,$1C,$10,$10,$1C,$04,$07
         Print $FE,$48,$1F,$00,$00,$00,$00,$00,$00,$1F
         Print $FE,$50,$1F,$01,$01,$01,$01,$01,$01,$1F
         Print $FE,$58,$1F,$07,$07,$07,$07,$07,$07,$1F    
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$1,$1,$2," %00"
         Print At 2,8,"TKS: 8 Sa"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$1,$1,$3," %10"
         Print At 2,8,"TKS: 6 Sa"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$1,$1,$FF," %20"
         Print At 2,8,"TKS: 4 Sa"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$1,$3,$FF," %40"
         Print At 2,8,"TKS: 2 Sa"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$1,$FF,$FF," %50"
         Print At 2,8,"TKS: 1 Sa"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$3,$FF,$FF," %60"
         Print At 2,8,"TKS: 40dk"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$1,$FF,$FF,$FF," %70"
         Print At 2,8,"TKS: 20dk"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$3,$FF,$FF,$FF," %80"
         Print At 2,8,"TKS:  5dk"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet
         Print At 1,2,"4.8 V  "
         Print At 2,1,201,Dec p_akim_ayarlanan,"mA "
         Print At 1,8,$0,$FF,$FF,$FF,$FF," %99"
         Print At 2,8,"TKS:  1dk"
         If Mode != 1 Then GoTo DongudenCik
         GoSub Beklet

         If Mode = 1 Then GoTo PilSarjMenu
         DongudenCik:


    Else 'menu Modu
        Cls
        For sayi = 1 To 16
            Print At 1,sayi,255
            Print At 2,sayi,255
            DelayMS 20
        Next sayi
        For sayi = 1 To 16
            Print At 1,sayi," "
            Print At 2,sayi," "
            DelayMS 20
        Next sayi
        Print At 1,1," AYARLAR  MENU  "
        Print At 2,1," -------------  "
        DelayMS 1000
        
        Print At 1,1,   "AYAR:          "
        MenuModu:
            'Menu modunda yapacaklarimi buraya yazacagim
            If AyarYaz = 1 Then
                If AyarSec = 0 Then Print At 2,1,201,"." : Print At 1,6," Volt Adim" : Else : Print At 2,1," ."
                If VAayar  = 0 Then Print At 2,3,"1"
                If VAayar  = 1 Then Print At 2,3,"2"
                If VAayar  = 2 Then Print At 2,3,"5"
                If AyarSec = 1 Then Print At 2,4,201 : Print At 1,6," Akim Adim" : Else : Print At 2,4," " 
                If AAayar  = 0 Then Print At 2,5,"Yav"
                If AAayar  = 1 Then Print At 2,5,"Ort"
                If AAayar  = 2 Then Print At 2,5,"Hiz"
                If AyarSec = 2 Then Print At 2,8,201 : Print At 1,6," Max Volt " : Else : Print At 2,8," " 
                Print At 2,9,Dec VMayar,"V "
                If AyarSec = 3 Then Print At 2,12,201: Print At 1,6," Max Akim " : Else : Print At 2,12," " 
                Print At 2,13,Dec AMayar,"A "
                EWrite 5,[VAayar,AAayar,VMayar,AMayar]
                GoSub AdimAyarla
            EndIf
            
            DelayMS 200
            'Ayaryaz = 0
            If Mode = 2 Then GoTo MenuModu
                        Cls
        For sayi = 1 To 16
            Print At 1,sayi,255
            Print At 2,sayi,255
            DelayMS 20
        Next sayi
        For sayi = 1 To 16
            Print At 1,sayi," "
            Print At 2,sayi," "
            DelayMS 20
        Next sayi
      Print At 1,1," ADAPTOR  MENU  "
      Print At 2,1," -------------  "
      DelayMS 1000

            GoTo EkranKur
    EndIf

    CCPR1L = akim_ayarlanan >> 2
    CCP1CON.4 = akim_ayarlanan.0 
    CCP1CON.5 = akim_ayarlanan.1
    
    CCPR2L = volt_ayarlanan >> 2
    CCP2CON.4 = volt_ayarlanan.0 
    CCP2CON.5 = volt_ayarlanan.1
            
    DelayMS 50    
    GoTo AnaProgram
    

Disable
Set_Registers:
    TRISA      = %11001011
    TRISB      = %11100000
    TRISC      = %00000000
    
    OPTION_REG = %00000111 'prescaler 1:256 timer0  
    'INTCON     = %11101000 'GIE PIE TMR0IE PBIE     a0 10100000
    INTCON     = %11101000  
    

    ADCON0     = %10000001 
    ADCON1     = %10000100 'RA0_RA1_RA3_ANALOG
'    ADCON1     = %10000101 'RA0_RA1_ANALOG  RA3_Ref+  Referansi disardan vererek test etmek icin
    
    CCP1CON    = %00001100 ' !!!!5. ve 4. biti i pwm e gore ayarlayacagim
    CCP2CON    = %00001100 ' lsb tarafini CCPR1L ye yazacagiz
    
    CCPR1L     = %00000000 'duty cycle baslangic olarak 0 set ediliyor (AKIM)
    CCPR2L     = %00000000 'duty cycle baslangic olarak 0 Set ediliyor (VOLTAJ)
                           'ayarlanacak deger 10 bit derinligindedir
                           '8 bit CCPRxL registerine yazilacak LSB 2 bit ise
                           'CCPxCON'un 4. ve 5. bitine yazilacak (1024 adim)
    T1CON      = %00110001 ' TImer 1S
    T2CON      = %00001111 ' Timer 2 prescaler 1:16 postscaler 1:16  t2enabled (bit2)
    PR2        = %11111111 ' PWM peryodu 
                           ' timer2 prescaler = 16
                           ' Frekans = Fosc/4  / T2 prescaler / PR2
                           ' Frekans = 20Mhz/4 /  16 / 255 = 1.22Khz
                            
    PIE1 = %01000001 'ADIE  T1IE

    
    PORTB.3 = 0            'B portundaki pulluplar sorun cikarmasin diye


    GoTo Set_Variables

Memory_Defaults:
    GoSub Acilis
    'bunlar varsayilan degerler, dogrularini EEPROM dan okuyacagim
    ilkkez = ERead 0
    If ilkkez != 104 Then '104 rastgele secilmis bir sayidir, daha once hic hafiza kaydi yapmadiysak ilk degerleri yaz
        volt_ayarlanan = 100 'yaklasik 2,5 volt
        akim_ayarlanan = 100 'yaklasik 1,5 amper
        VAayar         = 0   '.1 adim araligi (voltaj)
        AAayar         = 0   '.1 adim araligi (akim)
        VMayar         = 25  'maksimum 25V.. 0-25v ayarli 
        AMayar         = 15  'maksimum 15A.. 0-12A ayarli
        'her ihtimale karsi bunlari NVRAM a da yazalim
        EWrite 0,[104,volt_ayarlanan,akim_ayarlanan,VAayar,AAayar,VMayar,AMayar]
        DelayMS 500 'yazma isleminin tamamlanmasini bekle
    Else
        volt_ayarlanan = ERead 1
        akim_ayarlanan = ERead 3
        VAayar         = ERead 5
        AAayar         = ERead 6
        VMayar         = ERead 7
        AMayar         = ERead 8
    EndIf    
    GoSub AdimAyarla
    GoTo EkranKur
    
AdimAyarla:
    AyarYaz = 1                               
    If VAayar = 0 Then VAdim = 100 / VMayar   '.1 (100mV) adim araligi icin, Ornek : VMax=25V iken her adim 4 artiracak
    If VAayar = 1 Then VAdim = 200 / VMayar   '.2 (200mV) adim araligi icin, Ornek : VMax=25V iken her adim 8 artiracak
    If VAayar = 2 Then VAdim = 500 / VMayar   '.5 (500mV)
    If AAayar = 0 Then AAdim = 1
    If AAayar = 1 Then AAdim = 4
    If AAayar = 2 Then AAdim = 10

    Return


Acilis:
    Low LCD_RW    'PORTC.0 bunu direkt kart uzerinde saseye cekersek bir port bosaltiriz
    DelayMS 20
    Cls
    DelayMS 20
    Print $FE,$40,$00,$0F,$0F,$0F,$00,$01,$03,$07    '7W nin grafiksel gosterimi icin character map e eklenti
    Print $FE,$48,$00,$1C,$1C,$1C,$1C,$18,$17,$07
    Print $FE,$50,$00,$00,$00,$00,$00,$00,$00,$03
    Print $FE,$58,$00,$00,$03,$03,$07,$06,$06,$06
    Print $FE,$60,$07,$0E,$0E,$0E,$0E,$0E,$00,$00
    Print $FE,$68,$03,$03,$01,$01,$00,$00,$00,$00
    Print $FE,$70,$13,$13,$1B,$1B,$1F,$0E,$00,$00
    Print $FE,$78,$1E,$1E,$1E,$0E,$04,$00,$00,$00

    For sayi = 1 To 16 
        Print At 1,16-sayi," ",$00,$01,$02,$03,"PicPSU v.35"
        Print At 2,16-sayi," ",$04,$05,$06,$07,"Yavuz Dinc "
        DelayMS 100
    Next sayi

    DelayMS 1000
     
  

    DelayMS 1000
    Print At 1,1,"A: Ayarlanan    "
    Print At 2,1,"O: Olculen      "
    DelayMS 1000
    
    Return

Beklet:
    
    For Sure3 = 1 To 255
        DelayMS 10
    Next Sure3
    Return
    
Enable

