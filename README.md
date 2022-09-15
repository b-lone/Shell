> contact: youkun@bilibili.com

# 配置步骤：
1. 安装最新版的bash
```
brew install bash
```
2. 编辑配置文件，在~/.zprofile中加入以下命令
```
alias bb="/path/to/bbgit.sh"
```
3. 修改权限
``` 
chmod -R 755 "/path/to/bbgit.sh"
``` 
4. 配置路径，将文件中 LOKTAR_DIR 修改成对应路径
> LOKTAR_DIR="/Users/archie/Documents/loktar"
5. 配置当前版本，每个版本都要更新此值
> CURRENT_VERSION="2.22.0"

