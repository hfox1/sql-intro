require_relative 'database_connection'
require_relative 'albumrepository'


DatabaseConnection.connect('music_database')

# result = DatabaseConnection.exec_params('SELECT * FROM albums;', [])
albums = AlbumRepository.new

# albums.all.each { |album| p album } 
p albums.find(3)