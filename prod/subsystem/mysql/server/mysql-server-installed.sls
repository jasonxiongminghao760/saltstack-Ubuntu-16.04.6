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

Subsystem.Mysql.Server.Cmd:
  cmd.script:
    - name: salt://subsystem/mysql/server/mysql-server-modif.sh
    #- stateful: True
    - require:
      - service: mysql

  service.running:
    - name: mysql
    - enable: True
