require 'date'

require 'spec_helper'

describe Label do
  label = Label.new('title', 'red')

  item = Item.new('May 15, 2020')

  label.add_item(item)

  created_item = label.instance_variable_get(:@items)

  it 'should add label to items' do
    expect(created_item).to include(item)
  end
end
