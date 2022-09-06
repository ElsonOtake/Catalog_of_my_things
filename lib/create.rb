require './source'
require './movie'

module Create
  def add_source(name)
    source = Source.new(name)
    puts "#{source.id} #{source.name}"
    source
  end

  def add_movie(source, publish_date, silent)
    movie = Movie.new(source, publish_date, silent)
    puts "#{source.id} #{source.name} #{movie.publish_date} #{movie.silent}"
    movie
  end
end
