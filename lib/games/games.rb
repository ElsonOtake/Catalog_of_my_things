class Games
  def initialize(multiplayer, _last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date
  end

  private

  def can_be_archived?
    dif_time = Time.parse(DateTime.now) - Time.parse(@last_played_at)
    ((DateTime.now - @publish_date) / 365.25).to_i >= 10 && dif_time > 2
  end
end
