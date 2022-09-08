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
end
