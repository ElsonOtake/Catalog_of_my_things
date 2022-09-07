require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre, :publish_date

  def initialize(on_spotify = 'true')
    super(publish_date)

    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    can_be_archived? || @on_spotify
  end
end
