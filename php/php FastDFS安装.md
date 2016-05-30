php FastDFS安装
==

## 安装FastDFS依赖

### 源码：

```
https://github.com/happyfish100/libfastcommon
```

### 命令：

```shell
> ./make.sh
> sudo ./make.sh install
```

## 安装fastDFS(非必须，可以跳过)

### 源码：

```
https://github.com/happyfish100/fastdfs
```

### 命令：

```shell
> ./make.sh
> sudo ./make.sh install
```


## 进入fastDFS子目录php_client，安装php_client for fastDFS

```shell
> cd php_client/
> phpize
> ./configure
> make
> sudo make install
```

## 配置/etc/fdfs/client.conf

重点是tracker_server, 如：

```
tracker_server=192.168.3.131:22122

```


## 配置php.ini

php_client目录自带一个配置，可以从php_client目录拷贝内容过去：

```shell
> cat fastdfs_client.ini >> /usr/local/lib/php.ini
```

内容如下：

```
extension=fastdfs_client.so

[fastdfs_client]
; the base path
fastdfs_client.base_path = /tmp
; connect timeout in seconds
; default value is 30s
fastdfs_client.connect_timeout = 2
; set the log filename, such as /usr/local/fastdfs/logs/fastdfs_client.log
; empty for output to stderr
fastdfs_client.log_filename =
; secret key to generate anti-steal token
; this parameter must be set when http.anti_steal.check_token set to true
; the length of the secret key should not exceed 128 bytes
fastdfs_client.http.anti_steal_secret_key =
; FastDFS cluster count, default value is 1
fastdfs_client.tracker_group_count = 1
; config file of FastDFS cluster ;, based 0
; must include absolute path, such as fastdfs_client.tracker_group0
; the config file is same as conf/client.conf
fastdfs_client.tracker_group0 = /etc/fdfs/client.conf
; if use connection pool
; default value is false
; since V4.05
fastdfs_client.use_connection_pool = true
; connections whose the idle time exceeds this time will be closed
; unit: second
; default value is 3600
; since V4.05
fastdfs_client.connection_pool_max_idle_time = 3600
```

## 配置服务器信息

路径和上面php.ini中配置的

```
fastdfs_client.tracker_group0 = /etc/fdfs/client.conf
```

保持一致

## 重启apache，测试:

```
> php -i|grep fastdfs
```

如果出现类似如下提示：

```
> php -i|grep fastdfs
fastdfs_client
fastdfs_client v5.07 support => enabled
```

则表示安装php模块成功

## 执行测试程序：

```
> cd php_client/
> php fastdfs_test.php
```


## 相关问题

### 编译php_client提示error：

```
ld: library not found for -lfdfsclient
```

原因：libfastcommon在64位系统库文件会生成到/usr/lib64，如果此目录不在用户路径，则可以手动link过去：

```
> cd /usr/lib/
> sudo ln -s ../lib64/libfastcommon.so libfastcommon.so
> sudo ln -s ../lib64/libfdfsclient.so libfdfsclient.so
```

### 提示22122/23000错误，如：

```
connect to 192.168.3.131:23000 fail, errno: 60, error info: Operation timed out
```

原因：
请确认fdfs服务器的tracker server和storage server的防火墙是否开放了程序所在服务器ip的访问。




