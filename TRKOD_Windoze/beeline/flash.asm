;----------------------------------------------------------------------
;
; File: flash.asm
;	Flash read and write routines.  These are implemented in a deviece
;	independant manner.  The routines all use macros to interface with
;	the routines:
;
;	flash_addr	- Sets flash address register to contents of W register
;	flash_write	- Writes contents of flash data register to address in
;		  flash address register
;	flash_read	- Reads flash location pointed to by flash address register
;		  into W
;
; Author:
;	Robert F. Nee
;	robnee@robnee.com
;
; Revisions:
;	last delta 01/06/04 23:12:52
;
;	01/12/02 V1.01
;	Generalize the I/O routines for all flash parts (8 and 18 pin)
;
;	07/09/03 V1.02
;	Add support for parts with EE registers in separate banks.
;
;----------------------------------------------------------------------

flash_addr	macro
		banksel	EEADR
		movwf	EEADR
		bank00
		endm

flash_write
		banksel	EEDATA
		movwf	EEDATA

		bcf		INTCON, GIE		; Disable interrupts

		banksel	EECON1
		bsf		EECON1, WREN	; Enable writes

		; Write initiation sequence
		movlw	0x55
		movwf	EECON2			; Write 55h
		movlw	0xAA
		movwf	EECON2			; Write AAh

		bsf		EECON1, WR		; Begin write

		loop
		 btfsc	EECON1, WR		; Poll WR bit for write complete
		endloop

		bsf		INTCON, GIE		; Enable inturrupts
		bank00

		return

flash_read
		banksel	EECON1
		bsf		EECON1, RD		; EE read command
		banksel	EEDATA
		movf	EEDATA, w
		bank00
		return

;----------------------------------------------------------------------

#ifdef __12CE673
		#include "../include/fl67xinc.asm"

flash_addr	macro
		movwf	EEADR
		endm

flash_write	movwf	EEDATA
		loop	
		 call	WRITE_BYTE
		 btfss	PC_OFFSET,EE_OK		; Check if operation successful
		endloop

		clrf	PCLATH
		return

flash_read	call	READ_RANDOM
		clrf	PCLATH
		movf	EEDATA, w
		return
#endif

