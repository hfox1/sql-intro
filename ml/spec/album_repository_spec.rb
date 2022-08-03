require "AlbumRepository"

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

  it "after calling all, object attributes can be returned" do 
    
    repo =  AlbumRepository.new 

    albums = repo.all

    expect(albums[0].title).to eq 'DAMN'
    expect(albums[0].release_year).to eq "2017"
    expect(albums[0].artist_id).to eq "7"
    expect(albums.length).to eq 2
    expect(albums[1].title).to eq 'Mr Morale'
    expect(albums[1].release_year).to eq "2022"
    expect(albums[1].artist_id).to eq "7"

  end
  
  it "find gets a particular entry by id" do 
    repo = AlbumRepository.new

    album = repo.find(1)
    
    expect(album.title).to eq 'DAMN'
    expect(album.release_year).to eq "2017"
    expect(album.artist_id).to eq "7"
    
    album = repo.find(2)
    expect(album.title).to eq 'Mr Morale'
    expect(album.release_year).to eq "2022"
    expect(album.artist_id).to eq "7"
    
  end

  it "creates an entry" do 
    albums = AlbumRepository.new

    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1

    albums.create(album)

    all_albums = albums.all
    expect(all_albums[2].title).to eq 'Trompe le Monde'
    # The all_albums array should contain the new Album object
  end

  it "deletes an album" do 
    repository = AlbumRepository.new
    repository.delete(1)
    expect(repository.all.length).to eq 1
  end

end 