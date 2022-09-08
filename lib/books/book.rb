require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :title, :id

  def initialize(title, publisher, cover_state, publish_date)
    super(title, publish_date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @cover_state == 'bad' || super

    false
  end
end
