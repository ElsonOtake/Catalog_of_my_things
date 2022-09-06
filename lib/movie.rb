require './item'

class Movie < Item
  attr_reader :source, :publish_date, :archived, :id, :silent

  # def initialize(genre, author, source, label, publish_date, silent)
  #   super(genre, author, source, label, publish_date)
  def initialize(source, publish_date, silent)
    super(source, publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent

    false
  end
end
