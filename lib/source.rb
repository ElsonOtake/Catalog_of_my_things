class Source
  attr_reader :id, :name, :items

  def initialize(name)
    @name = name
    @id = Random.rand(1..1_000)
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.source = self unless item.source.eql?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
