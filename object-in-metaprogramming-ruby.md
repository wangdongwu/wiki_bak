```ruby
Class.superclass # => Module
Class.superclass # => Module
Module.superclass # => Object

Class.new.methods - Module.new.methods # => [:yaml_tag, :allocate, :new, :superclass]
```
```sh
[1] pry(main)> class A; end
=> nil
[2] pry(main)> A.ancestors
=> [A, Object, PP::ObjectMixin, Kernel, BasicObject]
```
-

- 一个 **类** 只不过是一个增强的 **Module** ，增加了四个方法——new()、allocate()、superclass()、yaml_tag()而已。
- 什么是对象？对象无非就是一组实例变量外加一个指向其类的引用。
- 什么是类？类无非就是一个对象（Class类的一个实例）外加一组实例方法和一个对其超类的引用。
- 对象的方法并不存在于对象本身，而是存在于对象的类中。在类中，这些方法被称为类的实例方法。
- **Class** 类是 **Module** 类的子类，因此一个类也是一个模块。
- Object类包含了Kernel模块，因此Kernel就进入了每个对象的祖先链。如果给Kernel模块增加一个方法，这个 **内核方法（Kernel Method）** 就对所有对象可用。
- 当调用一个方法时，接收者会扮演 **self** 的角色。
- 当定义一个模块（或者类）时，该模块扮演 **self** 的角色。
- 实例变量永远都被认定为 **self** 的实例变量。
- 任何没有明确指定接受者的方法调用，都当成是调用 **self** 的方法。


