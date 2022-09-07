require './check_input'

class UiMovies
  include CheckInput

  def initialize(app)
    @app = app
  end

  def list_all_movies
    puts 'The movies list is empty!' if @app.list_movies.length.zero?
    @app.list_movies.each { |movie| puts "Publish date: \"#{movie.publish_date}\", Source: #{movie.source.name}" }
  end

  def add_a_movie
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
    @publish_date = check_input('Publish date: ') { @option != '' }
    @silent = check_input('Silent: ') { @option != '' }
    @app.add_movie(@publish_date, @silent, @genre, @author, @source, @label)
    puts 'Movie created successfully'
  end
end
