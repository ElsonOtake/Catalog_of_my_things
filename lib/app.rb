require_relative './movie'
require_relative './source'
require_relative './genre'
require_relative './music_album'

class App
  attr_writer :list_of_movies, :list_of_sources, :list_of_music_albums, :list_of_genres

  def initialize
    @list_of_movies = []
    @list_of_sources = []
    @list_of_music_albums = []
    @list_of_genres = []
  end

  def list_movies
    @list_of_movies
  end

  def list_sources
    @list_of_sources
  end

  def list_music_albums
    @list_of_music_albums
  end

  def list_genres
    @list_of_genres
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

  def add_music_album(title, publish_date, on_spotify, *param)
    genre, source, _author, _label = *param

    music_album = MusicAlbum.new(title, publish_date, on_spotify)

    music_album.genre = genre

    music_album.author = genre

    music_album.source = source

    music_album.label = genre

    @list_of_music_albums << music_album

    music_album
  end

  def add_source(name)
    source = Source.new(name)
    @list_of_sources << source
    source
  end

  def add_genre(name)
    genre = Genre.new(name)

    @list_of_genres << genre

    genre
  end
end
