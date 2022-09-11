require './check_input'

class Ui
  include CheckInput

  def initialize(app)
    @app = app
    @title = ''
    @publish_date = ''
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
    @item = %w[genre author source label]
  end

  def header_all_item_class(class_name, class_array)
    puts "#{class_name.capitalize}s list\n\n"
    puts "The #{class_name.capitalize} list is empty!" if class_array.size.zero?
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
    puts "The #{class_name}s list is empty!" if class_array.size.zero?
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

  def add_a_thing_book
    publisher = check_input('Publisher ') { @option != '' }
    cover_state = check_input('Cover state: [good/bad] ') { %w[good bad].include?(@option.downcase) }
    @app.add_book(@title, @publish_date, publisher, cover_state, @app.list_genres[@genre.to_i],
                  @app.list_authors[@author.to_i], @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def add_a_thing_music
    on_spotify = check_input('on Spotify?: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_music_album(@title, @publish_date, on_spotify, @app.list_genres[@genre.to_i],
                         @app.list_authors[@author.to_i], @app.list_sources[@source.to_i],
                         @app.list_labels[@label.to_i])
  end

  def add_a_thing_movie
    silent = check_input('Silent: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_movie(@title, @publish_date, silent, @app.list_genres[@genre.to_i], @app.list_authors[@author.to_i],
                   @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def add_a_thing_game
    multiplayer = check_input('Multiplayer: [true/false] ') { %w[true false].include?(@option.downcase) }
    lastplayed = check_input('Last played date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @app.add_game(@title, @publish_date, multiplayer, lastplayed, @app.list_genres[@genre.to_i],
                  @app.list_authors[@author.to_i], @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def select_option(class_name, class_array)
    puts "Select a #{class_name} from the following list by number"
    class_array.each_with_index do |data, index|
      puts "#{index}) #{data.first_name} #{data.last_name}" if class_name == 'author'
      puts "#{index}) #{data.title} #{data.color}" if class_name == 'label'
      puts "#{index}) #{data.name}" if %w[genre source].include?(class_name)
    end
  end

  def list_option(class_name, class_array)
    select_option(class_name, class_array)
    list_size = class_array.size
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def input_item_data
    @title = check_input('Title: ') { @option != '' }
    @genre = list_option('genre', @app.list_genres)
    @author = list_option('author', @app.list_authors)
    @source = list_option('source', @app.list_sources)
    @label = list_option('label', @app.list_labels)
    @publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
  end

  def empty_list?
    @app.list_genres.size.zero? || @app.list_authors.size.zero? ||
      @app.list_sources.size.zero? || @app.list_labels.size.zero?
  end

  def add_a_thing(class_name)
    return if empty_list?

    puts "Add a #{class_name}"
    input_item_data
    add_a_thing_book if class_name.eql?('book')
    add_a_thing_music if class_name.eql?('music')
    add_a_thing_movie if class_name.eql?('movie')
    add_a_thing_game if class_name.eql?('game')
    puts "#{class_name.capitalize} created successfully"
  end

  def add_a_book
    add_a_thing('book')
  end

  def add_a_music
    add_a_thing('music')
  end

  def add_a_movie
    add_a_thing('movie')
  end

  def add_a_game
    add_a_thing('game')
  end
end
