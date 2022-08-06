TRUNCATE TABLE posts, comments RESTART IDENTITY;


INSERT INTO posts (title, post_content) VALUES ('Banana bread', 'my grandmas recipe');
INSERT INTO posts (title, post_content) VALUES ('Choucroute', 'you lot arent even ready');

INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('oh my god this recipe made my life', 'jezza', 1);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('who knew bananas could taste like this', 'jflow', 1);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('wow thank u so much my wife loves it', 'jeremih', 2);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('my life is blown up', 'tinie', 2);

