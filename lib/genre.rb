require './item'

class Genre
  attr_reader :item

  def initialize(name)
    super()
    @name = name
    @id = Random.rand(1..1000)
    @items = []
  end

  def add_item(author, source, label, publish_date)
    Item.new(self, author, source, label, publish_date)
  end
end
