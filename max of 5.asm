extern printf
section .data

	noo:	dq	26 , 55 , 145 , 1230 , 14 , 23 , 21 , 4111
	msg :	db	"The number is %lld",10,0
	
section .text
	
	global main

main:
	push	rbp
	mov	rbx,0
	mov	rax,[noo]
loop:
	
	add	rbx,8
	cmp	rbx,64
	JE	next
	cmp	rax,[noo+rbx]
	jg	go	
	mov	rax,[noo+rbx]
go:	
	JMP	loop
next:	
	mov	rdi,msg
	mov	rsi,rax
	call	printf
exit:
	mov	rax,0
	pop	rbp
	ret
	