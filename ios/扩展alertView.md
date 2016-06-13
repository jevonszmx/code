头文件中实现协议：UIAlertViewDelegate
```objective-c

@interface MainViewController : UIViewController <UIAlertViewDelegate>

@end

```


```objective-c

-(void)clickBtn {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"小提示" message:@"内容~~" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"button1",nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
//            NSLog(@"Cancel Button Pressed");
            break;
        case 1:
//            NSLog(@"Button 1 Pressed");
            break;
        case 2:
//            NSLog(@"Button 2 Pressed");
            break;
        case 3:
//            NSLog(@"Button 3 Pressed");
            break;
        default:
            break;
    }
}
```
