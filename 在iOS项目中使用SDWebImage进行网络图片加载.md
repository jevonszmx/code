How To Use
----------

1.  下载项目：[https://github.com/rs/SDWebImage](https://github.com/rs/SDWebImage);
2.  将项目文件SDWebImage.xproj添加到自身的项目文件中
3.  选中自身项目，在Target Dependencies中添加SDWebImage（一共有三个版本，根据需要选取一个)
4.  在Link Binary With Library中，添加SDWebImage的.a静态库
5.  在Link Binary With Library中，添加ImageIO.framework
6.  在”Build Settings”–”Other Linker Flags”中添加”-ObjC”
7.  在需要使用它的文件中包含h文件：

```objective-c
 #import <SDWebImage/UIImageView+WebCache.h>
```

8.  然后使用很简单：

```objective-c
 [imageView setImageWithURL:aUrl];
```