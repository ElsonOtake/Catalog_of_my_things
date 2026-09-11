require 'date'

require 'spec_helper'

describe Label do
  label = Label.new('Johnnie Walker', 'red')

  item = Item.new('Thing', 'May 15, 2020')

  label.add_item(item)

  created_item = label.instance_variable_get(:@items)

  it 'should add label to items' do
    expect(created_item).to include(item)
  end

  it 'should have the correct title' do
    expect(label.title).to eq('Johnnie Walker')
  end

  it 'should have the correct color' do
    expect(label.color).to eq('red')
  end

  it 'should have a numeric id between 1 and 1000' do
    id = label.instance_variable_get(:@id)
    expect(id).to be_between(1, 1000).inclusive
  end

  it 'should set itself as the item label' do
    expect(item.label).to eq(label)
  end
end
