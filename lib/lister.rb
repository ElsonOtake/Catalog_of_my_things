module Lister
  def header_all_item_class(class_name, class_array)
    puts "#{class_name.capitalize}s list\n\n"
    puts "The #{class_name.capitalize} list is empty!" if class_array.empty?
  end

  def list_all_genres
    header_all_item_class('genre', @app.list_genres)
    @app.list_genres.each { |genre| puts "  #{genre.name}" }
  end

  def list_all_authors
    header_all_item_class('author', @app.list_authors)
    @app.list_authors.each { |author| puts "  #{author.first_name} #{author.last_name}" }
  end

  def list_all_sources
    header_all_item_class('source', @app.list_sources)
    @app.list_sources.each { |source| puts "  #{source.name}" }
  end

  def list_all_labels
    header_all_item_class('label', @app.list_labels)
    @app.list_labels.each { |label| puts "  #{label.title} #{label.color}" }
  end

  def list_extra_things(class_name, data)
    case class_name
    when 'book'
      puts "  Publisher: #{data.publisher}"
      puts "  Cover State: #{data.cover_state}"
    when 'music'
      puts "  On Spotify: #{data.on_spotify}"
    when 'movie'
      puts "  Silent: #{data.silent}"
    when 'game'
      puts "  Multiplayer: #{data.multiplayer}"
      puts "  Last Played at: #{data.last_played_at}"
    end
  end

  def list_all_items(data)
    puts "  Id: #{data.id}"
    puts "  Title: #{data.title}"
    puts "  Publish date: #{data.publish_date}"
    puts "  Archived: #{data.archived}"
    puts "  Genre: #{data.genre.name}"
    puts "  Author: #{data.author.first_name} #{data.author.last_name}"
    puts "  Source: #{data.source.name}"
    puts "  Label: #{data.label.title} #{data.label.color}"
  end

  def list_all_things(class_name, class_array)
    puts "#{class_name.capitalize} list\n\n"
    puts "The #{class_name}s list is empty!" if class_array.empty?
    class_array.each do |data|
      list_all_items(data)
      list_extra_things(class_name, data)
      puts
    end
  end

  def list_all_books
    list_all_things('book', @app.list_books)
  end

  def list_all_musics
    list_all_things('music', @app.list_musics)
  end

  def list_all_movies
    list_all_things('movie', @app.list_movies)
  end

  def list_all_games
    list_all_things('game', @app.list_games)
  end
end
