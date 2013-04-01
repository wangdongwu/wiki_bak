###简介

Sinatra是一个基于Ruby语言，以最小精力为代价快速创建web应用为目的的DSL。
```ruby
# myapp.rb
require 'sinatra'

get '/' do
  'Hello world!'
end
```
安装gem然后运行：
```sh
gem insatll sinatra
ruby myapp.rb
```
在该地址查看：[localhost:4567](http://localhost:4567/)