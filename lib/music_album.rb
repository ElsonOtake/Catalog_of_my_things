require './lib/item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  def initialize(genre, source, publish_date, on_spotify = 'true', *attributes)
    author, label = *attributes
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    can_be_archived? || @on_spotify
  end
end
