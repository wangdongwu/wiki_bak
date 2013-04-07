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

**about_modules.rb**

```ruby
module Moo
  def self.included(klass)
    #WRITE CODE HERE
    klass.extend(ClassMethods)
  end
  # 注意module不能定义在def里面...囧
  module ClassMethods
    def class_method
      :class_value
    end
  end

  def instance_method
    :instance_value
  end
end
```

**about_define_method**

```ruby
# 注意，这里构造了一个类宏
module Accessor
  def my_writer(name)
    ivar_name = "@#{name}"
    define_method "#{name}=" do |value|
      instance_variable_set(ivar_name, value)
    end
  end

  def my_reader(name)
    ivar_name = "@#{name}"
    define_method name do
      instance_variable_get(ivar_name)
    end
  end
end

class Cat
  extend Accessor
  my_writer :name
  my_reader :name
end

def test_instance_variable_set_and_instance_variable_get_can_be_used_to_access_ivars
  cat = Cat.new
  cat.name = 'Fred'
  assert_equal 'Fred', cat.name
end
```

**about_method_added.rb**

```ruby
class Cat
  @num_of_methods = 0

  # 注意这里定义了自己的method_added方法
  def self.method_added(name)
    @num_of_methods += 1
  end

  def miaow
  end

  def speak
  end

  def self.num_of_methods
    @num_of_methods
  end
end

def test_method_added_hook_method_is_called_for_new_methods
  assert_equal 2, Cat.num_of_methods
end
```