
# 查找Module中的方法并输出

module TestModule
  def module_method
  end
end

class MyClass

  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|^method|object_id/
  end

  include TestModule
end

a = MyClass.new
a.methods.each do |m|
  next if m =~ /^__|^method|object_id/
  file, line =  a.method(m).source_location
  puts "Method #{m} is defined in #{file}, line #{line}"
end

