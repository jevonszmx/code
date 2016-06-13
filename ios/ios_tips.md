* 在使用view的缩放的时候，layer.border.width随着view的放大，会出现锯齿化的问题，解决这个问题需要设置这个属性。

```objective-c
self.layer.allowsEdgeAntialiasing = YES;
```
