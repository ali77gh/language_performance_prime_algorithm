; This assembly code calculate the count of prime numbers in range 1~9,000,000
; Prints the count of prime numbers and then the time (in ms) of execution
; we were interested measuring/comparing the speed and performance 
; optimization of different compilers/programming languages, Thats all.

; build steps:
; 1- sudo apt install nasm (of-course if you dont have NASM installed)
; 2- nasm -f elf64 -o prime.o prime.asm
; 3- ld -I/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc -s -o prime prime.o
Bits 64
MaxNumber EQU 8999999
section .data
    fmt   db "%lld", 10, 0
    tv1   dq 0,0
    tv2   dq 0,0

section .text
global _start
extern printf
extern exit
; entry point
_start:
    ; set start time
    mov rax, 96           ; gettimeofday syscall number
    mov rdi, tv1          ; struct timeval *tv
    mov rsi, 0            ; struct timezone *tz
    syscall

    call count_primes     ; count the number of prime numbers between 1 and 8999999

    mov rdi, fmt          ; format string for printf
    mov rsi, rax          ; the number of prime numbers found
    xor rax, rax          ; clear rax for printf
    call printf           ; print the result

    ; set stop time
    mov rax, 96           ; gettimeofday syscall number
    mov rdi, tv2          ; struct timeval *tv
    mov rsi, 0            ; struct timezone *tz
    syscall
    
    ; calculate time difference in milliseconds
    mov rax, [tv2 + 0]    ; tv2.tv_sec
    sub rax, [tv1 + 0]    ; tv1.tv_sec
    mov rbx, 1000000
    mul rbx
    mov rcx, [tv2 + 8]    ; tv2.tv_usec
    sub rcx, [tv1 + 8]    ; tv1.tv_usec
    add rax, rcx
    mov rbx, 1000
    div rbx

    ; print time duration in milliseconds
    mov rdi, fmt
    mov rsi, rax
    xor rax, rax
    call printf  

    xor rdi, rdi
    call exit    

; count the number of prime numbers between 1 and MaxNumber
; output: rax - the number of prime numbers found
count_primes:
; rcx = number counter to check if its prime
; rbx = divisor counter
; rbp = max number
; rdi = prime number counter
    mov ecx,1             ; numbers to check starts from 1
    mov ebp,MaxNumber     ; initialize max number
    xor edi,edi           ; no prime found yet. set counter to 0
chkprimelp:
    cmp ecx,1
    je notprime
    mov ebx,2             ; divisor counter start from 2
    mov eax,ecx
    cvtsi2sd xmm0,eax
    sqrtsd xmm0,xmm0
    cvtsd2si eax,xmm0
    mov r8d,eax           ; store max divisor in r8 register
primemlp:                 ; prime main loop
    cmp ebx,r8d           ; compare with max divisor
    ja  isprime           ; if its below or equal jump to primemlp
    mov eax,ecx           ; put number in eax
    xor edx,edx           ; set higher 4 byte to zero(our numbers is not that big)
    div ebx               ; devide eax to ebx. edx will be remainder
    or edx,edx            ; reminder is zero?
    je notprime           ; if yes (it is not prime)
    inc ebx               ; increase divisor
    jmp primemlp
isprime:
    inc edi               ; the number is prime for sure. inc the counter
notprime:
    inc ecx               ; increase number counter
    cmp ecx,ebp           ; compare with max number
    jna chkprimelp        ; if not above or equal jump to loop start
    mov eax,edi
    ret

