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
