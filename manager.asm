; CPSC 240, Cesar Gutierrez

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
section .data
	
	SYS_WRITE		equ	1
	FD_STDOUT		equ	1
	
	POINTER			dq	0
	ARRAY_SIZE		dq	100
	
	CRLF			db	13,10
	CRLF_LEN		equ	$-CRLF
	
	MSG			db	"The manager is here to assist you."
	MSG_LEN		equ	$-MSG
	REC			db	"The following integers were received: "
	REC_LEN		equ	$-REC

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
section .text

extern input_array

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
	push rbx
	push r12
	mov rbp, rsp
	mov r10, [ARRAY_SIZE]
	imul r10, 8
	sub rsp, r10
	mov r12, rsp
	; init array
	mov rdi, POINTER
	mov rsi, [ARRAY_SIZE]
	call input_array
	; save result here
	
	; step 4
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, REC
	mov rdx, REC_LEN
	syscall
	call crlf
	
	; clean up
	mov rsp, rbp
	pop r12
	pop rbx
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
