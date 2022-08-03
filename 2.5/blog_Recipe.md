# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

posts, title, post_content, comment, comment_content, comment_author
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.


## 3. Decide the column types.

POSTS 
id SERIAL 
title text 
post_content text 

COMMENTS 
id SERIAL 
post_id int
comment_content text 
comment_author text

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.



## 4. Decide on The Tables Relationship

one post has many comments

## 4. Write the SQL.

```sql 
CREATE TABLE posts (
id SERIAL, 
title text,
post_content text 
);


CREATE TABLE comments ( 
id SERIAL, 
comment_content text,
comment_author text,
post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id)
    on delete cascade
);


```


## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```
