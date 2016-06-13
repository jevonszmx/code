iphone iOS从注册到app上线开发流程
===


流程：注册，开发，真机测试，发布，上线。

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

xcode 7 以后不需要买idp也可以连真机调试了。～

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

1、详解Xcode 发布程序图文并茂教程
http://mobile.51cto.com/iphone-281948.htm

2、如何联机调试和发布程序(99$，人民币688)  

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
提交了程序需要5－10天左右的审核，耐心等待！！


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


ios开发遇到过的那些坑
===

自从去年4月份踏入iOS开发大军之后，真心在这条路上踩过了不少的坑，这一点，相信每个开发者都深有感触，如果一桌子iOS开发I聚在一起，喷这件事就能一起喷一下午。所以我就准备写篇文章，总结下自己踩过的坑，做个引子。因为我也是个业余选手，并且刚入行，所以大家轻拍，很多的确都是低级错误，但是很多新手都会在这上面载跟头，关键是栽一次两个周就没了，简直致命。

首先介绍下我自己吧，我是@小芋头君，不折腾会死星人，折腾过不少东西，目前比较拿得出手的，一个是前端乱炖（前端开发社区 http://www.html-js.com ），另一个就是iOS版的颜文字输入法（ http://itunes.apple.com/cn/app/yan-wen-zi/id866753915 ），都是业余产品，不过用户规模也算是不错的，所以才敢来这里露露脸，大家一定要轻拍轻拍。

今天要总结的就是我在开发颜文字输入法的过程中踩过的坑。别看颜文字输入法是个很小的app，但是这7个月以来，更新了十几个小版本，也就是上过十几次connect，因为之前对苹果条款了解不深，中间真是踩坑无数啊。而苹果的审核周期一般是1个星期到2个星期之间，大多数时候是2个星期，这时间对于互联网的快节奏来说，简直就是致命，如果你有竞争对手在后面跟着你，那被拒一次对于你来说更是一种深深地伤害。

不多说了，直接上我总结的坑：

1.最近的一次，因为app界面里出现“无节操”的字眼，被拒了。理由是：不雅词汇，使用户不适。我真是无力吐槽啊，也没法当面对质，好吧，我改成了“闹着玩”后审核通过。

2.上一次，app里加了个不完美的功能，于是加了个“beta”的字样，然后被打回了，说是app里不应包含测试版的功能，不能出现“beta”字样，好吧，我写了个代码，判断审核期里不显示beta，上架后再继续显示。不过后来每次审核，都没人再管里面的beta字样，估计是因为审核的人不一样吧，关注点不同。

3.iOS大小写写错了被打回。在简介里如果涉及到苹果的商标或者词汇，一定一个字母都不能错，包括每个字母的大小写。

4.引导用户好评，差点被封号。事情是这样的，我在微博发了条微博说去AppStore评论有奖品送，不知道被举报了还是咋滴，苹果发了个邮件说不允许鼓励评论，然后还有一个加拿大的电话打过来跟我确认情况，我说了情况后，她说下不为例即可，还是很nice的。全程中文沟通。对了，在苹果所有涉及审核上架邮件沟通等环节，尽管使用中文，他们有专人负责的。

5.没有提供测试账号。这个当时有点莫名其妙的，其实我的app不需要测试账号，后来随便填了个，然后就过了。

6.没有隐私声明。因为我是输入法，这个是必须提供的，我后来从搜狗输入法那里copy过来改了改放在自己服务器上的。

7.第三方输入法必须提供数字输入的功能。这个我也觉得有点莫名其妙，但是必须要加入，之前做的时候没有看条款，最后因为这个，我错过了第三方输入法第一波上架潮，iOS8正式版出来后，落后了好几个周才上架。

8.有一次不小心在界面里出现了成人词汇，但是我的app是4+评级的，于是被打回，后来我把评级临时提高了才通过。

我努力回忆，暂时只记起这些，都是很低级的错误，大家也可以一起来补充。

另外，再说一个诀窍：提交app，一定要利用好expedite review这个东西，所谓expedite review，就是申请快速review，一般通过后，提交当天就可以通过审核。不过前提是你能描述出你的app线上版本存在重大bug。你可以故意留点bug，或者是真的有bug，或者是故意夸大一下你的bug描述，通过的几率还是挺高的，半年来我至少通过了四五次。提交地址是 https://developer.apple.com/appstore/contact/?topic=expedite

