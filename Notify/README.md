example:
----------

```objective-c

// success info
BDKNotifyHUD *hud = [BDKNotifyHUD notifyHUDWithImage:[UIImage imageNamed:@"Checkmark"] text:@"保存图片成功!"];
hud.center = CGPointMake(self.view.center.x, self.view.center.y - 20);
 // Animate it, then get rid of it. These settings last 1 second, takes a half-second fade.
[self.view addSubview:hud];												        [hud presentWithDuration:1.0f speed:0.5f inView:self.view completion:^{
	[hud removeFromSuperview];
}];

```
