class Source
  attr_reader :id, :name, :items

  def initialize(name)
    @name = name
    @id = Random.rand(1..1_000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source.eql?(item)
  end
end
