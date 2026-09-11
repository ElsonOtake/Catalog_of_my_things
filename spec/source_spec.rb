require 'spec_helper'

describe Source do
  before :each do
    @source = Source.new('From a friend')
  end

  describe '#new' do
    it 'Has the Source class' do
      expect(@source).to be_instance_of Source
    end

    it 'Has numeric id between 1 and 1000' do
      expect(@source.id).to be_between(1, 1000).inclusive
    end

    it 'Has name equal "From a friend"' do
      expect(@source.name).to eq('From a friend')
    end

    it 'Has empty items array' do
      expect(@source.items.size).to be(0)
    end

    it 'adds an item and links itself back to the item' do
      item = Item.new('Thing', 'May 15, 2020')
      @source.add_item(item)

      expect(@source.items).to include(item)
      expect(item.source).to eq(@source)
    end

    it 'does not add the same item twice' do
      item = Item.new('Thing', 'May 15, 2020')
      @source.add_item(item)
      @source.add_item(item)

      expect(@source.items.count(item)).to eq(1)
    end
  end
end
