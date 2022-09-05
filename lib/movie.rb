require './item'

class Movie < Item
  def initialize(genre, author, source, label, publish_date, silent)
    super(genre, author, source, label, publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    return true if super || @silent
    false
  end
end
