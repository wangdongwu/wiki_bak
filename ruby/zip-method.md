**zip(*args) public**

Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument. This generates a sequence of self.size n-element arrays, where n is one more that the count of arguments. If the size of any argument is less than enumObj.size, nil values are supplied. If a block is given, it is invoked for each output array, otherwise an array of arrays is returned.

```ruby
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
a.zip(b)           #=> [[4, 7], [5, 8], [6, 9]]
[1,2,3].zip(a, b)  #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1,2].zip(a,b)     #=> [[1, 4, 7], [2, 5, 8]]
a.zip([1,2],[8])   #=> [[4,1,8], [5,2,nil], [6,nil,nil]]
```