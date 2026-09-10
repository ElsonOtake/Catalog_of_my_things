require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :archived, :title

  def initialize(title, publish_date)
    @id = Random.rand(1..10_000)
    @title = title
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  %i[genre author source label].each do |attr|
    define_method("#{attr}=") do |value|
      ivar = "@#{attr}"
      current = instance_variable_get(ivar)
      instance_variable_set(ivar, value) unless current.eql?(value)
      updated = instance_variable_get(ivar)
      updated.add_item(self) unless updated.items.include?(self)
    end
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    ((DateTime.now - @publish_date) / 365.25).to_i >= 10
  end
end
