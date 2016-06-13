From: <http://www.tfan.org/nodejs-running-on-port-80-with-apache/>

最近用 Node.js 开发一个微信公共平台接口，由于微信公众平台接口配置目前仅支持默认的 80 端口，而我的 CentOS 服务器已经在使用 Apache 运行一些其他业务了。这样就必须要求 Node.js 能够和 Apache 共用 80 端口。 

我们可以使用 Apache 的 Proxy mode 来解决这个问题。 

假设我们提供给微信公共平台接口配置的地址是：`http://www.foobar.com/weixin/receivetoken`。那么我们需要首先给 Apache 配置一个 vhost，域名就是 foobar.com；然后确认 Apache 加载了相应的 Proxy 模块；使 Apache 重新加载配置文件，最后确定一下我们的 Node.js 应用要监听的服务端口，比如 11342，启动我们的 Node.js 应用进行测试。那么我们通过如下几步配置即可实现。 

## 检查 Apache 配置文件 

首先找到并打开 Apache 的配置文件，检查一下 Proxy 模块是否已经被加载，比方在我的 CentOS 上配置文件的路径是: `/etc/httpd/conf/httpd.conf`  
```
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so

```

## 新增一个 VHOST 配置 

```
<VirtualHost *:80>
  ServerAdmin admin@gmail.com
  ServerName foobar.com
  ServerAlias www.foobar.com
 
  ProxyRequests off
 
  <Proxy *>
    Order deny,allow
    Allow from all
  </Proxy>
 
  <Location />
    ProxyPass http://localhost:11342/
    ProxyPassReverse http://localhost:11342/
  </Location>
 
  DocumentRoot /srv/www/foobar.com/public_html/weixin
  <Directory "/srv/www/foobar.com/public_html/weixin">
    AllowOverride All
  </Directory>
 
  ErrorLog /srv/www/foobar.com/logs/error.log
  CustomLog /srv/www/foobar.com/logs/access.log combined
</VirtualHost>
```

然后打开 vhost.conf 为 foobar.com 新增一个 virtual host 配置，在我的 CentOS 上的路径是：`/etc/httpd/conf.d/vhost.conf` 假设我们需要和 Apache 共享 80 端口的 Node.js 应用目录为：`/srv/www/foobar.com/public_html/weixin`，我们希望 Node.js 本身运行于 11342 端口。那么我们应该如下增加 vhost 配置： 

## 重新加载 Apache 配置文件及测试 

让 Apache 重新加载一下我们的配置： 

`service httpd reload`

最后运行一下 Node.js 脚本，然后就可以在浏览器中测试一下是否工作正常了。 

注意： 

  1. 上面我们是以 CentOS 为例说明 Apache 配置文件的路径，以及相关命令；如果是其他 Linux 的发行版本，按照相应平台进行处理即可，重点还是配置文件本身的内容。
  2. `ProxyPass http://localhost:11342/` 及其下面一行最后的“/”都是需要的。

本文地址：[http://www.tfan.org/nodejs-running-on-port-80-with-apache][1]

   [1]: http://www.tfan.org/nodejs-running-on-port-80-with-apache

参考资料： 

  * [http://thatextramile.be/blog/2012/01/hosting-a-node-js-site-through-apache][2]
  * [http://stackoverflow.com/questions/14168996/avoid-the-conflict-on-port-80-between-nodejs-and-apache][3]
  * [http://diogogmt.wordpress.com/2012/05/21/running-node-on-port-80-with-apache/][4]

   [2]: http://thatextramile.be/blog/2012/01/hosting-a-node-js-site-through-apache
   [3]: http://stackoverflow.com/questions/14168996/avoid-the-conflict-on-port-80-between-nodejs-and-apache
   [4]: http://diogogmt.wordpress.com/2012/05/21/running-node-on-port-80-with-apache/

