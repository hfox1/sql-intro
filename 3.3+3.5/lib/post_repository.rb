require_relative 'post'
require_relative 'database_connection'

class PostRepository 

  def find_with_tag(tag) # takes a tag, returns a post object 
    sql = 'SELECT posts.id, posts.title FROM posts 
    JOIN posts_tags ON posts_tags.post_id = posts.id
    JOIN tags ON posts_tags.tag_id = tags.id 
    WHERE tags.name = $1;'
    sql_params = [tag]
    fetched = DatabaseConnection.exec_params(sql, sql_params)
    posts = []
    fetched.each { |record|
      record
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post
      posts << post
    }
    posts
  end


end

