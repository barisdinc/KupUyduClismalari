;----------------------------------------------------------------------
; File : macros.inc
; 	Macros for MPASM
;
; Author:
;	Robert F. Nee
;	robnee@robnee.com
;
; Revisions:
;	last delta :  02/04/04 20:13:28
;
; 1/6/04
; Redesigned switch case to jump out of the switch statement if
; endcase is used.  endcase can be omitted after the last case for
; efficiency
;
;		noexpand

;----------------------------------------------------------------------
; Variables for macros

		Variable _labelcount = 0
		Variable _blockdepth = 0
		Variable _switchdepth = 0
		Variable _casecount = 0
		Variable _ifdepth = 0
		Variable _bankflag = 0

;----------------------------------------------------------------------
; bank0 - switch to register bank 0

bank01 Macro
    Bcf	STATUS, RP0
	Endm

bank00	Macro

		Bcf	STATUS, RP0
		Bcf	STATUS, RP1

		Endm

;----------------------------------------------------------------------
; bank1 - switch to register bank 1

bank10		Macro

		Bsf	STATUS, RP0

		Endm

;----------------------------------------------------------------------
; Save and restore registers

int_save	Macro
		Movwf	w_temp
		Swapf	STATUS, w
		Movwf	status_temp
		Endm

int_restore	Macro
		Swapf	status_temp, w
		Movwf	STATUS

		Swapf	w_temp, f
		Swapf	w_temp, w
		Endm

;----------------------------------------------------------------------
; beq - Branch equal

beq		Macro	address
		Btfsc	STATUS, Z
		GoTo	address
		Endm

;----------------------------------------------------------------------
; bne - Branch not equal

bne		Macro	address
		Btfss	STATUS, Z
		GoTo	address
		Endm

;----------------------------------------------------------------------

beginif		Macro
_ifdepth += 1
_labelcount += 1
_ifnum#v(_ifdepth) = _labelcount
			Endm

;----------------------------------------------------------------------
; ifweq - if W = <val> do block else do other block

ifweq	Macro	Val
		beginif
		Sublw	Val
		Btfss	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifwne	Macro	Val
		beginif
		Sublw	Val
		Btfsc	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

;----------------------------------------------------------------------
; ifeq - if <var> = <val> do block else do other block

ifeq	Macro	var, Val
		beginif
		movfw	var
		Sublw	Val
		Btfss	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifne	Macro	var, Val
		beginif
		movfw	var
		Sublw	Val
		Btfsc	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifgt	Macro	var, Val
		beginif
		movfw	var
		Sublw	Val
		Btfsc	STATUS, C
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

iflt	Macro	var, Val
		beginif
		movfw	var
		Sublw	Val - 1
		Btfss	STATUS, C
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifle	Macro	var, Val
		beginif
		movfw	var
		Sublw	Val
		Btfss	STATUS, C
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifz		Macro	
		beginif
		Btfss	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifnz	Macro	
		beginif
		Btfsc	STATUS, Z
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifbs	Macro	reg, Bit
		beginif
		Btfss	reg, Bit
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifbc	Macro	reg, Bit
		beginif
		Btfsc	reg, Bit
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

ifvgt	Macro	rega, regb
		beginif
		Movf	rega, w
		Subwf	regb, w
		Btfsc	STATUS, C
		GoTo	_if#v(_ifnum#v(_ifdepth))
		Endm

else_	Macro
_labelcount += 1
		GoTo	_if#v(_labelcount)
_if#v(_ifnum#v(_ifdepth))
_ifnum#v(_ifdepth) = _labelcount
		Endm

endif_	Macro
_if#v(_ifnum#v(_ifdepth))
_ifdepth -= 1
		Endm

;----------------------------------------------------------------------
; begin/endblock - housekeeping for the beginning and end of program blocks

beginblock	Macro
_blockdepth += 1
_labelcount += 1
_blocknum#v(_blockdepth) = _labelcount
		Endm

endblock	Macro
_endblock#v(_blocknum#v(_blockdepth))
_blockdepth -= 1
		Endm

;----------------------------------------------------------------------
; loop - loop endlessly

loop		Macro
		beginblock
_looptest#v(_blocknum#v(_blockdepth))
_loop#v(_blocknum#v(_blockdepth))
		Endm

endloop		Macro
		redo
		endblock
		Endm

;----------------------------------------------------------------------
; from - Count <var> down from <start> to zero

from		Macro	var, start
		beginblock
		Movlw	start
		Movwf	var
_loop#v(_blocknum#v(_blockdepth))
_loopvar#v(_blockdepth) = var
		Endm

;----------------------------------------------------------------------
; from - Count <var> down from value in <reg> to zero

fromf		Macro	var, reg
		beginblock
		movfw	reg
		Movwf	var
		Addlw	0			; Test for null loop
		Btfsc	STATUS, Z
		Break
_loop#v(_blocknum#v(_blockdepth))
_loopvar#v(_blockdepth) = var
		Endm
;----------------------------------------------------------------------
; from - Count <var> down from value in W to zero

fromw		Macro	var
		beginblock
		Movwf	var
		Addlw	0			; Test for null loop
		Btfsc	STATUS, Z
		Break
_loop#v(_blocknum#v(_blockdepth))
_loopvar#v(_blockdepth) = var
		Endm

;----------------------------------------------------------------------

endfrom		Macro
_looptest#v(_blocknum#v(_blockdepth))
		Decfsz	_loopvar#v(_blockdepth), f
		redo
		endblock
		Endm

;----------------------------------------------------------------------
; from16 - Count 16bit <var> down from <start> to zero

from16		Macro	var, start
		beginblock
		Movlw	Low start
		Movwf	var
		Movlw	High (start - 1) + 1
		Movwf	var + 1
_loop#v(_blocknum#v(_blockdepth))
_loopvar#v(_blockdepth) = var
		Endm

endfrom16	Macro
_looptest#v(_blocknum#v(_blockdepth))
		Decfsz	_loopvar#v(_blockdepth), f
		 redo
		Decfsz	_loopvar#v(_blockdepth) + 1, f
		 redo
		endblock
		Endm

;----------------------------------------------------------------------
; for - loop <var> from <start> to <stop> inclusive

For		Macro	var, start, Stop
		beginblock
		Movlw	start
		Movwf	var
		GoTo	$ + 2		; skip over the increment first time
_looptest#v(_blocknum#v(_blockdepth))
		If Stop > start		; increment or decrement
		 Incf	var, f
		 movfw	var
		 Sublw	Stop
		 Btfss	STATUS, C
		Else
		 Decf	var, f
		 movfw	var
		 Sublw	Stop - 1
		 Btfsc	STATUS, C
		EndIf
		Break
_loop#v(_blocknum#v(_blockdepth))
_loopvar#v(_blockdepth) = var
		Endm

Next		Macro
		Continue
		endblock
		Endm

;----------------------------------------------------------------------
; break - break out of the current block

Break		Macro
		GoTo	_endblock#v(_blocknum#v(_blockdepth))
		Endm

;----------------------------------------------------------------------
; continue - jump to the next loop iteration

Continue	Macro
		GoTo	_looptest#v(_blocknum#v(_blockdepth))
		Endm

;----------------------------------------------------------------------
; redo - jump to the beginning of the block bypassing any loop test code

redo		Macro
		GoTo _loop#v(_blocknum#v(_blockdepth))
		Endm

;----------------------------------------------------------------------
; switch/case - simulates C-style switch and case statements.  Value
; to be tested is in W.  break is used to exit each case.

switch	Macro
_casecount += 1
_labelcount += 1
_switchdepth += 1
_switchnum#v(_switchdepth) = _labelcount
		Endm

endswitch	Macro
_endswitch#v(_switchnum#v(_switchdepth))
_case#v(_casecount)
_switchdepth -= 1
		Endm

Case		Macro	Val
_caseval = Val
		Xorlw	Val
		bne	_case#v(_casecount)
		Endm

endcase		Macro
		GoTo	_endswitch#v(_switchnum#v(_switchdepth))
_case#v(_casecount)
_casecount += 1
		Xorlw	_caseval		; restore previous value of W
		Endm

default		Macro
		Endm
		
