> JavaScript是一种基于对象(object-based)的语言，但是，它又不是一种真正的面向对象编程语言，因为它的语法中没有class。

**一、生成对象的原始模式**  
```js
var cat1 = {};
cat1.name = "Lucy";
cat1.color = "yellow";
```

**二、原始模式的改进** 
```js
function Cat(name, color) {
  return {
    name: name,
    color: color
  }
}
//cat1和cat2之间没有内在的联系，不能反映出它们是同一个原型对象的实例。
var cat1 = Cat("Lucy", "yellow")
var cat2 = Cat("Honey", "red")
```

**三、构造函数模式**  
所谓“构造函数”，其实就是一个普通函数，但是内部使用了 **this** 变量。对构造函数使用 **new** 运算符，就能生成实例，并且 **this** 变量会绑定在实例对象上。
```js
function Cat(name, color) {
  this.name = name;
  this.color = color;
}

var cat1 = new Cat("Lucy", "yellow")
var cat2 = new Cat("Honey", "red")
```
这时cat1和cat2会自动含有一个 constructor 属性，指向它们的构造函数。
```js
alert(cat1.constructor == Cat); // true
alert(cat2.constructor == Cat); // true
```
JavaScript还提供了一个 **instanceof运算符** ，验证原型对象与实例对象之间的关系。
```js
alert(cat1 instanceof Cat); // true
alert(cat2 instanceof Cat); //true
```

**四、Protoytpe模式**  
JavaScript规定，每一个构造函数都由一个 prototype 属性，指向另一个对象。这个对象的所有属性和方法，都会被构造函数的实例继承。  
这意味着，可以把那些不变的属性和方法，直接定义在 prototype 对象上。
```js
function Cat(name, color) {
  this.name = name;
  this.color = color;
}
Cat.prototype.type = "animals";
Cat.prototype.eat = function() { alert("eat mice") }

var cat1 = new Cat("Lucy", "yellow")
var cat2 = new Cat("Honey", "red")

alert(cat1.type); // animals
alert(cat1.eat == cat2.eat); //true
```

**五、Protoytpe模式的验证方法**  
为了配合 prototype 属性，JavaScript定义了一些辅助方法。

**isPrototypeOf**  
这个方法用来判断，某个 prototype 对象和某个实例之间的关系。
```js
alert(Cat.prototype.isPrototypeOf(cat1)); // true
alert(Cat.prototype.isPrototypeOf(cat2)); // true
```

**hasOwnProperty()**  
每个实例对象都由一个 hasOwnProperty() 方法，用来判断某一个属性到底是本地属性，还是继承自 prototype 对象的属性。
```js
alert(cat1.hasOwnProperty("name")); // true
alert(cat1.hasOwnProperty("type")); // false
```

**in运算符**  
in 运算符可以用来判断，某个实例是否含有某个属性，不管是不是本地属性，还可以用来遍历某个对象的所有属性。
```js
alert("name" in cat1); // true
alert("type" in cat1); // true

// cat1[name] = Lucy
// cat1[color] = yellow
for(var prop in cat1) {
 alert("cat1["+prop+"] = " + cat1[prop]);
}
```