module Reader
  def reader_book
    unless File.exist?('data/book.json')
      File.open('data/book.json', 'w')
      return []
    end
    books = []
    File.foreach('data/book.json') do |line|
      book = JSON.parse(line)
      source = @app.list_sources.select { |src| src.name == book[4] }
      label = @app.list_labels.select { |lab| lab.title == book[5] }
      books << @app.add_book(book[0], book[1], book[2], book[3],
                             source[0], source[0], source[0], label[0])
    end
    books
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
      label = @app.list_labels.select { |lab| lab.title == music[5] }
      music_album << @app.add_music_album(music[0], music[1], music[2],
                                          genre[0], source[0], genre[0], label[0])
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
      author = @app.list_authors.select { |ath| ath.first_name == game[5] }
      genre = @app.list_genres.select { |gen| gen.name == game[4] }
      source = @app.list_sources.select { |src| src.name == game[6] }
      label = @app.list_labels.select { |lab| lab.title == game[7] }
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
