1、顶部状态栏隐藏问题
原来在ios6里的隐藏状态栏的方式为:
在AppController类的方法didFinishLaunchingWithOptions中增加以下语句：

```objective-c
[[UIApplication sharedApplication] setStatusBarHidden:YES];
```

以上方式在ios7中无效，ios7中隐藏顶部状态栏的方法为：
在RootViewController中重写方法prefersStatusBarHidden，增加以下代码：

```objective-c
- (BOOL)prefersStatusBarHidden
{
return YES;
}
```
