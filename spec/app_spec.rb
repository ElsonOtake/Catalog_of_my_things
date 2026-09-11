require 'spec_helper'

describe App do
  before :each do
    @app = App.new

    @source_added = @app.add_source('Newspaper')
    @movie_added = @app.add_movie('Driving Miss Daisy', 'Aug 30, 2022', false, @source_added, @source_added,
                                  @source_added, @source_added)
  end

  describe '#new' do
    it 'source_added has the Source class' do
      expect(@source_added).to be_instance_of Source
    end

    it 'source_added has the name Newspaper' do
      expect(@source_added.name).to eq('Newspaper')
    end

    it 'movie_added has Movie class' do
      expect(@movie_added).to be_instance_of Movie
    end

    it 'movie_added has Driving Miss Daisy as title' do
      expect(@movie_added.title).to eq('Driving Miss Daisy')
    end

    it 'movie_added has publish date as August 30, 2022' do
      expect(@movie_added.publish_date).to eq(Date.parse('Aug 30, 2022'))
    end

    it 'movie_added has silent as false' do
      expect(@movie_added.silent).to be_falsey
    end
  end

  describe '#add_genre' do
    it 'creates and stores a Genre' do
      genre = @app.add_genre('Fiction')

      expect(genre).to be_instance_of(Genre)
      expect(@app.list_genres).to include(genre)
    end
  end

  describe '#add_author' do
    it 'creates and stores an Author' do
      author = @app.add_author('Jane', 'Doe')

      expect(author).to be_instance_of(Author)
      expect(@app.list_authors).to include(author)
    end
  end

  describe '#add_label' do
    it 'creates and stores a Label' do
      label = @app.add_label('New', 'blue')

      expect(label).to be_instance_of(Label)
      expect(@app.list_labels).to include(label)
    end
  end

  describe '#add_book' do
    it 'creates a book with each reference assigned to the correct field' do
      genre = @app.add_genre('Fiction')
      author = @app.add_author('Jane', 'Doe')
      source = @app.add_source('Store')
      label = @app.add_label('New', 'blue')

      book = @app.add_book('Sapiens', 'May 15, 2020', 'Penguin', 'good', genre, author, source, label)

      expect(book).to be_instance_of(Book)
      expect(@app.list_books).to include(book)
      expect(book.genre).to eq(genre)
      expect(book.author).to eq(author)
      expect(book.source).to eq(source)
      expect(book.label).to eq(label)
    end
  end

  describe '#add_music_album' do
    it 'creates a music album with each reference assigned to the correct field' do
      genre = @app.add_genre('Rock')
      author = @app.add_author('Jane', 'Doe')
      source = @app.add_source('Spotify')
      label = @app.add_label('Favorite', 'red')

      music = @app.add_music_album('Thriller', '2019-01-01', true, genre, author, source, label)

      expect(music).to be_instance_of(MusicAlbum)
      expect(@app.list_musics).to include(music)
      expect(music.genre).to eq(genre)
      expect(music.author).to eq(author)
      expect(music.source).to eq(source)
      expect(music.label).to eq(label)
    end
  end

  describe '#add_game' do
    it 'creates a game with each reference assigned to the correct field' do
      genre = @app.add_genre('Platformer')
      author = @app.add_author('Jane', 'Doe')
      source = @app.add_source('Store')
      label = @app.add_label('New', 'blue')

      game = @app.add_game('Super Mario', '2015-12-24', true, '2019-08-17', genre, author, source, label)

      expect(game).to be_instance_of(Game)
      expect(@app.list_games).to include(game)
      expect(game.genre).to eq(genre)
      expect(game.author).to eq(author)
      expect(game.source).to eq(source)
      expect(game.label).to eq(label)
    end
  end
end
