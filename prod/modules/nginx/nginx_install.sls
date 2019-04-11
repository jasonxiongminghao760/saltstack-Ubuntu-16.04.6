apt_nginx_prerequisites:
  pkg.installed:
    - names:
      - curl 
      - gnupg2 
      - ca-certificates 
      - lsb-release

add_nginx_repo:
  pkgrepo.managed:
    - humaname: Nginx repo
    - name: 'deb http://nginx.org/packages/ubuntu trusty nginx'
    - dist: trusty
    - file: /etc/apt/sources.list.d/nginx.list 
    - gpgkey: https://nginx.org/keys/nginx_signing.key
    - gpgcheck: 1
    - require:
      - pkg: apt_nginx_prerequisites
    

apt_nginx_software:
  pkg.installed:
    - name: nginx
    - fromrepo:  trusty
    - refresh: True
    - require:
       - pkgrepo: add_nginx_repo
