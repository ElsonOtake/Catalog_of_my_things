require 'spec_helper'

describe Create do
  include Create
  before :each do
    @source_added = add_source('Newspaper')
    @movie_added = add_movie(@source_added, @source_added, @source_added, @source_added, 'Aug 30, 2022', false)
  end

  describe '#new' do
    it 'source_added has the Source class' do
      expect(@source_added).to be_instance_of Source
    end

    it 'source_added has the name Newspaper' do
      expect(@source_added.name).to eq('Newspaper')
    end

    it 'movie_added has Movie class' do
      expect(@movie_added).to be_instance_of Movie
    end

    it 'movie_added has silent as false' do
      expect(@movie_added.silent).to be_falsey
    end
  end
end