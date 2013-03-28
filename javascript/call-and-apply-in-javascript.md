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