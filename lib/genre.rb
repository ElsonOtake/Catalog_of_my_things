class Genre
  attr_accessor :genre, :items, :name

  def initialize(name)
    super()

    @name = name

    @id = Random.rand(1..1000)

    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self unless item.genre.eql?(self)
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
