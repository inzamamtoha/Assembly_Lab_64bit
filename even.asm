section .data
fmt: db "%d",10,0
ms1: db "the number is a prime number",10,0
ms2: db "the number is a prime not number",10,0
n: dq 5

section .text
global main
extern printf

main:
push rbp
mov rbp,rsp
mov rcx,0
mov rbx,[n]
call get1
pop rbp
ret




get1:
push rbp
mov rbp,rsp
sub rsp,32
cmp rbx,1
je finish
inc rcx
mov r8,2
mov rax,rbx
xor rdx,rdx
idiv r8
cmp rdx,0
je even
imul rbx,3
add rbx,1
call get1
pop rbp
ret

even:
mov rbx,rax
call get1
pop rbp 
ret

finish:
xor rax,rax
mov rdi,fmt
mov rsi, rcx
call printf
pop rbp 
ret


