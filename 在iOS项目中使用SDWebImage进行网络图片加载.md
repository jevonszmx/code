使用如下：
===

1.  将下载的zip中的所有文件拷贝到项目文件夹中
2.  将项目文件SDWebImage.xproj添加到自身的项目文件中
3.  选中自身项目，在Target Dependencies中添加SDWebImage（一共有三个版本，根据需要选取一个)
4.  在Link Binary With Library中，添加SDWebImage的.a静态库
5.  在Link Binary With Library中，添加ImageIO.framework
6.  在”Build Settings”–”Other Linker Flags”中添加”-ObjC”
7.  在需要使用它的文件中包含h文件：

> #import <SDWebImage/UIImageView+WebCache.h>

8.  然后使用很简单：

> [imageView setImageWithURL:aUrl];