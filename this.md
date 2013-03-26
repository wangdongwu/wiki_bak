**this** 是JavaScript语言的一个关键字。

它代表函数运行时，自动生成的一个内部对象，只能在函数内部使用。

随着函数使用场合的不同，this 的值会发生变化。但是有一个总的原则，那就是 this 指的是， **调用函数的那个对象**。

**情况一：纯粹的函数调用**  
这是函数的最通常用法，属于全局性调用，因此 this 就代表对局对象 Global。
```js
function test() {
  this.x = 1;
  alert(this.x);
}

test(); // 1

// this就是全局对象
var x = 1;
function test() { alert(this.x) }
test(); // 1

function test() { this.x = 0; }
test();
alert(x); // 0
```

**情况二：作为对象方法的调用**  
函数还可以作为某个对象的方法调用，这时 this 就指这个上级对象。
```js
function test() {
  alert(this.x);
}

var o = {};
o.x = 1;
o.m = test;
o.m(); // 1
```

**情况三：作为构造函数调用**  
所谓构造函数，就是通过这个函数生成一个新对象(object)。这时， this 就指这个新对象。
```js
var x = 2

function test() {
  this.x = 1;
}

var o = new test();
alert(o.x); // 1
alert(x); // 2, 这时this不是全局对象
```

**情况四： apply 调用**  
apply()是函数对象的一个方法，它的作用是改变函数的调用对象，它的第一个参数就表示改变后的调用这个函数的对象。因此，this 指的就是这第一个函数。
```js
var x = 0;
function test() {
  alert(this.x);
}

var o = {};
o.x = 1;
o.m = test;
o.m.apply(); // 0，apply()的参数为空时，默认调用全局对象
o.m.apply(o); // 1，this代表对象o
```