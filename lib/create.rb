require './source'

module Create
  def add_source(name)
    source = Source.new(name)
    puts "#{source.id} #{source.name}"
    source
  end
end
