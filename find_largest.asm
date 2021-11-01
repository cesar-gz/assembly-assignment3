; CPSC 240, Cesar Gutierrez

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

section .data

	SYS_WRITE					equ		1
	FD_STDOUT					equ		1

	CRLF						db		13,10
	CRLF_LEN					equ		$-CRLF

	M			db	"We are inside find_largest()"
	M_LEN		equ	$-M

section .text

global find_largest
find_largest:

	push r10
	push r13
	push r14
	push r15
	;mov r13, rdi ;pointer is in r13
	;mov r14, rsi ;count is in r14
	;mov r10, 0
	;mov r15, [r13 + (r10 *8)] ; hopefully the value at index 0 is in r15 now

;looptop:
	;cmp r10, r14 ; if 0 = count, jump to clean
	;je clean
	;cmp r13, r15
	;jge topdog

;topdog:
	;mov r13, r15
	;inc r10
	;jmp looptop

clean:

	mov r12, r13 ;r13 is the index we want, move it to r12 and hope it passes back to manager
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, M
	mov rdx, M_LEN
	syscall
	call crlf
	pop r15
	pop r14
	pop r13
	pop r10
	;mov rax, 0
	ret

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret

