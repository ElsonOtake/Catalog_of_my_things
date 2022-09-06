require './source'

module Create
  def add_source(name)
    Source.new(name)
  end
end
