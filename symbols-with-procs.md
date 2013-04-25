```ruby 
string = %w(1 2 3)
nums = string.map(&:to_I)
nums   # => [1, 2, 3]
```
By mapping `&:to_i` over every element of `strings` , we turned each string into an integer!