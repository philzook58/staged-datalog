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
	.globl	camlPrint__data_begin
camlPrint__data_begin:
	.text
	.globl	camlPrint__code_begin
camlPrint__code_begin:
	.data
	.align	8
	.data
	.align	8
	.quad	768
	.globl	camlPrint
camlPrint:
	.data
	.align	8
	.globl	camlPrint__gc_roots
camlPrint__gc_roots:
	.quad	camlPrint
	.quad	0
	.data
	.align	8
	.quad	3068
camlPrint__1:
	.ascii	"hello world"
	.space	4
	.byte	4
	.text
	.align	16
	.globl	camlPrint__entry
camlPrint__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L100:
	movq	camlPrint__1@GOTPCREL(%rip), %rax
	call	camlStdlib__print_endline_362@PLT
.L101:
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlPrint__entry,@function
	.size camlPrint__entry,. - camlPrint__entry
	.data
	.align	8
	.text
	.globl	camlPrint__code_end
camlPrint__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.quad	0
	.globl	camlPrint__data_end
camlPrint__data_end:
	.quad	0
	.align	8
	.globl	camlPrint__frametable
camlPrint__frametable:
	.quad	1
	.quad	.L101
	.word	17
	.word	0
	.align	4
	.long	(.L102 - .) + 0
	.align	8
	.align	4
.L102:
	.long	(.L104 - .) + -1879048192
	.long	4240
.L103:
	.ascii	"print.ml\0"
	.align	4
.L104:
	.long	(.L103 - .) + 0
	.ascii	"Print\0"
	.align	8
	.size camlPrint__frametable,. - camlPrint__frametable
	.section .note.GNU-stack,"",%progbits
