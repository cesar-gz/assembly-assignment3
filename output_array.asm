section .data

SYS_WRITE					equ		1
FD_STDOUT					equ		1

;A_SIZE					dq	100

CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

A					db	"("
A_LEN		equ	$-A
B					db	" integers)"
B_LEN		equ	$-B
C					db	", "
C_LEN		equ	$-C

section .text

extern libPuhfessorP_printSignedInteger64

global output_array
output_array:

	push r13
	push r14
	push r15
	mov r14, rdi ;pointer is in r14
	mov r15, rsi ;count is in r15

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, A
	mov rdx, A_LEN
	syscall
	
	mov rdi, r15
	call libPuhfessorP_printSignedInteger64
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, B
	mov rdx, B_LEN
	syscall
	
	; loop that prints out array
	lea rbx, [r14 + (100 * 8) -1]
	
print_top:
	cmp r14, rbx
	jg clean
	mov rdi, [r14]
	call libPuhfessorP_printSignedInteger64
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, C
	mov rdx, C_LEN
	syscall
	add r14, 8
	jmp print_top

clean:	
	; clean up
	pop r15
	pop r14
	pop r13
	mov rax, 0
	ret

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret
