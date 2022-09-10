module List
  def list_my_movie
    puts "Movie list\n\n"
    puts 'The movies list is empty!' if @app.list_movies.length.zero?
    @app.list_movies.each do |movie|
      puts "  Title: #{movie.title}"
      puts "  Publish date: #{movie.publish_date}"
      puts "  Genre: #{movie.genre.name}"
      puts "  Author: #{movie.author.first_name} #{movie.author.last_name}"
      puts "  Source: #{movie.source.name}"
      puts "  Label: #{movie.label.title} #{movie.label.color}"
      puts "  Silent: #{movie.silent}"
      puts "  Archived: #{movie.archived}"
      puts "  Id: #{movie.id}"
      puts
    end
  end

  def list_my_book
    puts "Books list\n\n"
    puts 'The book list is empty!' if @app.list_books.length.zero?
    @app.list_books.each do |book|
      puts "  Title: #{book.title}"
      puts "  Publish date: #{book.publish_date}"
      puts "  Genre: #{book.genre.name}"
      puts "  Author: #{book.author.first_name} #{book.author.last_name}"
      puts "  Source: #{book.source.name}"
      puts "  Label: #{book.label.title} #{book.label.color}"
      puts "  Cover state: #{book.cover_state}"
      puts " Id: #{book.id}"
      puts
    end
  end

  def list_my_music
    puts "Music list\n\n"
    puts 'The music album list is empty!' if @app.list_music_albums.length.zero?
    @app.list_music_albums.each do |music_album|
      puts "  Title: #{music_album.title}"
      puts "  Publish date: #{music_album.publish_date}"
      puts "  Genre: #{music_album.genre.name}"
      puts "  Author: #{music_album.author.first_name} #{music_album.author.last_name}"
      puts "  Source: #{music_album.source.name}"
      puts "  Label title: #{music_album.label.title} #{music_album.label.color}"
      puts "  On Spotify: #{music_album.on_spotify}"
      puts "  Archived: #{music_album.archived}"
      puts "  Id: #{music_album.id}"
      puts
    end
  end

  def list_my_games
    puts "Games list\n\n"
    puts 'The games album list is empty!' if @app.list_games.length.zero?
    @app.list_games.each do |game|
      puts "  Title: #{game.title}"
      puts "  Publish date: #{game.publish_date}"
      puts "  Genre: #{game.genre.name}"
      puts "  Author: #{game.author.first_name} #{game.author.last_name}"
      puts "  Source: #{game.source.name}"
      puts "  Label title: #{game.label.title} #{game.label.color}"
      puts "  Multiplayer: #{game.multiplayer}"
      puts "  Id: #{game.id}"
      puts
    end
  end
end
