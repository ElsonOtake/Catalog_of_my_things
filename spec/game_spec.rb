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

  it 'has the correct title' do
    expect(@game.title).to eq('Super Mario')
  end

  it 'has the correct multiplayer flag' do
    expect(@game.multiplayer).to be(true)
  end

  it 'has the correct last played date' do
    expect(@game.last_played_at).to eq('2019-08-17')
  end

  it 'has a numeric id between 1 and 10000' do
    expect(@game.id).to be_between(1, 10_000).inclusive
  end

  it 'is not archived when recently published, regardless of last played date' do
    recent_game = Game.new('New Release', Date.today.to_s, true, Date.today.to_s)
    recent_game.move_to_archive

    expect(recent_game.archived).to be(false)
  end

  it 'is archived when published over 10 years ago and last played over 2 years ago' do
    old_game = Game.new('Old Game', '2000-01-01', true, '2015-01-01')
    old_game.move_to_archive

    expect(old_game.archived).to be(true)
  end
end
