require_relative './item'



class MusicAlbum < Item

  attr_accessor :on_spotify, :publish_date, :genre, :source



  def initialize(on_spotify, publish_date)

    super(publish_date)



    @on_spotify = on_spotify

  end



  private



  def can_be_archived?

    can_be_archived? || @on_spotify

  end

end


