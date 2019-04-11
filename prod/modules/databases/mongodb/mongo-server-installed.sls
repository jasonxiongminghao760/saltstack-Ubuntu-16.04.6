subsystem.mongo.server.deploy:
  pkgrepo.managed:
    - humanname: mongodb-org-3.4
    - name: "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse"
    #- keyid: 0C49F3730359A14518585931BC711F9BA15703C6
    #- key_server: keyserver.ubuntu.com
    #- key_url: 
    - key_url: salt://modules/databases/mongodb/mongo-3.4.pub
    - file: /etc/apt/sources.list.d/mongodb-org-3.4.list
 
  pkg.installed:
    - name: mongodb-org
    - skip_verify: True
    - skip_suggestions: True

  file.directory:
    - name: /data/mongodata
    - user: mongodb
    - group: mongodb
    - makedirs: True

