```js
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