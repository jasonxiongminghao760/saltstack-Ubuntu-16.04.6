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
    - makedirs: True

Subsystem.Mongo.Server.Root:
  cmd.script:
    - name: salt://subsystem/mongo/server/mongo-server-grant-root.sh
    - stateful: True
    - require:
      - service: mongod
