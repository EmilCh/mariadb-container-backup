Example docker-compose.yml file

```
services:
  backup:
    image: ghcr.io/emilch/mariadb-container-backup:main
    restart: always
    volumes:
      - ./backup:/backup
    environment:
      MARIADB_USER: root
      MARIADB_PASS: rootpassword
      MARIADB_HOST: mariadb
```
