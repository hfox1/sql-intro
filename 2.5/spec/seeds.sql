TRUNCATE TABLE cohorts, students RESTART IDENTITY;


INSERT INTO cohorts (name, starting_date) VALUES ('July 22', 'my grandmas recipe');
INSERT INTO cohorts (name, starting_date) VALUES ('Choucroute', 'you lot arent even ready');

INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('oh my god this recipe made my life', 'jezza', 1);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('who knew bananas could taste like this', 'jflow', 1);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('wow thank u so much my wife loves it', 'jeremih', 2);
INSERT INTO comments (comment_content, comment_author, post_id) VALUES ('my life is blown up', 'tinie', 2);

