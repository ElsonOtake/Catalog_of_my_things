require 'movie'

require 'source'

require 'author'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_games, list_of_authors

  def initialize
    @list_of_movies = []

    @list_of_games = []

    @list_of_authors = []

    @list_of_sources = []
  end

  def list_movies
    @list_of_movies
  end

  def list_sources
    @list_of_sources
  end

  def list_games
    @list_of_games
  end

  def list_authors
    @list_of_authors
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

  def add_game(_title, publish_date, multiplayer, last_played_at, *param)
    _genre, author, source, _label = *param

    game = Games.new(publish_date, multiplayer, last_played_at)

    game.genre = source

    game.author = author

    game.source = source

    @list_of_games << game

    game
  end

  def add_author(name)
    author = Author.new(name)

    @list_of_authors << author

    author
  end

  def add_source(name)
    source = Source.new(name)

    @list_of_sources << source

    source
  end
end
