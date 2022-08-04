# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

```

```
Nouns:

accounts, 
email, username, 

posts, 
title, content, views, account_id
```

## 3. Decide the column types.

accounts 
id SERIAL PRIMARY KEY,
email text,
username text 

posts 
id SERIAL PRIMARY KEY,
title text,
content text,
views int,
account_id int

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.



## 4. Decide on The Tables Relationship

one account has many posts

## 4. Write the SQL.

```sql 
CREATE TABLE accounts (
id SERIAL PRIMARY KEY,
email text,
username text 
);


CREATE TABLE posts ( 
id SERIAL PRIMARY KEY,
title text,
content text,
views int,
account_id int

  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);



Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO students (name, cohort_name) VALUES ('Anna', 'May 2022');
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql

# 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

ACCOUNTS CLASSES 
# Table name: account

# Model class DONE
# (in lib/account.rb)
class Account
attr_accessor 
end

# Repository class
# (in lib/account_repository.rb)
class AccountRepository
  def all 
  end 

  def find
  end

  def create
  end

  def delete
  end 

end

POSTS CLASSES 

# Model class
# (in lib/post.rb)
class Post
end

# Repository class
# (in lib/post_repository.rb)
class PostRepository
def all 
  end 

  def find
  end

  def create
  end

  def delete
  end 
end

4. Implement the Model class

models done

class accountRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT title, release_year, artist_id FROM accounts;

    # Returns an array of account objects.
  end

  def find(id)
   # The placeholder $1 is a "parameter" of the SQL query.
   # It needs to be matched to the corresponding element 
    # of the array given in second argument to exec_params.
    #
    # (If we needed more parameters, we would call them $2, $3...
    # and would need the same number of values in the params array).

    # this shit needs to return an account, found by id

    sql = 'SELECT name, cohort_name FROM students WHERE id = $1;'

      params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    # (The code now needs to convert the result to a
    # Student object and return it)

  end 


end

6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

ACCOUNTS


# 1
# Get all accounts


repo =  AccountRepository.new 

accounts = repo.all

expect(accounts[0].email).to eq 'david@yahoo.com'
expect(accounts[0].username).to eq 'big dave'
expect(accounts.length).to eq 2
expect(accounts[1].email).to eq 'janed@yahoo.com'
expect(accounts[1].username).to eq 'jane'

# 2
# Get a single account

repo = AccountRepository.new

account = repo.find(1)

expect(account.email).to eq 'david@yahoo.com'
expect(account.username).to eq 'big dave'

account = repo.find(2)

expect(account.email).to eq 'janed@yahoo.com'
expect(account.username).to eq 'jane'

# 3
# Create a single account

repo = AccountRepository.new
account = Account.new
account.email = 'david@yahoo.com'
account.username = 'big dave'

repo.create(account)

expect(repo.all.length).to eq 3


# 4
# Delete a single account

repo = AccountRepository.new
repo.delete(1)
expect(repo.all.length).to eq 1

POSTS 



# 1
# Get all posts


repo =  PostRepository.new 

posts = repo.all

expect(posts[0].title).to eq 'tuesday'
expect(posts[0].content).to eq 'gregs'
expect(posts[0].views).to eq '24'
expect(posts[0].account_id).to eq '1'

expect(posts.length).to eq 2

expect(posts[1].title).to eq 'wednesday'
expect(posts[1].content).to eq 'gregs2'
expect(posts[1].views).to eq '10'
expect(posts[1].account_id).to eq '2'

# 2
# Find a single post

repo =  PostRepository.new 

post = repo.find(1)

expect(post.title).to eq 'tuesday'
expect(post.content).to eq 'gregs'
expect(post.views).to eq '24'
expect(post.account_id).to eq '1'

post = repo.find(2)

expect(post.title).to eq 'wednesday'
expect(post.content).to eq 'gregs2'
expect(post.views).to eq '10'
expect(post.account_id).to eq '2'

# 3
# Create a single post

repo = PostRepository.new
post = post.new

post.title = 'thursday'
post.content = 'gregs3'
post.views = '10000'
post.account_id = '3'

repo.create(post)

expect(repo.all.length).to eq 3


# 4
# Delete a single post

repo = PostRepository.new
repo.delete(1)
expect(repo.all.length).to eq 1




7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.