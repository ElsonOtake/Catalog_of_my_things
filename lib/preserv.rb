require './app'
require 'json'

module Preserv
  def writer_author_games
    File.write('data/game.json', '', mode: 'w')
    File.write('data/author.json', '', mode: 'w')

    @app.list_games.each do |game|
      array_game = [game.title, game.publish_date, game.genre.name, game.author.first_name, game.label.title, game.id,
                    game.source.name, game.multiplayer, game.last_played_at]
      json_game = JSON.generate(array_game)
      File.write('data/game.json', "#{json_game}\n", mode: 'a')
    end
    @app.list_authors.each do |author|
      json_author = JSON.generate(author)
      File.write('data/author.json', "#{json_author}\n", mode: 'a')
    end
  end

  def reader_games
    unless File.exist?('data/game.json')
      File.open('data/game.json', 'w')
      return []
    end
    games = []
    File.foreach('data/game.json') do |line|
      game = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == game[2] }
      author = @app.list_authors.select { |auth| auth.first_name == game[3] }
      label = @app.list_labels.select { |lbl| lbl.title == game[4] }
      source = @app.list_sources.select { |src| src.name == game[6] }
      games << @app.add_game(game[0], game[1], game[7], game[8],
                             genre[0], author[0], label[0], source[0])
    end
    movies
  end

  def reader_source
    unless File.exist?('data/source.json')
      File.open('data/source.json', 'w')
      return []
    end
    sources = []
    File.foreach('data/source.json') do |line|
      sources << JSON.parse(line, create_additions: true)
    end
    sources
  end
end
