###Rake简介

**[Rake](http://rake.rubyforge.org/)** 的意思是Ruby Make，一个用Ruby开发的代码构建工具。也是一个任务管理工具，通过Rake可以获得两个好处：  

> 1. 以任务的方式创建和运行脚本。  
2. 追踪和管理任务之间的依赖。  


###Rake脚本编写

创建一个名为 **rakefile** 的文件(Rake会在当前路径下寻找名叫Rakefile、rakefile、RakeFile.rb和rakefile.rb的rake文件)。  
输入如下内容:  
```ruby
desc "the task01"
task :task01 do
  puts "this is task01".inspect
end

desc "the task02"
task :task02 do
  puts "this is task02".inspect
end

desc "the task03"
task :task03 do
  puts "this is task03".inspect
end
```
打开命令行工具，进入文件所在的目录，运行以下命令:
```sh
>> rake task01
=> "this is task01"
>> rake task02
=> "this is task02"
>> rake task03
=> "this is task03"
```
desc是Rake定义的方法，表示对下面定义任务的描述。这个描述会在使用 **rake --tasks(或者rake -T)** 命令时输出在屏幕上:
```sh
>> rake --tasks 
=> rake task01  # the task01
=> rake task02  # the task02
=> rake task03  # the task03
```
加入依赖关系:  
```ruby
desc "the task01"
task :task01 do
  puts "this is task01".inspect
end

desc "the task02"
task :task02 => :task01 do
  puts "this is task02".inspect
end

desc "the task03"
task :task03 => :task02 do
  puts "this is task03".inspect
end
```
```sh
>> rake task03
=> "this is task01"
=> "this is task02"
=> "this is task03"
```

