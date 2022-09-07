require './movie'
require './source'

class App
  attr_writer :list_of_movies, :list_of_sources

  def initialize
    @list_of_movies = []
    @list_of_sources = []
  end

  def list_movies
    @list_of_movies
  end

  def list_sources
    @list_of_sources
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

  def add_source(name)
    source = Source.new(name)
    @list_of_sources << source
    source
  end
end
