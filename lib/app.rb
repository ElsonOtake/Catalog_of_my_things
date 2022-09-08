require_relative './movie'
require_relative './source'
require_relative './books/book'
require_relative './label'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_books, :list_all_labels

  def initialize
    @list_of_movies = []
    @list_of_sources = []
    @list_of_books = []
    @list_of_labels = []
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

  def add_movie(publish_date, silent, *param)
    _genre, _author, source, _label = *param
    movie = Movie.new(publish_date, silent)
    movie.genre = source
    movie.author = source
    movie.source = source
    movie.label = source
    @list_of_movies << movie
    movie
  end

  def add_source(name)
    source = Source.new(name)
    @list_of_sources << source
    source
  end

  def add_book(publisher, cover_state, publish_date, *param)
    genre, author, source, label = *param
    book = Book.new(publisher, cover_state, publish_date)
    book.genre = genre
    book.author = author
    book.source = source
    book.label = label
    @list_of_books << book
    book
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @list_of_labels << label
    label
  end
end
