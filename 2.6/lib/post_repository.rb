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

  def update(post, update_field)
    sql = updater_string(update_field)
    sql_params = []
    case update_field
      when "id"
        sql_params << post.id
      when "title"
        sql_params << post.title
      when "content"
        sql_params << post.content
      when "views"
        sql_params << post.views
      when "account_id"
        sql_params << post.account_id
    end
    sql_params << post.id

    DatabaseConnection.exec_params(sql, sql_params)
  end
  
  def updater_string(update_field)
    "UPDATE posts SET #{update_field} = $1 WHERE id = $2;"
  end

end
