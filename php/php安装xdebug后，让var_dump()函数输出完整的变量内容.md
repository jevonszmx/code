php开发环境里，安装了xdebug模块后，var_dump()输出的结果将比较易于查看，但默认情况下，var_dump() 输出的结果将有所变化：

过多的数组元素不再显示，字符串变量将只显示前N个字符，较深的数组元素也被显示成省略号。

这点会带来一些不便，我们修改配置文件，设置这些。

在php.ini里的xdebug节点中，加入如下:

```

xdebug.var_display_max_children=128

xdebug.var_display_max_data=512

xdebug.var_display_max_depth=5

```

含义从名字上看就可看懂。

其实这里有三条配置，正好与本文上述的三点“变化”一一对应嘀 ^..^


从phpinfo()里的xdebug节点里可以看到更多的配置变量，多半也是可以通过php.ini修改的.
