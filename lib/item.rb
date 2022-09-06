require 'date'

class Item
  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
    @id = Random.rand(1..10_000)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  private

  def can_be_archived?
    ((DateTime.now - @publish_date) / 365.25).to_i >= 10
  end
end
