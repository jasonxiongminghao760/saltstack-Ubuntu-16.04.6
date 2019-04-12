# 将mysql的程序文件移动到/data/mysqldata/
mv /var/lib/mysql/* /data/mysqldata/
[ $? -eq 0  ] && echo "ok" || echo "no"
sleep 5

# 修改mysql的数据目录
sed -ri 's#/var/lib/mysql/#/data/mysqldata/#g' /etc/apparmor.d/usr.sbin.mysqld
[ $? -eq 0  ] && echo "ok" || echo "no"
