require 'date'
require 'spec_helper'

describe Item do
  before do
    @item = Item.new('Thing', 'May 15, 2020')
    @genre = Genre.new('Fiction')
    @author = Author.new('Jane', 'Doe')
    @source = Source.new('Store')
    @label = Label.new('New', 'blue')
  end

  it 'stores the given title' do
    expect(@item.title).to eq('Thing')
  end

  it 'parses the publish date string into a Date' do
    expect(@item.instance_variable_get(:@publish_date)).to eq(Date.parse('May 15, 2020'))
  end

  it 'has a numeric id between 1 and 10000' do
    expect(@item.id).to be_between(1, 10_000).inclusive
  end

  it 'starts unarchived' do
    expect(@item.archived).to be_falsey
  end

  describe '#genre=' do
    it 'assigns the genre' do
      @item.genre = @genre
      expect(@item.genre).to eq(@genre)
    end

    it 'adds itself to the genre items list' do
      @item.genre = @genre
      expect(@genre.items).to include(@item)
    end

    it 'does not add itself twice when set repeatedly with the same genre' do
      @item.genre = @genre
      @item.genre = @genre
      expect(@genre.items.count(@item)).to eq(1)
    end
  end

  describe '#author=' do
    it 'assigns the author' do
      @item.author = @author
      expect(@item.author).to eq(@author)
    end

    it 'adds itself to the author items list' do
      @item.author = @author
      expect(@author.items).to include(@item)
    end
  end

  describe '#source=' do
    it 'assigns the source' do
      @item.source = @source
      expect(@item.source).to eq(@source)
    end

    it 'adds itself to the source items list' do
      @item.source = @source
      expect(@source.items).to include(@item)
    end
  end

  describe '#label=' do
    it 'assigns the label' do
      @item.label = @label
      expect(@item.label).to eq(@label)
    end

    it 'adds itself to the label items list' do
      @item.label = @label
      expect(@label.items).to include(@item)
    end
  end

  describe '#move_to_archive' do
    it 'archives an item published more than 10 years ago' do
      old_item = Item.new('Old thing', '2000-01-01')
      old_item.move_to_archive
      expect(old_item.archived).to be_truthy
    end

    it 'does not archive an item published less than 10 years ago' do
      recent_item = Item.new('Recent thing', Date.today.to_s)
      recent_item.move_to_archive
      expect(recent_item.archived).to be_falsey
    end
  end
end
