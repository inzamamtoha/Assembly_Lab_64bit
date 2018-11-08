section .data
a: db "This is xstring",10,0
b: db "%c",10,0

section .text
global main
extern printf

main:
push rbp
xor rbx,rbx
xor r12,r12
 call func
leave 
ret

func:
 push rbp
mov rbp ,rsp
sub rsp,32
add r12,8
cmp [a+r12],0
je exit

cmp a[a+r12],120
je func

mov rdi,b
mov rsi,[a+r12]
call printf
leave

exit: leave 
ret
