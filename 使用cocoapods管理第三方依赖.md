前言
-----

每种语言发展到一个阶段，就会出现相应的依赖管理工具, 或者是中央代码仓库。比如

```objective-c
Java: maven，Ivy
Ruby: gems
Python: pip, easy_install
Nodejs: npm
```

随着iOS开发者的增多，业界也出现了为iOS程序提供依赖管理的工具，这个工具叫：CocoaPods。

CocoaPods简介
------

CocoaPods是一个负责管理iOS项目中第三方开源代码的工具。CocoaPods项目的源码在Github上管理。该项目开始于2011年8月12日，经过一年多的发展，现在已经超过1000次提交，并且持续保持活跃更新。开发iOS项目不可避免地要使用第三方开源库，CocoaPods的出现使得我们可以节省设置和更新第三方开源库的时间。

在没有使用CocoaPods以前，我需要：

把这些第三方开源库的相关文件复制到项目中，或者设置成git的submodule，然后这些开源库通常需要依赖系统的一些framework，我需要手工地将这些framework一一增加到项目依赖中，比如ASI网络库就需要增加以下framework: CFNetwork, SystemConfiguration, MobileCoreServices, CoreGraphics and zlib。

对于RegexKitLite这个正则表达式库，我还需要设置-licucore的编译参数

手工管理这些依赖包的更新。

这些体力活虽然简单，但毫无技术含量并且浪费时间。

在使用CocoaPods之后，我只需要将用到的第三方开源库放到一个名为Podfile的文件中，然后执行pod install。CocoaPods就会自动将这些第三方开源库的源码下载下来，并且为我的工程设置好相应的系统依赖和编译参数。

CocoaPods的安装和使用介绍
------

#### 安装

安装方式异常简单, Mac下都自带ruby，使用ruby的gem命令即可下载安装：

```objective-c
$ gem install cocoapods
$ pod setup
```

#### 使用

使用时需要新建一个名为Podfile的文件，以如下格式，将依赖的库名字依次列在文件中即可

```objective-c
platform :ios
pod 'JSONKit',       '~> 1.4'
pod 'Reachability',  '~> 3.0.0'
pod 'ASIHTTPRequest'
pod 'RegexKitLite'
```

然后你将编辑好的Podfile文件放到你的项目根目录中，执行如下命令即可：

```objective-c
cd "your project home"
pod install
```

现在，你的所有第三方库都已经下载完成并且设置好了编译参数和依赖，你只需要记住如下2点即可：

使用CocoaPods生成的 .xcworkspace 文件来打开工程，而不是以前的 .xcodeproj 文件。
每次更改了Podfile文件，你需要重新执行一次pod install命令。
查找第三方库

你如果不知道cocoaPods管理的库中，是否有你想要的库，那么你可以通过pod search命令进行查找，以下是我用pod search json查找到的所有可用的库：

```objective-c
$ pod search json


	-> AnyJSON (0.0.1)
	Encode / Decode JSON by any means possible.
    - Homepage: https://github.com/mattt/AnyJSON
	- Source:   https://github.com/mattt/AnyJSON.git
	- Versions: 0.0.1 [master repo]


	-> JSONKit (1.5pre)
	A Very High Performance Objective-C JSON Library.
	- Homepage: https://github.com/johnezang/JSONKit
	- Source:   git://github.com/johnezang/JSONKit.git
	- Versions: 1.5pre, 1.4 [master repo]
```


生成第三方库的帮助文档
------

如果你想让CococaPods帮你生成第三方库的帮助文档，并集成到XCode中，那么用brew安装appledoc即可：

```objective-c
brew install appledoc
```

关于appledoc，我在今年初的另一篇博客《使用Objective-C的文档生成工具:appledoc》中有专门介绍。它最大的优点是可以将帮助文档集成到XCode中，这样你在敲代码的时候，按住opt键单击类名或方法名，就可以显示出相应的帮助文档。

原理
------

大概研究了一下CocoaPods的原理，它是将所有的依赖库都放到另一个名为Pods项目中，然后让主项目依赖Pods项目，这样，源码管理工作都从主项目移到了Pods项目中。发现的一些技术细节有：

Pods项目最终会编译成一个名为libPods.a的文件，主项目只需要依赖这个.a文件即可。
对于资源文件，CocoaPods提供了一个名为Pods-resources.sh的bash脚本，该脚本在每次项目编译的时候都会执行，将第三方库的各种资源文件复制到目标目录中。
 CocoaPods通过一个名为Pods.xcconfig的文件来在编译时设置所有的依赖和参数。
