**each**   
遍历list中的所有元素，按顺序用遍历输出每个元素。如果传递了context参数，则把iterator绑定到context对象上。   
每次调用iterator都会传递三个参数：(element, index, list)。    
如果list是个JavaScript对象，iterator的参数是 (value, key, list))。    
存在原生的forEach方法，Underscore就委托给forEach。

```js
_.each([1, 2, 3], function(num){ console.log(num); });
//  1,2,3

_.each({ one: 1, two: 2, three: 3 }, function(num, key){ console.log(num); });
//  1,2,3

var each = _.each = _.forEach = function(obj, iterator, context) {
  if (obj == null) return;
  if (nativeForEach && obj.forEach === nativeForEach) {
    obj.forEach(iterator, context);
  } else if (obj.length === +obj.length) {
    for (var i = 0, l = obj.length; i < l; i++) {
      if (iterator.call(context, obj[i], i, obj) === breaker) return;
    }
  } else {
    for (var key in obj) {
      if (_.has(obj, key)) {
        if (iterator.call(context, obj[key], key, obj) === breaker) return;
      }
    }
  }
};
```