prod_modules_nginx_install_prerequisites:
  pkg.installed:
    - names:
      - curl 
      - gnupg2 
      - ca-certificates 
      - lsb-release

prod_modules_nginx_set:
  pkgrepo.managed:
    - humaname: Nginx repo
    - name: 'deb http://nginx.org/packages/ubuntu trusty nginx'
    - dist: trusty
    - file: /etc/apt/sources.list.d/nginx.list 
    - gpgkey: https://nginx.org/keys/nginx_signing.key
    - gpgcheck: 1
    - require:
      - pkg: prod_modules_nginx_install_prerequisites
    

prod_modules_nginx_install_software: 
  pkg.installed:
    - name: nginx
    - fromrepo:  trusty
    - refresh: True
    - require:
       - pkgrepo: prod_modules_nginx_set
