### 显示服务器上所有的每个IP多少个连接数

```
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### 阿里云显示外网流量

```
/usr/local/sbin/iftop -i eth1
```
