	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text





	thumb_func_start sub_80814F4
sub_80814F4: @ 80814F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808153C
	ldr r3, =gSendCmd
	ldrh r0, [r3, 0x4]
	ldr r2, =gRecvCmds
	cmp r0, 0
	beq _0808151C
	movs r1, 0
	strh r0, [r2, 0x4]
	ldr r0, =0x00004444
	strh r0, [r2]
	strh r1, [r3, 0x4]
_0808151C:
	ldr r0, =gRecvCmds
	ldr r3, =0x00004444
	adds r1, r2, 0
	adds r1, 0x10
	adds r2, r0, 0
	adds r2, 0x14
	movs r7, 0x2
_0808152A:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08081532
	strh r3, [r1]
_08081532:
	adds r1, 0x10
	adds r2, 0x10
	subs r7, 0x1
	cmp r7, 0
	bge _0808152A
_0808153C:
	movs r7, 0
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r7, r0
	blt _0808154C
	b _080816F6
_0808154C:
	ldr r0, =gRecvCmds
	adds r2, r0, 0
	adds r2, 0x20
	str r2, [sp]
	movs r1, 0
	mov r9, r1
	movs r2, 0
	str r2, [sp, 0x4]
	mov r8, r0
	ldr r0, =0x00005432
	mov r10, r0
_08081562:
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, =0x00004444
	movs r2, 0x88
	lsls r2, 7
	bl sub_80814B0
	cmp r0, 0
	bne _08081576
	b _080816D2
_08081576:
	ldr r6, =sBerryBlenderData
	ldr r0, [r6]
	adds r0, 0x96
	ldr r2, [sp, 0x4]
	adds r0, r2
	ldrh r5, [r0]
	mov r0, r8
	ldrh r4, [r0, 0x4]
	ldr r1, =0x00004523
	cmp r4, r1
	bne _080815F4
	adds r0, r1, 0
	bl sub_8081370
	ldr r0, [r6]
	movs r2, 0x8B
	lsls r2, 1
	adds r4, r0, r2
	adds r0, 0x4C
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x37
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, 16
	ldr r0, =0x03e70000
	cmp r1, r0
	bls _080815BA
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4]
_080815BA:
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r0, =0x00004523
	bl sub_8081288
	ldr r1, [r6]
	movs r2, 0x92
	lsls r2, 1
	adds r1, r2
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0808165E
	.pool
_080815F4:
	cmp r4, r10
	bne _08081632
	mov r0, r10
	bl sub_8081370
	ldr r0, [r6]
	movs r1, 0x8B
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x4C
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x46
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r10
	bl sub_8081288
	ldr r1, [r6]
	movs r0, 0x93
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _0808165E
_08081632:
	ldr r0, =0x00002345
	cmp r4, r0
	bne _0808166A
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8081288
	adds r0, r4, 0
	bl sub_8081370
	ldr r0, [r6]
	movs r1, 0x94
	lsls r1, 1
	adds r0, r1
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r0, =0x000003e6
	cmp r2, r0
	bhi _08081660
	adds r0, r2, 0x1
_0808165E:
	strh r0, [r1]
_08081660:
	mov r0, r8
	ldrh r1, [r0, 0x4]
	ldr r0, =0x00002345
	cmp r1, r0
	beq _08081678
_0808166A:
	ldr r1, [sp]
	ldrh r0, [r1]
	ldr r2, =0x00004523
	cmp r0, r2
	beq _08081678
	cmp r0, r10
	bne _080816D2
_08081678:
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x4C
	movs r0, 0
	ldrsh r1, [r2, r0]
	ldr r0, =0x000005dc
	cmp r1, r0
	ble _080816C8
	adds r0, r1, 0
	ldr r2, =0xfffffd12
	adds r0, r2
	movs r1, 0x14
	bl __divsi3
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, =gMPlay_BGM
	bl m4aMPlayTempoControl
	b _080816D2
	.pool
_080816C8:
	ldr r0, =gMPlay_BGM
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
_080816D2:
	ldr r1, [sp]
	adds r1, 0x2
	str r1, [sp]
	movs r2, 0x6
	add r9, r2
	ldr r0, [sp, 0x4]
	adds r0, 0x2
	str r0, [sp, 0x4]
	movs r1, 0x10
	add r8, r1
	adds r7, 0x1
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r7, r0
	bge _080816F6
	b _08081562
_080816F6:
	ldr r0, =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	beq _08081722
	movs r7, 0
	ldr r3, =sBerryBlenderData
	ldr r0, [r3]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r7, r0
	bge _08081722
	movs r2, 0
	ldr r1, =gRecvCmds
_08081710:
	strh r2, [r1]
	strh r2, [r1, 0x4]
	adds r1, 0x10
	adds r7, 0x1
	ldr r0, [r3]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r7, r0
	blt _08081710
_08081722:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80814F4

	thumb_func_start sub_8081744
sub_8081744: @ 8081744
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808175A
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r6, r0, 24
_0808175A:
	ldr r3, =sBerryBlenderData
	ldr r1, [r3]
	lsls r2, r6, 1
	adds r0, r1, 0
	adds r0, 0x96
	adds r0, r2
	ldrb r5, [r0]
	adds r1, 0x63
	ldrb r0, [r1]
	cmp r0, 0
	bne _0808182C
	ldr r0, =gSaveBlock2Ptr
	ldr r0, [r0]
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _080817A8
	ldr r2, =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080817B6
	ldrh r2, [r2, 0x28]
	ldr r1, =0x00000201
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	beq _080817B6
	b _080817BA
	.pool
_080817A8:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080817B6
	movs r4, 0x1
_080817B6:
	cmp r4, 0
	beq _0808182C
_080817BA:
	ldr r4, =sBerryBlenderData
	ldr r1, [r4]
	lsls r2, r5, 1
	adds r0, r1, 0
	adds r0, 0x8E
	adds r0, r2
	adds r1, 0x50
	ldrh r0, [r0]
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gSprites
	adds r0, r1
	adds r1, r5, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, [r4]
	adds r0, 0x4A
	ldrh r0, [r0]
	adds r1, r6, 0
	bl sub_8080624
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08081810
	ldr r1, =gSendCmd
	ldr r0, =0x00004523
	b _08081828
	.pool
_08081810:
	cmp r0, 0x1
	bne _08081824
	ldr r1, =gSendCmd
	ldr r0, =0x00005432
	b _08081828
	.pool
_08081824:
	ldr r1, =gSendCmd
	ldr r0, =0x00002345
_08081828:
	strh r0, [r1, 0x4]
	adds r3, r4, 0
_0808182C:
	ldr r1, [r3]
	adds r1, 0x72
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _0808185A
	ldr r0, [r3]
	adds r1, r0, 0
	adds r1, 0x4C
	ldrh r2, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0x80
	ble _08081852
	subs r0, r2, 0x1
	strh r0, [r1]
_08081852:
	ldr r0, [r3]
	adds r0, 0x72
	movs r1, 0
	strb r1, [r0]
_0808185A:
	ldr r0, =gUnknown_020322D5
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808187E
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0808187E
	ldr r0, [r3]
	ldr r1, =0x00000123
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
_0808187E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081744

	thumb_func_start sub_8081898
sub_8081898: @ 8081898
	push {r4-r6,lr}
	bl sub_8082D28
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	movs r1, 0x82
	lsls r1, 1
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, =0x00057e03
	cmp r1, r0
	bhi _080818B4
	adds r0, r1, 0x1
	str r0, [r2]
_080818B4:
	bl sub_8081744
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x4C
	ldrh r0, [r0]
	movs r5, 0x8B
	lsls r5, 1
	adds r1, r5
	ldrh r1, [r1]
	bl sub_800A994
	bl sub_80814F4
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	movs r6, 0xFA
	lsls r6, 2
	adds r1, r6, 0
	bl sub_8083140
	ldr r0, [r4]
	adds r0, 0x4C
	ldrh r0, [r0]
	bl sub_8083230
	bl sub_808330C
	bl sub_8082AD4
	ldr r2, [r4]
	adds r3, r2, 0
	adds r3, 0x63
	ldrb r0, [r3]
	cmp r0, 0
	bne _0808191A
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, =0x000003e7
	cmp r1, r0
	bls _0808191A
	adds r0, r2, r5
	strh r6, [r0]
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, =sub_8081FC8
	bl SetMainCallback2
_0808191A:
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x8F
	lsls r2, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081898

	thumb_func_start Blender_DummiedOutFunc
Blender_DummiedOutFunc: @ 8081960
	bx lr
	thumb_func_end Blender_DummiedOutFunc

	thumb_func_start help_system_is_not_first_time
help_system_is_not_first_time: @ 8081964
	push {r4,r5,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r1, 20
	adds r4, r1, r0
	lsrs r2, 20
	adds r5, r2, r0
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _080819A2
	adds r0, r4, 0x2
	adds r1, r5, 0x2
	bl StringCompare
	cmp r0, 0
	bne _080819B0
	ldr r0, [r4, 0x8]
	ldr r2, =0xffffff00
	ands r0, r2
	ldr r1, [r5, 0x8]
	ands r1, r2
	cmp r0, r1
	bne _080819B0
	ldr r0, [r4, 0xC]
	ldr r2, =0x00ffffff
	ands r0, r2
	ldr r1, [r5, 0xC]
	ands r1, r2
	cmp r0, r1
	bne _080819B0
_080819A2:
	movs r0, 0x1
	b _080819B2
	.pool
_080819B0:
	movs r0, 0
_080819B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end help_system_is_not_first_time

	thumb_func_start sub_80819B8
sub_80819B8: @ 80819B8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	mov r2, sp
	movs r4, 0x5
_080819D4:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080819D4
	movs r6, 0
	mov r1, sp
	movs r4, 0x4
_080819E8:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080819F2
	adds r6, 0x1
_080819F2:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080819E8
	cmp r6, 0x5
	beq _08081A46
	cmp r3, 0x3
	bhi _08081A46
	movs r4, 0
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bge _08081A5E
	mov r3, r10
_08081A0C:
	movs r6, 0
	ldr r7, [sp, 0x10]
	cmp r6, r7
	bge _08081A54
	mov r9, r3
	mov r5, r10
	lsls r0, r4, 24
	mov r8, r0
_08081A1C:
	mov r1, r9
	ldrh r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _08081A4A
	cmp r4, r6
	beq _08081A4A
	cmp r0, 0xAF
	bne _08081A46
	lsls r2, r6, 24
	lsrs r2, 24
	mov r0, r10
	mov r7, r8
	lsrs r1, r7, 24
	str r3, [sp, 0xC]
	bl help_system_is_not_first_time
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _08081A4A
_08081A46:
	movs r0, 0xC
	b _08081B9E
_08081A4A:
	adds r5, 0x10
	adds r6, 0x1
	ldr r0, [sp, 0x10]
	cmp r6, r0
	blt _08081A1C
_08081A54:
	adds r3, 0x10
	adds r4, 0x1
	ldr r1, [sp, 0x10]
	cmp r4, r1
	blt _08081A0C
_08081A5E:
	movs r2, 0
	mov r1, sp
	movs r4, 0x4
_08081A64:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08081A72
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08081A72:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08081A64
	cmp r2, 0x3
	bls _08081A82
	movs r0, 0xD
	b _08081B9E
_08081A82:
	cmp r2, 0x3
	bne _08081A8A
	movs r0, 0xB
	b _08081B9E
_08081A8A:
	movs r4, 0
	mov r1, sp
_08081A8E:
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x32
	ble _08081A98
	b _08081B98
_08081A98:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _08081A8E
	cmp r2, 0x1
	bne _08081AEA
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _08081AB2
	movs r0, 0x1
	b _08081B9E
_08081AB2:
	mov r0, sp
	ldrh r0, [r0, 0x2]
	lsls r0, 16
	cmp r0, 0
	ble _08081AC0
	movs r0, 0x2
	b _08081B9E
_08081AC0:
	mov r0, sp
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	ble _08081ACE
	movs r0, 0x3
	b _08081B9E
_08081ACE:
	mov r0, sp
	movs r4, 0x6
	ldrsh r0, [r0, r4]
	cmp r0, 0
	ble _08081ADC
	movs r0, 0x4
	b _08081B9E
_08081ADC:
	mov r0, sp
	movs r7, 0x8
	ldrsh r0, [r0, r7]
	cmp r0, 0
	ble _08081AEA
	movs r0, 0x5
	b _08081B9E
_08081AEA:
	cmp r2, 0x2
	bne _08081B9C
	movs r4, 0
	ldr r5, =gUnknown_03000DF8
	mov r1, sp
	adds r2, r5, 0
_08081AF6:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08081B02
	strh r4, [r2]
	adds r2, 0x2
_08081B02:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _08081AF6
	movs r4, 0
	ldrsh r3, [r5, r4]
	lsls r0, r3, 1
	mov r7, sp
	adds r1, r7, r0
	movs r0, 0x2
	ldrsh r2, [r5, r0]
	lsls r0, r2, 1
	add r0, sp
	movs r4, 0
	ldrsh r1, [r1, r4]
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	blt _08081B58
	adds r0, r3, 0
	cmp r0, 0
	bne _08081B38
	lsls r0, r2, 16
	b _08081B62
	.pool
_08081B38:
	cmp r0, 0x1
	bne _08081B40
	lsls r0, r2, 16
	b _08081B6E
_08081B40:
	cmp r0, 0x2
	bne _08081B48
	lsls r0, r2, 16
	b _08081B7A
_08081B48:
	cmp r0, 0x3
	bne _08081B50
	lsls r0, r2, 16
	b _08081B86
_08081B50:
	cmp r0, 0x4
	bne _08081B9C
	lsls r0, r2, 16
	b _08081B92
_08081B58:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _08081B68
	lsls r0, r3, 16
_08081B62:
	movs r1, 0x6
	orrs r0, r1
	b _08081B9E
_08081B68:
	cmp r0, 0x1
	bne _08081B74
	lsls r0, r3, 16
_08081B6E:
	movs r1, 0x7
	orrs r0, r1
	b _08081B9E
_08081B74:
	cmp r0, 0x2
	bne _08081B80
	lsls r0, r3, 16
_08081B7A:
	movs r1, 0x8
	orrs r0, r1
	b _08081B9E
_08081B80:
	cmp r0, 0x3
	bne _08081B8C
	lsls r0, r3, 16
_08081B86:
	movs r1, 0x9
	orrs r0, r1
	b _08081B9E
_08081B8C:
	cmp r0, 0x4
	bne _08081B9C
	lsls r0, r3, 16
_08081B92:
	movs r1, 0xA
	orrs r0, r1
	b _08081B9E
_08081B98:
	movs r0, 0xE
	b _08081B9E
_08081B9C:
	movs r0, 0
_08081B9E:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80819B8

	thumb_func_start sub_8081BB0
sub_8081BB0: @ 8081BB0
	ldr r1, =gUnknown_03000E04
	strh r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_8081BB0

	thumb_func_start sub_8081BBC
sub_8081BBC: @ 8081BBC
	ldr r0, =gUnknown_03000E04
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.pool
	thumb_func_end sub_8081BBC

	thumb_func_start sub_8081BC8
sub_8081BC8: @ 8081BC8
	ldr r1, =gUnknown_03000E06
	strh r0, [r1]
	bx lr
	.pool
	thumb_func_end sub_8081BC8

	thumb_func_start sub_8081BD4
sub_8081BD4: @ 8081BD4
	ldr r0, =gUnknown_03000E06
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.pool
	thumb_func_end sub_8081BD4

	thumb_func_start sub_8081BE0
sub_8081BE0: @ 8081BE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp]
	mov r8, r1
	str r3, [sp, 0x4]
	ldr r0, [sp, 0x30]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r7, =gUnknown_03000DE8
	adds r2, r7, 0
	movs r1, 0
	adds r0, r7, 0
	adds r0, 0xA
_08081C0A:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, r2
	bge _08081C0A
	movs r6, 0
	cmp r6, r9
	bge _08081C40
	ldr r0, =gUnknown_03000DE8
	mov r12, r0
	ldr r5, [sp]
	adds r5, 0x9
_08081C20:
	movs r3, 0
	adds r4, r5, 0
	mov r2, r12
_08081C26:
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _08081C26
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r9
	blt _08081C20
_08081C40:
	movs r1, 0
	ldrsh r3, [r7, r1]
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	subs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, 0x4]
	subs r1, r0
	strh r1, [r7, 0x2]
	ldrh r1, [r7, 0x6]
	subs r0, r1
	strh r0, [r7, 0x4]
	ldrh r0, [r7, 0x8]
	subs r1, r0
	strh r1, [r7, 0x6]
	subs r0, r3
	strh r0, [r7, 0x8]
	movs r3, 0
	movs r2, 0
	adds r1, r7, 0
	movs r6, 0x4
_08081C6A:
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _08081C76
	strh r2, [r1]
	adds r3, 0x1
_08081C76:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081C6A
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
	movs r4, 0
	ldr r1, =gUnknown_03000DE8
	movs r6, 0x4
_08081C8A:
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _08081CA4
	cmp r0, r3
	bge _08081CA0
	strh r4, [r1]
	b _08081CA4
	.pool
_08081CA0:
	subs r0, r2, r3
	strh r0, [r1]
_08081CA4:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081C8A
	ldr r1, =gUnknown_03000DE8
	ldr r2, =gUnknown_020322A8
	movs r6, 0x4
_08081CB2:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081CB2
	ldr r1, =0x0000014d
	ldr r0, [sp, 0x8]
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	adds r3, 0x64
	ldr r4, =gUnknown_020322D0
	str r3, [r4]
	movs r6, 0x4
_08081CD6:
	movs r0, 0
	ldrsh r5, [r7, r0]
	adds r0, r5, 0
	muls r0, r3
	movs r1, 0xA
	str r3, [sp, 0xC]
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __modsi3
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	ldr r3, [sp, 0xC]
	cmp r4, 0x4
	ble _08081D02
	adds r5, 0x1
_08081D02:
	strh r5, [r7]
	adds r7, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081CD6
	ldr r1, =gUnknown_03000DE8
	ldr r2, =gUnknown_020322BC
	movs r6, 0x4
_08081D12:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081D12
	ldr r4, =gUnknown_03000DE8
	ldr r0, [sp]
	adds r1, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_80819B8
	mov r5, r8
	strb r0, [r5]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	mov r1, r9
	bl __divsi3
	mov r3, r9
	subs r0, r3
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _08081D4C
	movs r0, 0
	strh r0, [r4, 0xA]
_08081D4C:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0xC
	bne _08081DA6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r6, 0
	ldr r0, =gUnknown_08339CC8
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0
	movs r4, 0x1
	movs r3, 0x2
_08081D74:
	adds r2, r0, 0
	asrs r2, r6
	ands r2, r4
	cmp r2, 0
	beq _08081D9C
	strh r3, [r1]
	b _08081D9E
	.pool
_08081D9C:
	strh r2, [r1]
_08081D9E:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08081D74
_08081DA6:
	ldr r7, =gUnknown_03000DE8
	movs r2, 0xFF
	adds r1, r7, 0
	movs r6, 0x5
_08081DAE:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xFF
	ble _08081DB8
	strh r2, [r1]
_08081DB8:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08081DAE
	ldrh r0, [r7]
	mov r4, r8
	strb r0, [r4, 0x1]
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x2]
	ldrh r0, [r7, 0x4]
	strb r0, [r4, 0x3]
	ldrh r0, [r7, 0x6]
	strb r0, [r4, 0x4]
	ldrh r0, [r7, 0x8]
	strb r0, [r4, 0x5]
	ldrh r0, [r7, 0xA]
	strb r0, [r4, 0x6]
	movs r6, 0
	adds r2, r7, 0
_08081DDE:
	ldr r5, [sp, 0x4]
	adds r1, r5, r6
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08081DDE
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081BE0

	thumb_func_start sub_8081E04
sub_8081E04: @ 8081E04
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	bl sub_8081BE0
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8081E04

	thumb_func_start sub_8081E20
sub_8081E20: @ 8081E20
	push {r4-r6,lr}
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	movs r2, 0x82
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, 0x4E
	ldrh r4, [r0]
	movs r2, 0
	ldr r5, =0x00000383
	cmp r1, r5
	bhi _08081E48
	movs r2, 0x5
	b _08081E9A
	.pool
_08081E48:
	ldr r3, =0xfffffc7c
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r3, =0x00000257
	cmp r0, r3
	bhi _08081E64
	movs r2, 0x4
	b _08081E9A
	.pool
_08081E64:
	ldr r6, =0xfffffa24
	adds r0, r1, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bhi _08081E78
	movs r2, 0x3
	b _08081E9A
	.pool
_08081E78:
	ldr r3, =0xfffff7cc
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bhi _08081E8C
	movs r2, 0x2
	b _08081E9A
	.pool
_08081E8C:
	ldr r6, =0xfffff31c
	adds r0, r1, r6
	lsls r0, 16
	ldr r1, =0x012b0000
	cmp r0, r1
	bhi _08081E9A
	movs r2, 0x1
_08081E9A:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_8081BC8
	movs r2, 0
	cmp r4, 0x40
	bhi _08081F7C
	adds r0, r4, 0
	subs r0, 0x32
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081EC4
	ldr r2, =0x0000ffff
	b _08081F7C
	.pool
_08081EC4:
	adds r0, r4, 0
	subs r0, 0x64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081ED8
	ldr r2, =0x0000fffe
	b _08081F7C
	.pool
_08081ED8:
	adds r0, r4, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081EEC
	ldr r2, =0x0000fffd
	b _08081F7C
	.pool
_08081EEC:
	adds r0, r4, 0
	subs r0, 0xC8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F00
	ldr r2, =0x0000fffc
	b _08081F7C
	.pool
_08081F00:
	adds r0, r4, 0
	subs r0, 0xFA
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F14
	ldr r2, =0x0000fffb
	b _08081F7C
	.pool
_08081F14:
	ldr r1, =0xfffffea2
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F2C
	ldr r2, =0x0000fffa
	b _08081F7C
	.pool
_08081F2C:
	ldr r3, =0xfffffe70
	adds r0, r4, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F44
	ldr r2, =0x0000fff9
	b _08081F7C
	.pool
_08081F44:
	ldr r6, =0xfffffe0c
	adds r0, r4, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F5C
	ldr r2, =0x0000fff8
	b _08081F7C
	.pool
_08081F5C:
	ldr r1, =0xfffffdda
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08081F74
	ldr r2, =0x0000fff7
	b _08081F7C
	.pool
_08081F74:
	ldr r0, =0x00000257
	cmp r4, r0
	bls _08081F7C
	ldr r2, =0x0000fff6
_08081F7C:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_8081BB0
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081E20

	thumb_func_start sub_8081F94
sub_8081F94: @ 8081F94
	push {lr}
	adds r1, r0, 0
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08081FB8
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08081FB8
	movs r2, 0xBC
	lsls r2, 6
	b _08081FBA
	.pool
_08081FB8:
	ldr r2, =0x00002fff
_08081FBA:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081F94

	thumb_func_start sub_8081FC8
sub_8081FC8: @ 8081FC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	adds r0, 0x63
	ldrb r0, [r0]
	cmp r0, 0x2
	bhi _08081FDE
	bl sub_8082D28
_08081FDE:
	bl GetMultiplayerId
	ldr r0, [r4]
	adds r0, 0x63
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xC
	bls _08081FF0
	b _0808249E
_08081FF0:
	lsls r0, 2
	ldr r1, =_08082004
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08082004:
	.4byte _08082038
	.4byte _08082078
	.4byte _080820D4
	.4byte _080821C8
	.4byte _08082278
	.4byte _08082286
	.4byte _080822B0
	.4byte _08082458
	.4byte _080822E4
	.4byte _08082308
	.4byte _080823B0
	.4byte _08082430
	.4byte _0808246C
_08082038:
	ldr r0, =gMPlay_BGM
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
	movs r4, 0
	b _08082064
	.pool
_0808204C:
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08082064:
	ldr r0, =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r4, r0
	bcc _0808204C
	b _08082458
	.pool
_08082078:
	ldr r4, =sBerryBlenderData
	ldr r1, [r4]
	adds r1, 0x4C
	ldrh r0, [r1]
	subs r0, 0x20
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bgt _080820C6
	bl sub_8009F8C
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x4C
	movs r0, 0
	strh r0, [r1]
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080820B0
	adds r1, 0x17
	ldrb r0, [r1]
	adds r0, 0x1
	b _080820B6
	.pool
_080820B0:
	adds r1, r2, 0
	adds r1, 0x63
	movs r0, 0x5
_080820B6:
	strb r0, [r1]
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1]
	ldr r0, =gMPlay_SE2
	bl m4aMPlayStop
_080820C6:
	bl Blender_ControlHitPitch
	b _0808249E
	.pool
_080820D4:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _080820E0
	b _08082458
_080820E0:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _080820EC
	b _0808249E
_080820EC:
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808218C
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808218C
	ldr r3, =sBerryBlenderData
	ldr r1, [r3]
	movs r4, 0x8E
	lsls r4, 5
	adds r2, r1, r4
	movs r5, 0x82
	lsls r5, 1
	adds r0, r1, r5
	ldr r0, [r0]
	str r0, [r2]
	adds r0, r1, 0
	adds r0, 0x4E
	ldrh r0, [r0]
	ldr r2, =0x000011c4
	adds r1, r2
	strh r0, [r1]
	movs r4, 0
	mov r8, r3
	mov r12, r8
	ldr r7, =0x000011c8
	movs r6, 0x92
	lsls r6, 1
_08082128:
	movs r3, 0
	adds r5, r4, 0x1
	lsls r0, r4, 1
	adds r0, r4
	lsls r4, r0, 1
_08082132:
	mov r1, r12
	ldr r0, [r1]
	lsls r1, r3, 1
	adds r1, r4
	adds r2, r0, r7
	adds r2, r1
	adds r0, r6
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08082132
	lsls r0, r5, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08082128
	mov r2, r8
	ldr r1, [r2]
	movs r4, 0x8E
	lsls r4, 5
	adds r1, r4
	movs r0, 0
	movs r2, 0x20
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	bne _08082172
	b _0808249E
_08082172:
	mov r5, r8
	ldr r1, [r5]
	b _0808245C
	.pool
_0808218C:
	ldr r4, =sBerryBlenderData
	ldr r3, [r4]
	movs r0, 0xCC
	lsls r0, 1
	adds r1, r3, r0
	movs r2, 0x82
	lsls r2, 1
	adds r0, r3, r2
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r3, 0
	adds r0, 0x4E
	ldrh r2, [r0]
	movs r5, 0xCE
	lsls r5, 1
	adds r0, r3, r5
	strh r2, [r0]
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	lsls r0, 24
	cmp r0, 0
	bne _080821BE
	b _0808249E
_080821BE:
	ldr r1, [r4]
	b _0808245C
	.pool
_080821C8:
	bl GetBlockReceivedStatus
	lsls r0, 24
	cmp r0, 0
	bne _080821D4
	b _0808249E
_080821D4:
	bl ResetBlockReceivedFlags
	ldr r5, =sBerryBlenderData
	ldr r1, [r5]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082254
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082254
	ldr r2, =gBlockRecvBuffer
	ldr r3, [r5]
	ldrh r0, [r2, 0x4]
	adds r1, r3, 0
	adds r1, 0x4E
	strh r0, [r1]
	movs r0, 0x82
	lsls r0, 1
	adds r1, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	movs r4, 0
	adds r7, r2, 0
	adds r7, 0x8
	adds r6, r5, 0
	movs r2, 0x92
	lsls r2, 1
_08082216:
	movs r3, 0
	adds r5, r4, 0x1
	lsls r0, r4, 1
	adds r0, r4
	lsls r4, r0, 1
_08082220:
	ldr r1, [r6]
	lsls r0, r3, 1
	adds r0, r4
	adds r1, r2
	adds r1, r0
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08082220
	lsls r0, r5, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08082216
	b _0808249E
	.pool
_08082254:
	ldr r2, =gBlockRecvBuffer
	ldr r0, =sBerryBlenderData
	ldr r3, [r0]
	ldrh r0, [r2, 0x4]
	adds r1, r3, 0
	adds r1, 0x4E
	strh r0, [r1]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	ldr r0, [r2]
	str r0, [r1]
	b _0808249E
	.pool
_08082278:
	bl sub_8083B08
	lsls r0, 24
	cmp r0, 0
	bne _08082284
	b _0808249E
_08082284:
	b _08082458
_08082286:
	bl berry_blender_related
	lsls r0, 24
	cmp r0, 0
	bne _08082292
	b _0808249E
_08082292:
	ldr r0, =gInGameOpponentsNo
	ldrb r0, [r0]
	cmp r0, 0
	bne _080822A8
	movs r0, 0x22
	bl IncrementGameStat
	b _08082458
	.pool
_080822A8:
	movs r0, 0x21
	bl IncrementGameStat
	b _08082458
_080822B0:
	ldr r6, =sBerryBlenderData
	ldr r4, [r6]
	ldr r5, =0x000011b8
	adds r4, r5
	ldr r5, =sText_WouldLikeToBlendAnotherBerry
	bl GetPlayerTextSpeed
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl Blender_PrintText
	cmp r0, 0
	bne _080822D2
	b _0808249E
_080822D2:
	ldr r1, [r6]
	b _0808245C
	.pool
_080822E4:
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	adds r0, 0x9E
	movs r1, 0
	strb r1, [r0]
	ldr r0, =gUnknown_083399B8
	movs r1, 0x1
	movs r2, 0xD
	movs r3, 0
	bl CreateYesNoMenu
	ldr r1, [r4]
	b _0808245C
	.pool
_08082308:
	bl sub_8198C58
	lsls r0, 24
	asrs r2, r0, 24
	cmp r2, 0
	beq _0808236C
	cmp r2, 0
	bgt _08082322
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _08082328
	b _0808249E
_08082322:
	cmp r2, 0x1
	beq _08082328
	b _0808249E
_08082328:
	ldr r2, =sBerryBlenderData
	ldr r0, [r2]
	adds r0, 0x9E
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r2]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r4, 0
_0808233E:
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x8E
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _0808235C
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0808235C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0808233E
	b _0808249E
	.pool
_0808236C:
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r0, 0x9E
	strb r2, [r0]
	ldr r1, [r1]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r4, 0
_08082380:
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x8E
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _0808239E
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
_0808239E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08082380
	b _0808249E
	.pool
_080823B0:
	ldr r6, =gSendCmd
	adds r0, r6, 0
	bl sub_8081F94
	ldr r4, =sBerryBlenderData
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x9E
	ldrb r5, [r0]
	cmp r5, 0
	bne _0808241C
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	cmp r0, 0
	bne _080823EC
	ldr r0, [r4]
	adds r0, 0x70
	movs r1, 0x2
	strh r1, [r0]
	ldr r0, =0x00009999
	b _08082414
	.pool
_080823EC:
	bl sub_8136EF4
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0808240C
	ldr r0, [r4]
	adds r0, 0x70
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, =0x0000aaaa
	b _08082414
	.pool
_0808240C:
	ldr r0, [r4]
	adds r0, 0x70
	strh r5, [r0]
	ldr r0, =0x00007779
_08082414:
	strh r0, [r6, 0x2]
	b _08082458
	.pool
_0808241C:
	adds r1, r2, 0
	adds r1, 0x70
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, =0x00008888
	strh r0, [r6, 0x2]
	subs r1, 0xD
	b _0808245E
	.pool
_08082430:
	ldr r0, =gInGameOpponentsNo
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082458
	ldr r0, =sub_8082924
	bl SetMainCallback2
	ldr r2, =sBerryBlenderData
	ldr r0, [r2]
	adds r0, 0x63
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	b _0808249C
	.pool
_08082458:
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
_0808245C:
	adds r1, 0x63
_0808245E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808249E
	.pool
_0808246C:
	ldr r6, =sBerryBlenderData
	ldr r4, [r6]
	ldr r0, =0x000011b8
	adds r4, r0
	ldr r5, =sText_CommunicationStandby
	bl GetPlayerTextSpeed
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl Blender_PrintText
	cmp r0, 0
	beq _0808249E
	ldr r0, =sub_8082644
	bl SetMainCallback2
	ldr r0, [r6]
	adds r0, 0x63
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r6]
_0808249C:
	strb r1, [r0]
_0808249E:
	bl sub_808330C
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	adds r0, 0x4C
	ldrh r0, [r0]
	bl sub_8083230
	bl sub_8082AD4
	ldr r1, [r4]
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	movs r4, 0
	ldrsh r0, [r0, r4]
	movs r5, 0x8F
	lsls r5, 1
	adds r1, r5
	movs r2, 0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8081FC8

	thumb_func_start sub_80824FC
sub_80824FC: @ 80824FC
	push {r4,lr}
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	movs r2, 0xD0
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _08082512
	b _0808263C
_08082512:
	lsls r0, 2
	ldr r1, =_08082524
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08082524:
	.4byte _08082540
	.4byte _08082558
	.4byte _08082584
	.4byte _08082594
	.4byte _080825BA
	.4byte _08082600
	.4byte _0808261A
_08082540:
	bl sub_800ADF8
	ldr r0, =sBerryBlenderData
	ldr r2, [r0]
	movs r3, 0xD0
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x1
	b _0808260C
	.pool
_08082558:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0808263C
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r2, 0xD0
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, =gSoftResetDisabled
	movs r0, 0x1
	strb r0, [r1]
	b _0808263C
	.pool
_08082584:
	bl sub_8153430
	ldr r0, =sBerryBlenderData
	ldr r2, [r0]
	b _08082602
	.pool
_08082594:
	ldr r1, [r4]
	movs r2, 0x84
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	bne _0808263C
	bl sub_800ADF8
	ldr r1, [r4]
	movs r3, 0xD0
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _0808263C
_080825BA:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _0808263C
	bl sub_8153474
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080825E4
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	movs r1, 0xD0
	lsls r1, 1
	adds r0, r1
	movs r1, 0x5
	str r1, [r0]
	b _0808263C
	.pool
_080825E4:
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r3, 0x84
	lsls r3, 1
	adds r0, r1, r3
	str r2, [r0]
	movs r0, 0xD0
	lsls r0, 1
	adds r1, r0
	movs r0, 0x3
	str r0, [r1]
	b _0808263C
	.pool
_08082600:
	ldr r2, [r4]
_08082602:
	movs r3, 0xD0
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
_0808260C:
	str r0, [r1]
	movs r0, 0x84
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
	b _0808263C
_0808261A:
	ldr r1, [r4]
	movs r2, 0x84
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	ble _0808263C
	ldr r1, =gSoftResetDisabled
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _0808263E
	.pool
_0808263C:
	movs r0, 0
_0808263E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80824FC

	thumb_func_start sub_8082644
sub_8082644: @ 8082644
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r0, 0x63
	ldrb r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xC
	bls _08082658
	b _080828DC
_08082658:
	lsls r0, 2
	ldr r1, =_0808266C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0808266C:
	.4byte _080826A0
	.4byte _080826EC
	.4byte _0808271C
	.4byte _08082754
	.4byte _0808278C
	.4byte _080827AA
	.4byte _080827C8
	.4byte _080827FC
	.4byte _08082818
	.4byte _08082828
	.4byte _0808284C
	.4byte _080828A4
	.4byte _080828C6
_080826A0:
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x64
	ldrh r2, [r0]
	ldr r0, =0x00002222
	cmp r2, r0
	bne _080826B0
	b _080827A2
_080826B0:
	ldr r0, =0x00001111
	cmp r2, r0
	beq _080826B8
	b _080828DC
_080826B8:
	adds r0, r1, 0
	adds r0, 0x6C
	ldrh r2, [r0]
	ldr r0, =0x00009999
	cmp r2, r0
	bne _080826D8
	adds r1, 0x63
	movs r0, 0x2
	strb r0, [r1]
	b _080828DC
	.pool
_080826D8:
	ldr r0, =0x0000aaaa
	cmp r2, r0
	bne _080827A2
	adds r1, 0x63
	movs r0, 0x1
	strb r0, [r1]
	b _080828DC
	.pool
_080826EC:
	ldr r0, [r6]
	adds r0, 0x63
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, =gStringVar4
	ldr r0, [r6]
	adds r0, 0x6E
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, =gLinkPlayers + 8
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, =sText_ApostropheSPokeblockCaseIsFull
	b _08082740
	.pool
_0808271C:
	ldr r1, [r6]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r4, =gStringVar4
	ldr r0, [r6]
	adds r0, 0x6E
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, =gLinkPlayers + 8
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, =sText_HasNoBerriesToPut
_08082740:
	adds r0, r4, 0
	bl StringAppend
	b _080828DC
	.pool
_08082754:
	ldr r4, [r6]
	ldr r0, =0x000011b8
	adds r4, r0
	ldr r5, =gStringVar4
	bl GetPlayerTextSpeed
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl Blender_PrintText
	cmp r0, 0
	bne _08082774
	b _080828DC
_08082774:
	ldr r1, [r6]
	movs r0, 0x84
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _080828BC
	.pool
_0808278C:
	ldr r4, [r6]
	movs r2, 0x84
	lsls r2, 1
	adds r1, r4, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _080827A0
	b _080828DC
_080827A0:
	adds r1, r4, 0
_080827A2:
	adds r1, 0x63
	movs r0, 0x5
	strb r0, [r1]
	b _080828DC
_080827AA:
	ldr r0, [r6]
	ldr r1, =0x000011b8
	adds r0, r1
	ldr r1, =gText_SavingDontTurnOff2
	movs r2, 0
	bl Blender_PrintText
	bl sub_800ADF8
	b _080828BA
	.pool
_080827C8:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	bne _080827D4
	b _080828DC
_080827D4:
	ldr r3, =sBerryBlenderData
	ldr r1, [r3]
	movs r2, 0x84
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	str r2, [r0]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xD0
	lsls r1, 1
	adds r0, r1
	str r2, [r0]
	b _080828DC
	.pool
_080827FC:
	bl sub_80824FC
	lsls r0, 24
	cmp r0, 0
	beq _080828DC
	movs r0, 0x37
	bl PlaySE
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	b _080828BC
	.pool
_08082818:
	ldr r1, [r6]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_800ADF8
	b _080828DC
_08082828:
	bl sub_800A520
	lsls r0, 24
	cmp r0, 0
	beq _080828DC
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	b _080828BC
	.pool
_0808284C:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080828DC
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x64
	ldrh r1, [r0]
	ldr r0, =0x00002222
	cmp r1, r0
	bne _08082898
	bl FreeAllWindowBuffers
	movs r0, 0x2
	bl UnsetBgTilemapBuffer
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	ldr r0, [r6]
	bl Free
	str r4, [r6]
	ldr r0, =DoBerryBlending
	bl SetMainCallback2
	b _080828DC
	.pool
_08082898:
	movs r1, 0x84
	lsls r1, 1
	adds r0, r2, r1
	str r4, [r0]
	adds r1, r2, 0
	b _080828BC
_080828A4:
	ldr r1, [r6]
	movs r2, 0x84
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	ble _080828DC
	bl sub_800AC34
_080828BA:
	ldr r1, [r6]
_080828BC:
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080828DC
_080828C6:
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r4, [r0]
	cmp r4, 0
	bne _080828DC
	ldr r0, [r6]
	bl Free
	str r4, [r6]
	ldr r0, =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_080828DC:
	bl sub_8082AD4
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x8F
	lsls r2, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082644

	thumb_func_start sub_8082924
sub_8082924: @ 8082924
	push {r4-r6,lr}
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r0, 0x63
	ldrb r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xA
	bls _08082936
	b _08082A92
_08082936:
	lsls r0, 2
	ldr r1, =_08082948
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08082948:
	.4byte _08082974
	.4byte _080829AA
	.4byte _080829D4
	.4byte _08082A00
	.4byte _08082A92
	.4byte _08082A92
	.4byte _08082A92
	.4byte _08082A92
	.4byte _08082A92
	.4byte _08082A30
	.4byte _08082A48
_08082974:
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _08082986
	adds r1, 0x63
	movs r0, 0x9
	strb r0, [r1]
_08082986:
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0x70
	ldrh r1, [r0]
	cmp r1, 0x2
	bne _08082996
	subs r0, 0xD
	strb r1, [r0]
_08082996:
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _08082A92
	adds r1, 0x63
	movs r0, 0x1
	strb r0, [r1]
	b _08082A92
_080829AA:
	ldr r0, [r6]
	adds r0, 0x63
	movs r2, 0
	movs r1, 0x3
	strb r1, [r0]
	ldr r0, [r6]
	ldr r1, =0x000011b8
	adds r0, r1
	strh r2, [r0]
	ldr r0, =gStringVar4
	ldr r1, =sText_YourPokeblockCaseIsFull
	bl StringCopy
	b _08082A92
	.pool
_080829D4:
	ldr r1, [r6]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r6]
	ldr r1, =0x000011b8
	adds r0, r1
	strh r2, [r0]
	ldr r0, =gStringVar4
	ldr r1, =sText_RunOutOfBerriesForBlending
	bl StringCopy
	b _08082A92
	.pool
_08082A00:
	ldr r4, [r6]
	ldr r2, =0x000011b8
	adds r4, r2
	ldr r5, =gStringVar4
	bl GetPlayerTextSpeed
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl Blender_PrintText
	cmp r0, 0
	beq _08082A92
	ldr r0, [r6]
	adds r0, 0x63
	movs r1, 0x9
	strb r1, [r0]
	b _08082A92
	.pool
_08082A30:
	movs r0, 0x3
	bl BeginFastPaletteFade
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	adds r1, 0x63
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08082A92
	.pool
_08082A48:
	ldr r0, =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08082A92
	ldr r0, [r6]
	adds r0, 0x70
	ldrh r0, [r0]
	cmp r0, 0
	bne _08082A70
	ldr r0, =DoBerryBlending
	bl SetMainCallback2
	b _08082A76
	.pool
_08082A70:
	ldr r0, =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
_08082A76:
	bl FreeAllWindowBuffers
	movs r0, 0x2
	bl UnsetBgTilemapBuffer
	movs r0, 0x1
	bl UnsetBgTilemapBuffer
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	bl Free
	movs r0, 0
	str r0, [r4]
_08082A92:
	bl sub_8082AD4
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x8F
	lsls r2, 1
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	bl Blender_DummiedOutFunc
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTextPrinters
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082924

	thumb_func_start sub_8082AD4
sub_8082AD4: @ 8082AD4
	push {r4-r7,lr}
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08082AE0
	b _08082CA4
_08082AE0:
	ldr r4, =gRecvCmds
	ldrh r0, [r4]
	ldr r1, =0x00002fff
	movs r2, 0xBC
	lsls r2, 6
	bl sub_80814B0
	cmp r0, 0
	beq _08082B66
	ldrh r1, [r4, 0x2]
	ldr r0, =0x00001111
	cmp r1, r0
	bne _08082B58
	ldrh r3, [r4, 0x4]
	ldr r0, =0x00009999
	cmp r3, r0
	beq _08082B38
	cmp r3, r0
	bgt _08082B24
	ldr r0, =0x00008888
	b _08082B26
	.pool
_08082B24:
	ldr r0, =0x0000aaaa
_08082B26:
	cmp r3, r0
	beq _08082B38
	ldr r2, =sBerryBlenderData
	b _08082B48
	.pool
_08082B38:
	ldr r2, =sBerryBlenderData
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x6C
	strh r3, [r1]
	ldrh r1, [r4, 0x6]
	adds r0, 0x6E
	strh r1, [r0]
_08082B48:
	ldr r0, [r2]
	adds r0, 0x64
	ldr r1, =0x00001111
	b _08082B64
	.pool
_08082B58:
	ldr r0, =0x00002222
	cmp r1, r0
	bne _08082B66
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	adds r0, 0x64
_08082B64:
	strh r1, [r0]
_08082B66:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _08082B72
	b _08082CA4
_08082B72:
	ldr r2, =sBerryBlenderData
	ldr r0, [r2]
	adds r0, 0x64
	ldrh r1, [r0]
	ldr r0, =0x00001111
	cmp r1, r0
	bne _08082B82
	b _08082CA4
_08082B82:
	ldr r0, =0x00002222
	cmp r1, r0
	bne _08082B8A
	b _08082CA4
_08082B8A:
	movs r5, 0
	adds r7, r2, 0
	b _08082BF4
	.pool
_08082B9C:
	ldr r6, =gRecvCmds
	lsls r4, r5, 4
	adds r0, r4, r6
	ldrh r0, [r0]
	ldr r1, =0x00002fff
	movs r2, 0xBC
	lsls r2, 6
	bl sub_80814B0
	cmp r0, 0
	beq _08082BEE
	adds r0, r6, 0x2
	adds r0, r4, r0
	ldrh r2, [r0]
	ldr r0, =0x00008888
	cmp r2, r0
	beq _08082BE4
	cmp r2, r0
	bgt _08082BD8
	ldr r0, =0x00007779
	b _08082BE0
	.pool
_08082BD8:
	ldr r0, =0x00009999
	cmp r2, r0
	beq _08082BE4
	ldr r0, =0x0000aaaa
_08082BE0:
	cmp r2, r0
	bne _08082BEE
_08082BE4:
	ldr r0, [r7]
	lsls r1, r5, 1
	adds r0, 0x64
	adds r0, r1
	strh r2, [r0]
_08082BEE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08082BF4:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcc _08082B9C
	movs r5, 0
	b _08082C12
	.pool
_08082C0C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08082C12:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _08082C2E
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x64
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08082C0C
_08082C2E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08082CA4
	movs r5, 0
	ldr r4, =0x00007779
	b _08082C4E
	.pool
_08082C48:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08082C4E:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _08082C6A
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x64
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r4
	beq _08082C48
_08082C6A:
	ldr r4, =gSendCmd
	adds r0, r4, 0
	bl sub_8081F94
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _08082C90
	ldr r0, =0x00002222
	strh r0, [r4, 0x2]
	b _08082CA4
	.pool
_08082C90:
	ldr r0, =0x00001111
	strh r0, [r4, 0x2]
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	lsls r1, r5, 1
	adds r0, 0x64
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	strh r5, [r4, 0x6]
_08082CA4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082AD4

	thumb_func_start sub_8082CB4
sub_8082CB4: @ 8082CB4
	push {r4,lr}
	sub sp, 0x14
	movs r1, 0xF0
	lsls r1, 7
	str r1, [sp]
	movs r1, 0xA0
	lsls r1, 7
	str r1, [sp, 0x4]
	mov r3, sp
	ldr r1, =sBerryBlenderData
	ldr r1, [r1]
	mov r12, r1
	movs r1, 0x8E
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	movs r1, 0x78
	subs r1, r2
	strh r1, [r3, 0x8]
	movs r1, 0x8F
	lsls r1, 1
	add r1, r12
	ldrh r2, [r1]
	movs r1, 0x50
	subs r1, r2
	strh r1, [r3, 0xA]
	mov r2, sp
	movs r3, 0x8D
	lsls r3, 1
	add r3, r12
	ldrh r1, [r3]
	strh r1, [r2, 0xC]
	ldrh r1, [r3]
	strh r1, [r2, 0xE]
	mov r1, r12
	adds r1, 0x4A
	ldrh r1, [r1]
	strh r1, [r2, 0x10]
	mov r1, sp
	ldm r1!, {r2-r4}
	stm r0!, {r2-r4}
	ldm r1!, {r2,r3}
	stm r0!, {r2,r3}
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082CB4

	thumb_func_start sub_8082D18
sub_8082D18: @ 8082D18
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	adds r0, 0x4A
	ldrh r0, [r0]
	bx lr
	.pool
	thumb_func_end sub_8082D18

	thumb_func_start sub_8082D28
sub_8082D28: @ 8082D28
	push {r4,lr}
	movs r1, 0
	ldr r4, =gReceivedRemoteLinkPlayers
	ldrb r0, [r4]
	cmp r0, 0
	beq _08082D3C
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r1, r0, 24
_08082D3C:
	ldr r0, =gLinkVSyncDisabled
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082DCC
	ldrb r0, [r4]
	cmp r0, 0
	beq _08082DCC
	cmp r1, 0
	bne _08082D90
	ldr r0, =sBerryBlenderData
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x4A
	adds r0, r3, 0
	adds r0, 0x4C
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	ldr r1, =gSendCmd
	movs r4, 0x8B
	lsls r4, 1
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r1, 0xA]
	ldrh r0, [r2]
	strh r0, [r1, 0xC]
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r3, r1
	bl sub_8082CB4
	b _08082DEA
	.pool
_08082D90:
	ldr r3, =gRecvCmds
	ldrh r0, [r3]
	movs r1, 0xFF
	lsls r1, 8
	ands r1, r0
	movs r0, 0x88
	lsls r0, 7
	cmp r1, r0
	bne _08082DEA
	ldr r0, =sBerryBlenderData
	ldr r2, [r0]
	ldrh r0, [r3, 0xA]
	movs r4, 0x8B
	lsls r4, 1
	adds r1, r2, r4
	strh r0, [r1]
	ldrh r0, [r3, 0xC]
	adds r1, r2, 0
	adds r1, 0x4A
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r2, r1
	bl sub_8082CB4
	b _08082DEA
	.pool
_08082DCC:
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0x4A
	adds r0, r1, 0
	adds r0, 0x4C
	ldrh r0, [r0]
	ldrh r3, [r2]
	adds r0, r3
	strh r0, [r2]
	movs r4, 0xA0
	lsls r4, 1
	adds r0, r1, r4
	bl sub_8082CB4
_08082DEA:
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082D28

	thumb_func_start BerryBlender_SetGpuRegs
BerryBlender_SetGpuRegs: @ 8082DF4
	push {r4-r6,lr}
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	movs r6, 0x8E
	lsls r6, 1
	adds r0, r6
	ldrh r1, [r0]
	movs r0, 0x14
	bl SetGpuReg
	ldr r0, [r4]
	movs r5, 0x8F
	lsls r5, 1
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x16
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, r6
	ldrh r1, [r0]
	movs r0, 0x10
	bl SetGpuReg
	ldr r0, [r4]
	adds r0, r5
	ldrh r1, [r0]
	movs r0, 0x12
	bl SetGpuReg
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end BerryBlender_SetGpuRegs

	thumb_func_start sub_8082E3C
sub_8082E3C: @ 8082E3C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08082E5A
	adds r0, 0x7
_08082E5A:
	asrs r0, 3
	strh r0, [r2, 0x24]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08082E68
	adds r0, 0x7
_08082E68:
	asrs r0, 3
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08082E80
	adds r0, r2, 0
	bl DestroySprite
_08082E80:
	pop {r0}
	bx r0
	thumb_func_end sub_8082E3C

	thumb_func_start sub_8082E84
sub_8082E84: @ 8082E84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0x1
	ands r1, r0
	adds r0, r1, 0x1
	cmp r0, 0
	beq _08082F40
	ldr r0, =gSineTable
	mov r9, r0
	ldr r2, =gSprites
	mov r10, r2
	adds r6, r1, 0x1
	movs r3, 0x1F
	mov r8, r3
	movs r7, 0x10
_08082EB0:
	bl Random
	ldr r1, =sBerryBlenderData
	ldr r4, [r1]
	adds r4, 0x4A
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	ldrh r1, [r4]
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r9
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	bge _08082EE4
	adds r1, 0x3
_08082EE4:
	asrs r1, 2
	lsls r0, r2, 1
	add r0, r9
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _08082EF4
	adds r0, 0x3
_08082EF4:
	asrs r2, r0, 2
	adds r1, 0x78
	adds r2, 0x50
	ldr r0, =gUnknown_08339BE0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	mov r3, r10
	adds r4, r5, r3
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ands r0, r1
	subs r0, r7, r0
	strh r0, [r4, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r2, r8
	ands r0, r2
	subs r0, r7, r0
	strh r0, [r4, 0x30]
	ldr r3, =gSprites + 0x1C
	adds r5, r3
	ldr r0, =sub_8082E3C
	str r0, [r5]
	subs r6, 0x1
	cmp r6, 0
	bne _08082EB0
_08082F40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082E84

	thumb_func_start sub_8082F68
sub_8082F68: @ 8082F68
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08082F94
	adds r0, r4, 0
	bl DestroySprite
_08082F94:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8082F68

	thumb_func_start sub_8082F9C
sub_8082F9C: @ 8082F9C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xC
	negs r1, r1
	cmp r0, r1
	bge _08082FC0
	ldr r0, =0x0000fff4
	strh r0, [r2, 0x26]
_08082FC0:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08082FD4
	adds r0, r2, 0
	bl DestroySprite
_08082FD4:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8082F9C

	thumb_func_start Blender_SetBankBerryData
Blender_SetBankBerryData: @ 8082FDC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, =sBerryBlenderData
	ldr r3, [r2]
	lsls r4, r0, 1
	adds r2, r3, 0
	adds r2, 0x74
	adds r2, r4
	strh r1, [r2]
	lsls r0, 4
	movs r2, 0xAC
	lsls r2, 1
	adds r0, r2
	adds r3, r0
	adds r0, r3, 0
	bl Blender_CopyBerryData
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end Blender_SetBankBerryData

	thumb_func_start sub_8083010
sub_8083010: @ 8083010
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0808304C
	cmp r0, 0x1
	bgt _08083026
	cmp r0, 0
	beq _0808302C
	b _080830B2
_08083026:
	cmp r0, 0x2
	beq _08083066
	b _080830B2
_0808302C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x58
	ble _080830B2
	movs r0, 0x58
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl PlaySE
	b _080830B2
_0808304C:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080830B2
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x32]
	b _080830B2
_08083066:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _080830B2
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	adds r1, r0, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080830A0
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, =gUnknown_08339C60
	movs r2, 0x14
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x2
	bl CreateSprite
	b _080830B2
	.pool
_080830A0:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, =0x0000fff0
	strh r0, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_080830B2:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8083010

	thumb_func_start sub_80830C0
sub_80830C0: @ 80830C0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080830FC
	cmp r0, 0x1
	bgt _080830D6
	cmp r0, 0
	beq _080830DC
	b _08083130
_080830D6:
	cmp r0, 0x2
	beq _08083112
	b _08083130
_080830DC:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5C
	ble _08083130
	movs r0, 0x5C
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x15
	bl PlaySE
	b _08083130
_080830FC:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08083130
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08083130
_08083112:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _08083130
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_08083130:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80830C0

	thumb_func_start sub_8083140
sub_8083140: @ 8083140
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r1, =sBerryBlenderData
	ldr r1, [r1]
	movs r2, 0x8C
	lsls r2, 1
	adds r1, r2
	ldrh r2, [r1]
	cmp r2, r0
	bcs _08083166
	adds r0, r2, 0x2
	strh r0, [r1]
	ldrh r0, [r1]
	adds r1, r3, 0
	bl sub_8083170
_08083166:
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8083140

	thumb_func_start sub_8083170
sub_8083170: @ 8083170
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r7, =0x06006000
	lsrs r0, 10
	bl __divsi3
	adds r1, r0, 0
	cmp r1, 0
	bge _08083188
	adds r0, r1, 0x7
_08083188:
	asrs r4, r0, 3
	movs r3, 0
	cmp r3, r4
	bge _080831B0
	ldr r0, =0x000080e9
	adds r6, r0, 0
	adds r0, 0x10
	adds r5, r0, 0
	adds r2, r7, 0
	adds r2, 0x56
	adds r0, r7, 0
	adds r3, r4, 0
_080831A0:
	strh r6, [r0, 0x16]
	strh r5, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _080831A0
	adds r3, r4, 0
_080831B0:
	adds r0, r1, 0
	cmp r1, 0
	bge _080831B8
	adds r0, r1, 0x7
_080831B8:
	asrs r2, r0, 3
	lsls r0, r2, 3
	subs r2, r1, r0
	cmp r2, 0
	beq _080831D6
	lsls r0, r3, 1
	adds r0, r7
	ldr r4, =0xffff80e1
	adds r1, r2, r4
	strh r1, [r0, 0x16]
	adds r0, 0x56
	adds r4, 0x10
	adds r1, r2, r4
	strh r1, [r0]
	adds r3, 0x1
_080831D6:
	cmp r3, 0x7
	bgt _080831FA
	ldr r0, =0x000080e1
	adds r4, r0, 0
	adds r0, 0x10
	adds r2, r0, 0
	lsls r1, r3, 1
	adds r0, r1, 0
	adds r0, 0x56
	adds r0, r7
	adds r1, r7
_080831EC:
	strh r4, [r1, 0x16]
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _080831EC
_080831FA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8083170

	thumb_func_start sub_8083210
sub_8083210: @ 8083210
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, =0x00057e40
	muls r0, r1
	cmp r0, 0
	bge _08083222
	ldr r1, =0x0000ffff
	adds r0, r1
_08083222:
	asrs r0, 16
	pop {r1}
	bx r1
	.pool
	thumb_func_end sub_8083210

	thumb_func_start sub_8083230
sub_8083230: @ 8083230
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8083210
	adds r5, r0, 0
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x4E
	ldrh r0, [r1]
	cmp r0, r5
	bcs _0808324E
	strh r5, [r1]
_0808324E:
	movs r6, 0
_08083250:
	mov r0, sp
	adds r4, r0, r6
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	strb r0, [r4]
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _08083250
	ldr r2, =0x06006458
	mov r0, sp
	ldr r3, =0x00008072
	adds r1, r3, 0
	ldrb r0, [r0, 0x4]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x3]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x2]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x4
	mov r0, sp
	ldrb r0, [r0, 0x1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r0
	strh r1, [r2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8083230

	thumb_func_start sub_80832BC
sub_80832BC: @ 80832BC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r5, r4, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080832E0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsrs r1, r4, 17
	subs r0, r1
	strh r0, [r6]
_080832E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80832BC

	thumb_func_start sub_80832E8
sub_80832E8: @ 80832E8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _080832FA
	adds r0, r2, 0x1
	strh r0, [r1]
_080832FA:
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08083308
	subs r0, r2, 0x1
	strh r0, [r1]
_08083308:
	pop {r0}
	bx r0
	thumb_func_end sub_80832E8

	thumb_func_start sub_808330C
sub_808330C: @ 808330C
	push {r4,lr}
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r1
	bl sub_80832E8
	ldr r0, [r4]
	movs r1, 0x8F
	lsls r1, 1
	adds r0, r1
	bl sub_80832E8
	pop {r4}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_808330C

	thumb_func_start sub_8083334
sub_8083334: @ 8083334
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r5, 0x8
	cmp r1, 0x9
	bhi _08083344
	movs r5, 0x10
_08083344:
	ldrh r0, [r4]
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _08083362
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	lsrs r1, r5, 1
	subs r0, r1
	b _08083376
_08083362:
	cmp r1, 0
	bge _0808336A
	adds r0, 0x1
	strh r0, [r4]
_0808336A:
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08083378
	subs r0, r1, 0x1
_08083376:
	strh r0, [r4]
_08083378:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8083334

	thumb_func_start sub_8083380
sub_8083380: @ 8083380
	push {r4,r5,lr}
	ldr r5, =sBerryBlenderData
	ldr r2, [r5]
	movs r4, 0x84
	lsls r4, 1
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, 0
	bne _080833A0
	movs r3, 0x8E
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
_080833A0:
	ldr r0, [r5]
	adds r2, r0, r4
	ldr r1, [r2]
	adds r1, 0x1
	str r1, [r2]
	movs r2, 0x8E
	lsls r2, 1
	adds r0, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_8083334
	ldr r1, [r5]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r1, r3
	adds r1, r4
	ldrh r1, [r1]
	bl sub_8083334
	ldr r2, [r5]
	adds r0, r2, r4
	ldr r0, [r0]
	cmp r0, 0x14
	beq _080833DC
	movs r0, 0
	b _080833F0
	.pool
_080833DC:
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x1
_080833F0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8083380

	thumb_func_start sub_80833F8
sub_80833F8: @ 80833F8
	ldr r1, =sBerryBlenderData
	ldr r2, [r1]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x24]
	adds r3, 0x2
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.pool
	thumb_func_end sub_80833F8

	thumb_func_start UpdateBerryBlenderRecord
@ void UpdateBerryBlenderRecord()
UpdateBerryBlenderRecord: @ 8083418
	push {lr}
	ldr r0, =gSaveBlock1Ptr
	ldr r2, [r0]
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 1
	ldr r3, =0x000009bc
	adds r2, r3
	adds r2, r0
	adds r1, 0x4E
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _0808343E
	strh r1, [r2]
_0808343E:
	pop {r0}
	bx r0
	.pool
	thumb_func_end UpdateBerryBlenderRecord

	thumb_func_start berry_blender_related
berry_blender_related: @ 8083450
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4C
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _0808346A
	b _08083898
_0808346A:
	lsls r0, 2
	ldr r1, =_0808347C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_0808347C:
	.4byte _08083498
	.4byte _080834AE
	.4byte _080834C8
	.4byte _08083518
	.4byte _08083790
	.4byte _080837A8
	.4byte _0808386C
_08083498:
	ldr r1, [r4]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	movs r1, 0x11
	str r1, [r0]
	b _08083898
_080834AE:
	ldr r1, [r4]
	movs r3, 0x84
	lsls r3, 1
	adds r2, r1, r3
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _080834C2
	b _08083898
_080834C2:
	movs r0, 0
	str r0, [r2]
	b _08083854
_080834C8:
	ldr r1, [r4]
	movs r0, 0x84
	lsls r0, 1
	adds r1, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _080834DC
	b _08083898
_080834DC:
	movs r6, 0
_080834DE:
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	adds r0, 0x46
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x2
	bls _080834DE
	ldr r1, [r4]
	movs r3, 0x84
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	b _08083854
	.pool
_08083518:
	ldr r4, =sText_BlendingResults
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0xA8
	bl GetStringCenterAlignXOffset
	lsls r2, r0, 24
	lsrs r2, 24
	movs r0, 0xFF
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x5
	adds r1, r4, 0
	movs r3, 0x1
	bl Blender_AddTextPrinter
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r2, r0, 0
	adds r2, 0x7C
	ldrb r0, [r2]
	movs r3, 0x15
	mov r9, r3
	cmp r0, 0x4
	bne _08083550
	movs r0, 0x11
	mov r9, r0
_08083550:
	movs r6, 0
	mov r3, sp
	adds r3, 0x10
	str r3, [sp, 0x48]
	ldrb r2, [r2]
	cmp r6, r2
	bcs _0808361A
	adds r7, r1, 0
	movs r0, 0x3
	mov r10, r0
_08083564:
	ldr r0, [r7]
	movs r2, 0x9E
	lsls r2, 1
	adds r1, r0, r2
	adds r1, r6
	ldrb r5, [r1]
	adds r0, 0x9F
	adds r6, 0x1
	mov r8, r6
	mov r1, r8
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r1, =sText_Dot
	bl StringAppend
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r1, =gText_Space
	bl StringAppend
	ldr r0, [r7]
	adds r0, 0x9F
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	ldr r3, =gLinkPlayers + 8
	adds r1, r4, r3
	bl StringAppend
	ldr r1, [r7]
	adds r1, 0x9F
	mov r0, r9
	lsls r6, r0, 24
	lsrs r6, 24
	movs r2, 0xFF
	str r2, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x8
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x9F
	lsls r5, 4
	adds r5, r1
	movs r1, 0xAD
	lsls r1, 1
	adds r5, r1
	adds r1, r5, 0
	bl StringCopy
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r2, =gLinkPlayers
	adds r4, r2
	ldrb r1, [r4, 0x1A]
	bl ConvertInternationalString
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r1, =sText_SpaceBerry
	bl StringAppend
	ldr r1, [r7]
	adds r1, 0x9F
	movs r3, 0xFF
	str r3, [sp]
	mov r0, r10
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x54
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	movs r1, 0x10
	add r9, r1
	mov r2, r8
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r0, [r7]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r6, r0
	bcc _08083564
_0808361A:
	ldr r1, =sText_MaximumSpeed
	movs r3, 0xFF
	mov r10, r3
	str r3, [sp]
	movs r0, 0x3
	mov r9, r0
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0
	movs r3, 0x51
	bl Blender_AddTextPrinter
	ldr r6, =sBerryBlenderData
	ldr r0, [r6]
	adds r4, r0, 0
	adds r4, 0x9F
	adds r0, 0x4E
	ldrh r0, [r0]
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, 0x9F
	ldr r1, =sText_Dot
	bl StringAppend
	ldr r0, [r6]
	adds r0, 0x4E
	ldrh r0, [r0]
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [sp, 0x48]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, 0x9F
	ldr r1, [sp, 0x48]
	bl StringAppend
	ldr r0, [r6]
	adds r0, 0x9F
	ldr r1, =sText_RPM
	bl StringAppend
	ldr r1, [r6]
	adds r1, 0x9F
	movs r0, 0x1
	movs r2, 0xA8
	bl GetStringRightAlignXOffset
	ldr r1, [r6]
	adds r1, 0x9F
	lsls r2, r0, 24
	lsrs r2, 24
	mov r3, r10
	str r3, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r3, 0x51
	bl Blender_AddTextPrinter
	ldr r1, =sText_Time
	mov r2, r10
	str r2, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0
	movs r3, 0x61
	bl Blender_AddTextPrinter
	ldr r5, [r6]
	movs r1, 0x82
	lsls r1, 1
	adds r0, r5, r1
	ldr r0, [r0]
	mov r8, r0
	movs r1, 0x3C
	bl __udivsi3
	movs r1, 0x3C
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0xE1
	lsls r1, 4
	mov r0, r8
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r5, 0x9F
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, 0x9F
	ldr r1, =sText_Min
	bl StringAppend
	adds r1, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r0, 0x9F
	ldr r1, =sText_Sec
	bl StringAppend
	ldr r1, [r6]
	adds r1, 0x9F
	movs r0, 0x1
	movs r2, 0xA8
	bl GetStringRightAlignXOffset
	ldr r1, [r6]
	adds r1, 0x9F
	lsls r2, r0, 24
	lsrs r2, 24
	mov r3, r10
	str r3, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r3, 0x61
	bl Blender_AddTextPrinter
	ldr r1, [r6]
	movs r3, 0x84
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0x5
	movs r1, 0x2
	bl CopyWindowToVram
	b _08083898
	.pool
_08083790:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808379E
	b _08083898
_0808379E:
	ldr r1, [r4]
	b _08083854
	.pool
_080837A8:
	movs r0, 0x5
	movs r1, 0x1
	bl sub_8198070
	movs r6, 0
	add r7, sp, 0x40
	ldr r5, =sBerryBlenderData
_080837B6:
	ldr r0, [r5]
	lsls r2, r6, 1
	adds r0, 0x74
	adds r0, r2
	ldrh r1, [r0]
	cmp r1, 0
	beq _080837CC
	add r0, sp, 0x38
	adds r0, r2
	subs r1, 0x85
	strh r1, [r0]
_080837CC:
	ldr r0, [r5]
	adds r0, 0x8E
	adds r0, r2
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _080837EA
	lsls r4, r6, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PutWindowTilemap
	adds r0, r4, 0
	movs r1, 0x3
	bl CopyWindowToVram
_080837EA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _080837B6
	bl sub_8081E20
	ldr r4, =sBerryBlenderData
	ldr r3, [r4]
	movs r1, 0xAC
	lsls r1, 1
	adds r0, r3, r1
	adds r1, r3, 0
	adds r1, 0x7C
	ldrb r2, [r1]
	subs r1, 0x2E
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r7, 0
	add r3, sp, 0x8
	bl sub_8081BE0
	ldr r1, [r4]
	adds r1, 0x9F
	adds r0, r7, 0
	bl sub_80838AC
	ldr r1, [r4]
	movs r2, 0xD4
	lsls r2, 1
	adds r1, r2
	adds r0, r7, 0
	bl sub_8083F94
	ldr r0, =sub_8083F3C
	movs r1, 0x6
	bl CreateTask
	bl sub_80EECEC
	ldr r0, =gSpecialVar_ItemId
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r7, 0
	bl sub_8136F2C
	ldr r1, [r4]
	ldr r3, =0x000011b8
	adds r2, r1, r3
	movs r0, 0
	strh r0, [r2]
_08083854:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08083898
	.pool
_0808386C:
	ldr r4, [r4]
	ldr r0, =0x000011b8
	adds r5, r4, r0
	adds r4, 0x9F
	bl GetPlayerTextSpeed
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl Blender_PrintText
	cmp r0, 0
	beq _08083898
	bl UpdateBerryBlenderRecord
	movs r0, 0x1
	b _0808389A
	.pool
_08083898:
	movs r0, 0
_0808389A:
	add sp, 0x4C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end berry_blender_related

	thumb_func_start sub_80838AC
sub_80838AC: @ 80838AC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	strb r0, [r6]
	ldr r1, =gPokeblockNames
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	ldr r1, =gText_WasMade
	adds r0, r6, 0
	bl StringAppend
	ldr r1, =sText_NewLine
	adds r0, r6, 0
	bl StringAppend
	adds r0, r5, 0
	bl sub_8136EA4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_8136EDC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, =sText_TheLevelIs
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, =sText_TheFeelIs
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, =sText_Dot2
	adds r0, r6, 0
	bl StringAppend
	ldr r1, =gText_NewParagraph
	adds r0, r6, 0
	bl StringAppend
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80838AC

	thumb_func_start sub_808395C
sub_808395C: @ 808395C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r12, r2
	lsls r1, 24
	lsrs r7, r1, 24
	movs r0, 0
	cmp r0, r7
	bge _080839A8
_08083972:
	movs r5, 0
	adds r1, r0, 0x1
	mov r8, r1
	cmp r5, r7
	bge _080839A2
	mov r1, r9
	adds r6, r1, r0
_08083980:
	ldrb r4, [r6]
	lsls r1, r4, 2
	add r1, r12
	mov r0, r9
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, 2
	add r0, r12
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bls _0808399C
	strb r3, [r6]
	strb r4, [r2]
_0808399C:
	adds r5, 0x1
	cmp r5, r7
	blt _08083980
_080839A2:
	mov r0, r8
	cmp r0, r7
	blt _08083972
_080839A8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808395C

	thumb_func_start sub_80839B4
sub_80839B4: @ 80839B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r5, 0
	ldr r2, =sBerryBlenderData
	ldr r0, [r2]
	adds r0, 0x7C
	adds r1, r2, 0
	add r3, sp, 0x4
	mov r10, r3
	b _080839E4
	.pool
_080839D4:
	mov r4, sp
	adds r0, r4, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r2]
	adds r0, 0x7C
_080839E4:
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080839D4
	movs r5, 0
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x7C
	ldrb r2, [r1]
	cmp r5, r2
	bcs _08083A5E
	mov r9, r10
	movs r3, 0x92
	lsls r3, 1
	adds r3, r0
	mov r8, r3
	mov r12, r1
	movs r4, 0x93
	lsls r4, 1
	adds r7, r0, r4
	movs r1, 0x94
	lsls r1, 1
	adds r6, r0, r1
_08083A10:
	lsls r4, r5, 2
	add r4, r9
	lsls r3, r5, 1
	adds r3, r5
	lsls r3, 1
	mov r2, r8
	adds r0, r2, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r1, r0, 6
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r1, 6
	str r1, [r4]
	adds r0, r7, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	str r1, [r4]
	movs r0, 0xFA
	lsls r0, 2
	adds r1, r0
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r1, r0
	str r1, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r12
	ldrb r1, [r1]
	cmp r5, r1
	bcc _08083A10
_08083A5E:
	ldr r4, =sBerryBlenderData
	ldr r0, [r4]
	adds r0, 0x7C
	ldrb r1, [r0]
	mov r0, sp
	mov r2, r10
	bl sub_808395C
	movs r5, 0
	ldr r0, [r4]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08083A9E
	adds r2, r4, 0
	movs r3, 0x9E
	lsls r3, 1
_08083A80:
	ldr r1, [r2]
	adds r1, r3
	adds r1, r5
	mov r4, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r2]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08083A80
_08083A9E:
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083AB4
	movs r3, 0
	b _08083ABC
	.pool
_08083AB4:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r3, r0, 24
_08083ABC:
	movs r5, 0
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08083AF2
	movs r6, 0x9E
	lsls r6, 1
	movs r4, 0xD2
	lsls r4, 1
_08083AD2:
	ldr r2, [r1]
	adds r0, r2, r6
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, r3
	bne _08083AE2
	adds r0, r2, r4
	strb r5, [r0]
_08083AE2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r1]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08083AD2
_08083AF2:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_80839B4

	thumb_func_start sub_8083B08
sub_8083B08: @ 8083B08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, =sBerryBlenderData
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _08083B22
	b _08083E12
_08083B22:
	lsls r0, 2
	ldr r1, =_08083B34
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.pool
	.align 2, 0
_08083B34:
	.4byte _08083B50
	.4byte _08083B66
	.4byte _08083B80
	.4byte _08083B9A
	.4byte _08083DC8
	.4byte _08083DE2
	.4byte _08083E08
_08083B50:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x84
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	str r1, [r0]
	b _08083E12
_08083B66:
	ldr r1, [r2]
	movs r3, 0x84
	lsls r3, 1
	adds r2, r1, r3
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _08083B7A
	b _08083E12
_08083B7A:
	movs r0, 0
	str r0, [r2]
	b _08083DF8
_08083B80:
	ldr r1, [r2]
	movs r0, 0x84
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	adds r0, 0x1
	str r0, [r2]
	cmp r0, 0x14
	bgt _08083B94
	b _08083E12
_08083B94:
	movs r0, 0
	str r0, [r2]
	b _08083DF8
_08083B9A:
	movs r0, 0x5
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xD
	bl SetWindowBorderStyle
	ldr r4, =sText_Ranking
	movs r0, 0x1
	adds r1, r4, 0
	movs r2, 0xA8
	bl GetStringCenterAlignXOffset
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0xFF
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0x5
	adds r1, r4, 0
	movs r3, 0x1
	bl Blender_AddTextPrinter
	ldr r1, =gUnknown_08339B40
	mov r8, r1
	mov r0, r8
	movs r1, 0x80
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r7, =sBerryBlenderData
	ldr r1, [r7]
	adds r1, 0x46
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x46
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, =gSprites
	adds r0, r6
	movs r1, 0x3
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, 0x46
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r0, r5
	ldr r4, =SpriteCallbackDummy
	str r4, [r0]
	mov r0, r8
	movs r1, 0xA0
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x47
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x47
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	mov r0, r8
	movs r1, 0xC0
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x48
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x48
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r7]
	adds r0, 0x48
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	bl sub_80839B4
	movs r2, 0x29
	str r2, [sp, 0x8]
	movs r2, 0
	ldr r0, [r7]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r2, r0
	bcc _08083C7C
	b _08083D8A
_08083C7C:
	movs r3, 0xFF
	mov r10, r3
	movs r0, 0x3
	mov r9, r0
_08083C84:
	ldr r0, [r7]
	movs r3, 0x9E
	lsls r3, 1
	adds r1, r0, r3
	adds r1, r2
	ldrb r5, [r1]
	adds r0, 0x9F
	adds r2, 0x1
	mov r8, r2
	mov r1, r8
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r1, =sText_Dot
	bl StringAppend
	ldr r0, [r7]
	adds r0, 0x9F
	ldr r1, =gText_Space
	bl StringAppend
	ldr r0, [r7]
	adds r0, 0x9F
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r2, =gLinkPlayers + 8
	adds r1, r2
	bl StringAppend
	ldr r1, [r7]
	adds r1, 0x9F
	ldr r0, [sp, 0x8]
	lsls r6, r0, 24
	lsrs r6, 24
	mov r2, r10
	str r2, [sp]
	mov r3, r9
	str r3, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x9F
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 1
	movs r2, 0x92
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	ldrh r1, [r1]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, [r7]
	adds r1, 0x9F
	mov r3, r10
	str r3, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x4E
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x9F
	movs r2, 0x93
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	ldrh r1, [r1]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, [r7]
	adds r1, 0x9F
	mov r3, r10
	str r3, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x6E
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0x9F
	movs r2, 0x94
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	ldrh r1, [r1]
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r1, [r7]
	adds r1, 0x9F
	mov r3, r10
	str r3, [sp]
	mov r0, r9
	str r0, [sp, 0x4]
	movs r0, 0x5
	movs r2, 0x8E
	adds r3, r6, 0
	bl Blender_AddTextPrinter
	ldr r1, [sp, 0x8]
	adds r1, 0x10
	str r1, [sp, 0x8]
	mov r2, r8
	lsls r2, 16
	lsrs r2, 16
	ldr r0, [r7]
	adds r0, 0x7C
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08083D8A
	b _08083C84
_08083D8A:
	movs r0, 0x5
	bl PutWindowTilemap
	movs r0, 0x5
	movs r1, 0x3
	bl CopyWindowToVram
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
	movs r3, 0x84
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	b _08083DF8
	.pool
_08083DC8:
	ldr r2, [r2]
	movs r0, 0x84
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	ble _08083E12
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _08083E12
_08083DE2:
	ldr r0, =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08083E12
	movs r0, 0x5
	bl PlaySE
	ldr r0, =sBerryBlenderData
	ldr r1, [r0]
_08083DF8:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08083E12
	.pool
_08083E08:
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08083E14
_08083E12:
	movs r0, 0
_08083E14:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8083B08

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 8083E24
	push {r4-r7,lr}
	sub sp, 0x34
	ldr r0, =gUnknown_08339D14
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x2C]
	str r1, [sp, 0x30]
	ldr r5, =gUnknown_0203AB74
	add r0, sp, 0x2C
	bl AddWindow
	strb r0, [r5]
	ldrb r0, [r5]
	movs r1, 0
	bl sub_81973FC
	ldrb r0, [r5]
	movs r1, 0x11
	bl FillWindowPixelBuffer
	ldr r6, =gText_BlenderMaxSpeedRecord
	movs r0, 0x1
	adds r1, r6, 0
	movs r2, 0x90
	bl GetStringCenterAlignXOffset
	adds r3, r0, 0
	ldrb r0, [r5]
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0x1
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	adds r2, r6, 0
	bl PrintTextOnWindow
	ldrb r0, [r5]
	ldr r2, =gText_234Players
	movs r1, 0x29
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x1
	movs r3, 0x4
	bl PrintTextOnWindow
	movs r6, 0
	movs r7, 0xA4
	lsls r7, 22
_08083E8A:
	ldr r0, =gSaveBlock1Ptr
	ldr r0, [r0]
	lsls r1, r6, 1
	ldr r2, =0x000009bc
	adds r0, r2
	adds r0, r1
	ldrh r4, [r0]
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	add r0, sp, 0xC
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, =sText_Dot
	bl StringAppend
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, =sText_RPM
	bl StringAppend
	movs r0, 0x1
	add r1, sp, 0xC
	movs r2, 0x8C
	bl GetStringRightAlignXOffset
	adds r3, r0, 0
	ldr r4, =gUnknown_0203AB74
	ldrb r0, [r4]
	lsls r3, 24
	lsrs r3, 24
	lsrs r1, r7, 24
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x1
	add r2, sp, 0xC
	bl PrintTextOnWindow
	movs r0, 0x80
	lsls r0, 21
	adds r7, r0
	adds r6, 0x1
	cmp r6, 0x2
	ble _08083E8A
	ldrb r0, [r4]
	bl PutWindowTilemap
	ldrb r0, [r4]
	movs r1, 0x3
	bl CopyWindowToVram
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	.pool
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_8083F3C
sub_8083F3C: @ 8083F3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08083F62
	ldr r0, =0x0000016f
	bl PlayFanfare
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08083F62:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08083F82
	ldr r0, =sBerryBlenderData
	ldr r0, [r0]
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08083F82:
	pop {r4,r5}
	pop {r0}
	bx r0
	.pool
	thumb_func_end sub_8083F3C

	thumb_func_start sub_8083F94
sub_8083F94: @ 8083F94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	adds r7, r1, 0
	bl sub_8136EA4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8136EDC
	adds r1, r0, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 1
	lsls r1, 24
	lsrs r1, 24
	bl __divsi3
	lsls r0, 16
	lsrs r3, r0, 16
	strb r3, [r7, 0xD]
	ldrb r0, [r6]
	strb r0, [r7, 0xC]
	movs r0, 0xFF
	strb r0, [r7]
	ldr r0, =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080840C4
	ldr r0, =sBerryBlenderData
	ldr r2, [r0]
	movs r4, 0xD2
	lsls r4, 1
	adds r1, r2, r4
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, 0
	bne _08084058
	cmp r3, 0x14
	bls _08084058
	adds r0, r2, 0
	adds r0, 0x7C
	ldrb r1, [r0]
	subs r1, 0x1
	movs r0, 0x9E
	lsls r0, 1
	mov r9, r0
	adds r0, r2, r0
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r5, =gLinkPlayers + 8
	adds r1, r5
	adds r0, r7, 0
	bl StringCopy
	adds r0, r6, 0
	bl sub_81370B4
	strb r0, [r7, 0xB]
	ldrb r1, [r7, 0xB]
	ldrb r2, [r7, 0xC]
	ldrb r3, [r7, 0xD]
	mov r6, r8
	ldr r4, [r6]
	adds r0, r4, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	subs r0, 0x1
	add r4, r9
	adds r4, r0
	ldrb r4, [r4]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r5, r0
	ldrb r0, [r5, 0x12]
	str r0, [sp]
	adds r0, r7, 0
	bl Put3CheersForPokeblocksOnTheAir
	lsls r0, 24
	cmp r0, 0
	bne _080840BA
	b _080840C4
	.pool
_08084058:
	mov r0, r8
	ldr r2, [r0]
	movs r1, 0xD2
	lsls r1, 1
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	adds r0, 0x7C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bne _080840C4
	cmp r3, 0x14
	bhi _080840C4
	movs r4, 0x9E
	lsls r4, 1
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r5, =gLinkPlayers + 8
	adds r1, r5
	adds r0, r7, 0
	bl StringCopy
	adds r0, r6, 0
	bl sub_81370B4
	strb r0, [r7, 0xB]
	ldrb r1, [r7, 0xB]
	ldrb r2, [r7, 0xC]
	ldrb r3, [r7, 0xD]
	mov r6, r8
	ldr r0, [r6]
	adds r0, r4
	ldrb r4, [r0]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r5, r0
	ldrb r0, [r5, 0x12]
	str r0, [sp]
	adds r0, r7, 0
	bl Put3CheersForPokeblocksOnTheAir
	lsls r0, 24
	cmp r0, 0
	beq _080840C4
_080840BA:
	movs r0, 0x1
	b _080840C6
	.pool
_080840C4:
	movs r0, 0
_080840C6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8083F94

	thumb_func_start Blender_AddTextPrinter
Blender_AddTextPrinter: @ 80840D4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	mov r9, r1
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0
	cmp r4, 0x1
	beq _08084116
	cmp r4, 0x1
	bgt _08084100
	cmp r4, 0
	beq _08084108
	b _08084132
_08084100:
	cmp r4, 0x2
	beq _08084124
	cmp r4, 0x3
	bne _08084136
_08084108:
	add r1, sp, 0x14
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _08084130
_08084116:
	add r0, sp, 0x14
	strb r5, [r0]
	adds r1, r0, 0
	movs r0, 0x2
	strb r0, [r1, 0x1]
	movs r0, 0x3
	b _08084130
_08084124:
	add r0, sp, 0x14
	strb r5, [r0]
	adds r1, r0, 0
	movs r0, 0x4
	strb r0, [r1, 0x1]
	movs r0, 0x5
_08084130:
	strb r0, [r1, 0x2]
_08084132:
	cmp r4, 0x3
	beq _08084148
_08084136:
	add r0, sp, 0x14
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl FillWindowPixelBuffer
_08084148:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	add r0, sp, 0x14
	str r0, [sp, 0x8]
	ldr r0, [sp, 0x34]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0xC]
	mov r0, r9
	str r0, [sp, 0x10]
	adds r0, r6, 0
	movs r1, 0x1
	mov r2, r8
	adds r3, r7, 0
	bl AddTextPrinterParametrized2
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end Blender_AddTextPrinter

	thumb_func_start Blender_PrintText
Blender_PrintText: @ 808417C
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r7, r1, 0
	adds r6, r2, 0
	movs r0, 0
	ldrsh r4, [r5, r0]
	cmp r4, 0
	beq _08084194
	cmp r4, 0x1
	beq _080841C6
	b _080841DA
_08084194:
	movs r0, 0x4
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xF
	bl sub_8197B1C
	str r6, [sp]
	str r4, [sp, 0x4]
	movs r0, 0x4
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0x1
	bl Blender_AddTextPrinter
	movs r0, 0x4
	bl PutWindowTilemap
	movs r0, 0x4
	movs r1, 0x3
	bl CopyWindowToVram
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	b _080841DA
_080841C6:
	movs r0, 0x4
	bl IsTextPrinterActive
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _080841DA
	strh r0, [r5]
	movs r0, 0x1
	b _080841DC
_080841DA:
	movs r0, 0
_080841DC:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end Blender_PrintText

	.align 2, 0 @ Don't pad with nop.
