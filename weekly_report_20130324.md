##本周工作
---
- 进入新环境
- Koans，Koans
- Git学习
- Underscore.js

##下周安排
---
- Underscore.js
- Linux学习
- 项目组任务

##本周心得
---
这周学的东西较多，与新同事讨论了很多问题，感觉非常充实。同一批的新同事都是高手，鸭梨山大啊啊啊

##Support 2013/03/18
---
###触摸板
从HR MM手中接过 **厚实** 的笔记本，开机，顿时就傻眼了。触摸板失灵！Fn键怎么按都无效，问几个同事都不会弄。赶紧上前台要了个鼠标接上，用着用着越想越觉得不方便，带着本去哪都得拿着鼠标。google了一下解决办法，说是驱动问题，xxx，这咋弄，想到之前windows下的起死回生大法——重装系统，借了个U盘一试，又傻眼了，UEFI的bios，引导安装ubuntu太麻烦...此路不通，继续google。后来找到了个解决办法：
> 有可能是关机前触摸板就处于关闭状态，这种情况下先打开触摸板，再重启一次系统触摸板就能恢复工作 。 
`sudo modprobe -r psmouse`  
`sudo modprobe psmouse proto=imps`  
`sudo gedit /etc/modprobe.d/options`  
添加 options psmouse proto=imps  
保存改动重启。

果然有效啊，赶紧弄好，开始做Ruby Koans的题目，噼里啪啦的敲键盘，然后鼠标就开始乱飞，原来这笔记本设计有问题，敲键盘的时候手指容易碰到触摸板，难怪之前这台笔记本的主人要禁止触摸板功能。不爽，就没有两全其美的办法？继续找啊找，找到个 **Touchpad Indicator**软件：
> `sudo add-apt-repository ppa:atareao/atareao` 
`sudo apt-get update`  
`sudo apt-get install touchpad-indicator `

异常好使，有图为证
![Alt text](http://pic.55.la/upload/temp/2013/03/24/13/100004590535864.jpg)

##Support 2013/03/19 & 2013/03/20
---
###Ruby Koans
这两天大部分时间都在完成Ruby Koans，先前Ruby学了大概一年半，发现Koans中的很多ruby细节自己都疏忽了，有些概念一知半解。  
记录一下[Ruby Koans的收获](https://github.com/NaixSpirit/wiki/blob/master/ruby-koans.md)。


##Support 2013/03/21
---
###git考试
昨天围观了庄亚和大象的git考试，他们两人对git的命令非常熟悉，帅呆了！  
之前我在工作上用的版本控制工具是SVN，对git仅限于用在github上的push，pull，branch几个命令。不过没关系，现学现用嘛。google了一些git文档开始学习，发现自己对 **git远程分支** 这一块掌握的比较薄弱，一顿恶补...  
下午考试通过，非常开心啊～     
[常用命令](https://github.com/NaixSpirit/wiki/blob/master/git.md)  
[裸库](https://github.com/NaixSpirit/wiki/blob/master/git-init-bare.md)

##Support 2013/03/22
---
###JavaScript Koans & Underscore.js
对js并不熟练，把JS Koans做完，发现Underscore读得不太明白，关于js的几个问题问了问庄亚和大象，买了本书[JavaScript DOM编程艺术](http://book.douban.com/subject/1921890/)，准备周末好好看看。

