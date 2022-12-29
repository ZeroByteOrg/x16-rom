; Code by Barry Yost (a.k.a. ZeroByte), MooingLemur, and Jestin.
; - 2022

; ---------------------------------
; Audio ROM bank for Commander X16.
; ---------------------------------
; This bank contains an API at $C000 for several audio utility functions.
; It also holds data tables such as lookup tables used by the code, and
; a set of FM instrument configurations for ease-of-use by programmers and users
; unfamiliar with FM instrument creation / interfacing the YM2151 chip.
;
; All audio utility routines provided by this bank are self-contained here,
; and thus not included in the main Kernal API. Programs wishing to use the
; audio bank routines will need to either switch ROM banks to the Audio bank
; or else use JSRFAR to call them.
;
; At this time, the actual locations of the FM patches and LUTs are not
; considered to be "directly accessible" and their location is not hard-coded
; into this project. It is intended that programmers should use the published
; API calls that leverage them. e.g. ym_loadpatch in order to configure the
; YM2151 with that instrument configuration, or notecon_midi2psg in order to
; get the result of the note table lookup.
;

; imports from fm.s
.import ym_write
.import ym_loadpatch
.import ym_playnote
.import ym_setnote
.import ym_trigger
.import ym_release
.import ym_init
.import ym_read
.import ym_setatten
.import ym_setdrum
.import ym_playdrum

; imports from psg.s
.import psg_init
.import psg_playfreq
.import psg_setvol
.import psg_setatten
.import psg_setfreq
.import psg_write

; imports from basic.s
.import bas_fmhz
.import bas_fmnote
.import bas_fmvib
.import bas_psghz
.import bas_psgnote
.import bas_psgwav

; imports from noteconvert.s
.import notecon_fm2bas
.import notecon_psg2bas
.import notecon_midi2bas
.import notecon_freq2bas
.import notecon_bas2fm
.import notecon_psg2fm
.import notecon_freq2fm
.import notecon_midi2fm
.import notecon_bas2psg
.import notecon_fm2psg
.import notecon_freq2psg
.import notecon_midi2psg
.import notecon_bas2midi
.import notecon_fm2midi
.import notecon_freq2midi
.import notecon_psg2midi


.segment "API"
	jmp ym_write              ; $C000
	jmp ym_read               ; $C003
	jmp ym_loadpatch          ; $C006
	jmp ym_playnote           ; $C009
	jmp ym_setnote            ; $C00C
	jmp ym_trigger            ; $C00F
	jmp ym_release            ; $C012
	jmp ym_init               ; $C015
	jmp psg_init              ; $C018
	jmp bas_fmnote            ; $C01B
	jmp notecon_fm2bas        ; $C01E
	jmp notecon_psg2bas       ; $C021
	jmp notecon_midi2bas      ; $C024
	jmp notecon_freq2bas      ; $C027
	jmp notecon_bas2fm        ; $C02A
	jmp notecon_psg2fm        ; $C02D
	jmp notecon_freq2fm       ; $C030
	jmp notecon_midi2fm       ; $C033
	jmp notecon_bas2psg       ; $C036
	jmp notecon_fm2psg        ; $C039
	jmp notecon_freq2psg      ; $C03C
	jmp notecon_midi2psg      ; $C03F
	jmp notecon_bas2midi      ; $C042
	jmp notecon_fm2midi       ; $C045
	jmp notecon_freq2midi     ; $C048
	jmp notecon_psg2midi      ; $C04B
	jmp bas_psgnote           ; $C04E
	jmp psg_playfreq          ; $C051
	jmp psg_setvol            ; $C054
	jmp ym_setatten           ; $C057
	jmp psg_setatten          ; $C05A
	jmp psg_setfreq           ; $C05D
	jmp psg_write             ; $C060
	jmp ym_setdrum            ; $C063
	jmp ym_playdrum           ; $C066
	jmp bas_fmvib             ; $C069
	jmp bas_psgwav            ; $C06C
	jmp bas_psghz             ; $C06F
	jmp bas_fmhz              ; $C072
