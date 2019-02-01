-- Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

-- Write a query to delete a user named `michael` if it exists

DROP user IF EXISTS michael;

-- Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE user WITH ENCRYPTED PASSWORD 'stonebreaker';

-- Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

-- Connect to the newly created database

\c todo_app;

-- Write a query to create a table named `tasks` using the Initial columns detailed below...

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp WITHOUT TIME ZONE NOT NULL default now()
  updated_at timestamp WITHOUT TIME ZONE NULL,
  completed boolean NOT NULL default false
);

ALTER TABLE tasks
DROP COLUMN completed,
ADD COLUMN completed_at TIMESTAMP default NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET default now();

-- Create a new task, by only setting values (not defining which columns)

-- INSERT INTO tasks
-- VALUES (default, 'Study SQL', 'Complete this exercise!');

-- -- Create a new task with title = 'Study PostgreSQL', description = 'Read all the documentation'

-- INSERT INTO tasks
-- VALUES (default, 'Study PostgreSQL', 'Read all the documentation');

-- As long as we specify insertion points (columns), we can do the two above tasks at once:
INSERT INTO tasks (title, description)
VALUES 
('Study SQL', 'Complete this exercise!'),
('Study PostgreSQL', 'Read all the documentation');

-- Select all the titles of tasks that are not yet completed

SELECT title FROM tasks WHERE completed_at = false;

-- Select all titles and descriptions of tasks that are not yet completed.

SELECT title, description FROM tasks WHERE completed_at = false;

-- SELECT title FROM tasks WHERE title = 'Study SQL'; Selects but doesn't do anything to it...

-- Update the task with a title of 'Study SQL' to be completed as of now

UPDATE tasks SET completed_at = now() 
WHERE title = 'Study SQL';

-- SELECT all titles and descriptions of tasks that are not yet completed

SELECT (title, description) FROM tasks
WHERE completed_at = NULL;

-- Select al fields of every task sorted by creation date in ascending order.

SELECT * FROM tasks
ORDER BY created_at DESC;

-- Create new tasks

INSERT INTO tasks (title, description)
VALUES
('mistake 1', 'a test entry'),
('mistake 2', 'another test entry'),
('third mistake', 'another test entry');

-- Select title fields of all tasks with a title that includes the word 'mistake'

SELECT title FROM tasks WHERE title ~ 'mistake';

-- delete the task that has a title of 'mistake 1'

SELECT title FROM tasks WHERE title = 'mistake 1';

-- Select title and description fields of all tasks with a title that includes the word 'mistake'

SELECT title, description FROM tasks WHERE title ~ 'mistake';

-- Select all fields of all tasks sorted by 'title' in ascending order

SELECT * FROM tasks
ORDER BY title ASC;
