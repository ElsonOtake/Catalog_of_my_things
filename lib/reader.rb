module Reader
  def reader_book
    unless File.exist?('data/book.json')
      File.open('data/book.json', 'w')
      return []
    end
    books = []
    File.foreach('data/book.json') do |line|
      book = JSON.parse(line)
      genre = @app.list_genres.select { |gnr| gnr.name == book[4] }
      author = @app.list_authors.select { |aut| aut.first_name == book[5] && aut.last_name == book[6]}
      source = @app.list_sources.select { |src| src.name == book[7] }
      label = @app.list_labels.select { |lbl| lbl.title == book[8] && lbl.color == book[9]}
      books << @app.add_book(book[0], book[1], book[2], book[3],
                             genre[0], author[0], source[0], label[0])
    end
    books
  end

  def reader_music
    unless File.exist?('data/music.json')
      File.open('data/music.json', 'w')
      return []
    end
    music_album = []
    File.foreach('data/music.json') do |line|
      music = JSON.parse(line)
      genre = @app.list_genres.select { |gnr| gnr.name == music[3] }
      author = @app.list_authors.select { |aut| aut.first_name == music[4] && aut.last_name == music[5]}
      source = @app.list_sources.select { |src| src.name == music[6] }
      label = @app.list_labels.select { |lbl| lbl.title == music[7] && lbl.color == music[8]}
      music_album << @app.add_music_album(music[0], music[1], music[2],
                                          genre[0], author[0], source[0], label[0])
    end
    music_album
  end

  def reader_game
    unless File.exist?('data/game.json')
      File.open('data/game.json', 'w')
      return []
    end
    game_arr = []
    File.foreach('data/game.json') do |line|
      game = JSON.parse(line)
      genre = @app.list_genres.select { |gnr| gnr.name == game[4] }
      author = @app.list_authors.select { |aut| aut.first_name == game[5] && aut.last_name == game[6]}
      source = @app.list_sources.select { |src| src.name == game[7] }
      label = @app.list_labels.select { |lbl| lbl.title == game[8] && lbl.color == game[9]}
      game_arr << @app.add_game(game[0], game[1], game[2], game[3],
                                genre[0], author[0], source[0], label[0])
    end
    game_arr
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

  def reader_author
    unless File.exist?('data/author.json')
      File.open('data/author.json', 'w')
      return []
    end
    authors = []
    File.foreach('data/author.json') do |line|
      authors << JSON.parse(line, create_additions: true)
    end
    authors
  end
end
