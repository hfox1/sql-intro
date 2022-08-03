# require 'app'
# require 'albumrepository'
# require 'album'

# def reset_albums_table
#   seed_sql = File.read('spec/seeds_albums.sql')
#   connection = PG.connect({ host: '127.0.0.1', dbname: 'music_database_test' })
#   connection.exec(seed_sql)
# end

# RSpec.describe "app" do
  
#   before(:each) do 
#     reset_albums_table
#   end


#   it "prints list of albums to terminal" do
#     repo = AlbumRepository.new
#     albums = repo.all
#     expect(albums.print).to eq ["DAMN", "Mr Morale"]
#   end

# end