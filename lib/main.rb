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
    @app.list_of_sources = reader_source
    @app.list_of_movies = reader_movie

    # Andres part #################################
    @app.list_of_labels = reader_label
    @app.list_of_books = reader_book
    ##############################################
    @app.list_of_genres = reader_genre
    @app.list_of_music_albums = reader_music
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
    methods = { '1' => 'list_all_books', '2' => 'list_all_music_albums',
                '3' => 'list_all_movies', '4' => 'list_of_games',
                '5' => 'list_all_genres', '6' => 'list_all_labels',
                '7' => 'list_all_authors', '8' => 'list_all_sources',
                '9' => 'add_a_book', '10' => 'add_a_music_album',
                '11' => 'add_a_movie', '12' => 'add_a_game' }
    loop do
      case @option = menu_option
      when '0'
        writer
        book_label_writer
        music_writer
        puts "Thank you for using this app!\n"
        break
      else
        @ui.send(methods[@option])
      end
    end
  end

  # Andres part #################################
  def create_label
    @app.add_label('Gift', 'blue')
    @app.add_label('New', 'red')
    @app.add_label('recently earned', 'brown')
    @app.add_label('Old', 'green')
    @app.add_label('From a friend', 'black')
  end
  ##############################################

  def create_genre
    @app.add_genre('Rock')
    @app.add_genre('Pop')
    @app.add_genre('Hip Hop')
    @app.add_genre('EDM')
    @app.add_genre('Techno')
    @app.add_genre('Classic')
    @app.add_genre('Reggeton')
    @app.add_genre('Slow Jams')
  end
end

puts "\nWelcome to Catalog of my things App!"
main = Main.new
main.create_label
main.create_genre
main.menu
