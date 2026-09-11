require 'spec_helper'
require_relative '../lib/ui'

describe Ui do
  let(:app) { App.new }
  let(:ui) { Ui.new(app) }

  describe '#list_all_genres' do
    it 'prints a message when there are no genres' do
      expect { ui.list_all_genres }.to output(/list is empty/).to_stdout
    end

    it 'prints the genre name when genres exist' do
      app.add_genre('Fiction')

      expect { ui.list_all_genres }.to output(/Fiction/).to_stdout
    end
  end

  describe '#list_all_books' do
    it 'prints a message when there are no books' do
      expect { ui.list_all_books }.to output(/list is empty/).to_stdout
    end

    it 'prints book details when books exist' do
      genre = app.add_genre('Fiction')
      author = app.add_author('Jane', 'Doe')
      source = app.add_source('Store')
      label = app.add_label('New', 'blue')
      app.add_book('Sapiens', 'May 15, 2020', 'Penguin', 'good', genre, author, source, label)

      expect { ui.list_all_books }.to output(/Sapiens/).to_stdout
    end
  end

  describe '#select_option' do
    it 'lists genres by name' do
      app.add_genre('Fiction')

      expect { ui.select_option('genre', app.list_genres) }.to output(/Fiction/).to_stdout
    end

    it 'lists authors by first and last name' do
      app.add_author('Jane', 'Doe')

      expect { ui.select_option('author', app.list_authors) }.to output(/Jane Doe/).to_stdout
    end
  end

  describe '#empty_list?' do
    it 'is true when any of genre/author/source/label lists is empty' do
      expect(ui.empty_list?).to be(true)
    end

    it 'is false once genres, authors, sources, and labels all have entries' do
      app.add_genre('Fiction')
      app.add_author('Jane', 'Doe')
      app.add_source('Store')
      app.add_label('New', 'blue')

      expect(ui.empty_list?).to be(false)
    end
  end

  describe '#add_a_book' do
    it 'does not create a book when reference lists are empty' do
      allow(ui).to receive(:puts)

      ui.add_a_book

      expect(app.list_books).to be_empty
    end

    it 'creates a book from user input once reference lists are populated' do
      app.add_genre('Fiction')
      app.add_author('Jane', 'Doe')
      app.add_source('Store')
      app.add_label('New', 'blue')

      allow(ui).to receive(:puts)
      allow(ui).to receive(:gets).and_return(
        "Sapiens\n", "0\n", "0\n", "0\n", "0\n", "2020/05/15\n", "Penguin\n", "good\n"
      )

      ui.add_a_book

      expect(app.list_books.size).to eq(1)
      book = app.list_books.first
      expect(book.title).to eq('Sapiens')
      expect(book.publisher).to eq('Penguin')
      expect(book.cover_state).to eq('good')
      expect(book.genre.name).to eq('Fiction')
      expect(book.author.first_name).to eq('Jane')
      expect(book.source.name).to eq('Store')
      expect(book.label.title).to eq('New')
    end
  end
end
