	.file	"pure_func.c"
	.text
	.globl	testfunction
	.type	testfunction, @function
testfunction:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdx, %rbx
	cmpl	$31, %edi
	je	.L4
	cmpl	$34, %edi
	je	.L5
	movl	$2, %eax
	cmpl	$-24, %edi
	je	.L2
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movl	$0, %eax
.L2:
	cltq
	salq	$4, %rax
	leaq	strings(%rip), %rdx
	movq	(%rdx,%rax), %rdi
	testq	%rdi, %rdi
	je	.L1
	movq	%rdi, (%rsi)
	call	strlen@PLT
	movq	%rax, (%rbx)
	jmp	.L1
.L5:
	movl	$1, %eax
	jmp	.L2
	.cfi_endproc
.LFE52:
	.size	testfunction, .-testfunction
	.globl	strings
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"foo"
.LC1:
	.string	"bar"
.LC2:
	.string	"baz"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	strings, @object
	.size	strings, 48
strings:
	.quad	.LC0
	.long	31
	.zero	4
	.quad	.LC1
	.long	34
	.zero	4
	.quad	.LC2
	.long	-24
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
