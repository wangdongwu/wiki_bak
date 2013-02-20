Railscasts中的一个技巧 [to_proc](http://railscasts.com/episodes/6-shortcut-blocks-with-symbol-to-proc)，以为只是在Rails中才有，后来用编辑器试了试，Ruby 1.9 中也有这个技巧。

一个&符号后面跟着一个名字，叫做 **to_proc** 。

```ruby
class Project < ActiveRecord::Base
  has_many :tasks

  def self.all_names
    find(:all).collect(&:name)
  end
end
```
```sh
>> projects = Project.find(:all)
=> [#<Project id: 1, name: "Write another ASCIIcast", created_at: "2008-12-29 09:32:47", updated_at: "2008-12-29 09:32:47">, #<Project id: 2, name: "Go out walking", 
>> projects.collect { |p| p.name }
=> ["Write another ASCIIcast", "Go out walking"]
```
to_proc允许给一段需要传递给代码块的逻辑起一个名字，这样写在代码块中的逻辑就可以定义在其他地方，代码块中只需传入&逻辑名字的参数了。注意以下的链式调用：

```sh
>> projects.collect {&:name}
=> ["Write another ASCIIcast", "Go out walking"]
>> projects.collect(&:name).collect(&:upcase)
=> ["WRITE ANOTHER ASCIICAST", "GO OUT WALKING"]
```
不仅仅局限于collect方法，所有代码块都可以使用to_proc。

```ruby
projects.each(&:save!)
```
----
在 Ruby 1.9 中也有同样的 **to_proc** 
```ruby
class MyArrBlock
  attr_accessor :name
end

a = MyArrBlock.new
a.name = "aaa"
b = MyArrBlock.new
b.name = "bbb"
arr_name = [a, b].collect(&:name)
p arr_name # => ["aaa", "bbb"]
```


