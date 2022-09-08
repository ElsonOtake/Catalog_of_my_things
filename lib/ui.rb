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
      puts "  Title: #{movie.title}"
      puts "  Publish date: #{movie.publish_date}"
      puts "  Genre: #{movie.genre.name}"
      puts "  Author: #{movie.author.first_name} #{movie.author.last_name}"
      puts "  Source: #{movie.source.name}"
      puts "  Label Title: #{movie.label.title}"
      puts "  Label Color: #{movie.label.color}"
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

  def select_genre
    puts 'Select a genre from the following list by number'
    @app.list_genres.each_with_index do |genre, index|
      puts "#{index}) \"#{genre.name}\""
    end
  end

  def list_genres_option
    select_genre
    list_size = @app.list_genres.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def select_author
    puts 'Select an author from the following list by number'
    @app.list_authors.each_with_index do |author, index|
      puts "#{index}) \"#{author.name}\""
    end
  end

  def list_authors_option
    select_author
    list_size = @app.list_authors.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def select_source
    puts 'Select a source from the following list by number'
    @app.list_sources.each_with_index do |source, index|
      puts "#{index}) \"#{source.name}\""
    end
  end

  def list_source_option
    select_source
    list_size = @app.list_sources.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def select_label
    puts 'Select a label from the following list by number'
    @app.list_labels.each_with_index do |label, index|
      puts "#{index}) \"#{label.name}\""
    end
  end

  def list_label_option
    select_label
    list_size = @app.list_labels.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def check_empty
    puts 'The genre list is empty!' if @app.list_genres.length.zero?
    puts 'The author list is empty!' if @app.list_authors.length.zero?
    puts 'The source list is empty!' if @app.list_sources.length.zero?
    puts 'The label list is empty!' if @app.list_labels.length.zero?
  end

  def add_a_movie
    check_empty
    return if @app.list_genres.length.zero? || @app.list_authors.length.zero? || 
              @app.list_sources.length.zero? || @app.list_labels.length.zero?

    title = check_input('Title: ') { @option != '' }
    genre = list_genre_option
    author = list_author_option
    source = list_source_option
    label = list_label_option
    publish_date = check_input('Publish date: YYYY/MM/DD ') do
      @option.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    silent = check_input('Silent: [true/false] ') { %w[true false].include?(@option.downcase) }
    @app.add_movie(title, publish_date, silent, @app.list_genres[genre.to_i],
                  @app.list_authors[author.to_i], @app.list_sources[source.to_i],
                  @app.list_labels[label.to_i])
    puts 'Movie created successfully'
  end
end
