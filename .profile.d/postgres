#!/usr/bin/env bash

set -e

[ -z "$DATABASE_URL" ] && echo "\$DATABASE_URL environment variable does not exist"

IFS=':' read -r -a variables <<< "$DATABASE_URL"
export POSTGRES_DB_USER=(${variables[1]//\/\//})
IFS='@' read -r -a PASSWORD_HOST <<< "${variables[2]}"
export POSTGRES_DB_PASS=${PASSWORD_HOST[0]}
export POSTGRES_DB_HOST="jdbc:postgresql://${PASSWORD_HOST[1]}:${variables[3]}${POSTGRES_DB_HOST_ARGS}"
