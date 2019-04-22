System.Limit:
  file.managed:
    - name: /etc/security/limits.conf
    - source: salt://system/files/limit.conf.jinja
    - user: root
    - group: root
    - mode: 644
    - backup: minion
    - template: jinja
    - defaults:
      root_number: 65535
      other_number: 65535
    - unless:  grep -v "^#" /etc/security/limits.conf  |egrep "^root|^\*"
