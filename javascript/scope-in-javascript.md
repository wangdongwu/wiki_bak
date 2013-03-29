### JavaScript中的函数作用域

JavaScript中没有块级作用域（block scope)，取而代之使用了函数作用域（function scope）：**变量在声明它们的函数体以及这个函数体嵌套的任意函数体内都是有定义的。**
```js
function test(o) {
    var i = 0;  // i在整个函数体内均是有定义的
    if (typeof o == "object") {
        var j = 0;  // j在函数体内是有定义的，不仅仅是在这个代码段内
        for(var k = 0; k < 10; k++) {   // k在函数体内是有定义的，不仅仅是在循环内
            console.log(k);
            console.log(i);
        }
        console.log(k);
    }
    console.log(j);
}
```

JavaScript的函数作用域是指在函数内声明的所有变量在函数体内始终是可见的。这意味着变量在声明之前甚至已经可用。JavaScript的这个特性被非正式地称为 **声明提前（hoisting）**，即JavaScript函数里声明的所有变量（但不涉及赋值）都被“提前”至函数体的顶部：
```js
var scope = "golbal";
function f() {
    console.log(scope); // undefined
    var scope = "local"; // 变量在这里赋值，但变量本身在函数体内任何地方均是有定义的
    console.log(scope); // local
}
```
由于函数作用域的特性，局部变量在整个函数体始终是有定义的，也就是说，在函数体内局部变量遮盖了同名全局变量。尽管如此，只有在程序执行到 var 语句的时候，局部变量才会被真正赋值。因此，上诉过程等价于：将函数内的变量声明“提前”至函数体顶部，同时变量初始化留在原来的位置：
```js
var scope = "golbal";
function f() {
    var scope;  // 这里局部变量覆盖了全局变量
    console.log(scope);
    scope = "local";
    console.log(scope);
}
```
在具有块级作用域的编程语言中，在狭小的作用域里让变量声明和使用变量的代码尽可能靠近彼此，通常来讲，这是一个非常不错的编程习惯。

由于JavaScript没有块级作用域，因此一些程序员特意将变量声明放在函数体顶部，而不是将声明靠近放在使用变量之处。这种做法使得他们的源代码非常清晰地反映了真实的变量作用域。