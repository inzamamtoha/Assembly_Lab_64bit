section .data
	a: dq 7
	msg: db "toha %lld",10,0
section .text
	global main
	extern printf
main:
	push rbp
	mov rax,5
	
	call fibo
	pop rbp
	mov rax,0
	ret

fibo : 
push rbp

cmp rax,1
jbe exit
dec rax
push rax
call fibo
pop rax
dec rax
mov rcx,rax
push rcx
call fibo
pop rcx
add rax,rcx

mov rdi,msg
mov rsi,rax
call printf
;pop rbp
ret


exit:
pop rbp
ret


