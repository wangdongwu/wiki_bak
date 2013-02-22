**动态方法** 和 **动态派发**

这里注意 `send()` 方法:  
**`send()` 方法的第一个参数是你要发送给对象的消息，也就是方法的名字，所有剩下的参数（以及代码快）会直接传递给调用的方法。**

通过 `send()` 方法，你想调用的方法名可以成为一个参数，这样就可以在代码运行期间，直到最后一刻才决定调用哪个方法。这种技术称为 **动态派发(Dynamic Dispatch)** 。

可以利用 `Module#define_method()` 方法定义一个方法，只需要为其提供一个方法名和一个充当方法主体的块而已，这种在运行时定义方法的技术称为 **动态方法(Dynamic Method)** 。

```ruby
class Computer

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) do 
      Computer.define_componment $1
    end
  end

  def self.define_componment(name)
  
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info} ($#{price})"
      return " * #{result}" if price >= 100
      result
    end
  end
end
```

**动态代理** 和 **白板**

一个捕获幽灵方法调用并把它们转发给另外一个对象的对象（有时也会在转发前后包装一些自己的逻辑），称为 **动态代理(Dynamic Proxy)** 。

当一个幽灵方法和一个真实方法发生名字冲突时，后者会胜出。如果不需要那个继承来的方法（真实方法），则可以通过删除它来解决这个问题。为了安全起见，应该在代理类中删除大多数继承来的方法。这就是所谓的 **白板(Blank Slate)** 类。可以使用 `Module#undef_method()` 方法，它会删除所有的（包括继承来的）方法；也可以使用 `Module#remove_method()` 方法，它只会删除接收者自己的方法，保留继承来的方法。 **可以直接继承 `BasicObject` 类来获得白板类** 。

```ruby
class Computer

  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?|/
  end

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super if !respond_to?(name)
    info = @data_source.send("get_#{name}_info", args[0])
    price = @data_source.send("get_#{name}_price", args[0])
    result = "#{name.to_s.capitalize}: #{info} ($#{price})"
    return " * #{result}" if price >= 100
    result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end
```