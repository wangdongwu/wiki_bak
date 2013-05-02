###关于Surveyapi源码中的一些个人理解

1. controllers里面的 befores_controller.rb  
befores_controller.rb里面是这样写的
```ruby
module Surveyapi
  class BeforesController < Sinatra::Base

    before do
      # authorize
    end

  end
end
```
但是无论我怎么before里面的语句，在其他所有controller里面都不起作用，只有把before放在单个controllerl里面才起作用，奇怪的是强哥那边直接添加就可以起到全局before的作用，后来问了下秋哥，说是 不同机器Sinatra加载controller的顺序不一致，最好是把全局的before放到application.rb里面去，如下：
```ruby
module Surveyapi
  class Application < Sinatra::Base
    superclass.before do 
      # authorize
    end
  end
end
```

