require './create'

class Main
  include Create

  def tests
    add_source('HBO Max')
    add_source('Netflix')
    add_source('Disney Plus')
    add_source('Apple TV')
  end
end

main = Main.new
main.tests
