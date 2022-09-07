require './item'

class Movie < Item
  attr_reader :title, :genre, :author, :source, :label, :publish_date, :archived, :id, :silent

  def initialize(title, publish_date, silent)
    super(title, publish_date)
    @silent = silent
  end

  private

  def can_be_archived?
    super || @silent
  end
end
