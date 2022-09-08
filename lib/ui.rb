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

  def list_all_labels
    puts "Lbel list\n\n"
    puts 'The label list is empty!' if @app.list_labels.length.zero?
    @app.list_labels.each { |label| puts "  #{label.name}" }
  end

  def select_source
    puts 'Select a source from the following list by number'
    @app.list_sources.each_with_index do |source, index|
      puts "#{index}) Source: \"#{source.name}\""
    end
  end

  def select_genre
    puts 'Select a genre from the following list by number'
    @app.list_genres.each_with_index do |genre, index|
      puts "#{index}) \"#{genre.name}\""
    end
  end

  def select_author
    puts 'Select an author from the following list by number'
    @app.list_authors.each_with_index do |author, index|
      puts "#{index}) \"#{author.name}\""
    end
  end

  def select_label
    puts 'Select a label from the following list by number'
    @app.list_labels.each_with_index do |label, index|
      puts "#{index}) \"#{label.name}\""
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

  def list_authors_option
    select_author
    list_size = @app.list_authors.length
    @option = check_input('') { @option.match?(/^\d+$/) && (0..list_size - 1).any? { |a| a == @option.to_i } }
  end

  def list_genres_option
    select_genre
    list_size = @app.list_genres.length
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
