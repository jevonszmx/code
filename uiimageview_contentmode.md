UIImageView设置排版，使用ContentMode的问题
---

You'll have to subclass UIView
Add an UIImageview as a property and add it as subview.
set clipsToBounds to YES [self setClipsToBounds:YES];
Align the UIImageView to the top of the view
Resize the UIImageView based on the proportions of the image in layoutSubviews


