require 'date'
require 'spec_helper'

describe Author do
  before do
    @author = Author.new('Mauricio', 'Cantillo')
    @item = Item.new('May 15, 2020')
  end

  it 'should create a new author' do
    expect(@author).to be_instance_of(Author)
  end

  it 'should have a name and lastname' do
    expect(@author.first_name).to eq('Mauricio')
    expect(@author.last_name).to eq('Cantillo')
  end

  it 'should add author to items' do
    @author.add_item(@item)
    created_item = @author.instance_variable_get(:@items)
    expect(created_item).to include(@item)
  end
end
