# postgrest-tutorial

Learning purpose only.

This repository follows intructions at: https://postgrest.org/en/stable/tutorials/tut0.html

## History

Most recent on top:

- make requests
  - /requests-examples.sh
- sign a JWT token with `{"role": "todo_user"}`
  - https://jwt.io/
- define a secret for JWT
  - /tutorial.conf
- create a todo_user role
  - /scripts/02.sql
- as anonymous user
  - `curl http://127.0.0.1:3000/todos` works
  - `curl http://127.0.0.1:3000/todos -X POST -H "Content-Type: application/json" -d '{"task": "do bad thing"}` gives 401 unauthorized
- run server
  - `postgrest tutorial.conf`
- create /tutorial.conf file
- run psql commands:
  - `\q` to quit
  - run sql /scripts/...
- dive in
  - `sudo docker exec -it postgrest-tutorial psql -U postgres`
- install postgrest
  - `stack build --install-ghc --copy-bins --local-bin-path /usr/local/bin` ... it took about 30 minutes :O
  - `brew install libpq gmp stack`
  - `cd postgrest`
  - `git clone https://github.com/PostgREST/postgrest.git`
- install postgres
  - `sudo docker run --name postgrest-tutorial -p 5433:5432 -e POSTGRES_PASSWORD=admin -d postgres`
