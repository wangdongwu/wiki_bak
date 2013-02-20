> Use ClassName. **instance_eval** to define **class** methods.

> Use ClassName. **class_eval** to define **instance** mehtods.

Here are some examples:

```ruby
# Defining a class method with instance_eval
Fixnum.instance_eval { def ten; 10; end }
Fixnum.ten  # => 10

# Defining an instance method with class_eval
Fixnum.class_eval { def number; self; end }
10.number # => 10
```

---

instance_eval也可以用作为 **上下文探针(Context Probe)** 

```ruby
class Loan

  def initialize(book)
    @book = book
    @time = Time.now
  end

  def to_s
    "#{@book.upcase} loaned on #{@time}"
  end
end

require 'test/unit'

class TestLoan < Test::Unit::TestCase

  def test_conversion_to_string
    loan = Loan.new('War')
    loan.instance_eval { @time = "2013" }
    assert_equal 'WAR loaned on 2013', loan.to_s
  end
end
```

---


define_method的一个例子:

```ruby
class CallBacker

  def make_callback(obj, meth)
    # Note: define_method is defined on Class, not object.
    metaclass = class << self; self; end
    metaclass.send(:define_method, :callback) do
      obj.send(meth)
    end
  end
end

callbacker = CallBacker.new
callbacker.make_callback("   hello    ", :strip)
callbacker.callback # => "hello"

## anther method based on ruby 1.9
class CallBacker

  def make_callback(obj, meth)
    define_singleton_method :callback do
      obj.send(meth)
    end
  end
end
```

---

对class_eval的一些探究

```ruby
Module.instance_methods(true).grep(/class_eval/) # => [:class_eval]
Module.instance_methods(false).grep(/class_eval/) # => [:class_eval]

Class.instance_methods(true).grep(/class_eval/) # => [:class_eval]
Class.methods(false).grep(/class_eval/) # => []

Module.methods(true).grep(/class_eval/) # => [:class_eval]
Module.methods(false).grep(/class_eval/) # => []
```

可见，Module类中有实例方法class_eval，Class类继承Module类，因此Class类有实例方法class_eval，从而String等类有类方法String.class_eval，又因为Module是一个类，因此Module类有类方法Module.class_eval。

----


一个用define_method重构的例子

```ruby
class Book

  def title
  end

  def subtitle
  end

  define_singleton_method(:deprecate) do |old_method, new_method|
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end

  deprecate :TITLE, :title
  deprecate :SubTitle, :subtitle
end

Book.new.TITLE # => Warning: TITLE() is deprecated. Use title().
```

---

一个解释define_singleton_method的例子

```ruby
class A
  class << self
    def class_name
      to_s
    end
  end
end
A.define_singleton_method(:who_am_i) do
  "I am: #{class_name}"
end
A.who_am_i   # =>  "I am: A"

guy = "Bob"
guy.define_singleton_method(:hello) { "#{self}: Hello there!" }
guy.hello    # =>  "Bob: Hello there!"
```


