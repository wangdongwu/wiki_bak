**prototype属性的引入**  
> 这个属性包含一个对象，所有实例对象需要共享的属性和方法，都放在这个对象里面；那些不需要共享的属性和方法，放在构造函数里面。  
实例对象一旦创建，将自动引用prototype对象的属性和方法。也就是说，实例对象的属性和方法，分为两种，一种是本地的，另一种是引用的。  
——摘自阮一峰的 [Blog](http://www.ruanyifeng.com/blog/2011/06/designing_ideas_of_inheritance_mechanism_in_javascript.html)

### 一、基本使用方法

**prototype** 就是“一个给类的对象添加方法的方法”，使用prototype属性，可以给类动态地添加方法，以便在JavaScript中实现“继承”的效果。
具体来说protype是在IE4及其以后版本引入的一个针对于某一类的对象的方法，当用prototype编写一个类后，如果new一个新的对象，浏览器会自动把prototype中的内容替你附加在对象上。这样，通过利用prototype就可以在JavaScript中实现成员函数的定义，甚至是“继承”的效果。

对已有的类添加方法
```js
//对Number类添加add方法
Number.prototype.add = function(num){
  return (this + num);
}

//对Array类添加push方法
Array.prototype.push = function(new_element){
  this[this.length] = new_element;
  return this.length;
}

//对自定义类添加方法
function Person(){}
Person.prototype.name = "Spirit";
Person.prototype.age = 24;
Person.prototype.sayName = function(){
  alert(this.name);
}

var person1 = new Person();
var person2 = new Person();
person1.name = "huangxy";
alert(person1.name);
alert(person2.name);
```

### 二、prototype的动态特性及弊端

需要注意的是，prototype使我们可以在类定义完成之后，仍可以随时为其添加方法、属性，随时添加随时使用——也就是prototype的定义具有动态性。

如果当我们调用时根本没有该属性或者方法，将可能导致我们的脚本down掉。对于这个问题，可以使用以下写法：
```js
function MyObject(name, size) {
  this.name = name;
  this.size = size;
}

MyObject.prototype.height = 2.26
MyObject.prototype.tellHeight = function() {
  return this.name + this.height;
}

///使用方法,检验该属性或者方法是否存在
var myobj1 = new MyObject("aha", 3);
if (myobj1.tellHeight){
  domDiv.innerHTML += myobj1.tellHeight();
}
```

**属性和方法变不变化的问题就严重了**
```js
function MyObject() {}

MyObject.prototype.color = "red";
MyObject.prototype.tellColor = function() { return this.color; }

//修改MyObject的属性，myobj1的属性值也变化了
var myobj1 = new MyObject();
MyObject.prototype.color = "green";
domDiv.innerHTML += myobj1.tellColor();


function Person() {}
Person.prototype = {
  constructor: Person,
  name: 29,
  job: "Software Engineer",
  friends: ["Shelby", "Court"],
  sayName: function() {
    alert(this.name);
  }
};

//修改person1的属性，person2的属性也变化了
var person1 = new Person();
var person2 = new Person();
person1.friends.push("Van");
alert(person1.friends); // "Shelby", "Court","Van"
alert(person2.friends); // "Shelby", "Court","Van"
```

正确的方法，所有实例对象需要共享的属性和方法，都放在这个对象里面；那些不需要共享的属性和方法，放在构造函数里面。
```js
function Person(name, age, job) {
  this.name = name;
  this.age = age;
  this.job = job;
  this.friends = ["Shelby", "Court"];
}
Person.prototype = {
  constructor: Person,
  sayName: function() {
    alert(this.name);
  }
};
var person1 = new Person("Nicholas", 29, "Software Engineer");
var person2 = new Person("Greg", 27, "Doctor");
person1.friends.push("Van");
alert(person1.friends); // "Shelby", "Court","Van"
alert(person2.friends); // "Shelby", "Court"
```

