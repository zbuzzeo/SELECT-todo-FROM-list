-- Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

-- Write a query to delete a user named `michael` if it exists

DROP USER IF EXISTS michael;

-- Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE ROLE michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

-- Connect to the newly created database

\connect todo_app;

-- Write a query to create a table named `tasks` using the Initial columns detailed below...

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp NOT NULL default now(),
  updated_at timestamp,
  completed boolean NOT NULL default false
);

ALTER TABLE tasks
DROP COLUMN completed,
ADD COLUMN completed_at timestamp default NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET default now();

-- Create a new task, by only setting values (not defining which columns)

-- Create a new task with title = 'Study PostgreSQL', description = 'Read all the documentation'

INSERT INTO tasks (title, description)
VALUES 
('Study SQL', 'Complete this exercise'),
('Study PostgreSQL', 'Read all the documentation');

-- Select all the titles of tasks that are not yet completed

SELECT title FROM tasks WHERE completed_at IS NULL;

-- Update the task with a title of 'Study SQL' to be completed as of now

UPDATE tasks SET completed_at = now()
WHERE title = 'Study SQL';

-- SELECT all titles and descriptions of tasks that are not yet completed

SELECT title, description FROM tasks
WHERE completed_at IS NULL;

-- Select all fields of every task sorted by creation date in ascending order.

SELECT * FROM tasks
ORDER BY created_at ASC;

-- Create new tasks

INSERT INTO tasks (title, description)
VALUES
('mistake 1', 'a test entry'),
('mistake 2', 'a test entry'),
('third mistake', 'another test entry');

-- Select title fields of all tasks with a title that includes the word 'mistake'

SELECT title FROM tasks WHERE title ~ 'mistake';

-- delete the task that has a title of 'mistake 1'

DELETE FROM tasks WHERE title = 'mistake 1';

-- Select title and description fields of all tasks with a title that includes the word 'mistake'

SELECT title, description FROM tasks
WHERE title ~ 'mistake';

-- Select all fields of all tasks sorted by 'title' in ascending order

SELECT * FROM tasks
ORDER BY title ASC;
