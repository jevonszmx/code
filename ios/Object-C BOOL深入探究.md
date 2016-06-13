From: <http://blog.csdn.net/ahopedog/article/details/7390071>

这是一个很常见的类型-布尔，代表真或假的两个状态。但请注意，这里写的是BOOL（大写字母），并非输入有误，Object-C中的布尔类型就是这个样子的。如果顺其自然的将BOOL按照bool使用，很可能就会出现意想不到的结果。 

请看代码： 

```objective-c
    
    bool b1 = true;
    BOOL b2 = true;
    bool b3 = 256; //0x100
    BOOL b4 = 256; //0x100
            
    if(b1) NSLog(@"b1 is true");
    if(b2) NSLog(@"b2 is true");
    if(b3) NSLog(@"b3 is true");
    if(b4) NSLog(@"b4 is true");
    
```

你觉得会输出什么? 
    
```objective-c
    b1 is true
    b2 is true
    b3 is true
```

  


没有输出b4 is true，由此可见BOOL与bool不能完全同等对待。 

为了能更容易的理解Object-C中BOOL的用法，我们还是从最基本的if语句开始说明。 


## if 


        if是编程语言里最基本一个符号，简单的理解是表达式为真时执行，表达式为假时不执行。如果你是个JAVA程序员就要注意了，在c里，if有另外一种执行方式。表达式非0则执行，表达式为0则不执行。int, bool, char等类型的值都可以作为if的表达式使用。 


## **if和bool**

        这个应该很容易理解，也是最直接的使用方式，bool的值只有2个, true和false。这里不再说明。 

## **if和int**

       上面提到if的一个判断原则是非0则执行，0则不执行。请看代码 
```objective-c
    int a = 100;
    int b = 0;
    if(a)
       NSLog(@"a执行");
    if(b)
       NSLog(@"b不执行");
```

输出： 
```
    a执行
```

## if和char

char是1个字节的数值，所以也可以作为if的表达式使用。执行时，char首先被转换成int然后才参与计算。
```objective-c
    char a = 100;
    char b = 0;
    if(a)
       NSLog(@"a执行");
    if(b)
       NSLog(@"b执行");
```
    

  


输出结果与int作为表达式的完全相同： 
```
    a执行
```

## Object-C里的BOOL 

BOOL与bool并非同一个对象。Object-C里的BOOL是使用typedef重定义的char。 

在头文件objc.h中有这样几行代码： 
```objective-c
    typedef signed char     BOOL; 
    // BOOL is explicitly signed so @encode(BOOL) == "c" rather than "C" 
    // even if -funsigned-char is used.
    #define OBJC_BOOL_DEFINED
    
    
    #define YES             (BOOL)1
    #define NO              (BOOL)0
    
```

  


更准确的说，BOOL是无符号char的类型重定义，可以使用BOOL这个名字代替signed char使用。下面又定义了个2个符号， YES和NO，这是2个字面量，可以在代码中直接使用YES代替1， NO代替0。 

按照Object-C的原则，BOOL类型的变量只应该取YES和NO两个值。当YES（非0值）作为if的表达式时，if代码块里的代码便会执行，反之，NO则不执行。
```objective-c
    BOOL a = YES;
    BOOL b = NO;
    if(a == YES){
         NSLog(@"a==YES");
    }
    if(b == NO){
         NSLog(@"b==NO");
    }
    if(a){
         NSLog(@"a is true");
    }
    if(b){
         NSLog(@"b");
    }
```
    

输出： 
```objective-c
    a==YES
    b==NO
    a is true
```

  


现在回顾文章开头的例子 
```objective-c
    bool b3 = 256; //0x100
    BOOL b4 = 256; //0x100
    if(b3) NSLog(@"b3 is true");
    if(b4) NSLog(@"b4 is true");
```
    

  


这里有些奇怪，bool与BOOL即使不是同一种数据类型，但是赋予的值都是非0值，按理说if也应该认为这是一个检查通过的表达式。 

其实，BOOL是signed char的重定义，char的长度是1个字节，而数字256的低8位全是0，被转换成char后，char类型的变量就是0了（高位被丢弃）。所以最终作为if表达式的值实际上是0。 

  


## 建议的用法 

Object-C使用signed char重定义为BOOL的原因就不多研究了，可能为了一套完整语言的规范或是移植性的原因吧。 

 最后建议，为了规范程序里的代码，BOOL只应该使用YES和NO这2个值，而且在if语句的判断中尽量使用下面的格式： 
```objective-c
    if(a == YES){
          …
    }
    
    if(b == NO){
         ...
    }
```
