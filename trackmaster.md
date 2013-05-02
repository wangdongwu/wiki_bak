###关于Surveyapi源码中的一些个人理解

1. controllers里面的 befores_controller.rb  

befores_controller.rb里面是这样写的
```ruby
module Surveyapi
  class BeforesController < Sinatra::Base

    before do
      # authorize
    end

  end
end
```
但是无论我怎么before里面的语句，在其他所有controller里面都不起作用，只有把before放在单个controllerl里面才起作用，奇怪的是强哥那边直接添加就可以起到全局before的作用，后来问了下秋哥，说是 **不同机器Sinatra加载controller的顺序不一致** ，最好是把全局的before放到application.rb里面去，如下：
```ruby
module Surveyapi
  class Application < Sinatra::Base
    superclass.before do 
      # authorize
    end
  end
end
```

2. 统一 Ruby1.9 之后的hash表示法

源码中发现有些地方hash用的是1.8风格，有些地方用的是1.9风格，我认为应该统一风格，以方便查看。另外，新的 Hash 字面值只针对于符号键。
```ruby
{ :key => value } # Ruby 1.8
{ key: value } # Ruby 1.9+
```
PS: Hash也有序了
> 在 1.8 中，Hash 对象即是使用分离链接法解决哈希碰撞的散列表。表中每一项需要四个东西：散列码、键的引用、值的引用、下一个散列码相同的元素的引用。为了实现有序的散列表，Ruby 1.9 在表的元素结构体中增加了两个新的指针：指向按顺序排列的前一个和后一个元素的指针，这使得在对散列表进行插入和删除操作时能够维护一个有序的链，实际上就是一个和旧的散列表结构穿插在一起的双向循环链表结构，这两种结构的并集就是新的 Hash 结构了。这个改动的代价是：1.9 的 Hash 的 插入和删除变得更慢了些。这个改动的好处是：Hash 的遍历、迭代、枚举也有序了，它保持了创建 Hash 时元素的先后顺序。同时，因为内部维护着双向循环链表，1.9 遍历 Hash 的速度也比 1.8 快，因为 1.8 必须要遍历整个散列表的桶，自然也就必须经过一些空的桶槽位


3. 一些语法糖及方法inject的使用

|| 语法糖
```ruby
passwd = request.cookies['passwd']
passwd ||= params[:passwd]
passwd ||= find_posts[:passwd]

# 直接写成
passwd = request.cookies['passwd'] || params[:passwd] || find_posts[:passwd]
```
inject方法
```ruby
hash = {}
attributes.each do |key, value|
  field = fields[key]
  accessors = field.options[:accessor] if field
  if accessors && accessors.include? accessor
    hash[field.name.to_sym] = value
  end
end
hash

# 可以修改为下面这样，我没有改这个函数。
# 上面的可能更加直观，但是却多了hash临时变量。
# 我还没有去确认临时变量的引用对Ruby的GC机制会不会造成性能影响
# 不过发现有大量的临时变量肯定是要进行修改的
attributes.inject({}) do |memo, values|
  field = fields[values.first]
  accessors = field.options[:accessor] if field
  if accessors && accessors.include? accessor
    memo[field.name.to_sym] = values.last
  end
  memo
end
```

4. 行数超过一屏的大方法

行数超过一屏的大方法真的很丑...而且比较难懂...
modles/answer.rb 中的 add 方法
modles/prelogic.rb 中的 get_visible_questions 方法


