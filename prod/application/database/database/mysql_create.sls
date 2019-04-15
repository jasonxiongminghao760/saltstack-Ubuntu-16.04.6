DatabaseCreate:
  mysql_database.present:
    - name: {{ pillar['name'] }}
    - character_set: utf8mb4
    - connection_host: {{ pillar['host'] }}
    - connection_port: {{ pillar['port'] }}
    - connection_user: {{ pillar['op_user'] }}
    - connection_pass: '{{ pillar['op_password'] }}'
    - connection_charset: utf8

DatabaseUser:
  mysql_user.present:
    - name: {{ pillar['user'] }}
    - host: '%'
    - password: '{{ pillar['password'] }}'
    - allow_passwordless: True
    - connection_host: {{ pillar['host'] }}
    - connection_port: {{ pillar['port'] }}
    - connection_user: {{ pillar['op_user'] }}
    - connection_pass: '{{ pillar['op_password'] }}'
    - connection_charset: utf8

DatabaseGrant:
  mysql_grants.present:
    - grant:  all privileges
    - database: {{ pillar['name'] }}.*
    - user: {{ pillar['user'] }}
    - host: '%'
    - revoke_first: True
    - connection_host: {{ pillar['host'] }}
    - connection_port: {{ pillar['port'] }}
    - connection_user: {{ pillar['op_user'] }}
    - connection_pass: '{{ pillar['op_password'] }}'
    - connection_charset: utf8

