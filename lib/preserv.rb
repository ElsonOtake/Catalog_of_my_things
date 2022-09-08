require './app'
require 'json'

module Preserv
  def book_label_writer
    File.write('data/book.json', '', mode: 'w')
    File.write('data/label.json', '', mode: 'w')

    @app.list_books.each do |book|
      array_book = [book.title, book.publisher, book.cover_state, book.publish_date, book.genre.name, book.source.name,
                    book.author.first_name, book.author.last_name, book.label.title, book.label.color]
      json_movie = JSON.generate(array_book)
      File.write('data/book.json', "#{json_movie}\n", mode: 'a')
    end
    @app.list_labels.each do |label|
      json_label = JSON.generate(label)
      File.write('data/label.json', "#{json_label}\n", mode: 'a')
    end
  end

  def reader_book
    unless File.exist?('data/book.json')
      File.open('data/book.json', 'w')
      return []
    end
    books = []
    File.foreach('data/book.json') do |line|
      book = JSON.parse(line)
      genre = @app.list_genres.select { |gen| gen.name == book[4] }
      author = @app.list_authors.select { |auth| auth.last_name == book[7] }
      source = @app.list_sources.select { |src| src.name == book[5] }
      label = @app.list_labels.select { |lab| lab.title == book[8] }
      books << @app.add_book(book[0], book[1], book[2], book[3],
                             genre[0], author[0], source[0], label[0])
    end
    books
  end

  def reader_label
    unless File.exist?('data/label.json')
      File.open('data/label.json', 'w')
      return []
    end
    labels = []
    File.foreach('data/label.json') do |line|
      labels << JSON.parse(line, create_additions: true)
    end
    labels
  end
end
