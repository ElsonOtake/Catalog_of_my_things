require './app'
require 'json'

module Preserv
  def writer_author_games
    File.write('data/game.json', '', mode: 'w')
    File.write('data/author.json', '', mode: 'w')

    @app.list_games.each do |game|
      array_game = [game.title, game.publish_date, game.genre.name, game.author.first_name, game.label.title, game.id,
                    game.source.name, game.multiplayer, game.last_played_at]
      json_game = JSON.generate(array_game)
      File.write('data/game.json', "#{json_game}\n", mode: 'a')
    end
    @app.list_authors.each do |author|
      json_author = JSON.generate(author)
      File.write('data/author.json', "#{json_author}\n", mode: 'a')
    end
  end

  def reader_games
    unless File.exist?('data/game.json')
      File.open('data/game.json', 'w')
      return []
    end
    games = []
    File.foreach('data/game.json') do |line|
      game = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == game[2] }
      author = @app.list_authors.select { |auth| auth.first_name == game[3] }
      label = @app.list_labels.select { |lbl| lbl.title == game[4] }
      source = @app.list_sources.select { |src| src.name == game[6] }
      games << @app.add_game(game[0], game[1], game[7], game[8],
                             genre[0], author[0], label[0], source[0])
    end
    games
  end
  def book_label_writer
    File.write('data/book.json', '', mode: 'w')
    File.write('data/label.json', '', mode: 'w')

    @app.list_books.each do |book|
      array_book = [book.title, book.publisher, book.cover_state, book.publish_date, book.genre.name, book.source.name,
                    book.author.first_name, book.author.last_name, book.label.title, book.label.color]
      json_movie = JSON.generate(array_book)
      File.write('data/book.json', "#{json_movie}\n", mode: 'a')
    end
    @app.list_labels.each do |label|
      json_label = JSON.generate(label)
      File.write('data/label.json', "#{json_label}\n", mode: 'a')
    end
  end

  def reader_book
    unless File.exist?('data/book.json')
      File.open('data/book.json', 'w')
      return []
    end
    books = []
    File.foreach('data/book.json') do |line|
      book = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == book[4] }
      author = @app.list_authors.select { |auth| auth.last_name == book[7] }
      source = @app.list_sources.select { |src| src.name == book[5] }
      label = @app.list_labels.select { |lab| lab.title == book[8] }
      books << @app.add_book(book[0], book[1], book[2], book[3],
                             genre[0], author[0], source[0], label[0])
    end
    books
  end

  def reader_label
    unless File.exist?('data/label.json')
      File.open('data/label.json', 'w')
      return []
    end
    labels = []
    File.foreach('data/label.json') do |line|
      labels << JSON.parse(line, create_additions: true)
    end
    labels
  end

  def music_writer
    File.write('data/music_album.json', '', mode: 'w')
    File.write('data/source.json', '', mode: 'w')
    File.write('data/genre.json', '', mode: 'w')

    @app.list_music_albums.each do |music_album|
      array_music_album = [music_album.title, music_album.publish_date, music_album.on_spotify,
                           music_album.genre.name, music_album.source.name]
      json_music_album = JSON.generate(array_music_album)
      File.write('data/music_album.json', "#{json_music_album}\n", mode: 'a')
    end
    @app.list_sources.each do |source|
      json_source = JSON.generate(source)
      File.write('data/source.json', "#{json_source}\n", mode: 'a')
    end
    @app.list_genres.each do |genre|
      json_genre = JSON.generate(genre)
      File.write('data/genre.json', "#{json_genre}\n", mode: 'a')
    end
  end

  def reader_music
    unless File.exist?('data/music_album.json')
      File.open('data/music_album.json', 'w')
      return []
    end
    music_album = []
    File.foreach('data/music_album.json') do |line|
      music = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == music[3] }
      source = @app.list_sources.select { |src| src.name == music[4] }
      music_album << @app.add_music_album(music[0], music[1], music[2],
                                          genre[0], source[0], genre[0], genre[0])
    end
    music_album
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
  def reader_genre
    unless File.exist?('data/genre.json')
      File.open('data/genre.json', 'w')
      return []
    end
    genres = []
    File.foreach('data/genre.json') do |line|
      genres << JSON.parse(line, create_additions: true)
    end
    genres
  end
end
