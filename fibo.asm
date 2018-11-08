section .data
	fmt:	db	"%lld",10,0

section .bss
	a: 	resq 1
	b: 	resq 1
	c: 	resq 1
	d: 	resq 1

section .text
	extern printf
	global main

main:
	push	rbp
	mov	qword[a],0
	mov	qword[b],1
	mov	qword[d],1

	call fib
	pop rbp
	mov rax,0
	ret
fib:
	push rbp
	cmp qword[d],10
	je nxt
	mov rax,0
	add rax,[a]
	add rax,[b]
	mov rcx,[b]
	mov [a],rcx
	mov [b],rax
push rax
	call fib
pop rax
	mov rdi,fmt
	mov rsi,rax
	call printf
	add qword[d],1
	pop rbp
	ret

nxt:
	pop rbp
	ret
