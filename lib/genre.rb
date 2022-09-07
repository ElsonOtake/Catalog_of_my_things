require './item'

class Genre
  attr_reader :item, :name

  attr_accessor :genre

  def initialize(name)
    super()

    @name = name

    @id = Random.rand(1..1000)

    @items = []
  end

  def add_item(item)
    @items << item

    item.genre = self
  end
end
