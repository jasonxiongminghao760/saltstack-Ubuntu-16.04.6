Subsystem.Mongo.Server.Config:
  file.managed:
    - name: /etc/mongod.conf
    - source: salt://subsystem/mongo/server/mongod_conf.jinja
  service.running:
    - name: mongod
    - enable: True
    - restart: True
    - watch:
      - file: /etc/mongod.conf
