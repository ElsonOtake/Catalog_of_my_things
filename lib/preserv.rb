require './app'
require 'json'

module Preserv
  def writer
    File.write('data/movie.json', '', mode: 'w')
    File.write('data/source.json', '', mode: 'w')

    @app.list_movies.each do |movie|
      array_movie = [movie.title, movie.publish_date, movie.silent, movie.genre.name,
                     movie.author.first_name, movie.author.last_name, movie.source.name,
                     movie.label.title, movie.label.color]
      json_movie = JSON.generate(array_movie)
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
    movies = []
    File.foreach('data/movie.json') do |line|
      movie = JSON.parse(line)
      # genre = @app.list_genres.select { |gnr| gnr.name == movie[3] }
      # author = @app.list_authors.select { |aut| aut.first_name == movie[4] && aut.last_name == movie[5] }
      source = @app.list_sources.select { |src| src.name == movie[6] }
      # label = @app.list_labels.select { |lbl| lbl.title == movie[7] && lbl.color == movie[8] }
      movies << @app.add_movie(movie[0], movie[1], movie[2],
                               source[0], source[0], source[0], source[0])
      #  genre[0], author[0], source[0], label[0])
    end
    movies
  end

  def reader_source
    unless File.exist?('data/source.json')
      File.open('data/source.json', 'w')
      return []
    end
    sources = []
    File.foreach('data/source.json') do |line|
      sources << JSON.parse(line, create_additions: true)
    end
    sources
  end
end
