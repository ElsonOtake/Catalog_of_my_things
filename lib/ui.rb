require './check_input'
require './listmodule'

class Ui
  include CheckInput
  include List
  def initialize(app)
    @app = app
    @array_name = { 'genre' => @app.list_genres, 'author' => @app.list_authors, 'source' => @app.list_sources,
                 'label' => @app.list_labels, 'book' => @app.list_books, 'music' => @app.list_musics,
                 'movie' => @app.list_movies, 'game' => @app.list_games }
  end

  

  def list_all_movies
    list_my_movie
  end

  def list_all_books
    list_my_book
  end

  def list_all_music_albums
    list_my_music
  end

  def list_all_games
    list_my_games
  end

  def header_all_item_class(class_name)
    puts "#{class_name.capitalize}s list\n\n"
    puts 'The #{class_name.capitalize} list is empty!' if @array_name[class_name].size.zero?
  end

  def list_all_genres
    header_all_item_class('genre')
    @app.list_genres.each { |genre| puts "  #{genre.name}" }
  end

  def list_all_authors
    header_all_item_class('author')
    @app.list_authors.each { |author| puts "  #{author.first_name} #{author.last_name}" }
  end

  def list_all_sources
    header_all_item_class('source')
    @app.list_sources.each { |source| puts "  #{source.name}" }
  end

  def list_all_labels
    header_all_item_class('label')
    @app.list_labels.each { |label| puts "  #{label.title} #{label.color}" }
  end

  def select_source
    puts 'Select a source from the following list by number'
    @app.list_sources.each_with_index do |source, index|
      puts "#{index}) Source: \"#{source.name}\""
    end
  end

  def select_label
    puts 'Select a label from the following list by number'
    @app.list_labels.each_with_index do |label, index|
      puts "#{index}) \"#{label.title}\""
    end
  end

  def select_genre
    puts 'Select a genre from the following list by number'
    @app.list_genres.each_with_index do |genre, index|
      puts "#{index}) Genre: \"#{genre.name}\""
    end
  end

  def select_author
    puts 'Select an author from the following list by number'
    @app.list_authors.each_with_index do |author, index|
      puts "#{index}) Author: \"#{author.first_name}\""
    end
  end

  def list_source_option
    select_source
    list_size = @app.list_sources.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def list_label_option
    select_label
    list_size = @app.list_labels.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def list_genre_option
    select_genre
    list_size = @app.list_genres.length

    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def list_author_option
    select_author
    list_size = @app.list_authors.length

    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def add_a_movie
    puts 'The source list is empty!' if @app.list_sources.length.zero?
    return if @app.list_sources.length.zero?

    title = check_input('Title: ') { @option != '' }
    genre = list_genre_option
    author = list_author_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    silent = check_input('Silent: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_movie(title, publish_date, silent, @app.list_genres[genre.to_i], @app.list_authors[author.to_i],
                   @app.list_sources[source.to_i], @app.list_labels[label.to_i])
    puts 'Movie created successfully'
  end

  def add_a_book
    title = check_input('Title: ') { @option != '' }
    genre = list_genre_option
    author = list_author_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    publisher = gets.chomp
    cover_state = gets.chomp
    @app.add_book(title, publisher, cover_state, publish_date, @app.list_genres[genre.to_i], @app.list_authors[author.to_i],
                  @app.list_sources[source.to_i], @app.list_labels[label.to_i])
    puts 'Book created successfully'
  end

  def add_a_music_album
    puts 'The list is empty!' if @app.list_sources.length.zero?
    return if @app.list_sources.length.zero?

    title = check_input('Title: ') { @option != '' }
    genre = list_genre_option
    author = list_author_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    on_spotify = check_input('Is it on Spotify: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_music_album(title, publish_date, on_spotify, @app.list_genres[genre.to_i], @app.list_authors[author.to_i],
                         @app.list_sources[source.to_i], @app.list_labels[label.to_i])
    puts 'Music Album created successfully'
  end

  def add_a_game
    puts 'The list is empty!' if @app.list_sources.length.zero?
    return if @app.list_sources.length.zero?

    title = check_input('Title: ') { @option != '' }
    genre = list_genre_option
    author = list_author_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    puts 'please enter if game is multiplayer [true/false]'
    multiplayer = gets.chomp
    puts 'please enter last played date: YYYY/MM/DD'
    lastplayed = gets.chomp
    @app.add_game(title, publish_date, multiplayer, lastplayed, @app.list_genres[genre.to_i],
                  @app.list_authors[author.to_i], @app.list_sources[source.to_i], @app.list_labels[label.to_i])
    puts 'Game created successfully'
  end
end
