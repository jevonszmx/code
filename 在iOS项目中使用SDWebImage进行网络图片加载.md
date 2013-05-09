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

常见错误
===

我把SDwebImage放入工程中运行时就出现如下错误，之前导入外部文件也会出现这样的问题

```objective-c
Undefined symbols for architecture i386:
  "_OBJC_CLASS_$_MKAnnotationView", referenced from:
      l_OBJC_$_CATEGORY_MKAnnotationView_$_WebCache in MKAnnotationView+WebCache.o
  "_CGImageSourceCreateIncremental", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
  "_CGImageSourceUpdateData", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
  "_CGImageSourceCopyPropertiesAtIndex", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
  "_CGImageSourceCreateImageAtIndex", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
  "_kCGImagePropertyPixelHeight", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
  "_kCGImagePropertyPixelWidth", referenced from:
      -[SDWebImageDownloader connection:didReceiveData:] in SDWebImageDownloader.o
ld: symbol(s) not found for architecture i386
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

解决方法：

添加 ImageIO.framework  和  MapKit.framework  就好了
