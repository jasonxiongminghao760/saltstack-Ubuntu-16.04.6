Subsystem.Mongo.Server.Deploy:
  pkgrepo.managed:
    - humanname: mongodb-org-3.4
    - name: "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse"
    - key_url: salt://subsystem/mongo/server/mongo-3.4.pub
    - file: /etc/apt/sources.list.d/mongodb-org-3.4.list
    - unless: apt-key list|grep -qE 'MongoDB 3.4 Release' 
 
  pkg.installed:
    - name: mongodb-org
    - skip_verify: True
    - skip_suggestions: True

  file.directory:
    - name: /data/mongodata
    - user: mongodb
    - group: mongodb

Subsystem.Mongo.Server.Config:
  file.managed:
    - name: /etc/mongod.conf
    - source: salt://subsystem/mongo/server/mongod_conf.jinja
    - template: jinja
    - defaults:
      config_port: 27017
      config_ip: 0.0.0.0
  service.running:
    - name: mongod
    - enable: True
    - restart: True
    - watch:
      - file: /etc/mongod.conf

Subsystem.Mongo.Server.Root:
  cmd.script:
    - name: salt://subsystem/mongo/server/mongo-server-grant-root.sh
    - stateful: True
    - require:
      - service: mongod
