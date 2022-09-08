require './check_input'

class Ui
  include CheckInput

  def initialize(app)
    @app = app
  end

  def list_all_movies
    puts "Movie list\n\n"

    puts 'The movies list is empty!' if @app.list_movies.length.zero?

    @app.list_movies.each do |movie|
      puts '  Title:'

      puts "  Publish date: #{movie.publish_date}"

      puts "  Genre: #{movie.source.name}"

      puts "  Author: #{movie.source.name}"

      puts "  Source: #{movie.source.name}"

      puts "  Label: #{movie.source.name}"

      puts "  Silent: #{movie.silent}"

      puts "  Archived: #{movie.archived}"

      puts "  Id: #{movie.id}"

      puts
    end
  end

  def list_all_bokks
    puts "Books list\n\n"
    puts 'The book list is empty!' if @app.list_books.length.zero?
    @app.list_books.each do |book|
      puts "  Title: #{book.title}"
      puts "  Publish date: #{book.publish_date}"
      puts "  Genre: #{book.genre.name}"
      puts "  Author: #{book.author.first_name} #{book.author.last_name}"
      puts "  Source: #{book.source.name}"
      puts "  Label title: #{book.label.title} label color: #{book.label.color}"
      puts "  Cover state: #{book.cover_state}"
      puts " Id: #{book.id}"
      puts
    end
  end

  def list_all_sources
    puts "Source list\n\n"

    puts 'The sources list is empty!' if @app.list_sources.length.zero?

    @app.list_sources.each { |source| puts "  #{source.name}" }
  end

  def select_source
    puts 'Select a source from the following list by number'

    @app.list_sources.each_with_index do |source, index|
      puts "#{index}) Source: \"#{source.name}\""
    end
  end

  def list_source_option
    select_source

    list_size = @app.list_sources.length

    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def add_a_movie
    puts 'The source list is empty!' if @app.list_sources.length.zero?

    return if @app.list_sources.length.zero?

    @genre = ''

    @author = ''

    @source = list_source_option

    @label = ''

    @publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end

    @silent = check_input('Silent: [true/false] ') { %w[true false].include?(@option.downcase) }

    @app.add_movie(@publish_date, @silent, @genre, @author, @app.list_sources[@source.to_i], @label)

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
