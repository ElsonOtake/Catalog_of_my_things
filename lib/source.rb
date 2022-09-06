class Source
  def initialize(name)
    @name = name
    @id = Random.rand(1..1_000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self
  end
end
