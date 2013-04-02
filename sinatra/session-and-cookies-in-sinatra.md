**Sessions**

You can enable sessions via the **configure** block. Once enabled, the session object can be used to store and retrieve values.

```ruby
require 'sinatra'

configure do
  enable :sessions
end

before do
  content_type :txt
end

get '/set' do
  session[:foo] = Time.now
  "Session value set."
end

get '/fetch' do
  "Session value: #{session[:foo]}"
end

get '/logout' do 
  session.clear
  redirect '/fetch'
end
```

**Cookies**

```ruby
require 'sinatra'

get '/' do
  response.set_cookie "foo", "bar"
  "Cookie set. Would you like to <a href='/read'>read it</a>?"
end

get '/read' do
  "Cookie has a value of: #{request.cookies['foo']}."
end

get '/delete' do
  response.delete_cookie "foo"
  "Cookie has been deleted."
end
```