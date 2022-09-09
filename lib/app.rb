require_relative './movie'
require_relative './source'
require_relative './books/book'
require_relative './label'
require_relative './genre'
require_relative './music_album'
require_relative './author'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_books, :list_of_labels, :list_of_music_albums, :list_of_genres

  def initialize
    @list_of_movies = []
    @list_of_sources = []

    @list_of_books = []
    @list_of_labels = []

    @list_of_music_albums = []
    @list_of_genres = []

    @list_of_games = []
    @list_of_authors = []
  end

  # Elson part EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
  def list_movies
    @list_of_movies
  end

  def list_sources
    @list_of_sources
  end
  # EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

  # Andres Part AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

  def list_books
    @list_of_books
  end

  def list_labels
    @list_of_labels
  end

  # AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

  def list_music_albums
    @list_of_music_albums
  end

  def list_genres
    @list_of_genres
  end

  def list_games
    @list_of_games
  end

  def list_authors
    @list_of_authors
  end

  # Elson part EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
  def add_movie(title, publish_date, silent, *param)
    _genre, _author, source, _label = *param
    movie = Movie.new(title, publish_date, silent)
    movie.genre = source

    movie.author = source

    movie.source = source

    movie.label = source

    @list_of_movies << movie

    movie
  end
  # EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

  # Andres Part #####
  def add_book(title, publisher, cover_state, publish_date, *param)
    _genre, _author, source, label = *param
    book = Book.new(title, publisher, cover_state, publish_date)
    book.genre = source # pendiente ------------------------------
    book.author = source # pendiente  ----------------------------
    book.source = source
    book.label = label
    @list_of_books << book
    book
  end
  ##############################################################

  def add_music_album(title, publish_date, on_spotify, *param)
    genre, source, _author, label = *param
    music_album = MusicAlbum.new(title, publish_date, on_spotify)
    music_album.genre = genre
    music_album.source = source
    music_album.author = source
    music_album.label = label
    @list_of_music_albums << music_album
    music_album
  end

  # Elson part EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
  def add_source(name)
    source = Source.new(name)

    @list_of_sources << source

    source
  end
  # EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

  # Andres Part AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  def add_label(title, color)
    label = Label.new(title, color)
    @list_of_labels << label
    label
  end
  # AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

  def add_genre(name)
    genre = Genre.new(name)
    @list_of_genres << genre
    genre
  end
end
