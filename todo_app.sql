-- Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

-- Write a query to delete a user named `michael` if it exists

DROP user IF EXISTS michael;

-- Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE user WITH ENCRYPTED PASSWORD stonebreaker;

-- Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

-- Connect to the newly created database

\c todo_app;
