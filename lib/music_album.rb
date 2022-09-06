class MusicAlbum < Item
  def initialize(on_spotify: true)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    can_be_archived? || @on_spotify
  end
end
