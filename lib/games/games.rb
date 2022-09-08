require_relative '../item'

class Games < Item

  def initialize(title, publish_date, multiplayer, last_played_at)
    super(title, publish_date)

    @multiplayer = multiplayer

    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    dif_time = DateTime.now.year - Date.parse(@last_played_at).year

    super && dif_time > 2
  end
end
