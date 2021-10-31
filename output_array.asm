section .data

SYS_WRITE					equ		1
FD_STDOUT					equ		1

CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

A					db	"( "
A_LEN		equ	$-A
B					db	" integers)"
B_LEN		equ	$-B
C					db	", "
C_LEN		equ	$-C

section .text

extern libPuhfessorP_printSignedInteger64

global output_array
output_array:

	push r14
	push r15
	mov r14, rdi
	mov r15, rsi

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, A
	mov rdx, A_LEN
	syscall
	
	mov rdi, r15
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	pop r15
	pop r14
	mov rax, 0
	ret

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret
