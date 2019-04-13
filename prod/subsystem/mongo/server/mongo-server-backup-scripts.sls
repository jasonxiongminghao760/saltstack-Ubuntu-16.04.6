Subsystem.Mongo.Create.Dir.Scripts:
  file.directory:
    - name: /service/scripts/
    - makedirs: True

Subsystem.Mongo.Create.Dir.Backup:
  file.directory:
    - name: /data/backup/mongodb
    - makedirs: True

Subsystem.Mongo.Server.Backup:
  file.managed:
    - name: /service/scripts/mongodb_backup.sh
    - source: salt://subsystem/mongo/server/mongodb_backup.sh
    - template: jinja
    - defaults:
      user: {{ pillar['user'] }}
      password: {{ pillar['password'] }}
      host: {{ pillar['host'] }}
      port: {{ pillar['port'] }}
      path: /data/backup/mongodb 
    - require:
      - file: Subsystem.Mongo.Create.Dir.Scripts
      - file: Subsystem.Mongo.Create.Dir.Backup

Subsystem.Mongo.Server.Backup.Cron:
  cron.present:
    - name: '/bin/bash /service/scripts/mongodb_backup.sh &>/dev/null 2>&1'
    - user: root
    - identifier: True
    - hour: '00'
    - daymonth: '03'

