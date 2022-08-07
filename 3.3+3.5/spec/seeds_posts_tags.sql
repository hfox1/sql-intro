
TRUNCATE TABLE posts, tags, posts_tags RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.


INSERT INTO posts (title) VALUES ('REALLY big trucks');
INSERT INTO posts (title) VALUES ('When it hits');
INSERT INTO posts (title) VALUES ('How to FINALLY use up those leeches');

INSERT INTO tags (name) VALUES ('huntsman tips');
INSERT INTO tags (name) VALUES ('niche');
INSERT INTO tags (name) VALUES ('quiche');

INSERT INTO posts_tags (post_id, tag_id) VALUES (1, 2);
INSERT INTO posts_tags (post_id, tag_id) VALUES (2, 3);
INSERT INTO posts_tags (post_id, tag_id) VALUES (3, 1);
INSERT INTO posts_tags (post_id, tag_id) VALUES (3, 2);


