require_relative 'check_input'
require_relative 'lister'
require_relative 'selector'
require_relative 'thing_creator'

class Ui
  include CheckInput
  include Lister
  include Selector
  include ThingCreator

  def initialize(app)
    @app = app
    @title = ''
    @publish_date = ''
    @genre = ''
    @author = ''
    @source = ''
    @label = ''
    @item = %w[genre author source label]
  end
end
