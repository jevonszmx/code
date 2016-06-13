mac装了unixodbc后提示无法找到驱动

```
cd /Library/ODBC/

sudo ln -s /usr/local/unixODBC/etc/odbc.ini odbc.ini

sudo ln -s /usr/local/unixODBC/etc/odbcinst.ini odbcinst.ini
``
