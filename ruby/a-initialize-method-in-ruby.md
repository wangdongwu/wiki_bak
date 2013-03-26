这是一种ruby中的 `initialize` 方式。

用这种 `attributes = {}` 的方式可以更好的建立对象的属性。
```ruby
class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end

a_new_user = User.new(:name => "some_name", :email => "some_email")
```