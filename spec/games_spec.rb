require 'date'

require 'spec_helper'

describe Games do
  before do
    @game = Games.new('Title', '2015-12-24', true, '2019-08-17')

    @game2 = Games.new('Title', '2007-07-06', false, '2015-12-01')
  end

  it 'creates a new game' do
    expect(@game).to be_instance_of(Games)
  end

  it 'can be archived' do
    expect(@game.archived).to eq(false)

    @game2.move_to_archive

    expect(@game2.archived).to eq(true)

    # game2.move_to_archive = game2.archived = true
  end
end
