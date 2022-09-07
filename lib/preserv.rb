require './app'
require 'json'

module Preserv
  def writer
    File.write('data/movie.json', '', mode: 'w')
    File.write('data/source.json', '', mode: 'w')

    @app.list_movies.each do |movie|
      json_movie = JSON.generate(movie)
      File.write('data/movie.json', "#{json_movie}\n", mode: 'a')
    end
    @app.list_sources.each do |source|
      json_source = JSON.generate(source)
      File.write('data/source.json', "#{json_source}\n", mode: 'a')
    end
  end

  def reader_movie
    unless File.exist?('data/movie.json')
      File.open('data/movie.json', 'w')
      return []
    end
    movie = []
    File.foreach('data/movie.json') do |line|
      movie << JSON.parse(line, create_additions: true)
    end
    movie
  end

  def reader_source
    unless File.exist?('data/source.json')
      File.open('data/source.json', 'w')
      return []
    end
    source = []
    File.foreach('data/source.json') do |line|
      source << JSON.parse(line, create_additions: true)
    end
    source
  end
end
