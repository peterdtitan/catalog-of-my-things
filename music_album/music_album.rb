require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id: nil, archived: false)
    super(publish_date, id: id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super || on_spotify

    false
  end
end
