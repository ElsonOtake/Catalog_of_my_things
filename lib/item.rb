require 'date'

class Item
  attr_reader :genre, :author, :source, :label

  def initialize(title, publish_date)
    @title = title
    @publish_date = Date.parse(publish_date)
    @archived = false
    @id = Random.rand(1..10_000)
  end

  def genre=(genre)
    @genre = genre unless @genre.eql?(genre)
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author unless @author.eql?(author)
    @author.add_item(self) unless @author.items.include?(self)
  end

  def source=(source)
    @source = source unless @source.eql?(source)
    @source.add_item(self) unless @source.items.include?(self)
  end

  def label=(label)
    @label = label unless @label.eql?(label)
    @label.add_item(self) unless @label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    ((DateTime.now - @publish_date) / 365.25).to_i >= 10
  end
end
