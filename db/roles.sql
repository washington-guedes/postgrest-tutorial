-- language plpgsql

-- alternative to the highly privileged `postgres` role
create role authenticator noinherit login password 'auth-pwd';

-- anonymous access
create role web_anon nologin;
grant usage on schema api to web_anon;
grant select on api.todos to web_anon;
grant web_anon to authenticator;

-- a role with authority to do anything with `todos`
create role todo_user nologin;
grant usage on schema api to todo_user;
grant all on api.todos to todo_user;
grant usage, select on sequence api.todos_id_seq to todo_user;
grant todo_user to authenticator;

-- all roles must go through authn/authz validation
grant usage on schema auth to web_anon, todo_user;
