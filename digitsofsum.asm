section .data
	a: dq 1244
	msg: db "toha %lld",10,0
section .text
	global main
	extern printf

main:
	push rbp
	mov rbp,rsp
	sub rsp,32
	mov rax,[a]
	xor rbx,rbx
	call digitcount

	mov rdi,msg
	mov rsi,rbx
	xor rax,rax
	call printf
	leave
	ret

digitcount:
	push rbp
	mov rbp,rsp
	sub rsp,16

	xor rdx,rdx
	mov rcx,10
	idiv rcx
	add rbx,rdx

	cmp rax,0
	je nocall
	call digitcount

nocall: leave
	ret

