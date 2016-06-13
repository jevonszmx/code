单个文件排除在arc之外的方法
-----

项目 - TARGETS - Build Phases - Compile Sources

想要关闭的文件Compiler Flags加上：-fno-objc-arc
