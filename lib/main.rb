require './app'
require './ui'
require './check_input'
require './preserv'

class Main
  include CheckInput
  include Preserv

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
    methods = { '1' => 'list_all_books', '2' => 'list_all_movies',
                '3' => 'list_all_movies', '4' => 'list_all_movies',
                '5' => 'list_all_sources', '6' => 'list_all_labels',
                '7' => 'list_all_sources', '8' => 'list_all_sources',
                '9' => 'add_a_book', '10' => 'add_a_movie', '11' => 'add_a_movie', '12' => 'add_a_movie' }

    loop do
      case @option = menu_option
      when '0'
        puts "Thank you for using this app!\n"
        book_label_writer
        break
      else
        @ui.send(methods[@option])
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
end

puts "\nWelcome to Catalog of my things App!"
main = Main.new
main.create_sources
main.menu
