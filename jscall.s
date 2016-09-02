	.text
	.file	"jscall.ll"
	.hidden	hello
	.globl	hello
	.type	hello,@function
hello:                                  # @hello
# BB#0:                                 # %entry
	i32.const	$push0=, .L.str
	call    	alert@FUNCTION, $pop0
                                        # fallthrough-return
	.endfunc
.Lfunc_end0:
	.size	hello, .Lfunc_end0-hello

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Hello World!\n"
	.size	.L.str, 14


	.ident	"clang version 4.0.0 (http://llvm.org/git/clang.git 067ded57a22746e0941fbbdd817f53edd902cb18) (http://llvm.org/git/llvm.git f631b7acf6b9b3c0f017b9f915ddf0eebbc950d5)"
	.functype	alert, void, i32
