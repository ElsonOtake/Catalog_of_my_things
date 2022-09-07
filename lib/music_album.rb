require './lib/item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(genre, source, on_spotify = true, *attributes)
    # rubocop:enable Style/OptionalBooleanParameter
    author, label, publish_date = *attributes
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    can_be_archived? || @on_spotify
  end
end
