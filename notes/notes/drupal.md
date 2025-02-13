# Drush commands

### Dump
```sh 
drush sql-dump --gzip --result-file=../apipar.sql
```

### Sync db with ssh key
- Drupal self.site.yml
```yml
prod:
  host: xxx.xxx.226.213
  user: runcloud
  root: '/home/runcloud/webapps/project/httpdocs/'
  uri: https://xxxx.es/
  ssh:
    options: '-p 22 -i ../key/id_ed25519'
  paths:
    drush-script: '/home/runcloud/webapps/project/httpdocs/vendor/bin/drush'

```
- For work before dbprod
```sh
chmod 600 ../key/id_ed25519
ssh-keygen -p -N "" -m pem -f ../key/id_ed25519
```


### Delete entities (delete custom entity content)
```sh
drush entity:delete answer # all anwers
drush entity:delete answer --bundle=arrows # only arrows bundle
drush entity:delete progress
```

### Code generator
- Generar código con ./vendor/bin/dcg
- Generar una lista de servicios

### Drush commands on production
- You can run productions commands with ***@prod*** in drush command
```sh
drush @prod watchdog:delete all
```

### Nginx config
- Para aumentar la memoria del buffer de nginx, (por ejemplo la view de enrolments que no carga)
- Importante: eliminar la linea de ***#ddev-generated*** para que ddev no recree
```nginx
  fastcgi_buffers 16 32k;
  fastcgi_buffer_size 64k;
```
