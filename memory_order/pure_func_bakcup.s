	.file	"pure_func.c"
	.text
	.globl	lookup
	.type	lookup, @function
lookup:
.LFB51:
	.cfi_startproc
	endbr64
	cmpl	$31, %edi
	je	.L4
	cmpl	$34, %edi
	je	.L5
	movl	$0, %eax
	cmpl	$-24, %edi
	je	.L7
.L1:
	ret
.L7:
	movl	$2, %eax
	jmp	.L2
.L4:
	movl	$0, %eax
.L2:
	cltq
	salq	$4, %rax
	leaq	strings(%rip), %rdx
	movq	(%rdx,%rax), %rax
	jmp	.L1
.L5:
	movl	$1, %eax
	jmp	.L2
	.cfi_endproc
.LFE51:
	.size	lookup, .-lookup
	.globl	testfunction
	.type	testfunction, @function
testfunction:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, %rbp
	movq	%rdx, %rbx
	call	lookup
	testq	%rax, %rax
	je	.L8
	movq	%rax, %rdi
	movq	%rax, 0(%rbp)
	call	strlen@PLT
	movq	%rax, (%rbx)
.L8:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
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
