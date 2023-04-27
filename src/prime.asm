; This assembly code calculate the count of prime numbers in range 1~9,000,000
; Prints the count of prime numbers and then the time (in ms) of execution

; We were interested measuring/comparing the performance and optimization
; of different compilers/programming languages, Thats why this code exist.

; build steps:

; sudo apt install nasm (of-course if you dont have NASM installed)
; nasm -f elf64 prime.asm
; ld -s -o prime prime.o
Bits 64
MaxNumber EQU 8999999
section .data
    tv1     dq 0,0
    tv2     dq 0,0
    strbuf  db 20 dup(0),10,13,0

section .text
global _start
_start:                   ; entry point
    ; set start time
    mov rax, 96           ; gettimeofday syscall number
    mov rdi, tv1          ; struct timeval *tv
    mov rsi, 0            ; struct timezone *tz
    syscall

count_primes:             ; count the number of prime numbers between 1 and MaxNumber
    mov ecx,1             ; ecx = numbers to check, starts from 1
    mov ebp,MaxNumber     ; ebp = max number to check
    xor esi,esi           ; esi = count of primes
chkprimelp:
    cmp ecx,1
    je notprime
    ;test ecx,1           ; we did this in better way than C (divisor will be added 2 on 
    ;jz notprime          ; each loop in-order to obtain only odd numbers to be checked)
    ; ******************************************************************************************************
    ; a weird thing happens when we have the above lines uncommented and increment divisor 1 by each step
    ; despite the fact that it reduces our instruction count to be executed it increase total excution time 
    ; about 300~400 ms but leaving it active by 1 increment for loop has better performance
    ; I dont know why this happening also couldn't find any reason for this searching the google for hours
    ; ******************************************************************************************************
    mov ebx,3             ; ebx = divisor counter start from 3
    cvtsi2sd xmm0,ecx     ; mov the number to xmm0
    sqrtsd xmm0,xmm0      ; calculate xmm0 sqrt and put the result in xmm0
    cvtsd2si eax,xmm0     ; move integer part of result to eax
    mov r8d,eax           ; store max divisor in r8 register
primemlp:                 ; prime main loop
    cmp ebx,r8d           ; compare with max divisor
    ja  isprime           ; if its above jump to isprime
    mov eax,ecx           ; put number in eax
    xor edx,edx           ; set higher 4 byte to zero(our numbers is not that big so this must be zero)
    div ebx               ; devide eax to ebx. edx will be remainder
    or edx,edx            ; reminder is zero?
    je notprime           ; if yes (it is not prime)
    inc ebx               ; increase divisor
    jmp primemlp          ; loop to primemlp
isprime:
    inc esi               ; the number is prime for sure. inc the counter
notprime:
    add ecx,2
    ;inc ecx               ; increase number counter
    ;inc ecx               ; increase number counter
    cmp ecx,ebp           ; compare with max number
    jna chkprimelp        ; if not above or equal jump to loop start

    inc rsi               ; add 1 as number 2 not checked
    mov rax,rsi           ; put primes count to eax
    call printeax         ; print the eax as result

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
    call printeax  

    mov rax, 3ch          ; exit syscall no
    mov rdi, 0            ; argument, in this case: return value
    syscall

printeax:
    mov rdi,strbuf        ; address of strbuf to Destination Index register
    add rdi,19            ; add 19 to point last byte of buffer
    mov rsi,rdi           ; save end of string buffer in esi
    std                   ; set direction flag (will be moved backward)
    mov ecx,10            ; we want to print the number in base 10
devide:
    xor edx,edx           ; zero high value bits of number
    div ecx               ; div to ecx(=10) dl will be the reminder
    add dl,48             ; add character '0' ascii to it to obtain ascii character
    push rax              ; save eax on stack
    mov al,dl             ; move character to al
    stosb                 ; store byte in es:edi and decrement edi
    pop rax               ; restore eax value from stack
    or eax,eax            ; check if eax is zero
    jnz devide            ; if not zero goto devide
finish:
    sub rsi,rdi           ; calculate length of string
    add rsi,2             ; add 2 to include \r\n at the end of buffer
    inc rdi               ; increase edi as it decreased by last stosb
    mov rdx,rsi           ; message length to rdx
    mov rsi,rdi           ; string start address to rsi
    mov rcx,rdi           ; and same to rcx
    mov rbx,1             ; file descriptor 1 (stdout)
    mov rax,1             ; function number 1 (kernel write)
    mov rdi,1             ; rdi to 1
    syscall               ; call write function
    ret                   ; return to caller
