# Assembly_Lab_64bit
Assemble: nasm -f elf64 -l printf2_64.lst printf2_64.asm
Link: gcc -m64 -o printf2_64 printf2_64.o
Run: ./printf2_64 > printf2_64.out
Output: cat printf2_64.out
