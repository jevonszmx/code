
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
