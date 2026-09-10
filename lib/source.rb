require_relative 'json_referenceable'

class Source
  include JsonReferenceable

  attr_reader :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source.eql?(self)
  end

  private

  def json_fields
    [name]
  end
end
