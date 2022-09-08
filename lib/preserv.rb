require './app'
require 'json'

module Preserv
  def music_writer
    File.write('data/music_album.json', '', mode: 'w')
    File.write('data/source.json', '', mode: 'w')
    File.write('data/genre.json', '', mode: 'w')

    @app.list_music_albums.each do |music_album|
      array_music_album = [music_album.title, music_album.publish_date, music_album.on_spotify,
                           music_album.genre.name, music_album.source.name]
      json_music_album = JSON.generate(array_music_album)
      File.write('data/music_album.json', "#{json_music_album}\n", mode: 'a')
    end
    @app.list_sources.each do |source|
      json_source = JSON.generate(source)
      File.write('data/source.json', "#{json_source}\n", mode: 'a')
    end
    @app.list_genres.each do |genre|
      json_genre = JSON.generate(genre)
      File.write('data/genre.json', "#{json_genre}\n", mode: 'a')
    end
  end

  def reader_music
    unless File.exist?('data/music_album.json')
      File.open('data/music_album.json', 'w')
      return []
    end
    music_album = []
    File.foreach('data/music_album.json') do |line|
      music = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == music[3] }
      source = @app.list_sources.select { |src| src.name == music[4] }
      music_album << @app.add_music_album(music[0], music[1], music[2],
                                          genre[0], source[0], genre[0], genre[0])
    end
    music_album
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

  def reader_genre
    unless File.exist?('data/genre.json')
      File.open('data/genre.json', 'w')
      return []
    end
    genres = []
    File.foreach('data/genre.json') do |line|
      genres << JSON.parse(line, create_additions: true)
    end
    genres
  end
end
