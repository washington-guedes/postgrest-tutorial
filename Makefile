run:
	postgrest ./tutorial.conf

drop_db:
	docker rm -f postgrest-tutorial 2>/dev/null || exit 0
	sleep 2 # wait 2 seconds

create_db:
	docker run --name postgrest-tutorial -p 5433:5432 -e POSTGRES_PASSWORD=admin -d postgres -c log_statement=all
	sleep 3 # wait 3 seconds so docker can be up and running

migrate:
	make drop_db
	make create_db
	/bin/sh ./sh/migrate.sh

db_follow_logs:
	docker logs -f postgrest-tutorial
