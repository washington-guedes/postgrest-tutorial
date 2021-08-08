-- create a role with authority to do anything with `todos`
create role todo_user nologin;
grant todo_user to authenticator;

grant usage on schema api to todo_user;
grant all on api.todos to todo_user;
grant usage, select on sequence api.todos_id_seq to todo_user;
