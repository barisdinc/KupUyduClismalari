;----------------------------------------------------------------------
;
; File: serutil.asm
;   Serial I/O routines for decimal, 
;
; Author:
;	Robert F. Nee
;	robnee@robnee.com
;
; Revisions:
;	last delta :  03/10/04 23:15:49
;
;	6/10/99 V1.0
;	Initial fully functional release.
;
;	2/12/02 V1.1
;	Added #ifdefs to allow turning off unnecessary routines.
;	Tweaked time delays to be more precise
;	ser_disable no longer turns off the GIE to prevent interference
;	with other interrupt services.
;
;	Serout disables all interrupts temporarily
;
;	12/15/03 V1.2
;	Added ser_wait routine that waits for a serial character (forever)
;	and returns it when received.
;
;	1/3/04 V1.3
;	Rewrote several routines to eliminate labels
;	Fixed serout_dec to properly display values where the middle digit is 0
;	Added bank control logic
;
;----------------------------------------------------------------------

	cblock
ser_value	; temp variable for serial display routine
ser_digit	; digit counter for serial display routine
ser_input	; temp variable for serial input routine
	endc

;----------------------------------------------------------------------

ser_out_bank
		call	ser_out
		banksel	ser_value

		return

;----------------------------------------------------------------------

serout_crlf
		movlw	'\r'
		call	ser_out_bank
		movlw	'\n'
		call	ser_out_bank

		return

;----------------------------------------------------------------------
; Output the byte in W in hex

#ifdef SEROUT_HEX

serout_hex
		movwf	ser_value

		; isolate MSN
		swapf	ser_value, w
		andlw	0x0F

		call	nib_to_ascii
		call	ser_out_bank

		; isolate LSN
		movfw	ser_value
		andlw	0x0F

		call	nib_to_ascii
		call	ser_out_bank

		return

nib_to_ascii
		movwf	ser_digit
		movlw	0x0A
		subwf	ser_digit, w		; is it greater than 10?

		ifbs	STATUS, C
		 movlw	'A' - 10
		 addwf	ser_digit, w
		else_
		 movlw	'0'
		 addwf	ser_digit, w
		endif_

		return

#endif

;----------------------------------------------------------------------
; Output the byte in W in decimal

#ifdef SEROUT_DEC

serout_dec
		movwf	ser_value

		clrf	ser_digit

		loop
		 movlw	100
		 subwf	ser_value, f
		 btfss	STATUS, C
		  break

		 incf	ser_digit, f	; increment the 100s
		endloop

		movlw	100
		addwf	ser_value, f	; add the last 100 back

		; output the 100s digit
		ifne	ser_digit, 0
		 movfw	ser_digit
		 addlw	'0'
		 call	ser_out_bank

		 clrf	ser_digit		; reset the digit counter

		 loop
		  movlw	10
		  subwf	ser_value, f
		  btfss	STATUS, C
		   break

		  incf	ser_digit, f	; increment the 100s
		 endloop

		 movlw	10
		 addwf	ser_value, f	; add the last 10 back

		 movfw	ser_digit		; output the 10s digit
		 addlw	'0'
	 	 call	ser_out_bank
		else_
		 clrf	ser_digit		; reset the digit counter

		 loop
		  movlw	10
		  subwf	ser_value, f
		  btfss	STATUS, C
		   break

		  incf	ser_digit, f	; increment the 100s
		 endloop

		 movlw	10
		 addwf	ser_value, f	; add the last 10 back

		 ifne	ser_digit, 0	; ignore if 0
		  movfw	ser_digit		; output the 10s digit
		  addlw	'0'
		  call	ser_out_bank
		 endif_
		endif_

		movfw	ser_value
		addlw	'0'
		call	ser_out_bank

		return

#endif

;----------------------------------------------------------------------
; Output the byte in W in binary

#ifdef SEROUT_BIN

serout_bin
		movwf		ser_value

		; clock in the bits
		from		ser_digit, 8
		 rlf		ser_value, f
		 ifbc		STATUS, C
		  movlw		'0'
		 else_
		  movlw		'1'
		 endif_
		 call		ser_out_bank
		endfrom

		return

#endif

;----------------------------------------------------------------------
;

#ifdef SERIN_DEC

serin_dec
		movwf	ser_input

		movlw	0xFF
		call	serout_dec

		loop
		 call	ser_erase
		 movfw	ser_input
		 call	serout_dec		; Display the current value

		 ; pad with spaces
		 iflt	ser_input, 100
		  movlw	' '
		  call	ser_out_bank
		 endif_

		 iflt	ser_input, 10
		  movlw	' '
		  call	ser_out_bank
		 endif_
		 
		 ; Get command
		 call		ser_wait
		 banksel	ser_input

		 switch
		 case	'+'
		  incf	ser_input, f
		 endcase

		 case	'-'
		  decf	ser_input, f
		 endcase

		 case	'0'
		  clrf	ser_input
		 endcase

		 case	27
		  retlw	0xFF
		 endcase

		 case	'\r'
		  movfw	ser_input
		  return
		 endcase

		 endswitch
		endloop

		return

;----------------------------------------------------------------------
; Erase the input value

ser_erase
		movlw	'\b'
		call	ser_out
		movlw	'\b'
		call	ser_out
		movlw	'\b'
		call	ser_out

		return
		 
#endif
