require 'spec_helper'

describe Genre do
  context 'with valid input' do
    before(:each) do
      @new_genre = Genre.new('Rock')
    end

    it 'should return a correct name' do
      expect(@new_genre.name).to eq('Rock')

      expect(@new_genre.name == 'Rock').to be_truthy
    end

    it 'should return a correct name' do
      expect(@new_genre.name).not_to eq('Bass')

      expect(@new_genre.name == 'Bass').to be_falsy
    end

    it 'should have a numeric id between 1 and 1000' do
      id = @new_genre.instance_variable_get(:@id)
      expect(id).to be_between(1, 1000).inclusive
    end

    it 'should add an item to itself and link back to the item' do
      item = Item.new('Thing', 'May 15, 2020')
      @new_genre.add_item(item)

      expect(@new_genre.items).to include(item)
      expect(item.genre).to eq(@new_genre)
    end

    it 'should not add the same item twice' do
      item = Item.new('Thing', 'May 15, 2020')
      @new_genre.add_item(item)
      @new_genre.add_item(item)

      expect(@new_genre.items.count(item)).to eq(1)
    end
  end
end
