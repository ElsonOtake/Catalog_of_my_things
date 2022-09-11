module Reader
  def reader_instance(file_name)
    unless File.exist?(file_name)
      File.open(file_name, 'w')
      return []
    end
    instance_array = []
    File.foreach(file_name) do |line|
      instance_array << JSON.parse(line, create_additions: true)
    end
    instance_array
  end

  def reader_genre
    reader_instance('data/genre.json')
  end

  def reader_author
    reader_instance('data/author.json')
  end

  def reader_source
    reader_instance('data/source.json')
  end

  def reader_label
    reader_instance('data/label.json')
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
        file_array << @app.add_game(data[0], data[1], data[8], data[9], read_genre(data), read_author(data),
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
  end

  def reader_music
    unless File.exist?('data/music.json')
      File.open('data/music.json', 'w')
      return []
    end
    read_file('data/music.json')
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
  end
end
