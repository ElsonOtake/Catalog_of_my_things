require_relative 'json_referenceable'

class Label
  include JsonReferenceable

  attr_reader :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.label.eql?(self)
  end

  private

  def json_fields
    [title, color]
  end
end
