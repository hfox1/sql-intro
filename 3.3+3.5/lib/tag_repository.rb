require_relative 'tag'
require_relative 'database_connection'

class TagRepository 

  def find_by_post(post) # takes a post, returns tag objects 
    sql = 'SELECT tags.id, tags.name FROM tags 
    JOIN posts_tags ON posts_tags.tag_id = tags.id
    JOIN posts ON posts_tags.post_id = posts.id 
    WHERE posts.title = $1;'
    sql_params = [post]
    fetched = DatabaseConnection.exec_params(sql, sql_params)
    tags = []
    fetched.each { |record|
      record
      tag = Tag.new
      tag.id = record['id']
      tag.name = record['name']
      tag
      tags << tag
    }
    tags
  end


end

