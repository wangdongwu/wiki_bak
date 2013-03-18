##开发环境配置总结

1. 原机器已经安装好Ubuntu12.04，添加新用户，更新为163的源。
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
4. 添加github的SSH keys。
5. 安装Ruby，替换ruby淘宝源
```sh
$ rvm requirements
$ sed -i 's/ftp\.ruby-lang\.org\/pub\/ruby/ruby\.taobao\.org\/mirrors\/ruby/g' ~/.rvm/config/db
$ rvm install 1.9.3
$ rvm --default use 1.9.3
$ gem source -r https://rubygems.org/
$ gem source -a http://ruby.taobao.org
$ gem update --system
```
6. 下载Koans