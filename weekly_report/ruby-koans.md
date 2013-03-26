##Ruby Koans学习记录

这里记录一些学习Ruby Koans中的体会，完成Koans花费时间大概为8h。在 **about_proxy_object_project.rb**那里卡了一下。发现应该使用 **method_missing** 元编程技术。

-

**about_array_assignment.rb**  
以数组方式并行赋值，以前没有注意到。
```ruby
def test_parallel_assignments
  first_name, last_name = ["John", "Smith"]
  assert_equal "John", first_name
  assert_equal "Smith", last_name
end

def test_parallel_assignment_with_one_variable
  first_name, = ["John", "Smith"]
  assert_equal "John", first_name
end
```

**about_arrays.rb**  
当 start 超过数组长度时返回 nil
```ruby
def test_slicing_arrays
  array = [:peanut, :butter, :and, :jelly]
  assert_equal [], array[4,0]
  assert_equal [], array[4,100]
  assert_equal nil, array[5,0]
end
```

**about_class.rb**  
string version中，instance_eval的参数是字符串，这种方式没有用过，一般用block version
```ruby
def test_you_can_rip_the_value_out_using_instance_eval
  fido = Dog2.new
  fido.set_name("Fido")
  assert_equal "Fido", fido.instance_eval("@name")  # string version
  assert_equal "Fido", fido.instance_eval { @name } # block version
end
```

**about_hashes.rb**  
这种建立hash的方式非常好，hash中的value直接被初始化成了[]，可以直接改成自己想要的形式。
```ruby
def test_default_value_with_block
  hash = Hash.new {|hash, key| hash[key] = [] }
  hash[:one] << "uno"
  hash[:two] << "dos"
  assert_equal ["uno"], hash[:one]
  assert_equal ["dos"], hash[:two]
  assert_equal [], hash[:three]
end
```

**about_proxy_object_project.rb**  
重点在method_missing中的super
```ruby
class Proxy
  def initialize(target_object)
    @object = target_object
    @messages = []
  end

  def method_missing(method_name, *args, &block)
    if @object.respond_to? method_name
      @messages << method_name
      @object.send(method_name, *args)
    else
      super(method_name, *args, &block)
    end
  end
end
```

**about_regular_expressions.rb**  
正则的另一种表现形式，匹配不成功直接返回nil。平时用的比较多的是 obj =~ //
```ruby
def test_a_regexp_can_search_a_string_for_matching_content
  assert_equal "match", "some matching content"[/match/]
end

def test_a_failed_match_returns_nil
  assert_equal nil, "some matching content"[/missing/]
end
```

**about_scoring_project.rb**  
写了个比较搓的代码...
```ruby
def score(dice)
  point = 0
  hash = Hash.new {|hash, key| hash[key] = 0 }
  dice.each { |i| hash[i] += 1 }
  hash.each do |k, v|
    if k == 1
      if v >= 3
        point = point + 1000 + 100 * (v - 3)
      else
        point = point + 100 * v
      end
    elsif k == 5
      if v >= 3
        point = point + 100 * 5 + 50 * (v - 3)
      else
        point = point + 50 * v
      end
    elsif k != 1 && k != 5 && v >= 3
      point = point + 100 * k
    else
      next
    end
  end
  point
end
```