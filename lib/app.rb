require_relative './movie'
require_relative './source'
require_relative './books/book'
require_relative './label'
require_relative './genre'
require_relative './music_album'
require 'author'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_books, :list_of_labels

  def initialize
    @list_of_movies = []
    @list_of_sources = []

    @list_of_books = []
    @list_of_labels = []
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
    @list_of_movies
  end

  def list_labels
    @list_of_sources
  end

  # AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

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
end
