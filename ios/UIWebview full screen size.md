One cheap thing to do would be to set the frame of the webview in overriding - (void)viewDidLayoutSubviews

```obj
- (void)viewDidLayoutSubviews {
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
```

the advantage of doing it here, is that the size and orientation of the view has already been determined here, and you can get an accurate measurement.
