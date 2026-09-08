require 'json'
require_relative 'app'
require_relative 'reader'
require_relative 'ui'
require_relative 'check_input'
require_relative 'writer'

class Main
  include Reader
  include CheckInput
  include Writer

  VALID_OPTIONS = (0..12).map(&:to_s).freeze
  EXIT_OPTION = '0'.freeze
  MENU_ACTIONS = {
    '1' => :list_all_books,   '2' => :list_all_musics,
    '3' => :list_all_movies,  '4' => :list_all_games,
    '5' => :list_all_genres,  '6' => :list_all_labels,
    '7' => :list_all_authors, '8' => :list_all_sources,
    '9' => :add_a_book,       '10' => :add_a_music,
    '11' => :add_a_movie,     '12' => :add_a_game
  }.freeze

  def initialize
    @app = App.new
    @ui = Ui.new(@app)
    @option = ''
    reader
  end

  def menu_content
    options = ['Exit', 'List all books', 'List all music albums', 'List all movies', 'List all games',
               'List all genres', 'List all labels', 'List all authors', 'List all sources',
               'Add a book', 'Add a music album', 'Add a movie', 'Add a game']
    puts "\nPlease choose an option by entering a number:"
    options.each_with_index { |opt, idx| puts "#{idx} - #{opt}" }
  end

  def menu_option
    menu_content
    check_input('') { |input| VALID_OPTIONS.include?(input) }
  end

  def menu
    loop do
      @option = menu_option
      if @option == EXIT_OPTION
        writer
        puts "Thank you for using this app!\n"
        break
      end
      @ui.send(MENU_ACTIONS[@option])
    end
  end
end

puts "\nWelcome to Catalog of my things App!"
main = Main.new
main.menu
