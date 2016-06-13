### apache


```
./configure --enable-cache --enable-mem-cache --enable-mime-magic --enable-expires --enable-headers --enable-deflate --enable-usertrack --enable-unique-id --enable-proxy --enable-proxy-connect --enable-proxy-http --enable-proxy-balancer --disable-autoindex --disable-cgid --disable-cgi --disable-userdir --enable-rewrite --enable-so --disable-actions --with-mpm=worker
```

### php (5.3)

```
./configure \
--with-apxs2=/usr/local/apache2/bin/apxs \
--disable-cgi \
--enable-magic-quotes \
--disable-ipv6 \
--with-openssl \
--with-zlib \
--with-bz2 \
--enable-calendar \
--with-curl \
--enable-exif \
--with-gd \
--with-jpeg-dir \
--with-png-dir \
--enable-gd-native-ttf \
--with-freetype-dir \
--enable-mbstring \
--with-mysql=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-pdo-odbc=unixODBC,/usr/local/unixODBC/ \
--with-mssql=/usr/local/freetds/ \
--without-pdo-sqlite \
--without-sqlite \
--without-sqlite3 \
--enable-soap \
--enable-zip \
--with-pear
```
