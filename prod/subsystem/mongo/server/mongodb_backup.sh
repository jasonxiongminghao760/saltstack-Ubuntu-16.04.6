#!/bin/bash

# 定义mongo用户名/密码/端口等相关变量
User='{{ user }}'
Passwd='{{ password }}'
Host='{{ host }}'
Port='{{ port }}'
Path='{{ path }}'

# 定义mongo备份目录相关变量
Host=$(hostname)
Addr=$(ip add show eth0 |awk -F "[ /]+" 'NR==3{print $3}')
Date=$(date +%F)
Dest=${Host}_${Addr}_${Date}

# 定义当前脚本执行的日志记录变量
Log_Path='/var/log/mongodb'
Log_File="${Log_Path}/backup_db.log_${Date}"

# 创建以当天时间命名的备份日志文件
[ -f ${Log_File} ] || touch ${Log_File}
echo " " >> ${Log_File}
# 创建以当天时间和主机名+IP地址命名的目录
Now_Time=$(date +%F_%H:%M:%S)
[  ! -d ${Dest} ] || mkdir -p ${Path}/${Dest}; echo "${Now_Time}  ${Dest}目录不存在,${Dest}创建成功" >>${Log_File} && echo "${Now_Time}  ${Dest}目录已存在,停止创建(不影响备份)" >>${Log_File}

# 备份整个mongodb库
mongodump  -u${User} -p${Passwd} -h${Host} --port=${Port}  -o ${Path}/${Dest}  >/dev/null  2>&1
[ $? -eq 0 ] && echo "${Now_Time}  mongodb全备执行成功...." >>${Log_File} || echo "${Now_Time} mongodb全备执行失败..." >>${Log_File}

# rsync同步备份文件到，rsync服务端 （暂留） 

# 删除30天前的备份文件
find  $Path/ -type d -mtime +30 |xargs rm -rf 


