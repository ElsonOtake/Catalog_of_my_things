require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :archived, :id, :genre, :source, :title, :label, :author

  def initialize(title, publish_date, on_spotify)
    super(title, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super || @on_spotify
  end
end
