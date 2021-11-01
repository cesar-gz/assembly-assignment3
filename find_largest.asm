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

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, M
	mov rdx, M_LEN
	syscall
	call crlf

	mov rax, 0
	ret

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret

