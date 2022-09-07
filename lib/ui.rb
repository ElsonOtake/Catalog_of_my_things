require './check_input'

class Ui
  include CheckInput

  def initialize(app)
    @app = app
  end

  def list_all_movies
    puts 'The movies list is empty!' if @app.list_movies.length.zero?
    @app.list_movies.each { |movie| puts "Publish date: \"#{movie.publish_date}\", Source: #{movie.source.name}" }
  end

  def list_all_sources
    puts 'The sources list is empty!' if @app.list_sources.length.zero?
    @app.list_sources.each { |source| puts "Name: \"#{source.name}\"" }
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
    @publish_date = check_input('Publish date: ') { @option != '' }
    @silent = check_input('Silent: ') { @option != '' }
    @app.add_movie(@publish_date, @silent, @genre, @author, @app.list_sources[@source.to_i], @label)
    puts 'Movie created successfully'
  end
end
