require_relative 'bookstore.rb'
require_relative 'database_connection.rb'

DatabaseConnection.connect

repo = BookStore.new
library = repo.all
library.each { |book| p "#{book.id} - #{book.title} - #{book.author_name}" }
