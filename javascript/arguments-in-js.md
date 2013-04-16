ECMAScript中函数的参数与大多数其他语言中函数的参数有所不同。 

**ECMAScript函数不介意传递进来多少个参数，也不在乎传进来参数是什么数据。**

原因是ECMAScript中的参数在内部是用一个 **数组** 来表示的，函数接收到的始终都是这个数组，而不关心数组中包含哪些参数，如果这个数组中不包含任何元素，无所谓；如果包含多个元素，也没有问题。   

在函数体内可以通过 **arguments** 对象来访问这个参数数组，从而获取传递给函数的每一个参数。  

arguments对象只是与数组类似（它并不是Array的实例），因为可以使用方括号语法访问它的每一个元素（即第一个元素是arguments[0]，第二个元素是arguments[1]，以此类推），使用length属性来确定传递进来多少个参数。即函数可以不显性地使用命名参数：
```js
function sayHi() {
  alert(arguments.length);
  alert("Hello " + arguments[0] + arguments[1]);
}

sayHi("Spirit", ", how are you?")
```

