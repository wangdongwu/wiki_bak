#
# 随机排列字符串
#

class String
  def shuffle
    self.split('').shuffle.join
  end
end

p "test_for_string".shuffle