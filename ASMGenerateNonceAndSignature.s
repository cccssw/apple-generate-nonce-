//
//  ASMGenerateNonceAndSignature.s
//  IMKitDaemon
//
//  Created by cccssw on 8/16/13.
//  Copyright (c) 2013 alex. All rights reserved.
//
.macro BEGIN_FUNC
.align 4		// Align the function code to a 4-byte (2^n) word boundary.
.globl _$0		// Make the function globally accessible.
.no_dead_strip _$0	// Stop the optimizer from ignoring this function!
.private_extern _$0
_$0:				// Declare the function.
.endmacro


BEGIN_FUNC ALGenerateNonceAsm
pushq     %rbp
movq      %rsp, %rbp
pushq     %r15
pushq     %r14
pushq     %r13
pushq     %r12
pushq     %rbx
subq      $88, %rsp
    movq    %rdi,%r13
    movq    L_OBJC_SELECTOR_REFERENCES_DATE(%rip), %rsi
    movq    L_OBJC_CLASSLIST_REFERENCES_$_DATE(%rip), %rdi
    callq   _objc_msgSend
    movq    L_OBJC_SELECTOR_REFERENCES_TimeIntervalSince(%rip), %rsi
    movq      %rax, %rdi
    callq   _objc_msgSend
    movsd     DOUBLE_MMX(%rip), %xmm1
    movapd    %xmm0, %xmm2
    subsd     %xmm1, %xmm2
    movabsq   $-9223372036854775808, %rax
    movabsq   $71776119061217280, %r11
    movabsq   $1095216660480, %r8
    movabsq   $280375465082880, %r9
    movabsq   $16777216000, %r10
    cvttsd2siq          %xmm2, %rcx
    xorq      %rax, %rcx
    cvttsd2siq          %xmm0, %rdx
    ucomisd   %xmm1, %xmm0
    cmovaeq   %rcx, %rdx
    imulq     $1000, %rdx, %rax
    imulq     $256000, %rdx, %rsi
    movabsq   $-1729382256910270464, %rcx
    imulq     %rdx, %rcx
    movabsq   $1099511627776000, %rbx
    imulq     %rdx, %rbx
    leaq      -71(%rbp), %rdi
    andq      %r11, %rbx
    movb      $1, -80(%rbp)

    orq       %rcx, %rbx
    imulq     %r10, %rdx
    andq      %r9, %rdx
    orq       %rbx, %rdx
    andq      %r8, %rsi
    orq       %rdx, %rsi
    movq      %rax, %rdx
    shrq      $56, %rdx
    orq       %rsi, %rdx
    movq      %rax, %rcx
    shrq      $8, %rcx
    andl      $4278190080, %ecx
    orq       %rdx, %rcx
    movq      %rax, %rdx
    shrq      $24, %rdx
    andq      $16711680, %rdx
    orq       %rcx, %rdx
    shrq      $40, %rax
    andq      $65280, %rax
    orq       %rdx, %rax
    movq      %rax, -79(%rbp)
    movl      $8, %esi
    callq     _SecureRandomBytes
    leaq      -80(%rbp), %rdx
    movq      L_OBJC_SELECTOR_REFERENCES_DataWithByteLength(%rip),%rsi
    // movq      306291(%rip), %rdi,
    movq      L_OBJC_CLASSLIST_REFERENCES_$_DATA(%rip),%rdi
    movl      $17, %ecx
    // callq     *%r12,
    callq     _objc_msgSend
    movq      %rax, %rdi
    movq      %r13, %rsi
    // callq     "[0x2E186->_objc_assign_strongCast]" ## symbol stub for: _objc_assign_strongCast,
    callq     _objc_assign_strongCast

addq      $88, %rsp
popq      %rbx
popq      %r12
popq      %r13
popq      %r14
popq      %r15
popq      %rbp
ret
//END THE FUNCTION GENERATENONCE


.section __DATA,__objc_classrefs,regular,no_dead_strip
.align   3                       ## @"\01L_OBJC_CLASSLIST_REFERENCES_$_"
L_OBJC_CLASSLIST_REFERENCES_$_DATE:
.quad   _OBJC_CLASS_$_NSDate
L_OBJC_CLASSLIST_REFERENCES_$_DATA:
.quad   _OBJC_CLASS_$_NSData
L_OBJC_CLASSLIST_REFERENCES_$_BIND_DATA:
.quad   _OBJC_CLASS_$_NSData
L_OBJC_CLASSLIST_REFERENCES_$_NSMutableData:
.quad   _OBJC_CLASS_$_NSMutableData



.section __TEXT,__objc_methname,cstring_literals
.align  3
L_OBJC_METH_VAR_NAME_:                  ## @"\01L_OBJC_METH_VAR_NAME_"
.asciz    "date"
L_OBJC_METH_VAR_NAME_1:                 ## @"\01L_OBJC_METH_VAR_NAME_1"
.asciz    "timeIntervalSince1970"
L_OBJC_METH_VAR_NAME_init:                 ## @"\01L_OBJC_METH_VAR_NAME_5"
.asciz    "init"
L_OBJC_METH_VAR_NAME_2:
.asciz  "dataWithBytes:length:"
L_OBJC_METH_VAR_NAME_3:
.asciz  "alloc"
L_OBJC_METH_VAR_NAME_4:
.asciz  "appendData:"
L_OBJC_METH_VAR_NAME_5:
.asciz  "dataUsingEncoding:"
L_OBJC_METH_VAR_NAME_6:
.asciz  "appendBytes:length:"
L_OBJC_METH_VAR_NAME_7:
.asciz  "SHA1Data"
L_OBJC_METH_VAR_NAME_8:
.asciz  "bytes"

.section __DATA,__objc_selrefs,literal_pointers,no_dead_strip
.align   3                       ## @"\01L_OBJC_SELECTOR_REFERENCES_"
L_OBJC_SELECTOR_REFERENCES_DATE:
.quad L_OBJC_METH_VAR_NAME_
L_OBJC_SELECTOR_REFERENCES_TimeIntervalSince:
.quad   L_OBJC_METH_VAR_NAME_1
L_OBJC_SELECTOR_REFERENCES_INIT:
.quad L_OBJC_METH_VAR_NAME_init
L_OBJC_SELECTOR_REFERENCES_DataWithByteLength:
.quad   L_OBJC_METH_VAR_NAME_2
L_OBJC_SELECTOR_REFERENCES_ALLOC:
.quad   L_OBJC_METH_VAR_NAME_3
L_OBJC_SELECTOR_REFERENCES_AppendData:
.quad   L_OBJC_METH_VAR_NAME_4
L_OBJC_SELECTOR_REFERENCES_DataUsingEncoding:
.quad   L_OBJC_METH_VAR_NAME_5
L_OBJC_SELECTOR_REFERENCES_AppendBytes_length:
.quad   L_OBJC_METH_VAR_NAME_6
L_OBJC_SELECTOR_REFERENCES_SHA1Data:
.quad   L_OBJC_METH_VAR_NAME_7
L_OBJC_SELECTOR_REFERENCES_Bytes:
.quad   L_OBJC_METH_VAR_NAME_8


.section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_MSGREF_1:                 ## @"\01L_OBJC_METH_VAR_NAME_4"
.asciz    "alloc"
.private_extern   l_objc_msgSend_fixup_alloc ## @"\01l_objc_msgSend_fixup_alloc"
.section __DATA,__objc_msgrefs,coalesced
.globl   l_objc_msgSend_fixup_alloc
.weak_definition  l_objc_msgSend_fixup_alloc
.align   4
l_objc_msgSend_fixup_alloc:
.quad _objc_msgSend_fixup
.quad L_OBJC_METH_VAR_NAME_MSGREF_1


.section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_MSGREF_2:                 ## @"\01L_OBJC_METH_VAR_NAME_4"
.asciz    "length"
.private_extern   l_objc_msgSend_fixup_length ## @"\01l_objc_msgSend_fixup_alloc"
.section __DATA,__objc_msgrefs,coalesced
.globl   l_objc_msgSend_fixup_length
.weak_definition  l_objc_msgSend_fixup_length
.align   4
l_objc_msgSend_fixup_length:
.quad _objc_msgSend_fixup
.quad L_OBJC_METH_VAR_NAME_MSGREF_2


.section __TEXT,__objc_methname,cstring_literals
L_OBJC_METH_VAR_NAME_MSGREF_3:                 ## @"\01L_OBJC_METH_VAR_NAME_4"
.asciz    "release"
.private_extern   l_objc_msgSend_fixup_release ## @"\01l_objc_msgSend_fixup_alloc"
.section __DATA,__objc_msgrefs,coalesced
.globl   l_objc_msgSend_fixup_release
.weak_definition  l_objc_msgSend_fixup_release
.align   4
l_objc_msgSend_fixup_release:
.quad _objc_msgSend_fixup
.quad L_OBJC_METH_VAR_NAME_MSGREF_3

.section __TEXT,__const
DOUBLE_MMX:
.quad	0x43e0000000000000     ## double 4.485400e+02  4890909195324358656
