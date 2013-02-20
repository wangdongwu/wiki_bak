`$ rails console --sandbox`
 进入沙盒模式

`$ rake db:test:prepare`
在对modle进行测试时，需要创建测试数据库  

```ruby
validates :email, presence: true,
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
```
验证 Email 地址的唯一性，不区分大小写, 直接把 true 换成了 case_sensitive: false，Rails 会自动指定 :uniqueness 的值为 true。
