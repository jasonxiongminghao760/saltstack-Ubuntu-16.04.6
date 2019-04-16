{% for host in pillar['host'] %}
System.hosts.present:
  host.present:
    - ip:
      - {{ host }}
    - names:
      - {{ grains['localhost'] }}
{% endfor %}
