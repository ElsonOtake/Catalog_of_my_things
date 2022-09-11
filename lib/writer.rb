module Writer
  def clean_files
    %w[genre author source label book music movie game].each do |class_name|
      File.write("data/#{class_name}.json", '', mode: 'w')
    end
  end

  def write_instances(class_array, class_file)
    class_array.each do |data|
      json_file = JSON.generate(data)
      File.write(class_file, "#{json_file}\n", mode: 'a')
    end
  end

  def write_all_instances
    write_instances(@app.list_genres, 'data/genre.json')
    write_instances(@app.list_authors, 'data/author.json')
    write_instances(@app.list_sources, 'data/source.json')
    write_instances(@app.list_labels, 'data/label.json')
  end

  def write_array(class_array, class_file, *attr)
    class_array.each do |data|
      array_data = [data.title, data.publish_date, data.genre.name, data.author.first_name, data.author.last_name,
                    data.source.name, data.label.title, data.label.color]
      attr.each { |extra| array_data.push(data.send(extra)) }
      json_file = JSON.generate(array_data)
      File.write(class_file, "#{json_file}\n", mode: 'a')
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
