#!/bin/bash
# description:  MySQL buckup shell script
# author:       tao

st=$(date +%s)
USER="root" #用户名 
PASSWORD="flyfishdb" #数据库用户密码 
DATABASE="sanguo_GFFGame" 
MAIL="heavenfox@126.com" #mail   
BACKUP_DIR=/data/temp/DB_Backup/ #备份文件存储路径 
LOGFILE=/data/temp/DB_Backup/data_backup.log #日志文件路径

DATE=`date +%Y%m%d-%H%M` #用日期格式作为文件名
DUMPFILE=$DATE.sql 
ARCHIVE=$DATE.sql.tar.gz 
OPTIONS="-u$USER -p$PASSWORD $DATABASE"

#判断备份文件存储目录是否存在，否则创建该目录 
if [ ! -d $BACKUP_DIR ] 
then
    mkdir -p "$BACKUP_DIR"
fi  

#开始备份之前，将备份信息头写入日记文件 
echo "    ">> $LOGFILE 
echo "--------------------" >> $LOGFILE 
echo "BACKUP DATE:" $(date +"%y-%m-%d %H:%M:%S") >> $LOGFILE 
echo "-------------------" >> $LOGFILE  

#切换至备份目录 
cd $BACKUP_DIR 
mysqldump $OPTIONS > $DUMPFILE 
#判断数据库备份是否成功 
if [[ $? == 0 ]]
then 
    tar czvf $ARCHIVE $DUMPFILE >> $LOGFILE 2>&1 
    echo "[$ARCHIVE] Backup Successful!" >> $LOGFILE 
    rm -f $DUMPFILE #删除原始备份文件,只需保留备份压缩包
else 
    echo "Database Backup Fail!" >> $LOGFILE 
    #备份失败后向管理者发送邮件提醒 
    mail -s "database:$DATABASE Daily Backup Fail!" $MAIL 
fi 
echo "Backup Process Done" 
#删除3天以上的备份文件
#Cleaning
find $BACKUP_DIR  -type f -mtime +2 -name "*.tar.gz" -exec rm -f {} \;
