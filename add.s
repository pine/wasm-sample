	.text
	.file	"add.ll"
	.hidden	add
	.globl	add
	.type	add,@function
add:                                    # @add
	.param  	i32, i32
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$push2=, 0
	i32.load	$push3=, __stack_pointer($pop2)
	i32.const	$push4=, 16
	i32.sub 	$push6=, $pop3, $pop4
	tee_local	$push5=, $2=, $pop6
	i32.store	$drop=, 12($pop5), $0
	i32.store	$drop=, 8($2), $1
	i32.load	$push0=, 12($2)
	i32.add 	$push1=, $pop0, $1
                                        # fallthrough-return: $pop1
	.endfunc
.Lfunc_end0:
	.size	add, .Lfunc_end0-add


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 067ded57a22746e0941fbbdd817f53edd902cb18) (http://llvm.org/git/llvm.git f631b7acf6b9b3c0f017b9f915ddf0eebbc950d5)"
