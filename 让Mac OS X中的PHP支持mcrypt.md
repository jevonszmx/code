From: <http://www.ccvita.com/400.html>

发布时间：May 26, 2009 分类：[Mac][1]

   [1]: http://www.ccvita.com/category/mac/

《[让Mac OS X中的PHP支持GD][2]》 

   [2]: http://www.ccvita.com/401.html (让Mac OS X中的PHP支持GD)

《[奇矩互动招聘Social Game美术设计师][3]》 

   [3]: http://www.ccvita.com/405.html (奇矩互动招聘Social Game美术设计师)

[MCrypt][4]是一个功能强大的加密算法扩展库，它包括有22种算法，phpMyAdmin依赖这个PHP扩展，具体如下：  


   [4]: http://mcrypt.sourceforge.net/

  * 下载并解压[libmcrypt-2.5.8.tar.gz][5]。  

  * 在终端执行如下命令：  


   [5]: http://sourceforge.net/projects/mcrypt/files/Libmcrypt/

tar zxvf libmcrypt-2.5.8.tar.gz  
cd libmcrypt-2.5.8/  
./configure --disable-posix-threads --enable-static  
make  
sudo make install 

  

  * 下载并解压[PHP源码文件php-5.3.4.tar.gz][6]。Mac OS X 10.6.3中预装的PHP版本是5.3.4，所以需要下载这个版本。  

  * 在终端执行如下命令：  


   [6]: http://cn.php.net/get/php-5.3.4.tar.gz/from/a/mirror

tar zxvf php-5.3.4.tar.gz  
cd php-5.3.4/ext/mcrypt  
phpize  
./configure  
make  
sudo cp modules/mcrypt.so /usr/lib/php/extensions/no-debug-non-zts-20090626/ 

  

  * 打开php.ini  


sudo vi /usr/local/lib/php.ini 

  
在php.ini中加入如下代码，并保存后退出，然后重启Apache  


extension=mcrypt.so 

Tags: [PHP][7], [配置][8], [mcrypt][9]

   [7]: http://www.ccvita.com/tag/PHP/
   [8]: http://www.ccvita.com/tag/%E9%85%8D%E7%BD%AE/
   [9]: http://www.ccvita.com/tag/mcrypt/

* * *
