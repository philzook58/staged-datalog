	.file ""
	.section .rodata.cst16,"aM",@progbits,16
	.align	16
caml_negf_mask:
	.quad	0x8000000000000000
	.quad	0
	.align	16
caml_absf_mask:
	.quad	0x7fffffffffffffff
	.quad	-1
	.data
	.globl	camlTest__data_begin
camlTest__data_begin:
	.text
	.globl	camlTest__code_begin
camlTest__code_begin:
	.data
	.align	8
	.data
	.align	8
	.quad	3063
camlTest__5:
	.quad	camlTest__x1_83
	.quad	0x100000000000005
	.data
	.align	8
	.quad	3063
camlTest__4:
	.quad	camlTest__fun_136
	.quad	0x100000000000005
	.data
	.align	8
	.quad	3063
camlTest__3:
	.quad	camlTest__q_89
	.quad	0x100000000000005
	.data
	.align	8
	.quad	3063
camlTest__2:
	.quad	camlTest__q$27_92
	.quad	0x100000000000005
	.data
	.align	8
	.quad	11008
	.globl	camlTest
camlTest:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.data
	.align	8
	.globl	camlTest__gc_roots
camlTest__gc_roots:
	.quad	camlTest
	.quad	0
	.text
	.align	16
	.globl	camlTest__x1_83
camlTest__x1_83:
	.file	1	"test.ml"
	.loc	1	2	23
	.cfi_startproc
	.loc	1	2	32
.L100:
	.loc	1	2	32
	addq	$84, %rax
	ret
	.cfi_endproc
	.type camlTest__x1_83,@function
	.size camlTest__x1_83,. - camlTest__x1_83
	.text
	.align	16
	.globl	camlTest__fun_136
camlTest__fun_136:
	.loc	1	6	20
	.cfi_startproc
	.loc	1	6	29
.L101:
	.loc	1	6	29
	addq	$84, %rax
	ret
	.cfi_endproc
	.type camlTest__fun_136,@function
	.size camlTest__fun_136,. - camlTest__fun_136
	.text
	.align	16
	.globl	camlTest__q_89
camlTest__q_89:
	.loc	1	8	6
	.cfi_startproc
	.loc	1	8	10
.L102:
	.loc	1	8	10
	movq	(%rax), %rax
	ret
	.cfi_endproc
	.type camlTest__q_89,@function
	.size camlTest__q_89,. - camlTest__q_89
	.text
	.align	16
	.globl	camlTest__q$27_92
camlTest__q$27_92:
	.loc	1	9	7
	.cfi_startproc
.L103:
	ret
	.cfi_endproc
	.type camlTest__q$27_92,@function
	.size camlTest__q$27_92,. - camlTest__q$27_92
	.data
	.align	8
	.quad	1792
	.globl	camlTest__1
camlTest__1:
	.quad	867
	.text
	.align	16
	.globl	camlTest__entry
camlTest__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L104:
	movq	camlTest__5@GOTPCREL(%rip), %rax
	movq	camlTest@GOTPCREL(%rip), %rbx
	movq	%rax, 64(%rbx)
	.loc	1	6	12
	subq	$48, %r15
	call	caml_allocN@PLT
.L105:
	leaq	8(%r15), %rax
	.loc	1	6	12
	addq	$32, %rax
	movq	$1024, -8(%rax)
	movq	camlTest__4@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rax)
	movq	%rax, 72(%rbx)
	movq	camlTest__3@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rbx)
	movq	camlTest__2@GOTPCREL(%rip), %rdi
	movq	%rdi, 8(%rbx)
	movq	$186625, 16(%rbx)
	.loc	1	16	8
	addq	$-16, %rax
	movq	$1024, -8(%rax)
	movq	$1, (%rax)
	movq	%rax, 24(%rbx)
	movq	24(%rbx), %rdi
	.loc	1	17	9
	movq	$3, (%rdi)
	movq	24(%rbx), %rdi
	.loc	1	18	9
	movq	$5, (%rdi)
	movq	24(%rbx), %rdi
	.loc	1	19	9
	movq	$7, (%rdi)
	movq	$1, 32(%rbx)
	movq	24(%rbx), %rdi
	.loc	1	21	9
	movq	$9, (%rdi)
	.loc	1	22	8
	addq	$-16, %rax
	movq	$1024, -8(%rax)
	movq	$1, (%rax)
	movq	%rax, 40(%rbx)
	movq	40(%rbx), %rax
	.loc	1	23	9
	movq	$3, (%rax)
	movq	40(%rbx), %rax
	.loc	1	24	9
	movq	$5, (%rax)
	movq	40(%rbx), %rax
	.loc	1	25	9
	movq	$7, (%rax)
	movq	$110891, 48(%rbx)
	movq	camlTest__1@GOTPCREL(%rip), %rax
	movq	%rax, 56(%rbx)
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlTest__entry,@function
	.size camlTest__entry,. - camlTest__entry
	.data
	.align	8
	.text
	.globl	camlTest__code_end
camlTest__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlTest__data_end
camlTest__data_end:
	.quad	0
	.align	8
	.globl	camlTest__frametable
camlTest__frametable:
	.quad	1
	.quad	.L105
	.word	19
	.word	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.align	4
	.long	(.L106 - .) + 0
	.long	(.L107 - .) + 0
	.long	(.L108 - .) + 0
	.align	8
	.align	4
.L106:
	.long	(.L110 - .) + 872415232
	.long	90240
	.align	4
.L107:
	.long	(.L111 - .) + 872415232
	.long	65664
	.align	4
.L108:
	.long	(.L112 - .) + -1879048192
	.long	24768
.L109:
	.ascii	"test.ml\0"
	.align	4
.L112:
	.long	(.L109 - .) + 0
	.ascii	"Test.x\0"
	.align	4
.L110:
	.long	(.L109 - .) + 0
	.ascii	"Test.b\0"
	.align	4
.L111:
	.long	(.L109 - .) + 0
	.ascii	"Test.a\0"
	.align	8
	.size camlTest__frametable,. - camlTest__frametable
	.section .note.GNU-stack,"",%progbits
