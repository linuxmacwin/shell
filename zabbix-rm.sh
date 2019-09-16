#!/bin/bash

dir=`find /mds -maxdepth 2 -type d`
tdx=`ps aux | grep hostl |grep -v grep|grep -wo hostl| head -1`
tdxkz=`ps aux | grep dshost |grep -v grep|grep -wo dshost| head -1`
ths=`echo $dir |grep -wo "hxapp"|head -1`
dzh=`echo $dir |grep -wo "dzhserv"|head -1`
dzhn=`echo $dir |grep -wo "dzhserv2"|head -1`

tdx(){
today=`date +%Y%m%d`

cd /tmp
if [ ! -e rmlog  ];then
    mkdir rmlog
fi

/bin/rm -rf /mds/tdxapp/infohost/data/digest/*
/bin/rm -rf /mds/tdxapp/infohost/InfoLog/*
/bin/rm -rf /mds/tdxapp/infodown/data/digest/*
/bin/rm -rf /mds/tdxapp/infodown/InfoLog/*
/bin/rm -rf /mds/tdxapp/infodown_iw/data/digest/*
/bin/rm -rf /mds/tdxapp/infodown_iw/InfoLog/*
/bin/rm -rf /mds/tdxapp/infodown_bi/data/digest/*
/bin/rm -rf /mds/tdxapp/infodown_bi/InfoLog/*
/bin/rm -rf /mds/tdxapp/infodown_vst/data/digest/*
/bin/rm -rf /mds/tdxapp/infodown_vst/InfoLog/*

echo compressed packa >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tgz >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tgz -exec rm -rf {} \;
/bin/find /mds/ -name *.tar.gz >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tar.gz -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt
}

tdxkz(){
path=/mds/tdxapp/dshost/data/mtc
today=`date +%Y%m%d`

cd /tmp
if [ ! -e rmlog  ];then
    mkdir rmlog
fi

echo empty dir >> /tmp/rmlog/$today.txt
find /mds/tdxapp/dshost/data/mtc/ -maxdepth 1 -type d -empty >> /tmp/rmlog/$today.txt
find /mds/tdxapp/dshost/data/mtc/ -maxdepth 1 -type d -empty -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo history >> /tmp/rmlog/$today.txt
cd $path
/bin/pwd >> /tmp/rmlog/$today.txt
ls | head -3 >> /tmp/rmlog/$today.txt
ls | head -3|xargs rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo compressed packa >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tgz >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tgz -exec rm -rf {} \;
/bin/find /mds/ -name *.tar.gz >> /tmp/rmlog/$today.txt
/bin/find /mds/ -name *.tar.gz -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt
}

ths(){
today=`date +%Y%m%d`

cd /tmp
if [ ! -e rmlog  ];then
    mkdir rmlog
fi

echo history >> /tmp/rmlog/$today.txt
cd /mds/hxdata/hqserver/history/newindx/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
cd /mds/hxdata/hqserver/history/shase/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
cd /mds/hxdata/hqserver/history/sznse/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
cd /mds/hxdata/hqserver/history/shhk/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
cd /mds/hxdata/hqserver/history/stb/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
cd /mds/hxdata/hqserver/history/zzindx/real
/bin/pwd >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25 >> /tmp/rmlog/$today.txt
ls -F |grep '/$'| sed 's/\///g'|head -25| xargs rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

/bin/find /mds/hxdata/hqserver/log -mtime +31 -type f -name "cs*.log" -exec rm -rf {} \;
/bin/find /mds/hxdata/hqserver/log -mtime +31 -type f -name "rs*.log" -exec rm -rf {} \;
/bin/find /mds/hxdata/hqserver/log -mtime +180 -type f -name "user*.txt" -exec rm -rf {} \;
/bin/find /mds/hxdata/hqserver/log -mtime +31 -type f -name "merge*.log" -exec rm -rf {} \;

echo compressed packa >> /tmp/rmlog/$today.txt
/bin/find /mds/hxdata/hqserver/ -name "*.tgz" >> /tmp/rmlog/$today.txt
/bin/find /mds/hxdata/hqserver/ -name "*.tgz" -exec rm -rf {} \;
/bin/find /mds/hxdata/hqserver/ -name "*.zip" >> /tmp/rmlog/$today.txt
/bin/find /mds/hxdata/hqserver/ -name "*.zip" -exec rm -rf {} \;
/bin/find /mds/hxdata/hqserver/ -name "*.tar.gz" >> /tmp/rmlog/$today.txt
/bin/find /mds/hxdata/hqserver/ -name "*.tar.gz" -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt
}

dzh(){
today=`date +%Y%m%d`

cd /tmp
if [ ! -e rmlog  ];then
    mkdir rmlog
fi

echo empty dir >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SHASE/ -maxdepth 1 -type d -empty >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SHASE/ -maxdepth 1 -type d -empty -exec rm -rf {} \;
find /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SZNSE/ -maxdepth 1 -type d -empty >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SZNSE/ -maxdepth 1 -type d -empty -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo history >> /tmp/rmlog/$today.txt
cd /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SHASE
b=`ls -F |grep '/$'| sed 's/\///g'|head -1`
cd $b
/bin/pwd >> /tmp/rmlog/$today.txt
ls | head -25 >> /tmp/rmlog/$today.txt
ls | head -25|xargs rm -rf {} \;
#######################################################
cd /mds/dzhapp/dzhserv/zm/kdata/HisFzx/SZNSE
d=`ls -F |grep '/$'| sed 's/\///g'|head -1`
cd $d
/bin/pwd >> /tmp/rmlog/$today.txt
ls | head -25 >> /tmp/rmlog/$today.txt
ls | head -25|xargs rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo compressed packa >> /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv/zm/ -name "*.tgz" >> /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv/zm/ -name "*.tgz" -exec rm -rf {} \;
/bin/find /mds/dzhapp/dzhserv/zm/ -name "*.tar.gz" >> /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv/zm/ -name "*.tar.gz" -exec rm -rf {} \;
/bin/find /mds/dzhapp/dzhserv/zm/ -name "data-*" >> /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv/zm/ -name "data-*" -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt
}

dzhn(){
today=`date +%Y%m%d`

cd /tmp
if [ ! -e rmlog  ];then
    mkdir rmlog
fi

echo empty dir >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SH0010 -maxdepth 1 -type d -empty >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SH0010 -maxdepth 1 -type d -empty -exec rm -rf {} \;
find /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SZ0010 -maxdepth 1 -type d -empty >> /tmp/rmlog/$today.txt
find /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SZ0010 -maxdepth 1 -type d -empty -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo history >> /tmp/rmlog/$today.txt
cd /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SH0010
b=`ls -F |grep '/$'| sed 's/\///g'|head -1`
cd $b
/bin/pwd >> /tmp/rmlog/$today.txt
ls | head -25 >> /tmp/rmlog/$today.txt
ls | head -25|xargs rm -rf {} \;
#########################################################
cd /mds/dzhapp/dzhserv2/zm/kdata/OneCKLine/SZ0010
d=`ls -F |grep '/$'| sed 's/\///g'|head -1`
cd $d
/bin/pwd >> /tmp/rmlog/$today.txt
ls | head -25 >> /tmp/rmlog/$today.txt
ls | head -25|xargs rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt

echo compressed packa >> /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv2/zm -name "*.tgz" >>  /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv2/zm -name "*.tgz" -exec rm -rf {} \;
/bin/find /mds/dzhapp/dzhserv2/zm -name "*.tar.gz" >>  /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv2/zm -name "*.tar.gz" -exec rm -rf {} \;
/bin/find /mds/dzhapp/dzhserv2/zm -name "data-*" >>  /tmp/rmlog/$today.txt
/bin/find /mds/dzhapp/dzhserv2/zm -name "data-*" -exec rm -rf {} \;
echo =============== >> /tmp/rmlog/$today.txt
}

if [ "$ths" == hxapp ];then
    ths
elif [ "$tdxkz" == dshost ];then
    tdxkz
elif [ "$tdx" == hostl ];then
    tdx                         
elif [ "$dzhn" == dzhserv2 ];then
    dzhn
elif [ "$dzh" == dzhserv ];then
    dzh
else
    echo exit
fi
