#!/usr/bin/env bash

set -e

[ -z "$DATABASE_URL" ] && echo "\$DATABASE_URL environment variable does not exist"

IFS=':' read -r -a DATABASE_STRING <<< "$DATABASE_URL"
export POSTGRES_DB_USER=$(${DATABASE_STRING[1]} | tr -d /)
IFS='@' read -r -a PASSWORD_HOST <<< "${DATABASE_STRING[2]}"
export POSTGRES_DB_PASS=${PASSWORD_HOST[0]}
export POSTGRES_DB_HOST="jdbc:postgresql://${PASSWORD_HOST[1]}:${DATABASE_STRING[3]}${POSTGRES_DB_HOST_ARGS}"
