# Two Tables (Many-to-Many) Design Recipe Template

_Copy this recipe template to design and create two related database tables having a Many-to-Many relationship._

## 1. Extract nouns from the user stories or specification

```

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of movies with their title and release date.

As a cinema company manager,
So I can keep track of movies being shown,
I want to keep a list of my cinemas with their city name (e.g 'London' or 'Manchester').

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which cinemas are showing a specific movie.

As a cinema company manager,
So I can keep track of movies being shown,
I want to be able to list which movies are being shown a specific cinema.
```

```
Nouns:

movies, title, release_year 
cinemas, city

```
## 2. Infer the Table Name and Columns
```
movies 
  title, release_year 
cinemas
  city
movies_cinemas
  movie_id, cinema_id

```
## 4. Write the SQL.

```sql

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title text,
  releae_year int
);

-- Create the second table.
CREATE TABLE cinemas (
  id SERIAL PRIMARY KEY,
  city text
);

-- Create the join table.
CREATE TABLE movies_cinemas (
  movie_id int,
  cinema_id int,
  constraint fk_post foreign key(movie_id) references movies(id) on delete cascade,
  constraint fk_tag foreign key(cinema_id) references cinema(id) on delete cascade,
  PRIMARY KEY (movie_id, cinema_id)
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < movies_cinemas.sql
```
