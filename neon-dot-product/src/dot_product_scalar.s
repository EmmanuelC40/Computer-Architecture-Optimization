	.arch armv8-a
	.file	"dot_product_scalar.cpp"
	.text
	.align	2
	.p2align 4,,11
	.global	_Z18dot_product_scalarPKfS0_i
	.type	_Z18dot_product_scalarPKfS0_i, %function
_Z18dot_product_scalarPKfS0_i:
.LFB1780:
	.cfi_startproc
	movi	v0.2s, #0
	cmp	w2, 0
	ble	.L1
	sbfiz	x3, x2, 2, 32
	mov	x2, 0
	.p2align 3,,7
.L3:
	ldr	s2, [x0, x2]
	ldr	s1, [x1, x2]
	add	x2, x2, 4
	fmadd	s0, s2, s1, s0
	cmp	x3, x2
	bne	.L3
.L1:
	ret
	.cfi_endproc
.LFE1780:
	.size	_Z18dot_product_scalarPKfS0_i, .-_Z18dot_product_scalarPKfS0_i
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Dot product (scalar) = "
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB1781:
	.cfi_startproc
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, 23
	mov	x29, sp
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, 140737488355328
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	movk	x1, 0x4051, lsl 48
	fmov	d0, x1
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x0, [x0, -24]
	add	x0, x19, x0
	ldr	x20, [x0, 240]
	cbz	x20, .L12
	ldrb	w0, [x20, 56]
	cbz	w0, .L9
	ldrb	w1, [x20, 67]
.L10:
	mov	x0, x19
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L9:
	.cfi_restore_state
	mov	x0, x20
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x20]
	mov	w1, 10
	mov	x0, x20
	ldr	x2, [x2, 48]
	blr	x2
	and	w1, w0, 255
	b	.L10
.L12:
	bl	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE1781:
	.size	main, .-main
	.align	2
	.p2align 4,,11
	.type	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i, %function
_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i:
.LFB2315:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR0
	add	x19, x19, :lo12:.LANCHOR0
	mov	x0, x19
	bl	_ZNSt8ios_base4InitC1Ev
	mov	x1, x19
	adrp	x2, __dso_handle
	ldr	x19, [sp, 16]
	add	x2, x2, :lo12:__dso_handle
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	adrp	x0, :got:_ZNSt8ios_base4InitD1Ev
	ldr	x0, [x0, :got_lo12:_ZNSt8ios_base4InitD1Ev]
	b	__cxa_atexit
	.cfi_endproc
.LFE2315:
	.size	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i, .-_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZStL8__ioinit, %object
	.size	_ZStL8__ioinit, 1
_ZStL8__ioinit:
	.zero	1
	.hidden	__dso_handle
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
