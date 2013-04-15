在函数内部，有两个特殊的对象：arguments 和 this 。虽然 arguments的主要用途是保存函数参数，但这个对象还有一个名为 callee 的属性，该属性是一个指针，指向拥有这个arguments对象的函数。
```js
function factorial(num) {
  if (num <= 1) {
    return 1;
  } else {
    return num * factorial(num - 1);
  }
};

// 定义阶乘函数一般都要用到递归算法，但问题是这个函数的执行与函数名 factorial 紧紧耦合在了一起。
//为了消除这种紧密耦合的现象，可以使用arguments.callee
function factorial(num) {
  if (num <= 1) {
    return 1;
  } else {
    return num * arguments.callee(num - 1);
  }
};
```

每个函数都包含两个属性：length 和 prototype；其中，length 属性表示函数希望接收的命名参数的个数。对于ECMAScript中的引用类型而言，prototype 是保存它们所有实例方法的真正所在。prototype属性是不可枚举的，因此使用 for-in 无法发现。

每个函数都包含两个非继承而来的方法：apply() 和 call()。这两个方法的用途都是在特定的作用域中调用函数，实际上等于设置函数体内 this 对象的值。

apply() 方法接收两个参数：一个是在其中运行函数的作用域，另一个是参数数组。其中，第二个参数可以是 Array 的实例，也可以是 arguments 对象。

call() 方法与 apply() 方法的作用相同，它们的区别仅在于接收参数的方式不同。对于call() 方法而言，第一个参数是 this 值没有变化，变化的是其余参数都直接传递给函数。
```js
function sum(num1, num2) {
  return num1 + num2;
}

function callsum1(num1, num2) {
  return sum.apply(this, arguments);
}

function callsum2(num1, num2) {
  return sum.apply(this, [num1, num2]);
}

function callsum3(num1, num2) {
  return sum.call(this, num1, num2);
}

alert(callsum1(10, 10));  //20
alert(callsum2(10, 10));  //20
alert(callsum3(10, 10));  //20
```

事实上，传递参数并非是 apply() 和 call() 真正的用武之地；它们真正强大的地方是能够扩充函数赖以运行的作用域。    
使用 call() 和 apply() 来扩充作用域的最大好处，就是对象不需要与方法有任何耦合关系。
```js
window.color = "red";
var o = { color: "blue" };

function sayColor() {
  alert(this.color);
}

sayColor();              //red
sayColor.call(this);     //red
sayColor.call(window);   //red
sayColor.call(o);        //blue
```

### call方法 
**Synatx**
```js
fun.call(thisArg[, arg1[, arg2[, ...]]])
```
**Examples**
```js
function Product(name, price) {
  this.name = name;
  this.price = price;
}

function Food(name, price) {
  Product.call(this, name, price);
  this.category = 'food';
}

var cheese = new Food('feta', 5);
alert(cheese.name); // feta
```

### apply方法   
**Synayx**
```js
fun.apply(thisArg[, argsArray])
```
**Example** 
```js
function Product(name, price) {
  this.name = name;
  this.price = price;
}

function Food(name, price) {
  Product.apply(this, [name, price]);
  this.category = 'food';
}

var cheese = new Food('feta', 5);
alert(cheese.name); // feta
```