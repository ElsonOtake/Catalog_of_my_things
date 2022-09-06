require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @publish_date = Date.parse(publish_date)
    @archived = false
    @id = Random.rand(1..1000)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label_setter(label)
    @label = label
  end

  private

  def can_be_archived?
    ((DateTime.now - @publish_date) / 365.25).to_i >= 10
  end
end
