	.arch armv8-a
	.file	"dot_product_neon.cpp"
	.text
	.align	2
	.p2align 4,,11
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, %function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB6669:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x0, [x0, -24]
	add	x0, x19, x0
	ldr	x20, [x0, 240]
	cbz	x20, .L7
	ldrb	w0, [x20, 56]
	cbz	w0, .L3
	ldrb	w1, [x20, 67]
.L4:
	mov	x0, x19
	bl	_ZNSo3putEc
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZNSo5flushEv
.L3:
	.cfi_restore_state
	mov	x0, x20
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x20]
	mov	w1, 10
	mov	x0, x20
	ldr	x2, [x2, 48]
	blr	x2
	and	w1, w0, 255
	b	.L4
.L7:
	bl	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE6669:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.align	2
	.p2align 4,,11
	.global	_Z18dot_product_scalarPKfS0_i
	.type	_Z18dot_product_scalarPKfS0_i, %function
_Z18dot_product_scalarPKfS0_i:
.LFB6130:
	.cfi_startproc
	cmp	w2, 0
	ble	.L14
	sub	w3, w2, #1
	cmp	w3, 2
	bls	.L15
	lsr	w4, w2, 2
	movi	v0.2s, #0
	mov	x3, 0
	lsl	x4, x4, 4
	.p2align 3,,7
.L11:
	ldr	q2, [x1, x3]
	ldr	q1, [x0, x3]
	add	x3, x3, 16
	fmul	v1.4s, v1.4s, v2.4s
	dup	s3, v1.s[1]
	fadd	s0, s0, s1
	dup	s2, v1.s[2]
	dup	s1, v1.s[3]
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	cmp	x4, x3
	bne	.L11
	and	w3, w2, -4
	tst	x2, 3
	beq	.L8
.L10:
	sxtw	x5, w3
	add	w6, w3, 1
	sbfiz	x4, x3, 2, 32
	ldr	s2, [x0, x5, lsl 2]
	ldr	s1, [x1, x5, lsl 2]
	fmadd	s0, s2, s1, s0
	cmp	w2, w6
	ble	.L8
	add	x5, x4, 4
	add	w3, w3, 2
	ldr	s2, [x0, x5]
	ldr	s1, [x1, x5]
	fmadd	s0, s2, s1, s0
	cmp	w2, w3
	ble	.L8
	add	x4, x4, 8
	ldr	s2, [x1, x4]
	ldr	s1, [x0, x4]
	fmadd	s0, s2, s1, s0
.L8:
	ret
	.p2align 2,,3
.L14:
	movi	v0.2s, #0
	ret
.L15:
	movi	v0.2s, #0
	mov	w3, 0
	b	.L10
	.cfi_endproc
.LFE6130:
	.size	_Z18dot_product_scalarPKfS0_i, .-_Z18dot_product_scalarPKfS0_i
	.align	2
	.p2align 4,,11
	.global	_Z18dot_product_neon_4PKfS0_
	.type	_Z18dot_product_neon_4PKfS0_, %function
_Z18dot_product_neon_4PKfS0_:
.LFB6131:
	.cfi_startproc
	ldr	q0, [x0]
	ldr	q1, [x1]
	fmul	v1.4s, v1.4s, v0.4s
	dup	d0, v1.d[1]
	fadd	v0.2s, v0.2s, v1.2s
	dup	s1, v0.s[1]
	fadd	s0, s1, s0
	ret
	.cfi_endproc
.LFE6131:
	.size	_Z18dot_product_neon_4PKfS0_, .-_Z18dot_product_neon_4PKfS0_
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Scalar dot product = "
	.align	3
.LC1:
	.string	"NEON   dot product = "
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB6132:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, 21
	adrp	x1, .LC0
	mov	x29, sp
	str	x19, [sp, 16]
	add	x1, x1, :lo12:.LC0
	.cfi_offset 19, -16
	adrp	x19, :got:_ZSt4cout
	ldr	x19, [x19, :got_lo12:_ZSt4cout]
	str	d8, [sp, 24]
	.cfi_offset 72, -8
	mov	x0, x19
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, 140737488355328
	movk	x0, 0x4051, lsl 48
	fmov	d8, x0
	mov	x0, x19
	fmov	d0, d8
	bl	_ZNSo9_M_insertIdEERSoT_
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	x2, 21
	mov	x0, x19
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fmov	d0, d8
	mov	x0, x19
	bl	_ZNSo9_M_insertIdEERSoT_
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	ldr	x19, [sp, 16]
	mov	w0, 0
	ldr	d8, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6132:
	.size	main, .-main
	.align	2
	.p2align 4,,11
	.type	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i, %function
_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_i:
.LFB6666:
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
.LFE6666:
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
