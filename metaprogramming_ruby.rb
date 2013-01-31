#
# 学习元编程的一些笔记
#

p Class.superclass # => Module
p Module.superclass # => Object

# 一个类只不过是一个增强的Module，增加了三个方法——new()、allocate()、superclass()而已。
# 这几个方法可以创建对象并把它们纳入类体系架构中。
# 除此之外，类和模块基本上是一样的，绝大多数适用于类的内容也同样适用于模块。

# 什么是对象？对象无非就是一组实力变量外加一个指向其类的引用。
# 对象的方法并不存在于对象本身，而是存在于对象的类中。
# 在类中，这些方法被称为类的实例方法。

# 什么是类？类无非就是一个对象（Class类的一个实例）外加一组实例方法和一个对其超类的引用。
# Class类是Module类的子类，因此一个类也是一个模块。

puts Kernel.private_instance_methods