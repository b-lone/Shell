#!/opt/homebrew/bin/bash
#
#contact:youkun@bilibili.com
#
# 配置步骤：
# 1.安装最新版的bash
#  brew install bash
# 2.编辑配置文件，在~/.zprofile中加入以下命令
#  alias bb="/path/to/bbgit.sh"
# 3.修改权限
#  chmod -R 755 "/path/to/bbgit.sh"
# 4.配置路径，将下方 LOKTAR_DIR 修改成对应路径
LOKTAR_DIR="/Users/archie/Documents/Work/loktar"
CURRENT_VERSION="2.25.0"
#
#

BBSTUDIO_DIR="${LOKTAR_DIR}/srcs/app/BBStudio"
BBUPER_DIR="${LOKTAR_DIR}/srcs/app/studio-biz"
declare -A urls=(
["bbs"]=$BBSTUDIO_DIR 
["bbstudio"]=$BBSTUDIO_DIR 
["loktar"]=$LOKTAR_DIR
["bbuper"]=$BBUPER_DIR 
["zprofile"]="/Users/archie/.zprofile" 
["sh"]="/Users/archie/Documents/Me/Shell/bbgit.sh"
["1"]="https://git.bilibili.co/"
["2"]="https://www.tapd.bilibili.co/my_worktable/"
["3"]="https://info.bilibili.co/pages/viewpage.action?pageId=154621015"
)

errorCode=0
errorMessage=""

# mr
# bb mr 2.7.0
if [ "$1" = "mr" ];then
    # currentBranch=$(git rev-parse --abbrev-ref HEAD)
    # echo "========loktar========"
    # cd $LOKTAR_DIR
    # git push -u origin $currentBranch
    # echo "=======BBStudio======="
    # cd $BBSTUDIO_DIR
    # git push -u origin $currentBranch
    # echo "======================" 
    cd $LOKTAR_DIR
#    ./bbgit mr -t bbstudio/release/r$CURRENT_VERSION
    ./bbgit mr -t bbstudio/master
#git
#git br | grep 'test' | xargs git br -D
#myV=$(git rev-parse --abbrev-ref HEAD)
elif [ "$1" = "git" ];then
    if [ "$2" = "bug" ] || [ "$2" = "feat" ];then
        echo "========loktar========"
        cd $LOKTAR_DIR
        git checkout bbstudio/release/r${CURRENT_VERSION}
        git pull
        git checkout -b bbstudio/$2/r${CURRENT_VERSION}-$3
        echo "=======BBStudio======="
        cd $BBSTUDIO_DIR
        git checkout bbstudio/release/r${CURRENT_VERSION}
        git pull
        git checkout -b bbstudio/$2/r${CURRENT_VERSION}-$3
        echo "======================"
    else 
        echo "========loktar========"
        cd $LOKTAR_DIR
        $@
        echo "=======BBStudio======="
        cd $BBSTUDIO_DIR
        $@
        # echo "=======BBUper======="
        # cd $BBUPER_DIR
        # $@
        # echo "======================"
    fi   
# where
elif [ "$1" = "where" ];then
    for key in ${!urls[@]};do
        if [ "$2" = "$key" ]; then
            echo ${urls["$key"]} 
            echo ${urls["$key"]} | pbcopy
        fi
    done
# build
elif [ "$1" = "build" ];then
    if [ "$2" = "loktar" ];then 
        cd $LOKTAR_DIR
        ./bbgit pull
        sh build.sh
    elif [ "$2" = "bbs" ] || [ "$2" = "bbstudio" ] || [ "$2" = "" ];then 
        cd $LOKTAR_DIR
        ./bbgit pull
        sh build.sh //bilistudio-universal:bili-studio
    else
        cd $LOKTAR_DIR
        ./bbgit pull
        sh build.sh $2
    fi
    
# open
elif [ "$1" = "open" ];then
    if [ "$#" = "1" ];then 
        errorCode=1
    else
        for key in ${!urls[@]};do
            if [ "$2" = "$key" ]; then
                echo ${urls["$key"]} 
                open "${urls["$key"]}"
            fi
        done
    fi
# mobileprovision
elif [ "$1" = "mobileprovision" ];then
    if [ "$#" = "2" ];then 
        mobileprofileDir=${LOKTAR_DIR}/customized-provision
        mv $2 "${mobileprofileDir}/App_custom.mobileprovision"
    else
        errorCode=1
    fi
elif [ "$1" = "rm" ];then
echo "start"
echo $2
echo $3
echo $4
echo "stop"
else
    errorCode=1
fi

echo -e "Execution complete with code ${errorCode}."

if [ "$errorCode" == "1" ];then
    echo -e "\e[1;0;31mInvalid parameters.\e[0m"
fi
