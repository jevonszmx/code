像 Ajaxian，StackOverflow 等，搜一下，到处都在讨论 isArray() 的实现。对于一切都是对象的 JavaScript 来说，确实有点麻烦。今天刚好在学习支付宝 JS 框架 base.js 。瞄了一下，实现是这样的：

```
if (value instanceof Array ||
  (!(value instanceof Object) &&
	(Object.prototype.toString.call((value)) == '[object Array]') ||
	typeof value.length == 'number' &&
	typeof value.splice != 'undefined' &&
	typeof value.propertyIsEnumerable != 'undefined' &&
	!value.propertyIsEnumerable('splice'))) {
	return 'array';
}
```

怎么说呢，乱。当然，也可以说是，“史上最全”，它确实使用了最主流的方法，只是把他们都写一起了而已。


像我们所知道的，用 instanceof 和 constructor 是最直接的、简单的方式：

```
var arr = [];
arr instanceof Array; // true
arr.constructor == Array; //true
```

只是，由于在不同 iframe 中创建的 Array 并不共享 prototype。如果这样用。麻烦就来了。那么，如果要应用在框架中，这种方式肯定是行不通的。倒是，使用 Douglas Crockford 的填鸭式方法是可以解决这个问题（《JavaScript 语言精粹》P61）：

```
var is_array = function(value) {
	return value &&
        typeof value === 'object' &&
        typeof value.length === 'number' &&
        typeof value.splice === 'function' &&
        !(value.propertyIsEnumerable('length'));
};
```

不过，是否还有更简单的方法呢？其实，像我们自己用的，不就是了么？

```
Object.prototype.toString.call(value) == '[object Array]'
```

上面这种写法，是 jQuery 正在使用的。目前，淘宝的 kissy 也是使用这种方式。难道这不是目前最简洁，而且最有效的方式么？个人感觉内部框架写得有点累赘了。例行总结，最终方案：

```
var isArray = function(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
}
```

==============


判断类型，很酷。具体的，跟上面是一个道理：

```
var is = function (obj,type) {
        return (type === "Null" && obj === null) ||
        (type === "Undefined" && obj === void 0 ) ||
        (type === "Number" && isFinite(obj)) ||
         Object.prototype.toString.call(obj).slice(8,-1) === type;
}
```
