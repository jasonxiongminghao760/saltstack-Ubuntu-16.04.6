Subsystem.Mysql.Server.Config.Set:
  file.managed:
    - name: /etc/mysql/mysql.conf.d/mysqld.cnf
    - source: salt://subsystem/mysql/server/mysqld.jinja

Subsystem.Mysql.Server.Config.Reload:
  service.running:
    - name: mysql
    - reload: True
    - watch:
      - file: /etc/mysql/mysql.conf.d/mysqld.cnf
      # - file: Subsystem.Mysql.Server.Config.Set
