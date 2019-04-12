Subsystem.Mysql.Server.Deploy:
  pkg.installed:
    - name: mysql-server-5.7

Subsystem.Mysql.Server.Datadir.Deploy:
  file.directory:
    - name: /data/mysqldata
    - user: mysql
    - group: mysql
    - require:
      - pkg:  mysql-server-5.7

Subsystem.Mysql.Server.Cmd_Data:
  cmd.run:
    - name: 'mv /var/lib/mysql/* /data/mysqldata/'
    - onlyif: ls /var/lib/mysql/*
    - require:
      - service: mysql

Subsystem.Mysql.Server.Mysqld:
  cmd.run:
    - name: sed -ri 's#/var/lib/mysql/#/data/mysqldata/#g' /etc/apparmor.d/usr.sbin.mysqld
    - unless: grep  "/data/mysqldata" /etc/apparmor.d/usr.sbin.mysqld
    - require:
      - cmd: Subsystem.Mysql.Server.Cmd_Data

  service.running:
    - name: mysql
    - enable: True
    - reload: True
