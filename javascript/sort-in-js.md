在默认情况下，sort()方法按升序排列数组项——即最小的值位于最前面，最大的值位于最后面。    
为了实现排序，sort()方法会调用每个数组项的 toString()转型方法，然后比较得到的字符串，以确定如何排序。   
即使数组中的每一项都是数值，sort()方法比较的也是字符串，如下所示：
```js
var values = [0, 1, 5, 10, 15];
values.sort();
alert(values);  //0, 1, 10, 15, 5
```

sort()方法可以接收一个比较函数作为参数，一遍我们指定哪个值位于哪个值的前面。  
比较函数接收两个参数，如果第一个参数应该位于第二个之前则返回一个负数，如果两个参数相等则返回0，如果第一个参数应该位于第二个参数之后则返回一个正数。
```js
function createComparisonFunction(propertyName) {
  return function(object1, object2) {
    var value1 = object1[propertyName];
    var value2 = object2[propertyName];

    if (value1 < value2) {
      return -1;
    } else if (value1 > value2) {
      return 1;
    } else {
      return 0;
    }
  };
}

var data = [{name: "Bill", age: 28}, {name: "Spirit", age: 24}];
data.sort(createComparisonFunction("name"));
alert(data[0].name);

data.sort(createComparisonFunction("age"));
alert(data[0].name);
```