require_relative "album"
require_relative "database_connection"

class AlbumRepository
def initialize
  @albums = []
end

  # Selecting all records
  # No arguments
  def all
   sql = "SElECT * FROM albums;"
   result_set = DatabaseConnection.exec_params(sql, [])
   result_set.each{ |records|
    album = Album.new
    album.title = records["title"]
    album.artist_id = records["artist_id"]
    album.release_year = records["release_year"]
    @albums << album
  }
   return  @albums 
  end

  def find(id)

    sql = 'SELECT * FROM albums WHERE id = $1;'

    params = [id]

      result = DatabaseConnection.exec_params(sql, params)

      entry = result[0]

      album = Album.new
      album.title = entry["title"]
      album.artist_id = entry["artist_id"]
      album.release_year = entry["release_year"]
      album
   
  end

end