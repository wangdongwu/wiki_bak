**with** 语句的作用是将代码的作用域设置到一个特定的对象中。with语句的语法如下：  
`with (expression) statement`   

定义with语句的目的主要是为了简化多次编写同一个对象的工作，如下面的例子所示：
```js
var qs = location.search.substring(1)
var hostName = location.hostName
var url = location.href
```
上面几行代码都包含location对象。如果使用with语句，可以改写为：
```js
with(location) {
  var qs = search.substring(1);
  var hostName = hostname;
  var url = href;
}
```
使用with语句关联了location对象。这意味着在with语句的代码块内部，每个变量首先被认为是一个局部变量，而如果在局部环境中找不到该变量的定义，就会查询location对象中是否有同名的属性。如果发现了同名属性，则以location对象属性的值作为变量的值。    
> 由于大量使用with语句会导致性能下降，同时也会给调试代码造成困难，因此在开发大型应用程序时，不建议使用with语句。