class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
  
  def add_item(item)
    item.label_setter(self)
    @items << item unless @items.include?(item)
  end
end
