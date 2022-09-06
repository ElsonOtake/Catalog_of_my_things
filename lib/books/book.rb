require_relative '../item'

class Book < Item
  def initialize(publisher, cover_state)
    super(id, publidh_date, genre, author, source, label )
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    true if @cover_state == 'bad' || super
  end
end
