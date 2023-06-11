require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, archived, cover_state: '', id: nil)
    super(publish_date, id: id, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
