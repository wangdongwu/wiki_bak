```ruby
class String
  def shuffle
    self.split('').shuffle.join
  end
end

p "test_for_string".shuffle
```