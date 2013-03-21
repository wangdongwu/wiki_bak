**用户配置**
```sh
git config user.name "username"
git config user.email xxx@xxx.com.cn
git config core.editor subl
```

**初始化**
```sh
git init
git init --bare **初始化裸仓库** 
```

**纳入版本控制**
```sh
git add filename
```

**从现有仓库克隆**
```sh
git clone [url] [yourdirname]
```

**检查当前文件状态**
```sh
git status
```

**忽略某些文件**
```sh
建立名为 **.gitignore** 的文件
```

**查看未暂存的更新**
```sh
git diff
git diff --cached 查看已暂存的更新
```

**提交更新**
```sh
git commit
git commit -m "xxx"
```

**移除文件**
```sh
git rm filename
git rm -f filename  强制删除
git rm --cached filename  **移除跟踪但不删除文件**
```

**移动文件**
```sh
git mv file_from file_to
```

**查看提交历史**
```sh
git log
git log -p  查看每次提交内容的差异
git log -p -2 查看每次提交内容的差异，仅显示最近2次的更新。
git log --stat  仅显示简要的增改行数统计
git log --graph 图形化显示log
```

**撤消操作**
```sh
git commit --amend  修改最后一次提交
git reset HEAD filename 取消已经暂存的文件
git checkout --filename 取消对文件的修改
```

**查看远程仓库及其对应的地址**
```sh
git remote
git remote -v
```

**添加远程仓库**
```sh
git remote add [shortname] [url]
```

**从远程仓库抓取数据**
```
git fetch [remote-name]
```
> 此命令会到远程仓库中拉取所有你本地仓库中还没有的数据。运行完成后，你就可以在本地访问该远程仓库中的所有分支，将其中某个分支合并到本地，或者只是取出某个分支，一探究竟。 
fetch命令只是将远端的数据拉倒本地仓库，并不自动合并到当前工作分支，只有当你确实准备好了，才能手工合并。

**推送数据到远程仓库**
```sh
git push [remote-name] [branch-name]
```

**查看远程仓库信息**
```sh
git remote show [remote-name]
```

**远程仓库的删除和重命名**
```sh
git remote rename pb paul
git remote rm paul
```

**打标签**
```sh
git tag
```