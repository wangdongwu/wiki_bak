[回头根据这个整理一下](http://blog.csdn.net/xiaoyuemian/article/details/3844305)
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

```js
function Person(){}
Person.prototype = {
  constructor: Person,
  name: 29,
  job: "Software Engineer",
  friends: ["Shelby", "Court"],
  sayName: function(){
    alert(this.name);
  }
};

var person1 = new Person();
var person2 = new Person();
person1.friends.push("Van");
alert(person1.friends); // "Shelby", "Court","Van"
alert(person2.friends); // "Shelby", "Court","Van"
```

```js
function Person(name, age, job){
  this.name = name;
  this.age = age;
  this,job = job;
  this.friends = ["Shelby", "Court"];
}
Person.prototype = {
  constructor: Person,
  sayName: function(){
    alert(this.name);
  }
};
var person1 = new Person("Nicholas", 29, "Software Engineer");
var person2 = new Person("Greg", 27, "Doctor");
person1.friends.push("Van");
alert(person1.friends); // "Shelby", "Court","Van"
alert(person2.friends); // "Shelby", "Court"
```

