require 'json'
require 'spec_helper'

describe JsonReferenceable do
  describe 'Genre' do
    it 'serializes to JSON and can be recreated as an equivalent Genre' do
      genre = Genre.new('Fiction')

      recreated = JSON.parse(genre.to_json, create_additions: true)

      expect(recreated).to be_instance_of(Genre)
      expect(recreated.name).to eq('Fiction')
    end
  end

  describe 'Author' do
    it 'serializes to JSON and can be recreated as an equivalent Author' do
      author = Author.new('Jane', 'Doe')

      recreated = JSON.parse(author.to_json, create_additions: true)

      expect(recreated).to be_instance_of(Author)
      expect(recreated.first_name).to eq('Jane')
      expect(recreated.last_name).to eq('Doe')
    end
  end

  describe 'Source' do
    it 'serializes to JSON and can be recreated as an equivalent Source' do
      source = Source.new('Store')

      recreated = JSON.parse(source.to_json, create_additions: true)

      expect(recreated).to be_instance_of(Source)
      expect(recreated.name).to eq('Store')
    end
  end

  describe 'Label' do
    it 'serializes to JSON and can be recreated as an equivalent Label' do
      label = Label.new('New', 'blue')

      recreated = JSON.parse(label.to_json, create_additions: true)

      expect(recreated).to be_instance_of(Label)
      expect(recreated.title).to eq('New')
      expect(recreated.color).to eq('blue')
    end
  end
end
