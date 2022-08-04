require_relative 'post'

class PostRepository
  def all 
    sql = 'SELECT * FROM posts;'
    results = DatabaseConnection.exec_params(sql,[])

    all_posts = []

    results.each{ |record|

      post = Post.new
      post.title = record['title']
      post.content = record['content']
      post.views = record['views']    
      post.account_id = record['account_id'] 

      all_posts << post
    }
    all_posts
  end 

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    sql_params = [id]
    fetched = DatabaseConnection.exec_params(sql, sql_params)

    record = fetched[0]
    post = Post.new

    post.title = record['title']
    post.content = record['content']
    post.views = record['views']    
    post.account_id = record['account_id'] 

    post
  end

  def create(post)
    
    sql = 'INSERT INTO posts (title, content, views, account_id) VALUES ($1, $2, $3, $4);'
    sql_params = [post.title, post.content, post.views, post.account_id]
  
    DatabaseConnection.exec_params(sql,sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end 

  # def update (id, title, content, views, account_id)
  #   sql = 'UPDATE posts SET views = ‘241’ WHERE “id” = $1, title = $2, content = $3, views $ '
  #   sql_params = [id]

  # end

  def update (id, field, value)
# fail if field is not a column name 

    # sql = 'UPDATE posts SET $1 = $2 WHERE id = $3'
    # sql_params = [field, value, id]

    column_name = DatabaseConnection.quote_ident(views)
    sql = conn.exec("UPDATE posts SET #{column_name} = $1 WHERE id = $2")
    # sql = "UPDATE posts SET #{column_name} = $1 WHERE id = $2"
    sql_params = [value, id]

    DatabaseConnection.exec_params(sql, sql_params)

    # id = 1 field = 'views' value = post.views = '241'
# WE ARE GIVING UP 

  end

end

table_name   = conn.quote_ident(table_name)
query_result = conn.exec("SELECT * FROM #{table_name}")