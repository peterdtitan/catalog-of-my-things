require 'date'

class Item
  attr_reader :publish_date, :author, :genre, :source, :label, :archived, :id

  def initialize(publish_date, id: nil, archived: false)
    @id = id || Random.rand(101..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    date = Date.parse(@publish_date).year
    date_now = Date.today.year
    (date_now - date) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
