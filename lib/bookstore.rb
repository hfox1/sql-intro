require_relative 'database_connection.rb'
require_relative 'book.rb'

class BookStore
  def initialize 
  @store = []
  end

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, author_name FROM books;
    sql = "SELECT id, title, author_name FROM books;"
    booklist = DatabaseConnection.exec_params(sql, [])
    booklist.each { |book| 
      b = Book.new
      b.id = book["id"]    
      b.title = book["title"]    
      b.author_name = book["author_name"]
      @store << b
    }
    @store
    # Returns an array of book objects.
  end
end