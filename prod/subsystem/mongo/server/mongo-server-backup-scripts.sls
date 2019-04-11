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
      user: root
      password: 123456
      host: 127.0.0.1
      port: 27017
      path: /data/backup/mongodb 
    - require:
      - file: Subsystem.Mongo.Create.Dir.Scripts
      - file: Subsystem.Mongo.Create.Dir.Backup
