require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date
  attr_reader :id

  def initialize(multiplayer, publish_date, last_played_at: Time.now.strftime("%d/%m/%Y"), archived: false, id: nil)
    super(publish_date, archived: archived, id: id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end
end
