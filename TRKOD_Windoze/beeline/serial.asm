;----------------------------------------------------------------------
;
; File: serial.asm
;   Serial I/O routines.  define BAUD_RATE prior to including
;
; Author:
;	Robert F. Nee
;	robnee@robnee.com
;
; Revisions:
;	last delta :  05/27/04 18:49:27
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
;	3/8/04 V1.4
;	Rewrite timing routines to save program space
;	Moved ancillary routines to their own file
;
;	5/12/04 V1.9
;	Use a common delay routine
;	Turn delays into formulae so BAUD_RATE can be specified
;
;	5/26/04 V1.10
;	Eliminate the SER_ENABLE flag.  One can test if the serial port is
;	enabled by looking at the INTE flag
;	Allow serwait to fall through to ser_get to save the goto instruction
;	No longer uses excessive logic to disable and reenable GIE.  Simply
;	disables it on ser_out and the enables at the end.  No issue enabling
;	GIE even if it wasn't enabled to start.
;----------------------------------------------------------------------

SER_READY	equ	0
SER_ERROR	equ	1

	cblock
ser_data	; Serial data
ser_temp
ser_con		; Serial I/O status and control
ser_iter	; Loop counter for serial bit timing
ser_bit_count	; Serial bit count
	endc

;----------------------------------------------------------------------
; Baud rate delays. assumes BAUD_RATE is defined to adjust serial timing.

CLOCK_SPEED	equ 4000000								; Clock speed in Hz
CYCLE_SPEED	equ CLOCK_SPEED	/ 4							; Cycles per second
BAUD_TIME	equ (CYCLE_SPEED + BAUD_RATE/2) / BAUD_RATE	; time between bits in cycles
BAUD_DELAY	equ (BAUD_TIME - 4 + 3/2)/3					; Iterations for 1 bit delay
BAUD_DELAY2	equ (BAUD_TIME - 4 + 1)/2					; Iterations for 3/2 bit delay
;BAUD_TIME equ 417
;BAUD_DELAY equ 138
;BAUD_DELAY2 equ 207


;----------------------------------------------------------------------
; Call ser_del doing cycle calculations.  Takes desired number of cycles
; to pause and accounts for 5 cycles for setup/call/return then divides
; by 3 and rounds the result (by adding 3/2)

ser_delay	macro cycles
			movlw	(cycles - 5 + 3/2)/3
			call	ser_del
			endm

;----------------------------------------------------------------------
; Ser_enable - enables the serial input buffer interrupt

ser_enable
		banksel	ser_data
		clrf	ser_data
		clrf	ser_con

		; Set the interupt trigger to rising edge
		banksel	OPTION_REG
		bsf		OPTION_REG, INTEDG

		; Enable RB0 interrupt
		bsf		INTCON, GIE
		bsf		INTCON, RAIE
		bsf IOCA, 0
	banksel	ser_data

		return

;----------------------------------------------------------------------
; Ser_disable - disables the serial input buffer interrupt

ser_disable
		; Disable RB0 interrupt
		bcf	INTCON, INTE

		return

;----------------------------------------------------------------------
; ser_del - delay for 3 * W + 4 cycles

ser_del							; 2 call
		movwf	ser_iter		; 1 init
		loop
		 decfsz	ser_iter, f		; 3 * (W - 1) + 2
		endloop

		return					; 2


;----------------------------------------------------------------------
; Serin - reads one character from the serial port
;
; Serin set bit 0 of ser_con to 1 when a character is available.  The
; consumer should reset this bit.  On error bit 1 of ser_con is set
; to high until the next byte comes in.  An error condition can be set
; while there is still an available character.

ser_in
		; Clear the ready flag and set the error flag until good data
		banksel	ser_con
		bcf		ser_con, SER_READY
		bsf		ser_con, SER_ERROR

		clrf	ser_temp

		; wait one and a half the bit-time to positions in the center
		; of the first data bit.  Take into account the interrupt
		; call and dispatch time.
		ser_delay BAUD_TIME * 3/2 - 12

		; clock in the bits
		from ser_bit_count, 8
		 ; get bit and invert it
#if SER_DRIVER
		 btfss	serin_pin
		 bcf	STATUS,	C
		 btfsc	serin_pin
		 bsf	STATUS, C
#else
		 btfss	serin_pin
		 bsf	STATUS,	C
		 btfsc	serin_pin
		 bcf	STATUS, C
#endif

		 ser_delay BAUD_TIME - 8

		 ; rotate the bit into the word
		 rrf	ser_temp, f
		endfrom

		; get the stop bit
#if SER_DRIVER
		ifbs	serin_pin
#else
		ifbc	serin_pin
#endif
		 movfw	ser_temp
		 movwf	ser_data
		 bsf	ser_con, SER_READY	; Signify new byte ready
		 bcf	ser_con, SER_ERROR	; Clear the error flag
		endif_

		return 

;----------------------------------------------------------------------
; Ser_wait - Waits for a character on the serial port then continues

ser_wait
		banksel	ser_con
		loop
		 btfss	ser_con, SER_READY
		endloop

		; Fall through to ser_get

;----------------------------------------------------------------------
; Ser_get - returns the current available character and reset ser_con

ser_get
		banksel	ser_data
		movfw	ser_data
		bcf		ser_con, SER_READY

		return

;----------------------------------------------------------------------
; Serout - outputs a character in w to the serial port




ser_out	
		banksel	ser_temp
		movwf	ser_temp

		; Disable interrupts during output to preserve timing

		bcf	INTCON, GIE

		; start bit
		bcf		STATUS, C	

		; clock out start/carry bit then 8 data bits
		from ser_bit_count, 9
		 ; send bit inverted
#if SER_DRIVER
		 btfss	STATUS, C
		 bcf	serout_pin
		 btfsc	STATUS, C
		 bsf	serout_pin	; for use w/o inverter
#else
		 btfss	STATUS, C
		 bsf	serout_pin
		 btfsc	STATUS, C
		 bcf	serout_pin	; for use w/o inverter
#endif


	 	 ser_delay BAUD_TIME - 8

		 ; rotate the next bit to the carry position.  endfrom OK
		 rrf	ser_temp, f
		endfrom

		; stop bit
#if SER_DRIVER
		bsf		serout_pin; for use w/o inverted
#else
	
		bcf		serout_pin; for use w/o inverted
#endif

		; hold pin stable for a full cycle
	ser_delay BAUD_TIME

		; reenable interrupts
#if INTERRUPTS_ENABLED
		bsf	INTCON, GIE
#endif

		return

;----------------------------------------------------------------------
