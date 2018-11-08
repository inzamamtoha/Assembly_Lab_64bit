section .data
fmt: db "%s",10,0
ms1: db " prime",10,0
ms2: db "not prime",10,0
n: dq 12

section .text
global main
extern printf

main:
push rbp
mov rbp,rsp
sub rsp,32
mov rcx,0
mov rbx,1
call prime
leave
ret




prime:
push rbp
mov rbp,rsp
sub rsp,32
cmp rbx,[n]
jg finish
inc rbx
mov rax,[n]
mov rdx,0
idiv rbx
cmp rdx,0
je incre
call prime
leave
ret


incre:
inc rcx
call prime

finish:
cmp rcx,2
jg print
xor rax,rax
mov rdi,fmt
mov rsi,ms1
call printf
jmp exit

print:
xor rax,rax
mov rdi,fmt
mov rsi,ms2
call printf
pop rbp
leave
ret

exit:
leave
ret








