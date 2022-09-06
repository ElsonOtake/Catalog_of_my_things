require './create'

class Main
  include Create

  def tests
    hbo = add_source('HBO Max')
    netflix = add_source('Netflix')
    disney = add_source('Disney Plus')
    apple = add_source('Apple TV')
    puts "#{hbo.id} hbo"
    puts "#{netflix.id} netflix"
    puts "#{disney.id} disney"
    puts "#{apple.id} apple"
    shawshank = add_movie(disney, 'Sep 02, 2002', false)
    puts "#{shawshank.silent} #{shawshank.archived} #{shawshank.id} shawshank"
  end
end

main = Main.new
main.tests
