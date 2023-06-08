require_relative '../item'

class Author < Item
  attr_reader :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id: nil, archived: false)
    super(Time.now.strftime("%d/%m/%Y"), id: id, archived: archived)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end