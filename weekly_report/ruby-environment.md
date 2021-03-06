##开发环境配置总结

1. 原机器已经安装好Ubuntu12.04，添加新用户，添加163的源。
```sh
$ sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
$ sudo gedit /etc/apt/sources.list
```

2. 更新系统，重启。  
```sh
$ sudo apt-get update
$ sudo apt-get upgrate 
$ sudo apt-get dist-upgrade  
$ sudo reboot
```

3. 安装RVM，git，gitflow。 
```sh
$ sudo apt-get install curl git-core
$ sudo curl -L get.rvm.io | bash -s stable
$ sudo apt-get install git-flow
```

4. 添加github的 [SSH keys](https://github.com/settings/ssh)。

5. 安装Ruby，替换为[ruby淘宝源](http://ruby.taobao.org/)。  
```sh
$ rvm requirements
$ sed -i 's/ftp\.ruby-lang\.org\/pub\/ruby/ruby\.taobao\.org\/mirrors\/ruby/g' ~/.rvm/config/db
$ rvm install 1.9.3
$ rvm --default use 1.9.3
$ gem source -r https://rubygems.org/
$ gem source -a http://ruby.taobao.org
$ gem update --system
```

6. 安装 Vim，Sublime Text2。
```sh
$ sudo apt-get install vim
$ sudo add-apt-repository ppa:webupd8team/sublime-text-2
$ sudo apt-get update
$ sudo apt-get install sublime-text
```

7. 下载 [Koans](http://rubykoans.com/)。  
Koans学习记录见[[Ruby Koans 学习记录|ruby-koans]]。

8. 下载 [underscore.js](http://underscorejs.org/)。阅读代码，一头雾水，各种不懂，balabalabala。  
Underscore学习记录见[[Underscore 学习记录|underscore]]

9. 学习git，[Pro Git 简体中文版](http://iissnan.com/progit/)。  
git学习记录见[[git 学习记录|git]]


