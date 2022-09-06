require './source'
require './movie'

module Create
  def add_source(name)
    Source.new(name)
  end

  def add_movie(source, publish_date, silent)
    Movie.new(source, publish_date, silent)
  end
end
