It's true that there no easy way to do change the colour of inactive image. It does not seem to be possible to do within a storyboard at all. There's a pretty straightforward solution though — just assign the item an image with imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal rendering mode.

Given that your images are already coloured for inactive state originally, you can create a simple custom subclass of UITabBarItem with the following implementation

```objective-c
@implementation P2TabBarItem

- (void)awakeFromNib {
    [self setImage:self.image]; // calls setter below to adjust image from storyboard / nib file
}

- (void)setImage:(UIImage *)image {
    [super setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
```

In your storyboard, fill the Class field of all your UITabBarItems to the newly created subclass name — that's it!
