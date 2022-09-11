require 'date'

require 'spec_helper'

describe Game do
  before do
    @game = Game.new('Super Mario', '2015-12-24', true, '2019-08-17')
    @game2 = Game.new('Tetris', '2007-07-06', false, '2015-12-01')
  end

  it 'creates a new game' do
    expect(@game).to be_instance_of(Game)
  end

  it 'can be archived' do
    expect(@game.archived).to eq(false)

    @game2.move_to_archive

    expect(@game2.archived).to eq(true)
  end
end
