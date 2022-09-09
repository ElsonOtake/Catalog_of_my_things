require_relative './movie'
require_relative './source'
require_relative './books/book'
require_relative './label'
require_relative './genre'
require_relative './music_album'
require_relative './author'
require_relative './games/games'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_books, :list_of_labels, :list_of_music_albums,
              :list_of_genres, :list_of_games, :list_of_authors

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

  def list_movies
    @list_of_movies
  end

  def list_sources
    @list_of_sources
  end

  def list_books
    @list_of_books
  end

  def list_labels
    @list_of_labels
  end

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

  def add_game(title, publish_date, multiplayer, last_played_at, *param)
    genre, author, source, label = *param
    game = Game.new(title, publish_date, multiplayer, last_played_at)
    game.genre = genre
    game.author = author
    game.source = source
    game.label = label
    @list_of_games << game
    game
  end

  def add_source(name)
    source = Source.new(name)

    @list_of_sources << source

    source
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @list_of_labels << label
    label
  end

  def add_genre(name)
    genre = Genre.new(name)
    @list_of_genres << genre
    genre
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @list_of_authors << author
    author
  end
end
