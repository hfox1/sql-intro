class PostRepository

  def find_with_comments(post)
    # returns array of post object with comment objects 
  end 

  def create(post, comments)
    # creates post or comments 
  end 

  def all_with_comments
    #returns hash of pairs: post object: array of comment objects 
  end 

  def update (table, id, field, value) 
    #  sql = 'UPDATE accounts SET email = $1, username = $2 WHERE id = $3;'
    # sql_params = [account.email, account.username, account.id]
    # DatabaseConnection.exec_params(sql, sql_params)

  end

  def delete 
    #deletes posts and all their comments 
  end

end

