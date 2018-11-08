section .data
	a: dq 12
	b: dq 12
	msg1: db "prime",10,0
	msg2: db "not prime",10,0
section .text
	global main
	extern printf

main:
	push rbp
	mov rbx,[a]
	mov rcx,2
	mov r8,0 
	call prime
	pop rbp
	mov rax,0
	ret
prime:
push rbp
mov rax,rbx
mov rdx,0
idiv rcx
cmp rdx,0
je count;
inc rbx
inc rcx
call prime

count :
inc r8
cmp r8,2
je break;
call prime

break :
mov rdi,msg
call printf
pop rbp
ret
