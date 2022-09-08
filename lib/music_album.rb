require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :genre, :source

  def initialize(title, on_spotify, publish_date)
    super(title, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    can_be_archived? || @on_spotify
  end
end
