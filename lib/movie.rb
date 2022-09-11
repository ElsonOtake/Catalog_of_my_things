require_relative './item'

class Movie < Item
  attr_reader :title, :publish_date, :silent

  def initialize(title, publish_date, silent)
    super(title, publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
