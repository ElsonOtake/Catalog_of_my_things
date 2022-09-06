require './create'

class Main
  include Create

  def tests
    hbo = add_source('HBO Max')
    netflix = add_source('Netflix')
    disney = add_source('Disney Plus')
    apple = add_source('Apple TV')
    puts "#{hbo.id} #{hbo.name} hbo"
    puts "#{netflix.id} #{netflix.name} netflix"
    puts "#{disney.id} #{disney.name} disney"
    puts "#{apple.id} #{apple.name} apple"
    shawshank = add_movie(disney, 'Sep 02, 2002', false)
    puts "#{shawshank.source.id} #{shawshank.silent} #{shawshank.archived} #{shawshank.id} shawshank"
    disney.add_item(shawshank)
    puts "#{disney.items.size} items"
    tomatoes = add_movie(disney, 'Oct 31, 2022', true)
    puts "#{tomatoes.source.id} #{tomatoes.silent} #{tomatoes.archived} #{tomatoes.id} tomatoes"
    disney.add_item(tomatoes)
    puts "#{disney.items.size} items"
  end
end

main = Main.new
main.tests
