###Metaprogramming Koans

**about_metaclass.rb**

```ruby
class ::Object

  def metaclass
    class << self ; self ; end
  end

  def meta_eval(&block)
    metaclass.instance_eval(&block)
  end

  # Add methods to metaclass
  def meta_def name, &block
    meta_eval { define_method name, &block }
  end

  # Defines an instance method within a class
  def class_def name, &block
    class_eval { define_method name, &block }
  end
end
```

**about_class_as_constant.rb**

```ruby
class Foo; end
# 注意defined?的返回值
defined?(Foo)   # => "constant"
```