class Label
  attr_reader :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Random.rand(1001..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
