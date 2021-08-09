#!/bin/sh

execSql () {
  sleep 1
  cat "$1" | docker exec -i postgrest-tutorial psql -U postgres
}

# cria schemas
execSql "${PWD}/db/schemas/index.sql"

# cria os objetos dos schemas (tables, functions, etc.)
for absoluteFullPath in ${PWD}/db/schemas/*/*.sql; do
  execSql "${absoluteFullPath}"
done

# cria roles
execSql "${PWD}/db/roles.sql"

# insere dados
execSql "${PWD}/db/seed.sql"

echo "migration finished\n"
