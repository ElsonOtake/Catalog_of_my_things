require './app'
require 'json'

module Preserv
  def clean_files
    %w[genre author source label book music movie game].each do |class_name|
      File.write("data/#{class_name}.json", '', mode: 'w')
    end
  end
  
  def writer
    clean_files

    @app.list_movies.each do |movie|
      array_movie = [movie.title, movie.publish_date, movie.genre.name, movie.author.first_name,
                     movie.author.last_name, movie.source.name, movie.label.title, movie.label.color, movie.silent]
      json_movie = JSON.generate(array_movie)
      File.write('data/movie.json', "#{json_movie}\n", mode: 'a')
    end
    @app.list_sources.each do |source|
      json_source = JSON.generate(source)
      File.write('data/source.json', "#{json_source}\n", mode: 'a')
    end
    @app.list_books.each do |book|
      array_book = [book.title, book.publish_date, book.genre.name, book.author.first_name,
        book.author.last_name, book.source.name, book.label.title, book.label.color, book.publisher, book.cover_state]
      json_book = JSON.generate(array_book)
      File.write('data/book.json', "#{json_book}\n", mode: 'a')
    end
    @app.list_labels.each do |label|
      json_label = JSON.generate(label)
      File.write('data/label.json', "#{json_label}\n", mode: 'a')
    end
    @app.list_musics.each do |music_album|
      array_music_album = [music_album.title, music_album.publish_date,
        music_album.genre.name, music_album.author.first_name,
        music_album.author.last_name, music_album.source.name, music_album.label.title, music_album.label.color, music_album.on_spotify]
      json_music_album = JSON.generate(array_music_album)
      File.write('data/music.json', "#{json_music_album}\n", mode: 'a')
    end
    @app.list_genres.each do |genre|
      json_genre = JSON.generate(genre)
      File.write('data/genre.json', "#{json_genre}\n", mode: 'a')
    end
    @app.list_games.each do |game|
      array_game = [game.title, game.publish_date, game.genre.name, game.author.first_name,
        game.author.last_name, game.source.name, game.label.title, game.label.color, game.multiplayer, game.last_played_at]
      json_game = JSON.generate(array_game)
      File.write('data/game.json', "#{json_game}\n", mode: 'a')
    end
    @app.list_authors.each do |source|
      json_author = JSON.generate(source)
      File.write('data/author.json', "#{json_author}\n", mode: 'a')
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
      genre = @app.list_genres.select { |gnr| gnr.name == movie[2] }
      author = @app.list_authors.select { |aut| aut.first_name == movie[3] && aut.last_name == movie[4]}
      source = @app.list_sources.select { |src| src.name == movie[5] }
      label = @app.list_labels.select { |lbl| lbl.title == movie[6] && lbl.color == movie[7]}
      movies << @app.add_movie(movie[0], movie[1], movie[8],
                               genre[0], author[0], source[0], label[0])
    end
    movies
  end
end
