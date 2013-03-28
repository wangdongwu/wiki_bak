**一、变量的作用域**  
变量的作用域无非就是两种：全局变量和局部变量。  
Javascript语言的特殊之处，就在于函数内部可以直接读取 **全局变量** 。
```js
var n = 999;
function f1() {
  alert(n);
}
f1(); // 999
```

另一方面，在函数外部无法读取函数内的 **局部变量** 。
```js
function f1() {
  // 这里需要注意需要用var声明局部变量
  var n = 999;
}
alert(n); // Uncaught ReferenceError: n is not defined
```

**二、从外部读取局部变量**  
```js
function f1() {
  var n = 999;
  function f2() {
    alert(n); 
  }
  return f2;
}
var result = f1();
result(); // 999
```
函数f2被包含在函数f1内部，这时f1内部的所有局部变量对f2都是可见的，但是反过来就不行，f2内部的局部变量，对f1就是不可见的。这就是JavaScript语言特有的 **链式作用域** 结构(chain scope)，子对象会一级一级地向上寻找所有父对象的变量。所以父对象的所有变量，对子对象都是可见的，反之则不成立。

**三、闭包**  
```js
function f1() {
  var n = 999;
  nAdd = function() {
    n += 1;
  }
  function f2() {
    alert(n);
  }
  return f2;
}

var result = f1();
result(); /// 999
nAdd();
result(); // 1000
```
在这段代码中，result实际上就是闭包f2函数。它一共运行了两次，第一次的值是999，第二次的值是1000。这证明了，函数f1中的局部变量n一直保存在内存中，并没有在f1调用后被自动清除。  
为什么会这样呢？原因就在于f1是f2的父函数，而f2被赋给了一个全局变量，这导致f2始终在内存中，而f2的存在依赖于f1，因此f1也始终在内存中，不会在调用结束后，被垃圾回收机制（garbage collection）回收。  
这段代码中另一个值得注意的地方，就是"nAdd=function(){n+=1}"这一行，首先在nAdd前面没有使用var关键字，因此nAdd是一个全局变量，而不是局部变量。其次，nAdd的值是一个匿名函数（anonymous function），而这个匿名函数本身也是一个闭包，所以nAdd相当于是一个setter，可以在函数外部对函数内部的局部变量进行操作。  

-

```js
var name = "The Window";
var object = {
  name: "My object",
  getNameFunc: function() {
    alert(this.name);
    return function() {
      return this.name;
    };
  }
};
alert(object.getNameFunc()()); // My object, The Windows
```