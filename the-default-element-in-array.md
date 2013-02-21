注意这样一种初始化数组的方式：
```ruby
arr = Array.new(3, "abc")
puts arr.inspect # => ["abc", "abc", "abc"]
arr[0] << "123"
puts arr.inspect # => ["abc123", "abc123", "abc123"]
arr[0] = "123"
puts arr.inspect # => ["123", "abc123", "abc123"]
```
为什么会出现这样的情况呢？  
当用`Array.new`的第二个参数来对数组的多个元素进行初始化时(如`Array.new(3, "abc")`)，数组的所有元素都被初始化为同一个对象。  
如果执行`arr[0] << "123"`，那么在数组中的所有元素也都被改变了，因为它们 **指向** 同一个字符串对象。  

要用这样的方式，该代码块会被执行三次，每次产生一个新的字符串(含有同样的字符，但指向的是不同的字符串对象)：
```ruby
arr = Array.new(3) { "abc" }
```

