require_relative './item'

class Book < Item
  attr_reader :title, :publish_date, :publisher, :cover_state

  def initialize(title, publish_date, publisher, cover_state)
    super(title, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad' || super

    false
  end
end
