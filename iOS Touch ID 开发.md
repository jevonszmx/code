iOS Touch ID 开发
===

## Touch ID


Touch ID是iPhone5S后加入的一项新的功能，也就是大家熟知的指纹识别技术。大家用得最多的可能是手机的解屏操作，不用在和以前一样输入手机的四位数密码进行验证。一方面不用担心密码被别人看到，另一方面也方便了自己的操作。iOS8后苹果开放了Touch ID的API给开发者，这也给我们的app带来了新的体验。

## 使用

Touch ID的API非常的简单也好理解，在使用前我们需要导入LocalAuthentication这个库。



首先来看下头文件的定义：

```
//验证设备是否支持Touch ID
- (BOOL)canEvaluatePolicy:(LAPolicy)policy error:(NSError * __autoreleasing *)error;
//进行验证的回调
- (void)evaluatePolicy:(LAPolicy)policy
       localizedReason:(NSString *)localizedReason
                 reply:(void(^)(BOOL success, NSError *error))reply;
//取消Touch Id验证的按钮的标题，默认标题是输入密码
@property (nonatomic, copy) NSString *localizedFallbackTitle;

```


代码使用示例

```
    LAContext *laContext = [[LAContext alloc] init];
    NSError *error;

    if ([laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {

        [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                       localizedReason:@"Touch Id Test"
                                 reply:^(BOOL success, NSError *error) {
                                     if (success) {
                                         NSLog(@"success to evaluate");
                                         //do your work
                                     }
                                     if (error) {
                                         NSLog(@"---failed to evaluate---error: %@---", error.description);
                                         //do your error handle
                                     }
                                 }];
    }
    else {
        NSLog(@"==========Not support :%@", error.description);
        //do your error handle
    }
    
```

这样我们就完成了一个Touch ID的验证功能。当我们点击按钮进行调用的时候，就会弹出验证的对话框


弹窗目前还不能自定义，都是统一的，第一行是app的名字+Touch ID， 第二行是需要用Touch ID的理由。在用户进行操作后，我们可以在回调的block那边处理自己的业务逻辑。

错误处理

```
typedef NS_ENUM(NSInteger, LAError)
{
    //用户验证没有通过，比如提供了错误的手指的指纹
    LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,

    // 用户取消了Touch ID验证
    LAErrorUserCancel           = kLAErrorUserCancel,

    //用户不想进行Touch ID验证，想进行输入密码操作
    LAErrorUserFallback         = kLAErrorUserFallback,

    // 系统终止了验证
    LAErrorSystemCancel         = kLAErrorSystemCancel,

    // 用户没有在设备Settings中设定密码
    LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,

    // 设备不支持Touch ID
    LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,

    // 设备没有进行Touch ID 指纹注册
    LAErrorTouchIDNotEnrolled   = kLAErrorTouchIDNotEnrolled,
} NS_ENUM_AVAILABLE(10_10, 8_0);
```

在block回调那边，我们需要对每种错误进行处理，以便得到更好的用户体验。

## 总结

从上面的代码中我们也可以看到，Touch ID验证中我们并不能拿到标识，只有一个YES or NO的结果，只能用来表明当前用户有权限使用这设备。正常情况下，我们的手机里面的账号信息都是自己的，所以在一定方面的确有加固安全，验证和方便的功能。
