TRUNCATE TABLE accounts RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE posts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, username) VALUES ('David@yahoo.com', 'big dave');
INSERT INTO accounts (email, username) VALUES ('janed@yahoo.com', 'jane');

INSERT INTO posts (title,content,views,account_id) VALUES ('tuesday', 'gregs', 24, 1);
INSERT INTO posts (title,content,views,account_id) VALUES ('wednesday', 'gregs2', 10, 2);