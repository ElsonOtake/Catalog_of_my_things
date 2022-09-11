class Author
  attr_reader :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self unless item.author.eql?(self)
    @items << item unless @items.include?(item)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [first_name, last_name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
