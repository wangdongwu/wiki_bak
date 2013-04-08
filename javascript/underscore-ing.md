> 学习了两个礼拜JavaScript，光看基础书没有什么太大的进展。  
直接进入underscore.js和backbone.js学习。

##Underscore重点函数解释及其用法
###each  
**alias: forEach**  
遍历 list 中的所有元素，按顺序用遍历输出每个元素。如果传递了 context 参数，则把 iterator 绑定到 context 对象上。   
每次调用iterator都会传递三个参数：(element, index, list)。    
如果 list 是个JavaScript对象，iterator 的参数是 (value, key, list))。    
存在原生的 forEach 方法，Underscore就委托给 forEach。

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

###map   
**alias: collect**  
用转换函数把 list 中的每个值映射到一个新的数组。存在原生的 map 方法，就用原生map方法代替。如果 list 是个JavaScript对象，iterator 的参数是(value, key, list)。
```js
var i = _.map([1, 2, 3], function(num){ return num + 1; });
console.log(i);
//  2, 3, 4

var j = _.map({ one: 1, two: 2, three: 3 }, function(num, key){ return num + 1; }); 
console.log(j);
//[2, 3, 4]

_.map = _.collect = function(obj, iterator, context) {
  var results = [];
  if (obj == null) return results;
  if (nativeMap && obj.map === nativeMap) return obj.map(iterator, context);
  each(obj, function(value, index, list) {
    results.push(iterator.call(context, value, index, list));
  });
  return results;
};
```

###reduce   
**alias: inject, foldl**  
把列表中元素归结为一个简单的数值。Memo 是 reduce 函数的初始值，reduce 的每一步都需要由 iterator 返回。
```js
var sum = _.reduce([1, 2, 3], function(num1, num2){ return num1 + num2; }, 0);
console.log(sum);
// 6

_.reduce = _.foldl = _.inject = function(obj, iterator, memo, context) {
  var initial = arguments.length > 2;
  if (obj == null) obj = [];
  if (nativeReduce && obj.reduce === nativeReduce) {
    if (context) iterator = _.bind(iterator, context);
    return initial ? obj.reduce(iterator, memo) : obj.reduce(iterator);
  }
  each(obj, function(value, index, list) {
    if (!initial) {
      memo = value;
      initial = true;
    } else {
      memo = iterator.call(context, memo, value, index, list);
    }
  });
  if (!initial) throw new TypeError(reduceError);
  return memo;
};
```

###any  
**alias: some**  
如果有任何一个元素通过通过 iterator 的真值检测就返回true。如果存在原生的some方法，则委托给some。
```js
var r = _.any([2, 1, 13], function(num){ return num % 2 == 0; });
// true

var any = _.some = _.any = function(obj, iterator, context) {
  iterator || (iterator = _.identity);
  var result = false;
  if (obj == null) return result;
  if (nativeSome && obj.some === nativeSome) return obj.some(iterator, context);
  each(obj, function(value, index, list) {
    if (result || (result = iterator.call(context, value, index, list))) return breaker;
  });
  return !!result;
};
```

