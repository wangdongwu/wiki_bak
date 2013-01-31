#
# $ rails console --sandbox
# 进入沙盒模式

# 在对modle进行测试时，需要创建测试数据库
# $ rake db:test:prepare

validates :email, presence: true,
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
# 验证 Email 地址的唯一性，不区分大小写, 直接把 true 换成了 case_sensitive: false，
# Rails 会自动指定 :uniqueness 的值为 true。

# 唯一性验证无法真正保证唯一性。

# 1. Alice 用 alice@wonderland.com 注册；
# 2. Alice 不小心按了两次提交按钮，连续发送了两次请求；
# 3. 然后就会发生下面的事情：请求 1 在内存中新建了一个用户对象，通过验证；请求 2 也一样。
# 请求 1 创建的用户存入了数据库，请求 2 创建的用户也存入了数据库。
# 4. 结果是，尽管有唯一性验证，数据库中还是有两条用户记录的 Email 地址是一样的。

# 相信我，上面这种难以置信的过程是可能会发生的，只要有一定的访问量，在任何 Rails 网站中都可能发生。
# 幸好解决的办法很容易实现，只需在数据库层也加上唯一性限制。
# 我们要做的是在数据库中为 email 列建立索引，然后为索引加上唯一性限制。