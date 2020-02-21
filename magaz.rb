require_relative 'tovar'
require_relative 'book'
require_relative 'movie'

film = Movie.from_file '01'
puts film.to_s

book = Book.from_file '01'
puts book.to_s

book = Tovar.from_file '01'