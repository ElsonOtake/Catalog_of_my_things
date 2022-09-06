class Source
  def initialize(name)
    @name = name
    @id = Random.rand(1..1_000)
    @items = []
  end
end
