require './app'
require 'json'

module Preserv
  def writer
    File.write('data/movie.json', '', mode: 'w')
    File.write('data/source.json', '', mode: 'w')

    @app.list_movies.each do |movie|
      array_movie = [movie.title, movie.publish_date, movie.silent, movie.genre.name, movie.author.first_name,
        movie.author.last_name, movie.source.name, movie.label.title, movie.label.color]
      json_movie = JSON.generate(array_movie)
      File.write('data/movie.json', "#{json_movie}\n", mode: 'a')
    end
    @app.list_sources.each do |source|
      json_source = JSON.generate(source)
      File.write('data/source.json', "#{json_source}\n", mode: 'a')
    end
  end

  def book_label_writer
    File.write('data/book.json', '', mode: 'w')
    File.write('data/label.json', '', mode: 'w')

    @app.list_books.each do |book|
      array_book = [book.title, book.publisher, book.cover_state, book.publish_date, book.genre.name, book.author.first_name,
        book.author.last_name, book.source.name, book.label.title, book.label.color]
      json_book = JSON.generate(array_book)
      File.write('data/book.json', "#{json_book}\n", mode: 'a')
    end
    @app.list_labels.each do |label|
      json_label = JSON.generate(label)
      File.write('data/label.json', "#{json_label}\n", mode: 'a')
    end
  end

  def music_writer
    File.write('data/music.json', '', mode: 'w')
    File.write('data/genre.json', '', mode: 'w')

    @app.list_musics.each do |music_album|
      array_music_album = [music_album.title, music_album.publish_date, music_album.on_spotify,
        music_album.genre.name, music_album.author.first_name,
        music_album.author.last_name, music_album.source.name, music_album.label.title, music_album.label.color]
      json_music_album = JSON.generate(array_music_album)
      File.write('data/music.json', "#{json_music_album}\n", mode: 'a')
    end
    @app.list_genres.each do |genre|
      json_genre = JSON.generate(genre)
      File.write('data/genre.json', "#{json_genre}\n", mode: 'a')
    end
  end

  def game_writer
    File.write('data/game.json', '', mode: 'w')
    File.write('data/author.json', '', mode: 'w')

    @app.list_games.each do |game|
      array_game = [game.title, game.publish_date, game.multiplayer, game.last_played_at, game.genre.name, game.author.first_name,
        game.author.last_name, game.source.name, game.label.title, game.label.color]
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
      genre = @app.list_genres.select { |gnr| gnr.name == movie[3] }
      author = @app.list_authors.select { |aut| aut.first_name == movie[4] && aut.last_name == movie[5]}
      source = @app.list_sources.select { |src| src.name == movie[6] }
      label = @app.list_labels.select { |lbl| lbl.title == movie[7] && lbl.color == movie[8]}
      movies << @app.add_movie(movie[0], movie[1], movie[2],
                               genre[0], author[0], source[0], label[0])
    end
    movies
  end
end
