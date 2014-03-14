Iphone开发这一路走来(新手必经)   



流程：注册，开发，真机测试，发布，上线。

iphone iOS4从注册到app上线开发流程
http://blog.csdn.net/linzhiji/article/details/6732868

一、关于注册账号IDP和AppleID:
1、 注册AppId（无论是iOS使用者还是开发者 都需要有AppID，只是后者还需要付99$注册成为开发者。）
   网址：http://developer.apple.com
  由于上边的网址没有注册按钮，所以去itunes注册，方法参照（这里注册的是免费的，您需要注册付费的）：   
  http://jingyan.baidu.com/article/c14654136163f00bfcfc4cf2.html


2 、注册苹果开发者，教程：http://hi.baidu.com/492437598/blog/item/739b29c175e12722e4dd3b0e.html

 被苹果公司正式接纳为开发者之后，会收到一封E-mail告知苹果iTunes Connection网站的地址。这个网站相当于iTunes商店的"供货商专用通道"，每个你想要出售的产品都必须先通过iTunes Connect在App Store注册。你需提供产品的名称，描述，价格和其他在程序中用到的元数据。
http://book.51cto.com/art/201003/187775.htm


二、开发
1 注意
这里没有什么好说的，细心，专心，耐心。记得想办法处理下内存泄露的问题，代码优化。


三、真机测试：

1如何联机调试和发布程序(99$)  

 http://www.cocoachina.com/bbs/read.php?tid-7923.html

2 把Iphone程序连接真机调试  
http://blog.csdn.net/wswqiang/article/details/6896127



四、应用程序内购买（IAP）
启动IAP:
设置---通用---访问限制---应用程序内购买
app store的制度是，买的软件跟你的ID绑定，那么只要在很多软件免费的时候成功买到 了，以后无论什么时候都可以免费再重新下载，即便该软件已经收费了。

1、 iOS应用内付费简介和准备流程
http://mobile.51cto.com/others-302258.htm


2、IAP（程序内购买）: 完全攻略  (很详细)
 http://tr4work.blog.163.com/blog/static/1371493142011425114346676/


3 、（In App Purchase)翻译
http://xiongzhend.blog.163.com/blog/static/640985012010825105825754/

4、  iPhone In App Purchase购买完成时验证transactionReceipt  
http://menglinger-520.blog.163.com/blog/static/16929433020118915347597/


5、  IOS应用内购买（In App Purchase）总结
http://blog.csdn.net/langresser/article/details/6783242

6、 给你的iphone程序加上IAP
http://blog.sina.com.cn/s/blog_7a2ffd5c0100tzf5.html

7 、iPhone In App Purchase购买完成时验证transactionReceipt
http://www.cnblogs.com/eagley/archive/2011/06/15/2081577.html

http://tiny4cocoa.com/thread-1423-1-1.html

http://bbs.ldci.com.cn/read.php?tid-18371.html


五、打包、发布、
1、详解Xcode 4发布程序图文并茂教程
http://mobile.51cto.com/iphone-281948.htm

2、如何联机调试和发布程序(99$)  

 http://www.cocoachina.com/bbs/read.php?tid-7923.html

3、注意：
提交二进制文件的两种方式：
1   用xcode验证并上传：
     product----Archives----Validate------submit
（中间那个share是生成ipa的。）

教程：http://www.zhujiangroad.com/program/iOS/24670.html

2   用Application Loader工具：
    前往---电脑---Developer---Applications---Utilities---Application Loader

(真机编译通过后，在项目左边的树结构中找到xxx.app,选中右击show in finder，将看到的 xxx.app拖到itunes就生成ipa了默认名字应该是xxx.ipa
如果要将此ipa分发出去，可以在itunes中的xxx.ipa文件上点击鼠标右键，选择 在finder中显示，就可以得到生成后的ipa安装文件，可以上传了。)
教程：http://www.cocoachina.com/newbie/basic/2010/0726/1927.html

发布过程中app状态提示：
发布成功的状态顺序：
Prepare for upload(准备上传) ---->Waiting for upload(等待上传)--->upload Received(上传收稿)--->Waiting for Review(等待审核)--->In Review(审核中)--->Processing for AppStore(AppStore处理中)--->Ready for sale(准备出售)

发布失败的状态顺序：
Prepare for upload(准备上传) ---->Waiting for upload(等待上传)--->upload Received(上传收稿)--->Waiting for Review(等待审核)--->InReview(审核中)--->Rejected(拒绝)

六、上线
提交了程序需要5天左右的审核，耐心等待！！



七、其他

1、教你如何在app store里找到那些限时免费的收费游戏
http://bbs.weiphone.com/read-htm-tid-1070185.html
2、iphone上下左右手势判断代码
blog.csdn.net/wswqiang/article/details/6896897

3、iOS App的图标，启动画面及其它
http://www.cnblogs.com/jacktu/archive/2011/10/23/2221981.html

4、打开xxx.ipa提取音乐图片：
改后缀名，把xxx.ipa改成xxx.zip，选中app图标，右击“显示包内容”

5、Demo代码例子
http://code4app.com/category

八、更新版本:
1,更新后上传新ipa：
http://blog.csdn.net/diyagoanyhacker/article/details/6654873


九、产品升级
1 改代码，加上自己要更新的内容，info.plist中版本号该一下。

2 进入到apple后台，找到要更新的产品，AddVersion，填写产品更新版本简介，然后重新上传。 
Application Loader工具：
    前往---电脑---Developer---Applications---Utilities---Application Loader

待续………….
