Subsystem.Mysql.Server.Config.Set:
  file.managed:
    - name: /etc/mysql/my.cnf
    - source: salt://subsystem/mysql/server/mysqld.jinja

Subsystem.Mysql.Server.Config.Reload:
  service.running:
    - name: mysql
    - reload: True
    - watch:
      - file: Subsystem.Mysql.Server.Config.Set
