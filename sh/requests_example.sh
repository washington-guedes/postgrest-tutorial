export TOKEN="<jwt-token>"

# add a todo item
curl http://127.0.0.1:3000/todos -X POST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"task": "learn how to auth"}' -v

# set all todo items as done
curl http://127.0.0.1:3000/todos -X PATCH -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"done": true}' -v

# get all todos
curl http://127.0.0.1:3000/todos | jq
