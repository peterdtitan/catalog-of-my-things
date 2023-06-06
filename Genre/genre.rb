class Genre
  attr_reader :items

  def initialize(name, id: nil)
    @id = id || Random.rand(100..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
