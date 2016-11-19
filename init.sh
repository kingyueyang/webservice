#!/bin/bash
source ./baseline_info.sh
########初始化webService########################
cd $basepath
if [ -f webService-0.9.0-src.tar.gz ];then
echo "================安装webService=========服务"
        if [  -d $INSTALL_PATH/webService-0.9.0-src ];then
                rm -rf $INSTALL_PATH/webService-0.9.0-src
                $TAR xf webService-0.9.0-src.tar.gz -C $INSTALL_PATH
        else

                $TAR xf webService-0.9.0-src.tar.gz -C $INSTALL_PATH
        fi
        if [ `grep ZK_ADDR $INSTALL_PATH/webService-0.9.0-src/src/settings.py|wc -l` -eq 1 ];then
                sed -i "s#ZK_ADDR\"#$ZK_ADDR\"#g" $INSTALL_PATH/webService-0.9.0-src/src/settings.py
                sed -i "s#ZK_ADDR#$ZK_ADDR#g" $INSTALL_PATH/webService-0.9.0-src/etc/harpc.conf
                sed -i "s#LOCALADDR#$LOCALADDR:$WEB_PORT#g" $INSTALL_PATH/webService-0.9.0-src/bin/start.sh
        fi
fi
