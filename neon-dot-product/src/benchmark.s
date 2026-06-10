	.arch armv8-a
	.file	"benchmark.cpp"
	.text
	.align	2
	.p2align 4,,11
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, %function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB8987:
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
.LFE8987:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.align	2
	.p2align 4,,11
	.global	_Z18dot_product_scalarPKfS0_m
	.type	_Z18dot_product_scalarPKfS0_m, %function
_Z18dot_product_scalarPKfS0_m:
.LFB8189:
	.cfi_startproc
	cbz	x2, .L14
	sub	x3, x2, #1
	cmp	x3, 2
	bls	.L15
	lsr	x4, x2, 2
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
	cmp	x3, x4
	bne	.L11
	and	x3, x2, -4
	tst	x2, 3
	beq	.L8
.L10:
	ldr	s2, [x0, x3, lsl 2]
	add	x5, x3, 1
	ldr	s1, [x1, x3, lsl 2]
	lsl	x4, x3, 2
	fmadd	s0, s2, s1, s0
	cmp	x2, x5
	bls	.L8
	add	x5, x4, 4
	add	x3, x3, 2
	ldr	s2, [x0, x5]
	ldr	s1, [x1, x5]
	fmadd	s0, s2, s1, s0
	cmp	x2, x3
	bls	.L8
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
	mov	x3, 0
	b	.L10
	.cfi_endproc
.LFE8189:
	.size	_Z18dot_product_scalarPKfS0_m, .-_Z18dot_product_scalarPKfS0_m
	.align	2
	.p2align 4,,11
	.global	_Z16dot_product_neonPKfS0_m
	.type	_Z16dot_product_neonPKfS0_m, %function
_Z16dot_product_neonPKfS0_m:
.LFB8190:
	.cfi_startproc
	sub	x5, x2, #4
	mov	x3, 0
	movi	v0.4s, 0
	lsr	x4, x5, 2
	add	x4, x4, 1
	lsl	x4, x4, 4
	.p2align 3,,7
.L21:
	ldr	q1, [x0, x3]
	ldr	q2, [x1, x3]
	add	x3, x3, 16
	fmul	v1.4s, v1.4s, v2.4s
	fadd	v0.4s, v0.4s, v1.4s
	cmp	x3, x4
	bne	.L21
	faddp	v0.4s, v0.4s, v0.4s
	and	x5, x5, -4
	add	x6, x5, 4
	faddp	v0.4s, v0.4s, v0.4s
	cmp	x2, x6
	bls	.L20
	sub	x5, x2, x5
	sub	x3, x5, #5
	sub	x4, x5, #4
	cmp	x3, 2
	bls	.L23
	lsr	x5, x4, 2
	lsl	x7, x6, 2
	add	x8, x0, x7
	add	x7, x1, x7
	lsl	x5, x5, 4
	mov	x3, 0
	.p2align 3,,7
.L24:
	ldr	q2, [x7, x3]
	ldr	q1, [x8, x3]
	add	x3, x3, 16
	fmul	v1.4s, v1.4s, v2.4s
	dup	s3, v1.s[1]
	fadd	s0, s0, s1
	dup	s2, v1.s[2]
	dup	s1, v1.s[3]
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	cmp	x3, x5
	bne	.L24
	tst	x4, 3
	beq	.L20
	and	x4, x4, -4
	add	x6, x6, x4
.L23:
	ldr	s2, [x0, x6, lsl 2]
	add	x4, x6, 1
	ldr	s1, [x1, x6, lsl 2]
	lsl	x3, x6, 2
	fmadd	s0, s2, s1, s0
	cmp	x2, x4
	bls	.L20
	add	x4, x3, 4
	add	x6, x6, 2
	ldr	s2, [x0, x4]
	ldr	s1, [x1, x4]
	fmadd	s0, s2, s1, s0
	cmp	x2, x6
	bls	.L20
	add	x3, x3, 8
	ldr	s2, [x1, x3]
	ldr	s1, [x0, x3]
	fmadd	s0, s2, s1, s0
.L20:
	ret
	.cfi_endproc
.LFE8190:
	.size	_Z16dot_product_neonPKfS0_m, .-_Z16dot_product_neonPKfS0_m
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Initializing "
	.align	3
.LC1:
	.string	" elements..."
	.align	3
.LC2:
	.string	"Scalar Time: "
	.align	3
.LC3:
	.string	" s (Result: "
	.align	3
.LC4:
	.string	")"
	.align	3
.LC5:
	.string	"NEON Time:   "
	.align	3
.LC6:
	.string	"---------------------------------"
	.align	3
.LC7:
	.string	"Speedup Factor: "
	.align	3
.LC8:
	.string	"x"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB8191:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x1, 33792
	movk	x1, 0x17d7, lsl 16
	mov	x29, sp
	mov	x0, 16
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	d8, d9, [sp, 64]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	.cfi_offset 72, -32
	.cfi_offset 73, -24
	bl	aligned_alloc
	mov	x1, 33792
	movk	x1, 0x17d7, lsl 16
	mov	x20, x0
	mov	x0, 16
	bl	aligned_alloc
	mov	x19, x0
	mov	x2, 13
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x1, 57600
	movk	x1, 0x5f5, lsl 16
	bl	_ZNSo9_M_insertImEERSoT_
	mov	x21, x0
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	mov	x2, 12
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x21
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	fmov	v0.4s, 1.0e+0
	mov	x0, 33792
	mov	x1, 0
	movk	x0, 0x17d7, lsl 16
	.p2align 3,,7
.L33:
	str	q0, [x20, x1]
	str	q0, [x19, x1]
	add	x1, x1, 16
	cmp	x1, x0
	bne	.L33
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	mov	x21, x0
	movi	v8.2s, #0
	mov	x2, 33792
	mov	x1, 0
	movk	x2, 0x17d7, lsl 16
	.p2align 3,,7
.L34:
	ldr	q1, [x20, x1]
	ldr	q0, [x19, x1]
	add	x1, x1, 16
	fmul	v0.4s, v0.4s, v1.4s
	dup	s2, v0.s[1]
	fadd	s8, s8, s0
	dup	s1, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s8, s8, s2
	fadd	s8, s8, s1
	fadd	s8, s8, s0
	cmp	x1, x2
	bne	.L34
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	sub	x0, x0, x21
	mov	x1, 225833675390976
	mov	x2, 13
	scvtf	d9, x0
	movk	x1, 0x41cd, lsl 48
	fmov	d0, x1
	adrp	x1, .LC2
	adrp	x21, :got:_ZSt4cout
	ldr	x21, [x21, :got_lo12:_ZSt4cout]
	add	x1, x1, :lo12:.LC2
	fdiv	d9, d9, d0
	adrp	x23, .LC3
	mov	x0, x21
	adrp	x22, .LC4
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fmov	d0, d9
	ldr	x1, [x21]
	mov	w3, -261
	mov	x4, 4
	mov	x0, x21
	ldr	x1, [x1, -24]
	add	x1, x21, x1
	ldr	w2, [x1, 24]
	str	x4, [x1, 8]
	and	w2, w2, w3
	orr	w2, w2, 4
	str	w2, [x1, 24]
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x24, x0
	add	x1, x23, :lo12:.LC3
	mov	x2, 12
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fcvt	d0, s8
	mov	x0, x24
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x24, x0
	add	x1, x22, :lo12:.LC4
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x24
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	mov	x24, x0
	movi	v1.4s, 0
	mov	x2, 33792
	mov	x1, 0
	movk	x2, 0x17d7, lsl 16
	.p2align 3,,7
.L35:
	ldr	q0, [x20, x1]
	ldr	q2, [x19, x1]
	add	x1, x1, 16
	fmul	v0.4s, v0.4s, v2.4s
	fadd	v1.4s, v1.4s, v0.4s
	cmp	x1, x2
	bne	.L35
	faddp	v1.4s, v1.4s, v1.4s
	str	q1, [sp, 80]
	bl	_ZNSt6chrono3_V212system_clock3nowEv
	sub	x2, x0, x24
	mov	x1, 225833675390976
	scvtf	d8, x2
	movk	x1, 0x41cd, lsl 48
	fmov	d0, x1
	mov	x2, 13
	ldr	q1, [sp, 80]
	adrp	x1, .LC5
	fdiv	d8, d8, d0
	add	x1, x1, :lo12:.LC5
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	faddp	v1.4s, v1.4s, v1.4s
	str	q1, [sp, 80]
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fmov	d0, d8
	ldr	x1, [x21]
	mov	w2, -261
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x3, 4
	ldr	x1, [x1, -24]
	add	x21, x21, x1
	ldr	w1, [x21, 24]
	str	x3, [x21, 8]
	and	w1, w1, w2
	orr	w1, w1, 4
	str	w1, [x21, 24]
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x21, x0
	add	x1, x23, :lo12:.LC3
	mov	x2, 12
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	q1, [sp, 80]
	mov	x0, x21
	fcvt	d0, s1
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x21, x0
	add	x1, x22, :lo12:.LC4
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x21
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	fdiv	d9, d9, d8
	mov	x2, 33
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	adrp	x1, .LC6
	add	x1, x1, :lo12:.LC6
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x2, 16
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	fmov	d0, d9
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, :got_lo12:_ZSt4cout]
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x21, x0
	adrp	x1, .LC8
	add	x1, x1, :lo12:.LC8
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x21
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	mov	x0, x20
	bl	free
	mov	x0, x19
	bl	free
	ldp	x19, x20, [sp, 16]
	mov	w0, 0
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	d8, d9, [sp, 64]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8191:
	.size	main, .-main
	.align	2
	.p2align 4,,11
	.type	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_m, %function
_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_m:
.LFB8984:
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
.LFE8984:
	.size	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_m, .-_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_m
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I__Z18dot_product_scalarPKfS0_m
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
