### 非构造函数的继承
```js
var Chinese = {
  nation: "China"
};
var Doctor = {
  career: "doctor"
};
```
怎样让Doctor去继承Chinese？  


**一、object()方法**  
```js
function object(o) {
  function F() {}
  F.prototype = o;
  return new F();
}
var Doctor = object(Chinese);
Doctor.career = "doctor";
alert(Doctor.nation); // China
```
这个object()函数，就是把子对象的prototype属性，指向父对象，从而使得子对象与父对象连在一起。

**二、浅拷贝**  
除了使用“prototype链”以外，还有一种思路：把父对象的属性，全部拷贝给子对象，也能实现继承。
```js
function extendCopy(p) {
  var c = {};
  for (var i in p) {
    c[i] = p[i];
  }
  c.uber = p;
  return c;
}
```
但是这样的拷贝有一个问题，那就是，如果父对象的属性等于数组或另一个对象时，那么实际上，子对象获得的只是一个内存地址，而不是真正的拷贝，因此存在父对象被篡改的可能。
```js
Chinese.birthPlaces = ['beijing', 'shanghai', 'guangzhou'];
var Doctor = extendCopy(Chinese);
Doctor.birthPlaces.push('hongkong');
alert(Doctor.birthPlaces); // beijing, shanghai, guangzhou, hongkong
alert(Chinese.birthPlaces); // beijing, shanghai, guangzhou, hongkong
```
所以，extendCopy()只是拷贝基本类型的数据，这种拷贝叫做“浅拷贝”。

**三、深拷贝**  
递归调用“浅拷贝”即可。
```js
function deepCopy(p, c) {
  var c = c || {};
  for (var i in p) {
    if (typeof p[i] === 'object') {
      c[i] = (p[i].constructor === Array) ? [] : {};
      deepCopy(p[i], c[i]);
    } else {
      c[i] = p[i];
    }
  }
  return c;
}
```