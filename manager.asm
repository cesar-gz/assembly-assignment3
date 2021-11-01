; CPSC 240, Cesar Gutierrez

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
section .data
	
	SYS_WRITE		equ	1
	FD_STDOUT		equ	1
	
	ARRAY_SIZE		dq	100
	
	CRLF			db	13,10
	CRLF_LEN		equ	$-CRLF
	
	MSG			db	"The manager is here to assist you."
	MSG_LEN		equ	$-MSG
	REC			db	"The following integers were received:"
	REC_LEN		equ	$-REC
	X			db	"The largest value "
	X_LEN		equ	$-X
	Y			db	" has been found at index "
	Y_LEN		equ	$-Y
	Z			db	"The manager will now return the count to the driver."
	Z_LEN		equ	$-Z

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
section .text

extern input_array
extern output_array
extern find_largest
extern libPuhfessorP_printSignedInteger64

global manager
manager:
	
	; step 2
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, MSG
	mov rdx, MSG_LEN
	syscall
	call crlf
	
	; allocate array
	push rbp
	push r12
	mov rbp, rsp
	mov r10, [ARRAY_SIZE]
	imul r10, 8
	sub rsp, r10
	mov r12, rsp
	; init array
	mov rdi, r12
	mov rsi, [ARRAY_SIZE]
	call input_array
	; save result here
	mov r10, rax
	
	; step 4
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, REC
	mov rdx, REC_LEN
	syscall
	call crlf
	mov rdi, r12
	mov rsi, r10
	call output_array
	
	; step 8
	mov rdi, r12 ;array index
	mov rsi, r10 ;count
	call find_largest
	
	; step 9 & 10
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, X
	mov rdx, X_LEN
	syscall
	mov rdi, [r12] ;got this concept right just havn't return the right thing
	call libPuhfessorP_printSignedInteger64
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, Y
	mov rdx, Y_LEN
	syscall
	mov rdi, r12 ;this is printing out the address not the index that im supposed to be printing
	call libPuhfessorP_printSignedInteger64
	call crlf
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, Z
	mov rdx, Z_LEN
	syscall
	call crlf
	
	
	; clean up
	mov rsp, rbp
	pop r12
	pop rbp
	mov rax, 0
	ret
	
crlf:
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	ret
