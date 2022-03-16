class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end

  def to_s
    "Genre - name: #{@name}"
  end

  def to_json
    {name: @name, items: @items}
  end
end
