先进入finder里，顶上菜单有“前往”
前往  输入
```
~/Library/Application\ Support/Dock/
```

找到里面 后缀是.db的文件，复制下文件名称
然后打开“终端”
终端  输入   

```
rm -f ~/Library/Application\ Support/Dock/*.db && killall Dock
（* 替换成 你的.DB文件名称）
```

就好了

原理应该是会重建所有launchpad里的图标。
