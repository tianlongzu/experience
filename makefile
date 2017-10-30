{
	"宏": {
		{"-Wall" : "编译后显示所有警告"),
                {"-Werror" : "它要求GCC将所有的警告当成错误进行处理"},
		{
			"ErrMsg" : "deprecated conversion from string constant to char*",
		 	"分析" ；"char* x = "hello";  代码会报错。这段代码不符合规范，x指向的是常亮存储区，解决方案是增加-Wno-write-strings
		 	如果增加了这个宏，就会解决掉类似的所有报警。个人理解会对代码造成不确定性影响。"
		}，
		{"-Wsign-compare" : "在有符号数和无符号数进行值比较时，有符号数可能在比较之前被转换为无符号数而导致结果错误。使用该选项会对这样的情况给出警告。"},
	}
}

}
