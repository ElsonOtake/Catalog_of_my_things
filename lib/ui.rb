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
      puts
    end
  end
end
