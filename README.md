# postgresql

- Overwrite docker-entrypoint.sh in https://github.com/docker-library/postgres/blob/master/docker-entrypoint.sh to enable multiple databases
- `a-init-user-db.sh` is not needed/used.

## Check Existing Databases

```
$ psql -U guest -h <svc-postgresql-nodeport> -l
Password for user guest:
                                                         List of databases
        Name         |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | Locale | ICU Rules |   Access privileges
---------------------+----------+----------+-----------------+------------+------------+--------+-----------+-----------------------
 AspNetCoreWebApi    | guest    | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 LangchainCheckpoint | guest    | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 library             | guest    | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 postgres            | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 school              | guest    | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 template0           | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
                     |          |          |                 |            |            |        |           | postgres=CTc/postgres
 template1           | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
                     |          |          |                 |            |            |        |           | postgres=CTc/postgres
(7 rows)
```

## Dump the selected database

```
$ pg_dump -U guest -h <svc-postgresql-nodeport> -d LangchainCheckpoint -f LangchainCheckpoint.sql
```

## Map the databases in postgresql.yml

```
            - name: POSTGRES_DB_1
              value: AspNetCoreWebApi
            - name: POSTGRES_DB_2
              value: library
            - name: POSTGRES_DB_3
              value: school
            - name: POSTGRES_DB_4
              value: LangchainCheckpoint
```
