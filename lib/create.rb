require './source'
require './movie'

module Create
  def add_source(name)
    Source.new(name)
  end

  # rubocop:disable Metrics/ParameterLists
  def add_movie(genre, author, source, label, publish_date, silent)
    Movie.new(genre, author, source, label, publish_date, silent)
  end
  # rubocop:enable Metrics/ParameterLists
end
