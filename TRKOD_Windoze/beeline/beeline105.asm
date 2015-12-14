;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
;    BeeLine Communications Interface
;    Copyright (C) 2005  BigRedBee, LLC
;
;    This program is free software; you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation; either version 2 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program; if not, write to the Free Software
;    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
;
;    BigRedBee, LLC
;    5752 Bay Point Dr
;    Lake Oswego, OR  97035
;
;    info@bigredbee.com
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define version "0105"

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
    list        p=16F688        ; list directive to define processor
#include    <p16f688.Inc>   ; processor specific variable definitions

ver equ 688
    errorlevel  -302            ; suppress message 302 from list file
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 
; Changelog
;
; version 0105
;  - minor cosmetic changes and code cleanup, no functional changes
;
; version 0104
; - call ad_convert early in cmd_text_dump to make sure we send valid data
; - wait before doing ad conversion in check_shutdown. to allow v to creep
;   back up
; - set ADRESULTHI and LO to 0's, not 5A.  Looks better when reading 
;   prioir to doing AD conversion
;
; Version 0103
; - When zeroing flash, zero all 3 bytes
; - when writing time to flash, write all 3 bytes.
;
; Version 0102
; - check for input characters in between each morse character transmission
;   make sure to poweroff and poweron the transmitter appropriately
;
; Version 0101
; - instead of goto after cmd_dispatch detects a bogus character, do a return
;   makes plugging and unplugging (which generates spurious chars) transparent
; - check for characters inside the mores loop
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define model "BLTX0"

#define SER_DRIVER 1		; set to 0 if driving serial bus direct
#define SIMULATE 0		; for debug
#define INTERRUPTS_ENABLED 1	; for debug

    __CONFIG  _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _BOD_OFF & _FCMEN_OFF  & _IESO_OFF  

;__CONFIG  _INTRC_OSC_NOCLKOUT & _WDT_OFF &  _PWRTE_OFF & _MCLRE_ON  & _CP_OFF & _BOD_OFF & _FCMEN_OFF  & _IESO_OFF  

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; Pins definitions:
;

#define cc_pale    PORTA, 5		;; output
#define cc_pdata   PORTA, 4		;; output	
#define mclr_NA    PORTA, 3		;; input ONLY
#define cc_pclk    PORTA, 2		;; output
#define serout_pin PORTA, 1		;; output
#define serin_pin  PORTA, 0		;; input

#define TRIS_PORTA B'001001'

#define rc5_NA     PORTC, 5		;; input		
#define rc4_NA     PORTC, 4		;; input
#define rc3_NA     PORTC, 3		;; input
#define cc_di      PORTC, 2		;; output
#define cc_dclk    PORTC, 1		;; output	UNUSED
#define vbat       PORTC, 0		;; input AN4

#define TRIS_PORTC  B'0111001'

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Defines
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

w	equ	0x00 
f	equ	0x01 
pc	equ	0x02 
STATUS	equ	0x03 
zerof	equ	0x02 
caryf	equ	0x00 

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Bank Select Defines
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define	Bank0		Bcf	STATUS, RP0
#define	Bank1		Bsf	STATUS, RP0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;includes
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#include "macros.inc"

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; This block of data gets transferred back and forth over the serial
; port 
;
; Some entries are unused:
; - beep_space_lv
; - beep_freq_loop_h
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	cblock  0x20

        callsign: 0x20		;  message area
	f2			;  Frequency
	f1
	f0
	power_out		; power amplifier setting
	beep_tone		; freq (tone) of beep
	beep_len		; length of beep
	beep_num		; number of beeps between morse
	beep_space		; time between beeps
	beep_freq_h		; Beep pitch high
	beep_freq		; Beep pitch
	beep_freq_loop_h	; timing loop
	beep_freq_loop          ; timing loop
        morse_freq_h            ; morse pitch high
	morse_freq		; morse pitch
	morse_freq_loop		; timing loop;
	beep_space_lv	        ; time between beeps when voltage is low
	options

	v_cutoffh		; trigger for low V operation
	v_cutoff		; trigger for low V operation

	time2			; elapsed time
	time1
	time0
	ADRESULTHI		; A/D Conversion result
	ADRESULTLO		 

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; This is the end of the image that gets transferred on a "read" command
; 
; general purpose variables follow
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	WTemp
	outdata
	outaddr
	StatusTemp
	
	delay1 
	msgreg0
	msgreg1
	didah
	send
	
	delay2
	d100_h
	d100
	d250_h
	d250
	d5
	i:2
	j
	k
	pause_i
        f_divhi		; for the divide routines
        f_divlo		
	clk_state
    endc

program_length equ  ADRESULTLO - callsign + 1
program_pgm_length equ program_length -5 

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; cc0105f:  Read from flash, write to cc1050;

cc1050f Macro addr0, eeaddr0,  
	Movlw addr0
	Movwf outaddr

	Movlw eeaddr0

	banksel EEADR
;	bsf status, RP0
;	bcf status, RP1
	Movwf EEADR
	Bcf EECON1, EEPGD
	Bsf EECON1, RD

	Movf EEDAT, w

	banksel outdata
	Movwf outdata

	Call write_addr_data
    Endm

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; cc0105r:  Read from register, write to cc1050;

cc1050r Macro addr0, raddr0,  
	Movlw addr0
	Movwf outaddr

	movfw raddr0
	Movwf outdata

	Call write_addr_data
    Endm

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; cc0105:  Read from immediate, write to cc1050;

cc1050 Macro addr0, data0 
;
	Movlw addr0
	Movwf outaddr
	Movlw data0
	Movwf outdata
	Call write_addr_data
    Endm

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Begin Program Memory
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	Org		0x000		;RESET Vector
	Nop				;for ICD use
	GoTo		S0		;Initialize the chip in State 0

	Org		0x004		;Interrupt Vector
	Movwf		WTemp		;Save W register
	Swapf		STATUS, W	;Swap status to be saved into W
	Movwf		StatusTemp	;Save STATUS register
;
; DISABLE INTERRUPTS
;
	Bcf  INTCON, 6
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	ifbs INTCON, RAIF
	
	Call ser_in
	Bcf INTCON, RAIF
	endif_
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	ifbs PIR1, 0
	Call clkint
	Bcf PIR1, 0
	endif_
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;
; re-enable Interrupts
;
	Bsf  INTCON, 6

	Swapf	StatusTemp, W	; swap status_temp into W, sets Bank to original state
	Movwf	STATUS		; restore STATUS register
	Swapf	WTemp, F
	Swapf	WTemp, W	; restore W register
	Retfie

;=========================================================== 
;	w contains a number 0 to 9, returns morse 
;       character for w

msg		
	Movwf FSR
	movfw INDF
	Return

	Addwf   pc,f        

  

get_version
Table
	Addwf PCL, f
	dt version, 0
TableEnd
get_model
	Addwf PCL, F
	dt model, 0




msgnum
	Addwf pc, f
	Retlw m0
	Retlw m1
	Retlw m2
	Retlw m3
	Retlw m4
	Retlw m5
	Retlw m6
	Retlw m7
	Retlw m8
	Retlw m9


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;Subroutine: S0, State 0
;
;Description: Initialize the chip
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
S0

;PortA/C Init code
	banksel TRISA

	Movlw TRIS_PORTA		; 1 means input
	Movwf TRISA			; 


	Movlw TRIS_PORTC		; 1 means input
	Movwf TRISC	

	banksel OPTION_REG
	Bcf	OPTION_REG, 7

	banksel WPUA
	Bsf	WPUA, 0
	
	banksel PORTA	; 
        Clrf PORTA
	Clrf PORTC


	Movlw 0x07			; Comparators off;
	Movwf CMCON0

	Bsf STATUS, RP0
	Movlw 0x10
	Movwf ANSEL			; AN4 (C0) is an analog input
	Bcf STATUS, RP0

	Call read_program


;	clrf time0
;	clrf time1
	Clrf clk_state

; Set AD to zero, so if we read before we convert, we get 0.
;
	Movlw 0x00
	Movwf ADRESULTHI
	Movwf ADRESULTLO

#if SER_DRIVER
	Bsf		serout_pin; for use w/o inverted
#else
	Bcf 		serout_pin;
#endif

; this code is unnecessary !!!
	#if 1
	Call ser_enable
        Bcf ser_con, SER_READY
	#endif

;
; before we do ANYTHING, sit here for 5 seconds and wait for an input character
;

	For k, 0, 50
   	  Call	w100mS		; wait 100mS 
	  banksel ser_con
again_h1
	  Btfsc ser_con, SER_READY
	  GoTo cmd_dispatch_h1	; char available
	  GoTo continue10		; no char


cmd_dispatch_h1
	  Call cmd_dispatch
	  GoTo again_h1			; if illegal character, discard

continue10
	Next

;;;;;;
;
; Enable timer interrupts if options allow

	Btfsc	options,3	; SKIP timer init if set.
	GoTo beacon_start

	Movlw 0x31		
	Movwf T1CON		; 8/1 pre-scaler

	Bsf INTCON, 6

	banksel PIE1
	Bsf PIE1, 0
	banksel TMR0

	GoTo beacon_start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

cmd_dispatch

	Call ser_get
	bank00
	switch 

	  Case 'M'
	  	GoTo cmd_model
	  endcase			

	  Case 'V'
	  	GoTo cmd_version
	  endcase			

	  Case 'T'
	  	GoTo cmd_text_dump
	  endcase			

	  Case 'P'
	  	GoTo cmd_text_pgm
	  endcase

	  Case 'G'
	  	;goto S0
		GoTo beacon_start
	  endcase

	  Case 'S'
	  	GoTo cmd_read_serialnum
	  endcase

	  Case 'C'
	  	GoTo cmd_read_callsign
	  endcase

	  Case 'Z'
	  	GoTo cmd_zero_time
	  endcase

          Case 'U'
	  	GoTo cmd_update_serial
	  endcase

; what do we do if we get a bogus character?  Let's start all over again.
; 
; no wait, let's just return

	  Return

   	  GoTo S0
	  endswitch

cmd_read_serialnum

	bank0
	For k, serialnum, serialnum+4
		movfw k
		banksel EEADR
		Movwf 	EEADR
		bank00
		Call flash_read
		Call ser_out
	Next
	GoTo cmd_ok

cmd_read_callsign
	bank0
	For k, scall, scall+5
		movfw k
		banksel EEADR
		Movwf	EEADR
	bank00
		Call flash_read
		Call ser_out
	Next
	GoTo cmd_ok

cmd_zero_time
	For k, eetime2, eetime0
		movfw k
		banksel EEADR
		Movwf EEADR
		bank00
		Movlw 0
		Call flash_write
	Next
	bank00
	Movlw 0
	Movwf time2
	Movwf time1
	Movwf time0
	GoTo cmd_ok
		


;; the default here should be to go to S0 if we get an illegal character.

cmd_update_serial

	Movlw 0x0a 
	Call ser_out
	Movlw  0x0d
	Call ser_out
	bank00

	banksel callsign
	Movlw callsign
	Movwf FSR

	For i,0, 9		;;6 callsign charas + 4 sernum
		banksel ser_con
		Btfss ser_con, SER_READY
		GoTo $-1

		Call ser_get	
		bank00
		Movwf INDF
		Incf FSR, f
    Next	
	Call write_serial
	Call read_program	;now restore the data we trashed
	GoTo cmd_ok

cmd_text_pgm

	Movlw 0x0a 
	Call ser_out
	Movlw  0x0d
	Call ser_out
	bank00

	banksel callsign
	Movlw callsign
	Movwf FSR

	For i,0, program_pgm_length-1
		banksel ser_con
		Btfss ser_con, SER_READY
		GoTo $-1

		Call ser_get	
		bank00
		Movwf INDF
		Incf FSR, f
        Next	
	Call write_program
	GoTo cmd_ok


cmd_text_dump

        Call ad_convert	;; this used to be just before goto cmd_ok
			;; need to move here to guarantee valid values

	banksel callsign

	Movlw callsign
	Movwf FSR

	For i, 0, program_length-1
	movfw INDF
	Call ser_out
	Incf FSR, F
	Next

	GoTo cmd_ok


cmd_version
	Call output_version
	GoTo cmd_ok

cmd_model
	Call output_model
	GoTo cmd_ok

cmd_ok
	Movlw 0x0a 
	Call ser_out
	Movlw  0x0d
	Call ser_out
	bank00

get_cmd_again
	Btfss ser_con, SER_READY
	GoTo $-1

	Call cmd_dispatch
	GoTo get_cmd_again


	
;#endif





;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Beacon_start
; Start programming the receiver;
;

beacon_start 

#define MAIN 		0
#define  FREQ_2A 	1
#define  FREQ_1A	2
#define  FREQ_0A	3
#define  FREQ_2B	4
#define  FREQ_1B	5
#define  FREQ_0B	6
#define  FSEP1		7
#define  FSEP0		8
#define	 CURRENT	9
#define	XOSC		0x0A
#define PA_POW		0x0B
#define PLL		0x0c
#define LOCK		0x0D
#define CAL		0x0E
#define MODEM0		0x11
#define FSCTRL		0x13
#define PRESCALER	0x1C

#define F_REG   B'01000000'
#define TX_PD   B'00010000'
#define FS_PD   B'00001000'
#define CORE_PD B'00000100'
#define BIAS_PD B'00000010'
#define RESET_N B'00000001'

#define PA_POWER 0xff
 
;;;;;;;;;;;;;;;;;;;
; initialize and reset: set main
;	F_REG=0			bit6
; 	TX_PD=1;		bit4
;	FS_PD=1;		bit3
; 	CORE_PD=0;		bit2
;	BIAS_PD=1;		bit1
;	reset_N=0;		bit0
	

init1
	Bsf cc_pale
	cc1050 MAIN, TX_PD | FS_PD | BIAS_PD

;	reset_N=1;		bit0

	cc1050 MAIN, TX_PD | FS_PD | BIAS_PD | RESET_N

	Call	w100mS		; 
;
;	now, program all registers but main;

	cc1050r FREQ_2A, f2
	cc1050r FREQ_1A, f1
	cc1050r FREQ_0A, f0

	cc1050r FREQ_2B, f2
	cc1050r FREQ_1B, f1
	cc1050r FREQ_0B, f0

#if SIMULATE
	GoTo logmsg
#endif

	cc1050 FSEP1,	0x00
	cc1050 FSEP0, 	0x32
	cc1050 CURRENT, 0x81
	cc1050 XOSC, 	0x00
	cc1050 PA_POW,	0x00
	cc1050 PLL, 	0x48
	cc1050 LOCK, 	0x10
;;	cc1050 CAL, 	x026
	cc1050 MODEM0, 	0x6b	; manchester mode 9.6kb; was 6b
	cc1050 FSCTRL, 	0x01	
	cc1050 PRESCALER, 0x40
	cc1050 0x42, 	0x25


;
; callibrate:
; write cal: cal_dual =1:


; first, turn the outpu power off.

#define CAL_DUAL 	B'01000000'
#define CAL_START 	B'10000000'
#define CAL_WAIT   	B'00100000'
#define CAL_ITERATE	B'00000110'

	cc1050 PA_POW, 0
	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE
	cc1050 MAIN, RESET_N
	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE | CAL_START

	Call w100mS

	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE
	
;
; now powerdown;

    	cc1050 MAIN, TX_PD | FS_PD | CORE_PD | BIAS_PD | RESET_N

;
; now, powerup; release CORE_PD
;
	cc1050 MAIN,  TX_PD | FS_PD |  BIAS_PD |RESET_N

	Call	w100mS		; wait 100mS 

; release BIAS_PD

	cc1050 MAIN,  TX_PD | FS_PD | RESET_N

	Call	w100mS		; wait 100mS 

; release FS_PD
	cc1050 MAIN,  TX_PD |  RESET_N

	Call	w100mS		; wait 100mS 

;set output power

	cc1050r PA_POW, power_out;

; release TX_PD
	cc1050 MAIN, RESET_N

here:
	cc1050r PA_POW, power_out;
	cc1050 MAIN, RESET_N

	
        
;;;;;; goto long

long	


	cc1050 MAIN, RESET_N
	;; THis is reset
	Call Reset
	Call	w100mS		; wait 100mS
	;;;
	Call poweron
	Call calibrate		; calibrate returns with power on

	; We need to do at least one coversion in case we skip both below
	
;
; this call to ad_convert is unnecessary
;
	Call ad_convert
   
	Call	logmsg		; play ID message
;
; This call to ad_convert is being done with the transmitter enabled
;

	Btfsc	options,0	; SKIP playing  voltage if set
	GoTo check_again

	Call ad_convert

	Movlw mV
	Movwf send
	Call morout

	Movlw m1
	Movwf send
	Call morout

        Call div_and_morse

check_again

	Call poweroff

	Btfsc	options,1	; SKIP playing voltage if set
	GoTo check_done

; let the power drain out 

	Call w100mS
	Call w100mS
	Call w100mS
	Call w100mS
	Call w100mS

; 
; the last call to ad_convert is the one that will be displayed 
; when a read command is issued.  This call is being  done with the transmitter
; turned off.

	Call ad_convert
	Call poweron

	Movlw mV
	Movwf send
	Call morout

	Movlw m0
	Movwf send
	Call morout

	Call div_and_morse
	Call poweroff		; end with the power off

check_done:

; main loop, produce a locating tone for 1 second out of every
; three, then at 5 minute intervals play the ID message

main5	
	movfw	beep_num 	; How many beeps between morse transmissions 
	Movwf	d5		; = 300/60 = 5 minutes

fivel

; 
; check for a new command at the beginning of every beep, with the power on
;
try_again3

	banksel ser_con
	Btfsc ser_con, SER_READY
	GoTo cmd_dispatch_h2	; handle charactger
	GoTo continue23		; no char available

cmd_dispatch_h2
	Call cmd_dispatch
	GoTo try_again3		; try again

continue23
	Call poweron

; produce a tone for 1 second, 10 loops of 100mS


	movfw   beep_len
	Movwf	delay1

tnlop	Movf	beep_freq_loop,w		; get 100mS constant
	Movwf	d100		; based upon tone frequency
wtone	Bsf	cc_di		; high cycle of tone

	Movf	beep_freq,w	; get period constant
	Movwf	d250

	Movf	beep_freq_h,w	; get period constant
        Addlw 1          	; becasue decfsz decs first, then checks
	Movwf	d250_h

whight	Decfsz	d250,f		; delay high period
	GoTo	whight

	Decfsz d250_h
	GoTo fixd250
	GoTo continue11

fixd250
	Movlw 0xff
	Movwf d250
	GoTo whight

continue11

	Bcf	cc_di		; low cycle of tone
	Movf	beep_freq,w	; get period constant
	Movwf	d250
	Movf	beep_freq_h,w	; get period constant
        Addlw 1          	; because decfsz decs first, then checks
	Movwf	d250_h

wlowt	Decfsz	d250,f		; delay low period
	GoTo	wlowt

	Decfsz d250_h
	GoTo fixd250a
	GoTo continue1

fixd250a
	Movlw 0xff
	Movwf d250
	GoTo wlowt

continue1
	Decfsz	d100,f		; done w/100mS?
	GoTo	wtone		; nope, loop

	Decfsz	delay1,f	; done with 1 second?
	GoTo	tnlop		; nope, loop

	Call poweroff
; delay 1.8 seconds (18 x 100mS)

	movfw   beep_space
	Movwf	d250
d15	Call	w100mS
	Decfsz	d250,f		; done ?
	GoTo	d15		; nope, loop back

	Decfsz	d5,f		; done ?
	GoTo	fivel		; nope, loop back


;;;;;
UPDATE_FLASH_TIME
        Movlw eetime0
	banksel EEADR
	Movwf EEADR
	bank00
	movfw time0
	Call flash_write

	Movlw eetime1
	banksel EEADR
	Movwf EEADR
	bank00
	movfw time1
	Call flash_write

	Movlw eetime2
	banksel EEADR
	Movwf EEADR
	bank00
	movfw time2
	Call flash_write

	movfw time1
;;;;;;
;  
;
; before we start playing the thing again, let's check the volate and see 
; if we need to shutdown
;
; We've just stopped beeping, then disabled the TX
; then wrote the time to flash
; now do the conversion and check.
;
check_shutdown
	Call w100mS	; wait some more for the power to settle down.
	Call w100mS	; before doing a conversion
	Call w100mS
	Call w100mS
	Call w100mS

	Btfsc	options,2	; if bit2 set, don't check this
	GoTo long

	Call ad_convert

	movfw v_cutoffh
	Subwf ADRESULTHI, w
	Btfsc STATUS, zerof
	GoTo doit2		; no match, keep playing
	GoTo long
doit2

	movfw ADRESULTLO
	Subwf v_cutoff, w
    	Btfsc STATUS, caryf	
	GoTo goodnight
        GoTo long		 ; not less than, keep playing

goodnight
;
; play some ZZZZZ's
;
	Call poweron
	Movlw mZ
	Movwf send
	Call morout
	Movlw mZ
	Movwf send
	Call morout
	Movlw mZ
	Movwf send
	Call morout
	Movlw mZ
	Movwf send
	Call morout

	Call poweroff

	Sleep

;
; if we happen to wake up from sleep, we'll start up again here
;

; this routine sends the message stored at msg in morse

logmsg	Clrf	msgreg0
        Clrf	msgreg1		; clear the message counter

calldone
	Clrf msgreg1
playl	
	Movlw callsign	
	Addwf msgreg1, w	; w has the address of the char to send
	Call	msg		; used to point to msg character
	Incf	msgreg1,f	; move to next character (pointer)
				; returned is morse equivalent
play	
	Movwf	send		; save the morse character
	Movlw	mEND		; is it the end flag?
	Subwf	send,w
	Btfss	STATUS,zerof
	GoTo	morplay		; no, so play it
	Return			; yes, end, leave

morplay	Call morout
	GoTo playl

;----------------------------------------------------
; morout
;	enter with the morse character to be transmitted
;	in the send register, this routine will toggle
;	an output line, simulating a morse code transmission
;
;
; But, before we do anything, check for a character
;
;
; check for a control word delay flag first, then do
; either the delay or start sending the cw
;
morout	
	Btfsc ser_con, SER_READY
	GoTo cmd_dispatch_h3	; char available
	GoTo continue99		; no char

cmd_dispatch_h3
	Call poweroff
	Call cmd_dispatch	; returns if character is bad
	Call poweron		; turn power back on just in case we return

continue99
	Movlw	mSpace		; is it a space (between words)
	Subwf	send,w
	Btfss	STATUS,zerof
	GoTo	morlop		; not a space, go send didah
	Call	w100mS		; space, wait 700mS
	Call	w100mS		; for 12wpm cw
	Call	w100mS		; 400mS here and another
	Call	w100mS		; 300mS at mordn
	GoTo	mordn

; send the cw from the information stored in the send register
; Shift the eight bit register to the left, if the carry bit
; is 0 then send a di, if the carry bit is a 1 send a dah.
; When the send register = 1000 0000 then all bits have been
; sent.

morlop	Movlw	0x01		; setup for di
	Bcf	STATUS,caryf	; make sure carry bit is clear
	Rlf	send,f		; shift to get bit to send
	Btfsc	STATUS,caryf	; skip next instruction for di's
	Iorlw	0x02		; 3x di = dah
	Movwf	didah		; save didah time

morwat	
	movfw   morse_freq_loop
	Movwf	d100

wmors	Bsf	cc_di	; turn on tone bit (high period)
	movfw   morse_freq
	Movwf	d250

	Movf    morse_freq_h, w
	Addlw 1
	Movwf  d250_h

whigh	Decfsz	d250,f		; high period delay
	GoTo	whigh

	Decfsz  d250_h
	GoTo fixd2501
	GoTo continue12

fixd2501
	Movlw 0xff
	Movwf d250
	GoTo whigh

continue12
	Bcf	cc_di	; low period for tone bit
	movfw   morse_freq
	Movwf	d250

	Movf morse_freq_h, w
	Addlw 1
	Movwf d250_h
	
wlow	Decfsz	d250,f		; low period delay
	GoTo	wlow

	Decfsz d250_h
	GoTo fixd250b
	GoTo continue13

fixd250b
	Movlw 0xff
	Movlw d250
	GoTo wlow

continue13

	Decfsz	d100,f		; loop for 100mS
	GoTo	wmors

	Decfsz	didah,f		; fall thru for di's
	GoTo	morwat		; or do again twice for dah's
	Call	w100mS		; delay between di-dahs

	Movlw	b'10000000'	; check for end of data
	Subwf	send,w
	Btfss	STATUS,zerof	; not equal, not end
	GoTo	morlop		; so continue with this character

mordn	Call	w100mS		; delay between characters
	Call	w100mS		; 300mS for 12wpm
	Call	w100mS
;	incf	msgreg1,f	; move to next character (pointer)
;	goto	playl		; loop for rest of message
	Return


;-----------------------------------------------------
; 100 mS delay rtn 


w500mS	
#if SIMULATE
	Return
#endif

	Call w100mS
	Call w100mS
	Call w100mS
	Call w100mS
	Return

w100mS  
#if SIMULATE
	Return
#endif
	Movlw   d'100'          ; 1 cycle 
        Movwf   delay2          ; 1 cycle 

                                ; gets kinda funky here 
                                ; as there is a 1mS rtn 
                                ; built into the 100mS 
                                ; rtn (saving a sub call 
                                ; and stack space!) 

d100ms  Movlw   d'197'          ; 1 cycle           ---+ 
        Movwf   delay1          ; 1 cycle              | 
d1ms2   GoTo    $+1             ; 2 cycles (x 197)     | 
        Decfsz  delay1,f        ; 1 cycle  (x 197)     | 
        GoTo    d1ms2           ; 2 cycles (x 197)     | 
                                ; 3 + 197 x 5 = 988    | 
        GoTo    $+1             ; = 990                |  
        GoTo    $+1             ; = 992             ---+ 

        Decfsz  delay2,f        ; 1 cycle 
        GoTo    d100ms          ; 2 cycles, = 995 

; setup cycles 2 + 1 for fall thru = 3 
; interior cycles = 100 x 995 = 99500 
; = 99503 uS (99.503 mS) 
; the calling rtn eats up 2 more and the return eats 
; two cycles, = 99507uS, need to eat up 493 uS to 
; give a precise 100mS delay 
; also gives us an approximate 500uS delay

w500uS  Movlw   d'122'          ; 1 cycle 
        Movwf   delay1          ; 1 cycle 
d101ms  Nop                     ; 1 cycle x 122 
        Decfsz  delay1,f        ; 1 cycle x 122 
        GoTo    d101ms          ; 2 cycles x 122 

; 2 + 1 + 4 x 122 = 491 uS 

        GoTo    $+1             ; waste 2 more cycles 
                                ; for 493 uS, add in 
                                ; the call (2uS) and 
                                ; return (2uS) for 
        Return                  ; a grand total of 100mS 

w250uS  Movlw   d'65'          ; 1 cycle 
        Movwf   delay1          ; 1 cycle 
d101ams Nop                     ; 1 cycle x 122 
        Decfsz  delay1,f        ; 1 cycle x 122 
        GoTo    d101ams          ; 2 cycles x 122 



        GoTo    $+1             ; waste 2 more cycles 
                                ; for 493 uS, add in 
                                ; the call (2uS) and 
                                ; return (2uS) for 
        Return                  ; a grand total of 100mS 

w125uS  Movlw   d'32'          ; 1 cycle 
        Movwf   delay1          ; 1 cycle 
d101bms Nop                     ; 1 cycle x 122 
        Decfsz  delay1,f        ; 1 cycle x 122 
        GoTo    d101bms          ; 2 cycles x 122 

        GoTo    $+1             ; waste 2 more cycles 
                                ; for 493 uS, add in 
                                ; the call (2uS) and 
                                ; return (2uS) for 
        Return                  ; a grand total of 100mS 



; equates for morse characters 
; specify the coded characters by using 'm' followed 
; by the letter you want to send the coded form of 
; morse is based in... 0 = dit, 1 = dash, roll out 
; the bits, when 0x80 remains the code is done 
; this Morse Code storage rtn was published in _BYTE_ 
; October 1976, pg. 36 in an article by L. Krakauer 

mA      equ     0x60 
mB      equ     0x88 
mC      equ     0xa8 
mD      equ     0x90 
mE      equ     0x40 
mF      equ     0x28 
mG      equ     0xd0 
mH      equ     0x08 
mI      equ     0x20 
mJ      equ     0x78 
mK      equ     0xb0 
mL      equ     0x48 
mM      equ     0xe0 
mN      equ     0xa0 
mO      equ     0xf0 
mP      equ     0x68 
mQ      equ     0xd8 
mR      equ     0x50 
mS      equ     0x10 
mT      equ     0xc0 
mU      equ     0x30 
mV      equ     0x18 
mW      equ     0x70 
mX      equ     0x98 
mY      equ     0xb8 
mZ      equ     0xc8 

m0      equ     0xfc 
m1      equ     0x7c 
m2      equ     0x3c 
m3      equ     0x1c 
m4      equ     0x0c 
m5      equ     0x04 
m6      equ     0x84 
m7      equ     0xc4 
m8      equ     0xe4 
m9      equ     0xf4 

mPeriod equ     0x56 
mComma  equ     0xce 
mQuest  equ     0x32 
mEqual  equ     0x8c 
mColon  equ     0xe2 
mSemi   equ     0xaa 
mSlash  equ     0x94 
mDash   equ     0x86 

mSpace  equ     0x01    ; space between words 
mEND    equ     0x00    ; end of the info 


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; write_addr_data:
;
; Write the address and data to the cc1050
; 
; there are only 6 address bits
; MK

write_addr_data:
	Bsf cc_pclk
	Bcf cc_pdata

	Bcf cc_pale

	Btfsc	outaddr, 6		; test bit 6, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 5		; test bit 5, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 4		; test bit 4, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 3		; test bit 3, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 2		; test bit 2, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 1		; test bit 1, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outaddr, 0		; test bit 0, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

; this is a write, so set  to 1, and toggle clk.
	Bsf cc_pdata
	Bcf cc_pclk
	Bsf cc_pclk

; and raise ale

	Bsf cc_pale	

	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 7		; test bit 7, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 6		; test bit 6, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 5		; test bit 5, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 4		; test bit 4, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 3		; test bit 3, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 2		; test bit 2, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 1		; test bit 1, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Btfsc	outdata, 0		; test bit 0, skip of 0
	Bsf 	cc_pdata		; set the data line
	Bcf	cc_pclk			; set the clock line
	Bsf 	cc_pclk			; clear the clock line
	Bcf	cc_pdata		;clear the data line

	Retlw 	0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; poweron

poweron:
	cc1050 MAIN,  TX_PD | FS_PD |  BIAS_PD |RESET_N
	Call	w100mS		; wait 100mS 

	cc1050 MAIN,  TX_PD | FS_PD | RESET_N
	Call	w100mS		; wait 100mS 

	cc1050 MAIN,  TX_PD |  RESET_N
	Call	w100mS		; wait 100mS 

; release TX_PD
	cc1050 MAIN, RESET_N
	cc1050r PA_POW, power_out;
	Retlw 0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; poweroff

poweroff:
	cc1050 MAIN, TX_PD | FS_PD | BIAS_PD |CORE_PD  | RESET_N
	cc1050 PA_POW, 0x00
	Retlw 0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; reset

Reset:	 
        cc1050 MAIN, TX_PD | FS_PD | CORE_PD | BIAS_PD 
	Call	w100mS		; wait 100mS 
        cc1050 MAIN, TX_PD | FS_PD | CORE_PD | BIAS_PD | RESET_N;
	cc1050r FREQ_2A, f2
	cc1050r FREQ_1A, f1
	cc1050r FREQ_0A, f0


	cc1050r FREQ_2B, f2
	cc1050r FREQ_1B, f1
	cc1050r FREQ_0B, f0


	cc1050 FSEP1,	0x00
	cc1050 FSEP0, 	0x32
	cc1050 CURRENT, 0x81
	cc1050 XOSC, 	0x00
	cc1050 PA_POW,	0x00
	cc1050 PLL, 	0x48
	cc1050 LOCK, 	0x10
;;	cc1050 CAL, 	x026
	cc1050 MODEM0, 	0x6b	; manchester mode 9.6kb; was 6b
	cc1050 FSCTRL, 	0x01	
	cc1050 PRESCALER, 0x40
	cc1050 0x42, 	0x25
	Retlw 0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; calibrate

calibrate:
	cc1050 PA_POW, 0
	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE
	cc1050 MAIN, RESET_N
	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE | CAL_START

	Call w100mS

	cc1050 CAL, CAL_DUAL | CAL_WAIT | CAL_ITERATE
	cc1050r PA_POW, power_out;
	Retlw 0

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; calibrate

output_crlf
	Call serout_crlf
	bank00
	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; output_model

output_model
	Clrf i
	loop
 	  movfw i
	  Call get_model
	  Andlw 0xff
	  Btfsc STATUS, Z
	  Break 
	  Call ser_out
	  bank00
	  Incf i, f
	endloop
	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; output_model

output_version
	Clrf i
	loop
 	  movfw i
	  Call get_version
	  Andlw 0xff
	  Btfsc STATUS, Z
	  Break 
	  Call ser_out
	  bank00
	  Incf i, f
	endloop

	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; read_program

read_program
	bank0	;;;;; was bank1
	Movlw callsign
	Movwf FSR

	For k, 0, program_length-1
	  movfw k
	  banksel EEADR
	  Movwf	EEADR
	  bank00
	  Call flash_read
	  Movwf INDF
	  Incf FSR, f
	Next
	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; write_serial

write_serial
	Movlw callsign
	Movwf FSR

	For k, serialnum, serialnum+9
	  movfw k
	  banksel	EEADR
	  Movwf	EEADR
	  bank00
	  movfw INDF
	  Call flash_write
	  Incf FSR, f
	Next
	Return	

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; write_program
;

write_program
	Movlw callsign
	Movwf FSR

	For k, 0, program_pgm_length - 1
	  movfw k
	  banksel	EEADR
	  Movwf	EEADR
	  bank00
	  movfw INDF
	  Call flash_write
	  Incf FSR, f
	Next
	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; ad_convert
	  
ad_convert
	BANKSEL ANSEL
	Movlw 0x10
	Movwf ANSEL			; AN4 (C0) is an analog input

	BANKSEL ADCON1
	Movlw B'00010000'		
	Movwf ADCON1

	BANKSEL ADCON0
	Movlw B'10010001'	; RIght, VDD Vref, AN4, Start
	Movwf ADCON0
	Call pause_1ms		; really only needs to be 11.5 uSecs
	Bsf ADCON0, GO		; Start the conversion
	Btfsc ADCON0, GO
	GoTo $-1

	BANKSEL ADRESH
	Movf ADRESH, W
;	CLRF ADRESH

	BANKSEL ADRESULTHI
	Movwf ADRESULTHI

	BANKSEL ADRESL
	Movf ADRESL, W
;	CLRF ADRESL

	BANKSEL ADRESULTLO
	Movwf ADRESULTLO
;
; now turn it off
;
	BANKSEL ADCON0
	Movlw B'10010000'	; RIght, VDD Vref, AN4, Start
	Movwf ADCON0

	BANKSEL ANSEL
	Clrf ANSEL

	BANKSEL ADCON0
	Clrf ADCON0

	BANKSEL ADCON1
	Clrf ADCON1

	BANKSEL  ADRESULTLO

	Return

#define bf_carry 3, 0
#define bf_zero 3, 2

#define same 1
#define wreg 0

#define stc Bsf bf_carry
#define clc Bcf bf_carry

;-[ Div ]--------------------------------------------------------------
; Call w/: Number in f_divhi:f_divlo, divisor in W.
; Returns: Quotient in f_divlo, remainder in f_divhi. W preserved.
;          Carry set if error. Z if divide by zero, NZ if divide overflow.
; Notes:   Works by left shifted subtraction.
;          Size = 29, Speed(w/ call&ret) = 7 cycles if div by zero
;          Speed = 94 minimum, 129 maximum cycles

	
Div:
    Addlw 0          ; w+=0 (to test for div by zero)
    stc              ; set carry in case of error
    Btfsc bf_zero    ; if zero
    Return          ;   return (error C,Z)

    Call DivSkipHiShift
iDivRepeat = 8
    While iDivRepeat

    Call DivCode

iDivRepeat--
    endw

    Rlf f_divlo, same ; C << lo << C

    ; If the first subtract didn't underflow, and the carry was shifted
    ; into the quotient, then it will be shifted back off the end by this
    ; last RLF. This will automatically raise carry to indicate an error.
    ; The divide will be accurate to quotients of 9-bits, but past that
    ; the quotient and remainder will be bogus and carry will be set.

    Bcf bf_zero  ; NZ (in case of overflow error)
    Return       ; we are done!

DivCode
    Rlf f_divlo, same    ; C << lo << C
    Rlf f_divhi, same    ; C << hi << C
    Btfss bf_carry       ; if Carry
    GoTo DivSkipHiShift ;
    Subwf f_divhi, same  ;   hi-=w
    stc                  ;   ignore carry
    Return               ;   done
                         ; endif
DivSkipHiShift
    Subwf f_divhi, same  ; hi-=w
    Btfsc bf_carry       ; if carry set
    Return              ;   done
    Addwf f_divhi, same  ; hi+=w
    clc                  ; clear carry
    Return               ; done


MPY8X8:

	Clrf f_divhi
	Clrf i
	Bsf i,3
	Rrf f_divlo

LOOPmult:

	Skpnc
	Addwf f_divhi
	
	Rrf f_divhi
	Rrf f_divlo

	Decfsz i
	GoTo LOOPmult
	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; div_and_morse
;
; change the AD value into decimal by dividing my some magic numbers,
; and the transmit these values;
;
; more magic numbers
;

div_and_morse:


	Movlw mSpace
	Movwf send
	Call morout

	movfw ADRESULTHI
	Movwf f_divhi

	movfw ADRESULTLO
	Movwf f_divlo

	Movlw D'171'
	Call Div		; now quotent is in low, remainder in hi

	movfw f_divlo
	Call msgnum
	Movwf	send		; save the morse character
	Call morout

	Movlw mPeriod
	Movwf send
	Call morout

	movfw f_divhi
	Movwf f_divlo
	Clrf f_divhi
	Movlw D'10'
	Call MPY8X8
	Movlw D'171
	Call Div

	movfw f_divlo
	Call msgnum
	Movwf	send		; save the morse character
	Call morout

	movfw f_divhi
	Movwf f_divlo
	Clrf f_divhi
	Movlw D'10'
	Call MPY8X8
	Movlw D'171'
	Call Div

	movfw f_divlo
	Call msgnum
	Movwf	send		; save the morse character
	Call morout

	Return

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; TImer is ticking once every xxx secsonds timer counts up;
; timer interrupts when it wraps from FFFF-> 0.
;
; clock speed / 2 = tick rate
; pre-scaler is 8, so 4Mhz/2/8 = 125,000 Hz.
; 
; that means  one cycle from 0-> FFFF (65536)
; and anther cycle from 17b8-> FFFF   (another 59464) 
; for a total of 125000 ticks of the clock.
;
; I think it should really be 17B8, not 28B8
; 
; When timer expires,  inc timer, which  really  consist of 3 
; seperate 8 bit counters .
;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clkint				
	
	ifbc clk_state, 0
	  Bsf clk_state, 0
	  Movlw 0xb8
	  Movwf TMR1L
	  Movlw 0x17
	  Movwf TMR1H
	  Return
	endif_

	ifbs clk_state, 0
	  Bcf clk_state, 0
	  Incf time0
	  ifbs STATUS, zerof
	    Incf time1
	    ifbs STATUS, zerof
	      Incf time2
	      Return
	    endif_
	    Return
	  endif_
	  Return
	endif_

	;; should never get here.....
	Sleep


	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
pause_1ms
#ifdef Debug
	Return
#endif
	from pause_i, .199
	GoTo $+1
	endfrom

	Return
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

radix Dec

#define SERIN_DEC
#define SEROUT_DEC
#define BAUD_RATE 2400
#include "serutil.asm"
#include "serial.asm" 
#include "flash.asm"


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        Org 0x2100
eecall
	de  mC, mQ, mSpace, mC, mQ, mSpace
	de mEND

        Org 0x2120
eef2	de 0x42		; these #'s correspond to 433.92
eef1	de 0x14
eef0	de 0x25
eepower_out		de 0xff
eebeep_tone		de 0		; freq of beep
eebeep_len 		de 3 	        ; number of beeps between call signs
eebeep_num		de 50		; length of beep in 100's of ms
eebeep_space		de 45		; time between beeps (in 100ms increments)
eebeep_freq_h		de 0x00		; Beep Freqency
eebeep_freq		de 0xA6		; Beep Freqency
eebeep_freq_loop_h 	de 0x00
eebeep_freq_loop 	de 0x64
eemorse_freq_h 		de 0
eemorse_freq 		de 0xa6
eemorse_freq_loop 	de 0x64
eebeep_space_lv		de 0		; time between beeps when voltage is low
eeoptions		de 0xf		; both TX on and TXOFF voltages ID'd
eev_cutoffh		de 2		; trigger for  low V operation
eev_cutoff		de 0x44		; trigger for low V operation	244 is 1.7volts (3.4 VOls)
eetime2			de 0x00
eetime1			de 0x00
eetime0			de 0x00

junk			de 0xfe
junk2			de 0xfe
junk3			de 0x5a, 0x5a, 0x5a, 0x5a

;
; Private data follows
;
serialnum		de   0x00, 0x00, 0x00, 0x00
scall 	     		de  '?','?','?','?','?','?'

	End
