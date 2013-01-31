#
# 一种好的初始化方式
#

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