{
	"宏": {
		{"-Wall" : "编译后显示所有警告"),
		{
			"ErrMsg" : "deprecated conversion from string constant to char*",
		 	"分析" ；"char* x = "hello";  代码会报错。这段代码不符合规范，x指向的是常亮存储区，解决方案是增加-Wno-write-strings
		 	如果增加了这个宏，就会解决掉类似的所有报警。个人理解会对代码造成不确定性影响。"
		}，
		{}
	}
}

}