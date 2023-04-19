MaxNumber EQU 8999999
section .data
    fmt   db "%lld", 10, 0
    space dq MaxNumber
    res   dq 0
    tv1   dq 0,0
    tv2   dq 0,0    
section .text
global main
extern printf
extern exit
; entry point
main:
    ; set start time
    mov rax, 96      ; gettimeofday syscall number
    mov rdi, tv1       ; struct timeval *tv
    mov rsi, 0         ; struct timezone *tz
    syscall

    call count_primes   ; count the number of prime numbers between 1 and 8999999

    mov rdi, fmt        ; format string for printf
    mov rsi, rax        ; the number of prime numbers found
    xor rax, rax        ; clear rax for printf
    call printf         ; print the result

    ; set stop timer
    mov rax, 96      ; gettimeofday syscall number
    mov rdi, tv2       ; struct timeval *tv
    mov rsi, 0         ; struct timezone *tz
    syscall
    
    ; calculate time difference in milliseconds
    mov rax, [tv2 + 0]  ; tv2.tv_sec
    sub rax, [tv1 + 0]  ; tv1.tv_sec
    mov rbx, 1000000
    mul rbx
    mov rcx, [tv2 + 8]  ; tv2.tv_usec
    sub rcx, [tv1 + 8]  ; tv1.tv_usec
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
    xor rbx, rbx        ; initialize counter
    mov rdi, 1          ; will start with number 1
.loop2:    
    cmp rdi, 1          ; 1 is not prime
    jle .not_prime
    mov rcx, 1          ; will start with divisor 2
    ; loop over divisors up to sqrt(n)
    xor rdx, rdx        ; clear rdx
    lea rax, space
    mov QWORD [rax],rdi
    fild QWORD [rax]
    fsqrt
    fistp QWORD [rax+8]
    mov rsi, QWORD [rax+8] ; use the square root as the upper bound for the loop
.loop1:
    inc rcx             ; move on to the next divisor
    cmp rcx, rsi        ; compare divisor to upper bound
    jg .is_prime        ; if we have reached the upper bound, the number is prime
    mov rax, rdi        ; restore the number
    xor rdx, rdx        ; clear rdx
    div rcx             ; divide by the divisor
    or rdx, rdx         ; check if the remainder is zero
    jne .loop1          ; if the remainder is not zero, continue
.not_prime:
    xor rax, rax        ; the number is not prime
    jmp .continue
.is_prime:
    mov rax, 1          ; the number is prime
.continue:


    inc rdi             ; move on to the next number
    or rax, rax          ; if rax is 1, the number is prime
    add rbx,rax
    cmp rdi, MaxNumber  ; we're done when we reach MaxNumber
    jbe .loop2
.done:
    mov rax,rbx
    ret
