### 删除 Mac OS X 中“打开方式”里重复或无用的程序列表

如果右键菜单的「打开方式」里出现了已不存在的应用程序或者重复的项目，打开终端，执行以下命令：

```
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system-domainuser
```

如果是 Mountain Lion（OS X 10.8）则执行以下命令：

```
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
```

此命令的作用是重建 LaunchServices 的数据库，这样重复或无效的项目就会被清理掉了。
