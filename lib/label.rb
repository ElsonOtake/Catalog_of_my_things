class Label
  attr_accessor :title, :color, :items

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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, color]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
