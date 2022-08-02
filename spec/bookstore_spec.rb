require 'bookstore'
require 'book'


def reset_books_table
  seed_sql = File.read('spec/seeds_book_store.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

RSpec.describe do
  before(:each) do 
    reset_books_table
  end

  it "returns book attributes correctly from table" do 
    # b = Book.new
    # b.title = "one"
    # expect(b.title).to eq "one"

    repo = BookStore.new
    library = repo.all

    expect(library.length).to eq 2

   expect(library[0].id).to eq "1"
   expect(library[0].title).to eq 'Dune'
    expect(library[0].author_name).to eq 'Frank Herbert'

    expect(library[1].id).to eq "2"
    expect(library[1].title).to eq 'The Dispossessed'
    expect(library[1].author_name).to eq 'Ursula K. Le Guin'
  end

  # returning list of book ojbects already tested for by preceeding test 

  
end