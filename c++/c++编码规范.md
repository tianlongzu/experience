# C++编码规范

## 编码规则

1. C++代码风格应遵循Google规范

- 细节参照地址[https://zh-google-styleguide.readthedocs.io/en/latest/google-cpp-styleguide/](https://zh-google-styleguide.readthedocs.io/en/latest/google-cpp-styleguide/)

2. 函数以及变量命名遵循下划线`_`风格。例如`int my_foo = 1;`

## IDE配置

1.风格需要侧重的细节颇多。在了解google规范后。一些格式化操作，必然还是存在漏洞的，为此建议使用IDE的自动格式化能力(Format on save)来解决人力不足。

2.以`vscode`IDE为例，

- 打开工程后，对应工程目录下创建`.vscode/settings.json`文件。

- 在文件中添加如下内容:

```
"C_Cpp.clang_format_fallbackStyle": "{ BasedOnStyle: Google, IndentWidth: 2 }",
"editor.formatOnSave": true
```

- 语意是每次保存文件时会自动按照规则格式化代码。

- 效果如下图所示
![google setting](../picture/google_seeting.jpg "")
