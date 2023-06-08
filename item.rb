require 'date'

class Item
  attr_accessor :genre
  attr_reader :publish_date, :author, :source, :label, :archived, :id

  def initialize(publish_date, id: nil, archived: false)
    @id = id || Random.rand(101..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archived?
    date = Date.parse(@publish_date).year
    date_now = Date.today.year
    (date_now - date) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
