require './item'

class Movie < Item
  attr_reader :source, :publish_date, :archived, :id, :silent

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, silent)
    super(genre, author, source, label, publish_date)
    @silent = silent
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def can_be_archived?
    super || @silent

    false
  end
end
