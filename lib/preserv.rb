require './app'
require 'json'

module Preserv
  def clean_files
    %w[genre author source label book music movie game].each do |class_name|
      File.write("data/#{class_name}.json", '', mode: 'w')
    end
  end

  def write_instances(class_array, class_file)
    class_array.each do |data|
      json_file = JSON.generate(data)
      File.write(class_file, "#{json_file}\n", mode: 'a')
    end
  end

  def write_all_instances
    write_instances(@app.list_genres, 'data/genre.json')
    write_instances(@app.list_authors, 'data/author.json')
    write_instances(@app.list_sources, 'data/source.json')
    write_instances(@app.list_labels, 'data/label.json')
  end

  def write_array(class_array, class_file, *attr)
    class_array.each do |data|
      array_data = [data.title, data.publish_date, data.genre.name, data.author.first_name, data.author.last_name,
                    data.source.name, data.label.title, data.label.color]
      attr.each { |extra| array_data.push(data.send(extra)) }
      json_file = JSON.generate(array_data)
      File.write(class_file, "#{json_file}\n", mode: 'a')
    end
  end

  def write_all_arrays
    write_array(@app.list_books, 'data/book.json', 'publisher', 'cover_state')
    write_array(@app.list_musics, 'data/music.json', 'on_spotify')
    write_array(@app.list_movies, 'data/movie.json', 'silent')
    write_array(@app.list_games, 'data/game.json', 'multiplayer', 'last_played_at')
  end

  def writer
    clean_files
    write_all_instances
    write_all_arrays
  end

  def read_genre(data)
    @app.list_genres.select { |gnr| gnr.name == data[2] }[0]
  end

  def read_author(data)
    @app.list_authors.select { |aut| aut.first_name == data[3] && aut.last_name == data[4] }[0]
  end

  def read_source(data)
    @app.list_sources.select { |src| src.name == data[5] }[0]
  end

  def read_label(data)
    @app.list_labels.select { |lbl| lbl.title == data[6] && lbl.color == data[7] }[0]
  end

  def read_file(file_name)
    file_array = []
    File.foreach(file_name) do |line|
      data = JSON.parse(line)
      case file_name
      when 'data/book.json'
        file_array << @app.add_book(data[0], data[1], data[8], data[9], read_genre(data), read_author(data),
                                    read_source(data), read_label(data))
      when 'data/music.json'
        file_array << @app.add_music_album(data[0], data[1], data[8], read_genre(data), read_author(data),
                                           read_source(data), read_label(data))
      when 'data/movie.json'
        file_array << @app.add_movie(data[0], data[1], data[8], read_genre(data), read_author(data), read_source(data),
                                     read_label(data))
      when 'data/game.json'
        file_arr << @app.add_game(data[0], data[1], data[8], data[9], read_genre(data), read_author(data),
                                  read_source(data), read_label(data))
      end
    end
    file_array
  end

  def reader_book
    unless File.exist?('data/book.json')
      File.open('data/book.json', 'w')
      return []
    end
    read_file('data/book.json')
    # books = []
    # File.foreach('data/book.json') do |line|
    #   book = JSON.parse(line)
    #   genre = @app.list_genres.select { |gnr| gnr.name == book[2] }
    #   author = @app.list_authors.select { |aut| aut.first_name == book[3] && aut.last_name == book[4]}
    #   source = @app.list_sources.select { |src| src.name == book[5] }
    #   label = @app.list_labels.select { |lbl| lbl.title == book[6] && lbl.color == book[7]}
    #   books << @app.add_book(book[0], book[1], book[8], book[9],
    #                          genre[0], author[0], source[0], label[0])
    # end
    # books
  end

  def reader_music
    unless File.exist?('data/music.json')
      File.open('data/music.json', 'w')
      return []
    end
    read_file('data/music.json')
    # music_album = []
    # File.foreach('data/music.json') do |line|
    #   music = JSON.parse(line)
    #   genre = @app.list_genres.select { |gnr| gnr.name == music[2] }
    #   author = @app.list_authors.select { |aut| aut.first_name == music[3] && aut.last_name == music[4]}
    #   source = @app.list_sources.select { |src| src.name == music[5] }
    #   label = @app.list_labels.select { |lbl| lbl.title == music[6] && lbl.color == music[7]}
    #   music_album << @app.add_music_album(music[0], music[1], music[8],
    #                                       genre[0], author[0], source[0], label[0])
    # end
    # music_album
  end

  def reader_movie
    unless File.exist?('data/movie.json')
      File.open('data/movie.json', 'w')
      return []
    end
    read_file('data/movie.json')
  end

  def reader_game
    unless File.exist?('data/game.json')
      File.open('data/game.json', 'w')
      return []
    end
    read_file('data/game.json')
    # game_arr = []
    # File.foreach('data/game.json') do |line|
    #   game = JSON.parse(line)
    #   genre = @app.list_genres.select { |gnr| gnr.name == game[2] }
    #   author = @app.list_authors.select { |aut| aut.first_name == game[3] && aut.last_name == game[4]}
    #   source = @app.list_sources.select { |src| src.name == game[5] }
    #   label = @app.list_labels.select { |lbl| lbl.title == game[6] && lbl.color == game[7]}
    #   game_arr << @app.add_game(game[0], game[1], game[8], game[9],
    #                             genre[0], author[0], source[0], label[0])
    # end
    # game_arr
  end
end
