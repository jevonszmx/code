今天在用cocoapods安装第三方库时出现问题，so？怎么用着好好就不能用了。查找原因是不是ruby需要更新，结果更新了也没有用，那就重新安装最新版的cocoapods来解决问题吧，结果~，报错了......

 报错情况如下：

ERROR:  Could not find a valid gem 'cocospods’ (>= 0), here is why:

Unable to download data from http://ruby.taobao.org/ - bad response Not Found 404 (http://ruby.taobao.org/latest_specs.4.8.gz)

 解决办法：
将http 替换成 https

```sh
 gem sources --remove http://ruby.taobao.org/

 gem sources -a https://ruby.taobao.org/
```

3.查看源对不对

```
  gem sources -l
```

4.再安装就好了
```
  sudo gem install cocoapods
```
