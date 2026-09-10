require 'json'
require 'fileutils'

module Reader
  def ensure_file?(file_name)
    return true if File.exist?(file_name)

    FileUtils.mkdir_p(File.dirname(file_name))
    FileUtils.touch(file_name)
    false
  end

  def reader_instance(file_name)
    return [] unless ensure_file?(file_name)

    File.foreach(file_name).map { |line| JSON.parse(line, create_additions: true) }
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
    @app.list_genres.find { |gnr| gnr.name == data['genre_name'] }
  end

  def read_author(data)
    @app.list_authors.find { |aut| aut.first_name == data['author_first'] && aut.last_name == data['author_last'] }
  end

  def read_source(data)
    @app.list_sources.find { |src| src.name == data['source_name'] }
  end

  def read_label(data)
    @app.list_labels.find { |lbl| lbl.title == data['label_title'] && lbl.color == data['label_color'] }
  end

  def build_record(file_name, data, refs)
    genre, author, source, label = refs
    case file_name
    when 'data/book.json'
      @app.add_book(data['title'], data['publish_date'], data['publisher'], data['cover_state'],
                    genre, author, source, label)
    when 'data/music.json'
      @app.add_music_album(data['title'], data['publish_date'], data['on_spotify'], genre, author, source, label)
    when 'data/movie.json'
      @app.add_movie(data['title'], data['publish_date'], data['silent'], genre, author, source, label)
    when 'data/game.json'
      @app.add_game(data['title'], data['publish_date'], data['multiplayer'], data['last_played_at'],
                    genre, author, source, label)
    end
  end

  def read_file(file_name)
    file_array = []
    File.foreach(file_name) do |line|
      data = JSON.parse(line)
      refs = [read_genre(data), read_author(data), read_source(data), read_label(data)]
      file_array << build_record(file_name, data, refs)
    end
    file_array
  end

  def reader_book
    return [] unless ensure_file?('data/book.json')

    read_file('data/book.json')
  end

  def reader_music
    return [] unless ensure_file?('data/music.json')

    read_file('data/music.json')
  end

  def reader_movie
    return [] unless ensure_file?('data/movie.json')

    read_file('data/movie.json')
  end

  def reader_game
    return [] unless ensure_file?('data/game.json')

    read_file('data/game.json')
  end

  def reader
    @app.list_of_genres = reader_genre
    @app.list_of_labels = reader_label
    @app.list_of_sources = reader_source
    @app.list_of_authors = reader_author
    @app.list_of_books = reader_book
    @app.list_of_movies = reader_movie
    @app.list_of_musics = reader_music
    @app.list_of_games = reader_game
  end
end
