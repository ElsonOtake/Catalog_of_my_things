require 'spec_helper'

require 'date'

describe Book do
  book = Book.new('Sapiens', 'May 15, 2020', 'andres', 'good')
  book1 = Book.new('Curtain', 'May 15, 2020', 'andres', 'bad')

  it 'book is an instance of Book class' do
    expect(book).to be_instance_of(Book)
  end

  it 'The publish date of book is a date' do
    expect(book.publish_date).to be_a(Date)
  end

  it 'method works correctly' do
    expect(book.can_be_archived?).to eq(false)

    expect(book1.can_be_archived?).to eq(true)
  end

  it 'has the correct title' do
    expect(book.title).to eq('Sapiens')
  end

  it 'has the correct publisher' do
    expect(book.publisher).to eq('andres')
  end

  it 'has the correct cover state' do
    expect(book.cover_state).to eq('good')
  end

  it 'has a numeric id between 1 and 10000' do
    expect(book.id).to be_between(1, 10_000).inclusive
  end

  it 'links to its genre, author, source, and label when assigned' do
    genre = Genre.new('Fiction')
    author = Author.new('Jane', 'Doe')
    source = Source.new('Store')
    label = Label.new('New', 'blue')

    linked_book = Book.new('1984', 'Jun 8, 1949', 'Secker', 'good')
    linked_book.genre = genre
    linked_book.author = author
    linked_book.source = source
    linked_book.label = label

    expect(linked_book.genre).to eq(genre)
    expect(linked_book.author).to eq(author)
    expect(linked_book.source).to eq(source)
    expect(linked_book.label).to eq(label)
  end
end
