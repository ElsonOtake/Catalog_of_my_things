require 'spec_helper'

require 'date'

describe Book do
  book = Book.new('title', 'andres', 'Good', 'May 15, 2020')

  book1 = Book.new('title', 'andres', 'bad', 'May 15, 2020')

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
end
