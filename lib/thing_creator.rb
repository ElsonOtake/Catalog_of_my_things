module ThingCreator
  def add_a_thing_book
    publisher = check_input('Publisher ') { |input| input != '' }
    cover_state = check_input('Cover state: [good/bad] ') { |input| %w[good bad].include?(input.downcase) }
    @app.add_book(@title, @publish_date, publisher, cover_state, @app.list_genres[@genre.to_i],
                  @app.list_authors[@author.to_i], @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def add_a_thing_music
    on_spotify = check_input('on Spotify?: [true/false] ') { |input| %w[true false].include?(input.downcase) }
    @app.add_music_album(@title, @publish_date, on_spotify, @app.list_genres[@genre.to_i],
                         @app.list_authors[@author.to_i], @app.list_sources[@source.to_i],
                         @app.list_labels[@label.to_i])
  end

  def add_a_thing_movie
    silent = check_input('Silent: [true/false] ') { |input| %w[true false].include?(input.downcase) }
    @app.add_movie(@title, @publish_date, silent, @app.list_genres[@genre.to_i], @app.list_authors[@author.to_i],
                   @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def add_a_thing_game
    multiplayer = check_input('Multiplayer: [true/false] ') { |input| %w[true false].include?(input.downcase) }
    lastplayed = check_input('Last played date: YYYY/MM/DD ') do |input|
      input.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
    @app.add_game(@title, @publish_date, multiplayer, lastplayed, @app.list_genres[@genre.to_i],
                  @app.list_authors[@author.to_i], @app.list_sources[@source.to_i], @app.list_labels[@label.to_i])
  end

  def input_item_data
    @title = check_input('Title: ') { |input| input != '' }
    @genre = list_option('genre', @app.list_genres)
    @author = list_option('author', @app.list_authors)
    @source = list_option('source', @app.list_sources)
    @label = list_option('label', @app.list_labels)
    @publish_date = check_input('Publish date: YYYY/MM/DD ') do |input|
      input.match?(%r{^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[1-2][0-9]|3[0-1])$})
    end
  end

  def empty_list?
    @app.list_genres.empty? || @app.list_authors.empty? ||
      @app.list_sources.empty? || @app.list_labels.empty?
  end

  def add_a_thing(class_name)
    return if empty_list?

    puts "Add a #{class_name}"
    input_item_data
    add_a_thing_book if class_name.eql?('book')
    add_a_thing_music if class_name.eql?('music')
    add_a_thing_movie if class_name.eql?('movie')
    add_a_thing_game if class_name.eql?('game')
    puts "#{class_name.capitalize} created successfully"
  end

  def add_a_book
    add_a_thing('book')
  end

  def add_a_music
    add_a_thing('music')
  end

  def add_a_movie
    add_a_thing('movie')
  end

  def add_a_game
    add_a_thing('game')
  end
end
