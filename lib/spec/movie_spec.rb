require 'spec_helper'
require 'date'

describe Movie do
  before :each do
    @source = Source.new('Online shop')
    @movie = Movie.new('Sep 02, 2002', true)

  end

  describe '#new' do
    it 'Has the Movie class' do
      expect(@movie).to be_instance_of Movie
    end

    it 'Has source as instance of Source class' do
      @movie.source = @source
      expect(@movie.source).to be_instance_of Source
    end

    it 'Has publish date as September 02, 2002' do
      expect(@movie.publish_date).to eq(Date.parse('Sep 02, 2002'))
    end

    it 'Has silent as true' do
      expect(@movie.silent).to be_truthy
    end

    it 'Has parent item id between 1 and 10000' do
      expect(@movie.id).to be_between(1, 10_000).inclusive
    end

    it 'Has parent archived as false' do
      expect(@movie.archived).to be_falsey
    end

    it 'Has parent archived as false' do
      @movie.move_to_archive
      expect(@movie.archived).to be_truthy
    end

    it 'Has 1 as number of item to the items list of Source class' do
      @movie.source = @source
      expect(@source.items.size).to be(1)
    end
  end
end
