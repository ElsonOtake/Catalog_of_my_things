require 'spec_helper'

require 'date'
require_relative '../../games/games'
require_relative '../../author'

describe Games do
  before :each do
    @games = Games.new
    @author = Author.new
  end
end
