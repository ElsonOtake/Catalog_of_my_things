require 'spec_helper'

require 'date'

describe MusicAlbum do
  context 'with valid input' do
    before(:each) do
      @new_music_album = MusicAlbum.new('Thriller', '2019-01-01', true)
      rock = Genre.new('Rock')
      @new_music_album.genre = rock
      spotify = Source.new('Spotify')
      @new_music_album.source = spotify
    end

    context 'with valid input' do
      it 'should return the correct genre' do
        expect(@new_music_album.genre.name).to eq('Rock')
      end

      it 'should return the correct source' do
        expect(@new_music_album.source.name).to eq('Spotify')
      end

      it 'should return boolean' do
        expect(@new_music_album.on_spotify).to be(true)
      end
    end
  end
end
