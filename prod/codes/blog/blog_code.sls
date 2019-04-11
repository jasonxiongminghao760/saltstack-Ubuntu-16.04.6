prod_codes_blog_dir:
  file.directory:
    - name: /data/appwebs/blog
    - user: nginx
    - group: nginx
    - mode: 755
    - makedirs: True


prod_codes_blog_set:
  file.recurse:
    - name: /data/appwebs/blog
    - source: salt://codes/blog/files
    - user: nginx
    - group: nginx
    - file_mode: 644
    - include_empty: True
    - clean: True
    - require:
      - file: prod_codes_blog_dir 
