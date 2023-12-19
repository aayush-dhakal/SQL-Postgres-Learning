-- By default the the tables are referenced to public schema.

-- If you want to create a new schema then:
=>
CREATE SCHEMA test;

-- Now to do any operation in this schema's table you have to select the table by explicitly mentioning the schema as:
=>
CREATE TABLE test.users (
  id SERIAL PRIMARY KEY,
  username VARCHAR
);

-- If you donot specify the schema name then the table will be created in public schema.
=>
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR
);
-- this will create the table in public schema

-- Same for other queries:
=>
SELECT * FROM test.users;

-- If you want to make test schema default then:
=>
SET search_path TO test, public;

-- Now:
=>
SELECT * FROM users;
-- this will select the users table from test schema
=>
SELECT * FROM public.users;
-- now we have to explicitly define public schema to select its tables

-- To undo the default schema:
=> 
SET search_path TO "$user", public;
-- here $user is the owner of the database. Run whoami to see the user value on your machine for linux or mac
