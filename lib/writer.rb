module Writer
  def clean_files
    %w[genre author source label book music movie game].each do |class_name|
      File.write("data/#{class_name}.json", '', mode: 'w')
    end
  end

  def write_instances(class_array, class_file)
    File.open(class_file, 'a') do |file|
      class_array.each { |data| file.puts(JSON.generate(data)) }
    end
  end

  def write_all_instances
    write_instances(@app.list_genres, 'data/genre.json')
    write_instances(@app.list_authors, 'data/author.json')
    write_instances(@app.list_sources, 'data/source.json')
    write_instances(@app.list_labels, 'data/label.json')
  end

  def item_hash(data, extra_attrs)
    hash = {
      'title' => data.title,
      'publish_date' => data.publish_date,
      'genre_name' => data.genre.name,
      'author_first' => data.author.first_name,
      'author_last' => data.author.last_name,
      'source_name' => data.source.name,
      'label_title' => data.label.title,
      'label_color' => data.label.color
    }
    extra_attrs.each { |attr| hash[attr.to_s] = data.send(attr) }
    hash
  end

  def write_array(class_array, class_file, *attr)
    File.open(class_file, 'a') do |file|
      class_array.each { |data| file.puts(JSON.generate(item_hash(data, attr))) }
    end
  end

  def write_all_arrays
    write_array(@app.list_books, 'data/book.json', 'publisher', 'cover_state')
    write_array(@app.list_musics, 'data/music.json', 'on_spotify')
    write_array(@app.list_movies, 'data/movie.json', 'silent')
    write_array(@app.list_games, 'data/game.json', 'multiplayer', 'last_played_at')
  end

  def writer
    clean_files
    write_all_instances
    write_all_arrays
  end
end
