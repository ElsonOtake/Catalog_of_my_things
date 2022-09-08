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
    item.genre = self unless item.genre.eql?(self)

    @items << item unless @items.include?(item)
  end
end
