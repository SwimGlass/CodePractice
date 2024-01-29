	.file	"sample_code_with_barrier.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	.cfi_startproc
	endbr64
	mov	eax, DWORD PTR B[rip]
	add	eax, 1
	mov	DWORD PTR A[rip], eax
	mov	DWORD PTR B[rip], 0
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.globl	B
	.bss
	.align 4
	.type	B, @object
	.size	B, 4
B:
	.zero	4
	.globl	A
	.align 4
	.type	A, @object
	.size	A, 4
A:
	.zero	4
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
