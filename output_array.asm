section .data

SYS_WRITE					equ		1
FD_STDOUT					equ		1

CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

WELCOME					db	"Test."
WELCOME_LEN		equ	$-WELCOME

section .text

global output_array
output_array:

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, WELCOME
	mov rdx, WELCOME_LEN
	syscall

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret
