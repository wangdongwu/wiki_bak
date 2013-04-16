####原型属性

我们创造的每一个函数都有一个 prototype （原型）属性，这个属性是一个指针，指向这个函数的 **原型对象** ，原型对象的用途是包含可以由特定类型的所有实例共享的属性和方法。

####原型对象

无论什么时候，只要创建了一个新函数，就会根据一组特定的规则为该函数创建一个 prototype 属性，这个属性指向函数的原型对象。  
在默认情况下，所有原型对象都会自动获得一个 **construtor** （构造函数）属性，这个属性包含一个指向 prototype 属性所在函数的指针。并且其原型对象默认只会取得 constructor 属性，至于其他方法，则都是从 Object 继承而来的。   
当调用构造函数创建一个新实例后，该实例的内部将包含一个指针，指向构造函数的原型对象。即实例与构造函数没有直接的关系。原型最初只包含 constructor 属性，而该属性也是共享的，所以可以通过对象实例访问。
```js
var Person = function(name, age) {
  this.name = name,
  this.age = age
};
Person.prototype.sayHi = function(){
  alert('hello, world!');
}

person1 = new Person('Spirit', 24);

// 原型最初只包含 constructor 属性，该属性是共享的，可以通过对象实例访问。
console.log(person1.constructor == Person);  //true

// 通过 isPrototypeO 可以确定实例与原型的关系
console.log(Person.prototype.isPrototypeOf(person1));  //true

// 使用 hasOwnProperty 可以检测一个属性是存在实例中，还是存在原型中
console.log(person1.hasOwnProperty("name"));  //true
console.log(person1.hasOwnProperty("sayHi")); //false
```

####一个常见的原型语法
```js
function Person() {
}

// 将 Person.prototype 设置为等于一个以对象字面量形式创建的新对象
// constructor 属性不再指向 Person 了，其本质上重写了默认的 prototype 对象
// 因此 constructor 属性也就变成了新对象的 constructor 属性（指向 Object 函数）
// 所以需要重设 constructor 属性
Person.prototype = {
  constructor: Person,
  name: "Spirit",
  age: 24,
  job: "Software Engineer",
  sayName: function() {
    alert(this.name);
  }
};
```