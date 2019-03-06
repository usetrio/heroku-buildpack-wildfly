#!/usr/bin/env bash

set -e

[ -z "$DATABASE_URL" ] && echo "\$DATABASE_URL environment variable does not exist"

IFS=':' read -r -a DATABASE_VAR <<< "$DATABASE_URL"
export POSTGRES_DB_USER=$("${DATABASE_VAR[1]}" | tr -d "/")
IFS='@' read -r -a PASSWORD_HOST <<< "${DATABASE_VAR[2]}"
export POSTGRES_DB_PASS=${PASSWORD_HOST[0]}
export POSTGRES_DB_HOST="jdbc:postgresql://${PASSWORD_HOST[1]}:${DATABASE_VAR[3]}${POSTGRES_DB_HOST_ARGS}"
