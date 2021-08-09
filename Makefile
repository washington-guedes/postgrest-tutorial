run:
	postgrest ./tutorial.conf

drop_db:
	docker rm -f postgrest-tutorial 2>/dev/null || exit 0
	sleep 2 # wait 2 seconds

create_db:
	docker run --name postgrest-tutorial -p 5433:5432 -e POSTGRES_PASSWORD=admin -d postgres
	sleep 3 # wait 3 seconds so docker can be up and running

log_queries:
	docker run -v "${PWD}/sh/enable_db_logs.sh":"/docker-entrypoint-initdb.d/init.sh" -d postgres
	docker logs -f postgrest-tutorial

migrate:
	make drop_db
	make create_db
	/bin/sh ./sh/migrate.sh
	make log_queries
