.feature labels_without_colons
.feature string_escapes

;----------------------------------------------------------------------
;			cc65 includes
;----------------------------------------------------------------------
.include "telestrat.inc"
.include "fcntl.inc"

;----------------------------------------------------------------------
;			Orix Kernel includes
;----------------------------------------------------------------------
;.include "kernel/src/include/kernel.inc"
;.include "kernel/src/include/memory.inc"
;.include "kernel/src/include/process.inc"
;.include "kernel/src/include/ch376.inc"
;.include "kernel/src/orix.inc"


;----------------------------------------------------------------------
;			Orix Shell includes
;----------------------------------------------------------------------
; Pour userzp: include les 2 fichiers...
;.include "shell/src/include/bash.inc"
;.include "shell/src/include/orix.inc"


;----------------------------------------------------------------------
;			Orix SDK includes
;----------------------------------------------------------------------
.include "macros/SDK.mac"
.include "include/SDK.inc"
.include "macros/types.mac"
.include "include/errors.inc"

;----------------------------------------------------------------------
;				Imports
;----------------------------------------------------------------------

;----------------------------------------------------------------------
;				Exports
;----------------------------------------------------------------------
.export _main
;.export _argc
;.export _argv

;----------------------------------------------------------------------
;			Librairies
;----------------------------------------------------------------------


;----------------------------------------------------------------------
; Defines / Constants
;----------------------------------------------------------------------


;----------------------------------------------------------------------
;				Page Zéro
;----------------------------------------------------------------------
.zeropage

;----------------------------------------------------------------------
;				Variables
;----------------------------------------------------------------------
.segment "DATA"


;----------------------------------------------------------------------
; Variables et buffers
;----------------------------------------------------------------------
.segment "CODE"

;----------------------------------------------------------------------
;			Segments vides
;----------------------------------------------------------------------
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"

;----------------------------------------------------------------------
;				Programme
;----------------------------------------------------------------------
.segment "CODE"

.proc _main
	print hello_world
	rts
.endproc


;**********************************************************************
; Fin du programme
;**********************************************************************

;----------------------------------------------------------------------
;				DATAS
;----------------------------------------------------------------------
.segment "RODATA"
	hello_world:
		.asciiz "Hello World!\r\n"

;----------------------------------------------------------------------
;				TABLES
;----------------------------------------------------------------------
.segment "RODATA"