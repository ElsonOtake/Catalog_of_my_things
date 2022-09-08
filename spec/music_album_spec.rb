require 'spec_helper'

require 'date'

describe MusicAlbum do
  context 'with valid input' do
    before(:each) do
      @new_music_album = MusicAlbum.new('title', true, '2019-01-01')

      @new_music_album.genre = 'Rock'

      @new_music_album.source = 'Spotify'
    end

    context 'with valid input' do
      it 'should return the correct genre' do
        expect(@new_music_album.genre).to eq('Rock')
      end

      it 'should return the correct source' do
        expect(@new_music_album.source).to eq('Spotify')
      end

      it 'should return boolean' do
        expect(@new_music_album.on_spotify).to be(true)
      end
    end
  end
end
