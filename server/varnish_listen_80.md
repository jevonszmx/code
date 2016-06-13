By default, Varnish is listening on port 6081. To Varnish can handle traffic of website on port 80, you can using iptables to redirect traffic from port 80 to port 6081, type the following command

```
# iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 6081
```

And type the following command to save iptables rules

```
# /etc/init.d/iptables save
```
