require_relative './item'

class Movie < Item
  attr_reader :source, :publish_date, :archived, :id, :silent

  def initialize(publish_date, silent)
    super(publish_date)

    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
