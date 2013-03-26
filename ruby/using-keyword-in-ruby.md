用 **内核方法** 可以伪造一个关键字。

`Kernel#using()` 方法以待管理的资源作为参数。它还要接受一个块，在那里执行代码。

无论块中的代码是否正常执行完成，`ensure` 语句都会调用 `resouce` 的 `dispose()` 方法来释放它。

如果发生了异常，`Kernel#using()` 方法还会把这个异常重新抛出给调用者。

```ruby
module Kernel
  def using(resource)
    begin
      yield if block_given?
    ensure
      resource.dispose
    end
  end
end

require 'test/unit'

class TestUsing < Test::Unit::TestCase
  class Resource
    def dispose
      @disposed = true
    end

    def disposed?
      @disposed
    end
  end

  def setup
    @r = Resource.new
  end

  def test_disposes_of_resources
    using(@r) {}
    assert @r.disposed?
  end

  def test_disposes_of_resources_in_case_of_exception
    assert_raises(Exception) {
      using(@r){
        raise Exception
      }
    }
    assert @r.disposed?
  end
end
```