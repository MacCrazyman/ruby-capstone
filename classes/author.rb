require_relative '../classes/item'

class Author
  attr_accessor :first_name, :last_name, :id
  attr_reader :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end

# author = Author.new('Bobby', 'Shmurda')
# p author
# item = Item.new('1999-01-01')

# puts author.add_item(item)
