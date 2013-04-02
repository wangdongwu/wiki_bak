**It's important to note that the name of the view must be a symbol.**

**Inline Templates**

Inline templates, unsurprisingly, are defined in the application code file itself.

```ruby
require 'sinatra'

get '/' do
  erb :index
end

__END__

@@index

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Inline template</title>
  </head>
  <body>
    <h1>Worked!</h1>
  </body>
</html>
```

**External View Files**

If you'd prefer to store your views externally, Sinatra will look for them by default in the **"view"** subfolder.

```ruby
require 'sinatra'

get '/index' do 
  erb :index
end

# This code will look for files called profile.erb 
# and help.erb in "/views/user"
get '/:user/profile' do
  erb '/user/profile'.to_sym
end

get '/:user/help' do
  erb :'/user/help'
end
```

**Passing Data into Views**

```ruby
require 'sinatra'

get '/index' do 
  @name = 'Spirit'
  erb :index
end
```

**Filter**

```ruby
require 'sinatra'

before do 
  @name = 'Spirit'
end

after do 
  @name = 'Spirit'
end
```
