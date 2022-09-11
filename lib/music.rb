require_relative './item'

class MusicAlbum < Item
  attr_reader :title, :publish_date, :on_spotify

  def initialize(title, publish_date, on_spotify)
    super(title, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super || @on_spotify
  end
end
