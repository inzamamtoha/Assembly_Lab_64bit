        extern printf                   ; the C function to be called
        SECTION .data                   ; Data section

					; format strings for printf
fmt2:   db "printf2: flt2=%e", 10, 0
fmt3:	db "char1=%c, str1=%s, len=%d", 10, 0
fmt4:	db "char1=%c, str1=%s, len=%d, inta1=%d, inta2=%ld", 10, 0
fmt5:	db "hex1=%lX, flt1=%e, flt2=%e", 10, 0
	
char1:	db	'a'			; a character 
str1:	db	"mystring",0	        ; a C string, "string" needs 0
len:	equ	$-str1			; len has value, not an address
inta1:	dd	12345678		; integer 12345678, note dd
inta2:	dq	12345678900		; long integer 12345678900, note dq
hex1:	dq	0x123456789ABCD	        ; long hex constant, note dq
flt1:	dd	5.327e-30		; 32-bit floating point, note dd
flt2:	dq	-123.456789e300	        ; 64-bit floating point, note dq

	SECTION .bss
		
flttmp:	resq 1			        ; 64-bit temporary for printing flt1
	
        SECTION .text                   ; Code section.

        global	main		        ; "C" main program 
main:				        ; label, start of main program
	push    rbp			; set up stack frame 
	fld	dword [flt1]	        ; need to convert 32-bit to 64-bit
	fstp	qword [flttmp]          ; floating load makes 80-bit,
	                                ; store as 64-bit
	mov	rdi,fmt2
	movq	xmm0, qword [flt2]
	mov	rax, 1			; 1 xmm register
	call	printf

	mov	rdi, fmt3		; first arg, format
	mov	rsi, [char1]		; second arg, char
	mov	rdx, str1		; third arg, string
	mov	rcx, len		; fourth arg, int
	mov	rax, 0			; no xmm used
	call	printf

	mov	rdi, fmt4		; first arg, format
	mov	rsi, [char1]		; second arg, char
	mov	rdx, str1		; third arg, string
	mov	rcx, len		; fourth arg, int
	mov	r8, [inta1]		; fifth arg, inta1 32->64
	mov	r9, [inta2]		; sixth arg, inta2
	mov	rax, 0			; no xmm used
	call	printf

	mov	rdi, fmt5		; first arg, format
	mov	rsi, [hex1]		; second arg, char
	movq	xmm0, qword [flttmp]    ; first double
	movq	xmm1, qword [flt2]	; second double
	mov	rax, 2			; 2 xmm used
	call	printf
	
	pop	rbp			; restore stack	
        mov     rax, 0			; exit code, 0=normal
        ret