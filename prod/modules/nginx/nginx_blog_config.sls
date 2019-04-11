prod_modules_nginx_blogconfig_set:
  file.managed:
    - name: /etc/nginx/conf.d/blog.conf
    - source: salt://modules/nginx/files/blog.conf
    - template: jinja
    - defaults:
       Port: 80 
       WebSite: /data/appwebs/blog

prod_modules_nginx_blog_service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - file: prod_modules_nginx_blogconfig_set
