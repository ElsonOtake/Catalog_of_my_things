require './app'
require './ui'
require './check_input'

class Main
  include CheckInput

  def initialize
    @app = App.new
    @ui = Ui.new(@app)
    @option = ''
  end

  def menu_content
    options = ['Exit', 'List all books', 'List all music albums', 'List all movies', 'List of games',
               'List all genres', 'List all labels', 'List all authors', 'List all sources',
               'Add a book', 'Add a music album', 'Add a movie', 'Add a game']
    puts "\nPlease choose an option by entering a number:"
    options.each_with_index { |opt, idx| puts "#{idx} - #{opt}" }
  end

  def menu_option
    menu_content
    @option = check_input('') { %w[0 1 2 3 4 5 6 7 8 9 10 11 12].include?(@option) }
  end

  def menu
    loop do
      case @option = menu_option
      when '3'
        @ui.list_all_movies
      when '8'
        @ui.list_all_sources
      when '11'
        @ui.add_a_movie
      else
        puts "Thank you for using this app!\n"
        break
      end
    end
  end

  def create_sources
    @app.add_source('From a friend')
    @app.add_source('Online shop')
    @app.add_source('Amazon Prime Video')
    @app.add_source('Google Play')
    @app.add_source('Vudu')
    @app.add_source('Apple iTunes')
    @app.add_source('YouTube')
  end

  def tests
    hbo = add_source('HBO Max')
    netflix = add_source('Netflix')
    disney = add_source('Disney Plus')
    apple = add_source('Apple TV')
    puts "#{hbo.id} #{hbo.name} hbo"
    puts "#{netflix.id} #{netflix.name} netflix"
    puts "#{disney.id} #{disney.name} disney"
    puts "#{apple.id} #{apple.name} apple"
    shawshank = add_movie('Sep 02, 2002', false, disney, disney, disney, disney)
    puts "#{shawshank.source.id} #{shawshank.silent} #{shawshank.archived} #{shawshank.id} shawshank"
    shawshank.move_to_archive
    puts "#{shawshank.source.id} #{shawshank.silent} #{shawshank.archived} #{shawshank.id} shawshank"
    puts "#{disney.items.size} items"
    tomatoes = add_movie('Oct 31, 2022', true, disney, disney, disney, disney)
    puts "#{tomatoes.source.id} #{tomatoes.silent} #{tomatoes.archived} #{tomatoes.id} tomatoes"
    puts "#{disney.items.size} items"
  end
end

main = Main.new
main.create_sources
main.menu
