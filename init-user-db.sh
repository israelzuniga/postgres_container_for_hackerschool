#!/bin/bash

TEST=`gosu postgres postgres --single <<- EOSQL
	SELECT 1 FROM pg_database WHERE datname='$DB_NAME';
EOSQL`

echo "SETTING UP THE DATABASE"
if [[ $TEST == "1" ]]; then
	 # database exists
	 # $? is 0
	 exit 0
else
gosu postgres postgres --single <<- EOSQL
	CREATE ROLE hschool WITH LOGIN ENCRYPTED PASSWORD 3raclase CREATEDB;
EOSQL

gosu postgres postgres --single <<- EOSQL
	CREATE DATABASE dvdrental WITH OWNER hschool TEMPLATE template0 ENCODING 'UTF8';
EOSQL

gosu postgres postgres --single <<- EOSQL
	GRANT ALL PRIVILEGES ON DATABASE dvdrental TO hschool;
EOSQL
fi

echo ""
echo "******DATABASE "dvdrental" CREATED******"


pg_restore -U postgres -d dvdrental /docker-entrypoint-initdb.d/dvdrental.tar

echo ""
echo "******DATABASE RESTORED******"
