class Genre
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  # public: creates the relationship between the item and the genre class.
  #
  # item - an instance of an item to set the genre
  #
  # Examples
  #   rock = Genre.new('rock')
  #   album_1 = MusicAlbum.new('2010-04-04', on_spotify: true)
  #   rock.add_item(album_1)

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
