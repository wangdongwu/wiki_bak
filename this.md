**this** 是JavaScript语言的一个关键字。

它代表函数运行时，自动生成的一个内部对象，只能在函数内部使用。

随着函数使用场合的不同，this 的值会发生变化。但是有一个总的原则，那就是 this 指的是， **调用函数的那个对象**。

情况一：纯粹的函数调用  
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