require 'fileutils'
require 'spec_helper'

class ReaderWriterTester
  include Reader
  include Writer

  attr_reader :app

  def initialize(app)
    @app = app
  end
end

describe 'Reader and Writer round trip' do
  let(:test_dir) { File.expand_path('../../tmp_reader_writer_spec_data', __dir__) }

  before do
    @original_dir = Dir.pwd
    FileUtils.mkdir_p(test_dir)
    Dir.chdir(test_dir)
  end

  after do
    Dir.chdir(@original_dir)
    FileUtils.rm_rf(test_dir)
  end

  it 'creates an empty data directory and files on first run' do
    app = App.new
    tester = ReaderWriterTester.new(app)

    tester.reader

    expect(Dir.exist?('data')).to be(true)
    expect(app.list_genres).to eq([])
    expect(app.list_books).to eq([])
  end

  it 'writes an added book and reads back an equivalent record' do
    app = App.new
    tester = ReaderWriterTester.new(app)
    tester.reader # creates the data/ directory and empty files

    genre = app.add_genre('Fiction')
    author = app.add_author('Jane', 'Doe')
    source = app.add_source('Store')
    label = app.add_label('New', 'blue')
    app.add_book('Sapiens', 'May 15, 2020', 'Penguin', 'good', genre, author, source, label)

    tester.writer

    reloaded_app = App.new
    reloaded_tester = ReaderWriterTester.new(reloaded_app)
    reloaded_tester.reader

    expect(reloaded_app.list_books.size).to eq(1)

    reloaded_book = reloaded_app.list_books.first
    expect(reloaded_book.title).to eq('Sapiens')
    expect(reloaded_book.publisher).to eq('Penguin')
    expect(reloaded_book.cover_state).to eq('good')
    expect(reloaded_book.genre.name).to eq('Fiction')
    expect(reloaded_book.author.first_name).to eq('Jane')
    expect(reloaded_book.author.last_name).to eq('Doe')
    expect(reloaded_book.source.name).to eq('Store')
    expect(reloaded_book.label.title).to eq('New')
    expect(reloaded_book.label.color).to eq('blue')
  end

  it 'clears previous file contents on each write instead of appending indefinitely' do
    app = App.new
    tester = ReaderWriterTester.new(app)
    tester.reader

    genre = app.add_genre('Fiction')
    author = app.add_author('Jane', 'Doe')
    source = app.add_source('Store')
    label = app.add_label('New', 'blue')
    app.add_book('Sapiens', 'May 15, 2020', 'Penguin', 'good', genre, author, source, label)

    tester.writer
    tester.writer # writing twice in a row should not duplicate records

    reloaded_app = App.new
    reloaded_tester = ReaderWriterTester.new(reloaded_app)
    reloaded_tester.reader

    expect(reloaded_app.list_books.size).to eq(1)
  end
end
