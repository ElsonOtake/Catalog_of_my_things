require './source'
require './movie'

module Create
  def add_source(name)
    Source.new(name)
  end

  def add_movie(_genre, _author, source, _label, publish_date, silent)
    movie = Movie.new(publish_date, silent)
    movie.source = source
    movie
  end
end
