section .data
	s: dq 4
	fmt: db "%lld",10,0
	msg1: db "even parity",10,0
	msg2: db "odd parity",10,0
section .text
	extern printf
	global main

main:
	push rbp
        mov  rbp,rsp
	sub rsp,32 
	mov rax,6
	mov rcx,3 ;1 counter
	xor rdx,rdx ;loop counter
	xor rbx,rbx ; comparision register
	idiv rbx
	mov [s],rax
	mov rdi,fmt
	mov rsi,[s]
	call printf
	

	leave 
        ret

exit:
	leave 
	ret

