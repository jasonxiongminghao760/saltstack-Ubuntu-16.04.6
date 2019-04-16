DatabaseDrop:
  mysql_database.absent:
    - name: {{ pillar['name'] }}
    - connection_host: {{ pillar['host'] }}
    - connection_port: {{ pillar['port'] }}
    - connection_user: {{ pillar['op_user'] }}
    - connection_pass: '{{ pillar['op_password'] }}'

