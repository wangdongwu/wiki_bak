**git init 和 git iinit -bare 的区别**
> 用 **git init** 初始化的版本库用户也可以在该目录下执行所有git方面的操作。但别的用户在将更新push上来的时候容易出现冲突。  

>> 比如有用户在该目录（就称为远端仓库）下执行git操作，且有两个分支(master 和 b1)，当前在master分支下。  
另一个用户想把自己在本地仓库（就称为本地仓库）的master分支的更新提交到远端仓库的master分支，他就敲了 `git push origin master:master `，因为远端仓库的用户正在master的分支上操作，而你又要把更新提交到这个master分支上，当然就出错了。  
但如果是往远端仓库中空闲的分支上提交还是可以的，比如 `git push origin master:b1` ，还是可以成功的。

> 解决办法就是使用”git init –bare”方法创建一个所谓的裸仓库，之所以叫裸仓库是因为这个仓库只保存git历史提交的版本信息，而不允许用户在上面进行各种git操作，如果你硬要操作的话，只会得到下面的错误（”This operation must be run in a work tree”）。  

这个就是最好把远端仓库初始化成bare仓库的原因。