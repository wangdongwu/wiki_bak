###对象之间继承的五种方法

如何才能使Cat继承Animal？
```js
function Animal() {
  this.species = "animal";
}

function Cat(name, color) {
  this.name = name;
  this.color = color;
}
```

**一、构造函数绑定**  
使用 **call** 或 **apply** 方法，将父对象的构造函数绑定在子对象上，即在子对象构造函数中加一行：
```js
function Cat(name, color) {
  Animal.apply(this, arguments);
  this.name = name;
  this.color = color;
}

var cat1 = new Cat("Lucy", "yellow");
alert(cat1.species); // animal
```

**二、prototype模式**  
使用prototype属性：
```js
Cat.prototype = new Animal();
Cat.prototype.constructor = Cat;

var cat1 = new Cat("Lucy", "yellow");
alert(cat1.species); // animal
```
第一行，将Cat的prototype对象指向一个Animal的实例。它相当于完全删除了prototype对象原先的值，然后赋予一个新值。 **并且将Cat.prototype.constructor的属性指向了Animal，** 从而cat1.constructor也指向Animal，造成了继承链的紊乱。  
第二行， **将Cat的prototype对象的constructor属性重新指向Cat。**

这一点很重要，即如果替换了prototype对象，那么，下一步必然是为新的prototype对象加上contructor属性，并将这个属性指回原来的构造函数。
```js
o.prototype = {};
o.prototype.instructor = o;
```

**三、直接继承prototype**  
由于Animal对象中，不变的属性都可以直接写入Animal.protype。所以，可以让Cat()跳过Animal()，直接继承Animal.prototype。
```js
// 先改写Animal对象
function Animal() {}
Animal.prototype.species = "animal";

Cat.prototype = Animal.prototype;
Cat.prototype.constructor = Cat;

var cat1 = new Cat("Lucy", "yellow");
alert(cat1.species); // animal
```
这样做的优点是效率比较高（不用执行和建立Animal的实例了），比较省内存。 **缺点是Cat.prototype和Animal.prototype现在指向了同一个对象，** 那么任何对Cat.prototype的修改，都会反映到Animal.prototype上。
```js
Cat.prototype.constructor = Cat;
alert(Animal.prototype.constructor); // Cat
```

**四、利用空对象作为中介**  
直接继承prototype存在缺点，可以利用一个空对象作为中介，空对象几乎不占内存。这时修改Cat的prototype对象，就不会影响到Animal的prototype对象。
```js
function Animal() {}
Animal.prototype.species = "animal";

var F = function() {};
F.prototype = Animal.prototype;
Cat.prototype = new F();
Cat.prototype.constructor = Cat;

alert(Animal.prototype.constructor); // Animal
```
将上面的方法封装成一个函数：
```js
function extend(Child, Parent) {
  var F = function() {};
  F.prototype = Parent.prototype;
  Child.prototype = new F();
  Child.prototype.constructor = Child;
  Child.uber = Parent.prototype;
}
// 最后一行为子对象设一个uber属性，这个属性直接指向父对象的prototype属性。这等于在子对象上打开一条通道，可以直接调用父对象的方法。这一行放在这里，只是为了实现继承的完备性，纯属备用性质。
```

**五、拷贝继承**  
```js
function Animal() {}
Animal.prototype.species = "animal";

function extend(Child, Parent) {
  var p = Parent.prototype;
  var c = Child.prototype;
  for (var i in p) { c[i] = p[i]; }
  c.uber = p;
}
// 这个函数的作用，就是将父对象的prototype对象中的属性，一一拷贝给Child对象的prototype对象。
```