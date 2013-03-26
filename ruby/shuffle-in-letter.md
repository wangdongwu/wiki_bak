```ruby
def shuffle_in_letter
  ('a'..'z').to_a.shuffle[0..7].join
end

puts shuffle_in_letter.inspect
```