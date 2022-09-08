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

  def array_name(class_name)
    case class_name
    # when 'genre'
    # @app.list_genres
    # when 'author'
    # @app.list_authors
    when 'source'
      @app.list_sources
      # when 'label'
      # @app.list_labels
    end
  end

  def array_things_name(class_name)
    case class_name
    when 'game'
      @app.list_games
    when 'movie'
      @app.list_movies
    when 'book'
      @app.list_books
    when 'music album'
      @app.list_music_albums
    end
  end

  def list_all_movies
    list_all_things('movie')
  end

  def list_extra_things(class_name, data)
    case class_name
    when 'book'
      puts "  Publisher: #{data.publisher}"
      puts "  Cover State: #{data.cover_state}"
    when 'music album'
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
    # puts "  Genre: #{data.genre.name}"
    # puts "  Author: #{data.author.first_name} #{data.author.last_name}"
    puts "  Source: #{data.source.name}"
    # puts "  Label: #{data.label.title} #{data.label.color}"
  end

  def list_all_things(class_name)
    puts "#{class_name.capitalize} list\n\n"
    puts "The #{class_name}s list is empty!" if array_things_name(class_name).size.zero?
    array_things_name(class_name).each do |data|
      list_all_items(data)
      list_extra_things(class_name, data)
      puts
    end
  end

  def list_all_sources
    puts "Source list\n\n"
    puts 'The sources list is empty!' if @app.list_sources.size.zero?
    @app.list_sources.each { |source| puts "  #{source.name}" }
  end

  def select_option(class_name)
    puts "Select a #{class_name} from the following list by number"
    array_name(class_name).each_with_index do |data, index|
      puts "#{index}) #{data.name}"
    end
  end

  def list_option(class_name)
    select_option(class_name)
    list_size = array_name(class_name).size
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def empty_list?
    @item.each { |data| puts "The #{data} list is empty!" if array_name(data).size.zero? }
  end

  def input_item_data
    @title = check_input('Title: ') { @option != '' }
    # @genre = list_option('genre')
    # @author = list_option('author')
    @source = list_option('source')
    # @label = list_option('label')
    @publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
  end

  def add_a_movie
    empty_list?
    return if @item.any? { |data| array_name(data).size.zero? }

    input_item_data
    silent = check_input('Silent: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_movie(@title, @publish_date, silent, @genre, @author, @app.list_sources[@source.to_i], @label)
    # @app.add_movie(@title, @publish_date, silent, @app.list_genres[@genre.to_i],
    #                @app.list_authors[@author.to_i], @app.list_sources[@source.to_i],
    #                @app.list_labels[@label.to_i])
    puts 'Movie created successfully'
  end

  def list_all_games
    puts "Games list\n\n"

    puts 'The games list is empty!' if @app.list_games.length.zero?

    @app.list_games.each do |game|
      puts '  Title:'

      puts "  Publish date: #{game.publish_date}"

      puts "  Genre: #{game.genre.name}"

      puts "  Author: #{game.author.first_name}"

      puts "  Label: #{game.label.title}"

      puts "  Id: #{game.id}"
    end
  end

  def list_all_music_albums
    puts "Music list\n\n"
    puts 'The music album list is empty!' if @app.list_music_albums.length.zero?
    @app.list_music_albums.each do |music_album|
      puts "  Title: #{music_album.title}"
      puts "  Publish date: #{music_album.publish_date}"
      puts "  Genre: #{music_album.genre.name}"
      puts "  Author: #{music_album.genre.name}"
      puts "  Source: #{music_album.source.name}"
      puts "  Label: #{music_album.genre.name} #{music_album.genre.name}"
      puts "  On Spotify: #{music_album.on_spotify}"
      puts "  Archived: #{music_album.archived}"
      puts "  Id: #{music_album.id}"
      puts
    end
  end

  def add_a_game
    puts 'The game list is empty!' if @app.list_sources.length.zero?

    return if @app.list_sources.length.zero?

    @title = ''

    @genre = ''

    @author = ''

    @label = ''

    @publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end

    @app.add_game(@title, @publish_date, @multiplayer, @genre, @author, @app.list_authors[@author], @label)

    puts 'Games created successfully'
  end

  def list_all_genre
    puts "Genre list\n\n"
    puts 'The Genre list is empty!' if @app.list_genres.length.zero?
    @app.list_genres.each { |genre| puts "  #{genre.name}" }
  end

  def select_genre
    puts 'Select a genre from the following list by number'
    @app.list_genres.each_with_index do |genre, index|
      puts "#{index}) Genre: \"#{genre.name}\""
    end
  end

  def list_genre_option
    select_genre
    list_size = @app.list_genres.length

    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def add_a_music_album
    puts 'The list is empty!' if @app.list_sources.length.zero?
    return if @app.list_sources.length.zero?

    @title = check_input('Title: ') { @option != '' }
    @genre = list_genre_option
    @author = ''
    @source = list_source_option
    @label = ''
    @publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @on_spotify = check_input('Is it on Spotify: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_music_album(@title, @publish_date, @on_spotify, @app.list_genres[@genre.to_i],
                         @app.list_sources[@source.to_i], @author, @label)
    puts 'Music Album created successfully'
  end

  def add_a_book
    title = check_input('Title: ') { @option != '' }
    genre = list_genres_option
    author = list_authors_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    puts 'please enter publisher name'
    publisher = gets.chomp
    puts 'please enter the cover state [good/bad]'
    cover_state = gets.chomp
    @app.add_book(title, publisher, cover_state, publish_date, genre, author, source, label)
    puts 'Book created successfully'
  end
end
