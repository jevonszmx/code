### 开启NSZombieEnabled

NSZombieEnabled (in your executable settings, Arguments panel, add an environment variable NSZombieEnabled set to YES).

### 常见相关报错

+ -[CFString retain]: message sent to deallocated instance 0x4593540”  =》 a retain count problem
+ EXC_BAD_ACCESS，当你向已经释放的对象发送消息时就会出现这种错误