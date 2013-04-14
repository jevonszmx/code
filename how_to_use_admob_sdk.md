
需要额外加入：
=====

AdSupport.framework
StoreKit.framework


常见问题
=====

# bool _WebTryThreadLock(bool): Tried to obtain the web lock from a thread other than the main thread or the web thread. This may be a result of calling to UIKit from a secondary thread

切换viewController时，需要在主进程中进行：

``` objective-c
-(void)loadView {
	    [self performSelectorOnMainThread:@selector(go2MainView) withObject:nil waitUntilDone:NO];
}

-(void)go2MainView {
	MainViewController *mainViewController = [[MainViewController alloc] init];
	[self presentModalViewController:mainViewController animated:YES];
}


```
