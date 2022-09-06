require 'spec_helper'
require 'date'

describe Movie do
  before :each do
    source = Source.new('Online shop')
    @movie = Movie.new(source, 'Sep 02, 2002', true)
  end

  describe '#new' do
    it 'Has the Movie class' do
      expect(@movie).to be_instance_of Movie
    end

    it 'Has source as instance of Source class' do
      expect(@movie.source).to be_instance_of Source
    end

    it 'Has publish date as September 02, 2002' do
      expect(@movie.publish_date).to eq(Date.parse('Sep 02, 2002'))
    end

    it 'Has silent as true' do
      expect(@movie.silent).to be_truthy
    end
  end
end
