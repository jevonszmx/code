Objective-c @Class 说明
---

Objective-C引入了关键字@class来告诉编译器：这是一个类，所以我只需要通过指针来引用它。 
它并不需要知道关于这个类的更多信息，只要了解它是通过指针引用即可。 
如下例所视：

```objective-c 
#import <Cocoa/Cocoa.h> 
@class Tire; 
@class Engine; 
@interface Car : NSObject { 
	Tire *tires[4]; 
	Engine *engine; 
} 
- (void) setEngine: (Engine *) newEngine; 
- (Engine *) engine; 
- (void) setTire: (Tire *) tire 
         atIndex: (int) index; 
- (Tire *) tireAtIndex: (int) index; 
- (void) print; 
@end // Car

```
 
为什么要用@class Tire;和@class Engine;呢？ 
-----

如果此处用#import来导入Tire.h和Engine.h的话，编译器会获得这两个类的大量信息，上例中，只是通过指针引用了Tire和Engine。这是@Class可以完成的工作。 

+  import会包含这个类的所有信息，包括实体变量和方法，而@class只是告诉编译器，其后面声明的名称是类的名称，至于这些类是如何定义的，暂时不用考虑，后面会再告诉你； 
+  在头文件中，一般只需要知道被引用的类的名称就可以了，不需要知道其内部的实体变量和方法，所以在头文件中一般使用@class来声明这个名称是类的名称，而在类的实现部分，因为会用到这个引用类的内部的实体变量和方法，所以需要使用#import来包含这个被引用类的头文件。 

+ 一般来说，@class是放在interface中的，只是为了在interface中引用这个类，把这个类作为一个类型来用的。在实现这个接口的实现类中，如果需要引用这个类的实体变量或者方法之类的，还是需要import在@class中声明的类进来. 
