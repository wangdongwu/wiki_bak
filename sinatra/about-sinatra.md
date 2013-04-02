```ruby
require 'sinatra'

before do
  content_type :txt
  @defeat = {
    rock:     :scissors,
    paper:    :rock,
    scissors: :paper
  }
  @throws = @defeat.keys
end

get '/throw/:type' do
  player_throw = params[:type].to_sym

  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end

  computer_throw = @throws.sample

  if player_throw == computer_throw
    "You tied with the computer. Try again!"
  elsif computer_throw == @defeat[player_throw]
    "Nicely done; #{player_throw} beats #{computer_throw}!"
  else
    "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
  end
end
```

###简介

Sinatra是一个基于Ruby语言，以最小精力为代价快速创建web应用为目的的DSL(domain-specific language)。

Sinatra不是一个框架，它没有内建的ORM层(object-relational mapper)，没有预配置文件等

Sinatra does not force you to adhere to the model-view-controller pattern, or any other pattern for that matter. It is a lightweight wrapper around Rack middleware and encourages a close relationship between service endpoints and the HTTP verbs, making it particularly ideal for web services and APIs(application programming interfaces).
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

###路由

Routes in your application are matched in top-down order; the first route that matches the incoming request is the one that gets used.

**Common Route Definition**

```ruby
require 'sinatra'

get '/' do
  "Triggered via GET"
end

post '/' do
  "Triggered via POST"
end

put '/' do
  "Triggered via PUT"
end

delete '/' do
  "Triggered via DELETE"
end

patch '/' do
  "Triggered via PATCH"
end

options '/' do
  "Triggered via OPTIONS"
end
```

**Route with Parameters**

```ruby
require 'sinatra'

get '/:name' do
  "Hello, #{params[:name]}"
end

post '/login' do
  username = params[:username]
  password = params[:password]
end

put '/user/:id' do
  u = User.find(params[:id])
  u.first_name = params[:first_name]
  u.last_name  = params[:last_name]
  u.save
end
```