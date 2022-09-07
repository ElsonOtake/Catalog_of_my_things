require_relative '../lib/genre'

describe Genre do
  context 'with valid input' do
    before(:each) do
      @new_genre = Genre.new('Rock')
    end
    context 'with valid input' do
      it 'should return a correct name' do
        expect(@new_genre.name).to eq('Rock')
        expect(@new_genre.name == 'Rock').to be_truthy
      end
      it 'should return a correct name' do
        expect(@new_genre.name).not_to eq('Bass')
        expect(@new_genre.name == 'Bass').to be_falsy
      end
    end
  end
end
