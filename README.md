# postgresql

* Overwrite docker-entrypoint.sh in https://github.com/docker-library/postgres/blob/master/docker-entrypoint.sh to enable multiple databases
* Only `a-init-user-db.sh` is used.

## Adding `.sql` dump to `postgresql-initdb.yml`:

* Remember to add `\c <database>` at the beginning of the `.sql` dump.
* Create a configMap of the `.sql` dump
* Retrieve the configMap in YAML format and append it to `postgresql-initdb.yml`
