require_relative './genre'
require_relative './author'
require_relative './source'
require_relative './label'
require_relative './book'
require_relative './music'
require_relative './movie'
require_relative './game'

class App
  attr_writer :list_of_genres, :list_of_authors, :list_of_sources, :list_of_labels,
              :list_of_books, :list_of_musics, :list_of_movies, :list_of_games

  def initialize
    @list_of_genres = []
    @list_of_authors = []
    @list_of_sources = []
    @list_of_labels = []
    @list_of_books = []
    @list_of_musics = []
    @list_of_movies = []
    @list_of_games = []
  end

  def list_genres
    @list_of_genres
  end

  def list_authors
    @list_of_authors
  end

  def list_sources
    @list_of_sources
  end

  def list_labels
    @list_of_labels
  end

  def list_books
    @list_of_books
  end

  def list_musics
    @list_of_musics
  end

  def list_movies
    @list_of_movies
  end

  def list_games
    @list_of_games
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

  def add_book(title, publish_date, publisher, cover_state, *param)
    genre, author, source, label = *param
    book = Book.new(title, publish_date, publisher, cover_state)
    book.genre = genre
    book.author = author
    book.source = source
    book.label = label
    @list_of_books << book
    book
  end

  def add_music_album(title, publish_date, on_spotify, *param)
    genre, author, source, label = *param
    music_album = MusicAlbum.new(title, publish_date, on_spotify)
    music_album.genre = genre
    music_album.author = author
    music_album.source = source
    music_album.label = label
    @list_of_musics << music_album
    music_album
  end

  def add_movie(title, publish_date, silent, *param)
    genre, author, source, label = *param
    movie = Movie.new(title, publish_date, silent)
    movie.genre = genre
    movie.author = author
    movie.source = source
    movie.label = label
    @list_of_movies << movie
    movie
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
end
