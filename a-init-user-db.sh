#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER "$POSTGRESQL_USER" WITH PASSWORD '$POSTGRESQL_PASSWORD';
	CREATE DATABASE "$POSTGRES_DB_1";
	CREATE DATABASE "$POSTGRES_DB_2";
	CREATE DATABASE "$POSTGRES_DB_3";
	GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB_1" TO "$POSTGRESQL_USER";
	GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB_2" TO "$POSTGRESQL_USER";
	GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB_3" TO "$POSTGRESQL_USER";
EOSQL