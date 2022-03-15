require_relative '../classes/item'

class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color)
    @title = title
    @color = color
    @id = Random.rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
