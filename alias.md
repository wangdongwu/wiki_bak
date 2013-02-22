在 **alias** 语法中，第一个出现的是方法的新名字，第二个出现的是原始的名字。

注意： **alias** 是一个关键字，而非一个方法。这就是为什么两个方法名之间没有逗号的原因。

**环绕别名(Around Alias)**  
1. 给方法定义一个别名。
2. 重定义这个方法。
3. 在新的方法中调用老的方法。

```ruby
class Fixnum

  alias :old_plus :+

  def +(value)
    self.old_plus(value).old_plus(1)
  end
end

require 'test/unit'

class BrokenMathTest < Test::Unit::TestCase

  def test_math_is_broken
    assert_equal 3, 1 + 1
    assert_equal 1, -1 + 1
    assert_equal 111, 100 + 10
  end
end
```