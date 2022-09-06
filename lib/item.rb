class Item
  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
    @id = Random.rand(1..1000)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def set_label(label)
    @label = label
  end

  private

  def can_be_archived?
    @publish_date >= 10
  end
end
