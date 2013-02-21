这个将具体动作提取出来，放入它自己的对象中的方法就是命令模式的精华。

这个模式将那些变动的东西（即那些当按钮被按下时我们希望发生的事情）从不变的东西（GUI框架提供的标准按钮）中分离出来。

因为按钮和命令之间的关联存在于运行时。所以很容易改变这种关联。
```ruby
#
# Command
#

class SlickButton

  attr_accessor :command

  def initailize(command)
    @command = command
  end

  def on_button_push
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    #
    # save
    #
  end
end

save_button = SlickButton.new(SaveCommand.new)
```
---
记录操作命令

我们要跟踪将要做的事情和已经做过的事情，需要一个类来收集这些命令。

实现撤销操作的方法是在我们创建的每一个可以撤销的命令都包含两个方法。

其一是处理事情的execute方法。伴随这个方法，加入unexecute方法，用于撤销已经执行的操作。

重做是使你恢复你的想法并且在此执行之前被撤销操作的能力。要实现重做，我们只需要从最后撤销的那个命令开始重新执行它。

```ruby
class Command

  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise 'Abstract method called'
  end

  def unexecute
    raise 'Abstract method called'
  end
end

class CreateFile < Command

  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

class DeleteFile < Command

  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    if File.exist?(@path)
      @contents = File.read(@path)
    end
    File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@contents)
      f.close
    end
  end
end

class CopyFile < Command

  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    if File.exist?(@source)
      @contents = File.read(@source)
    end
    FileUtils.copy(@source, @target)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@contents)
      f.close
    end
    File.delete(@target)
  end
end


class CompositeCommand < Command

  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  # 这里的unexecute方法其实就是execute方法的反向处理。
  # 请注意，在我们遍历所有的子命令之前，先将它们反序。因为我们想要从最近的一个操作开始撤销直到最早的那个操作。
  def unexecute
    @commands.reverse.each { |cmd| cmd.unexecute }
  end

  def description
    description = ''
    @commands.each do |cmd|
      description += cmd.description + "\n"
    end
  end
end
```