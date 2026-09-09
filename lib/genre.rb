require_relative 'json_referenceable'

class Genre
  include JsonReferenceable

  attr_reader :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self unless item.genre.eql?(self)
  end

  private

  def json_fields
    [name]
  end
end
