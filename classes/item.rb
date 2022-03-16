require 'time'
# require_relative '../classes/author'

class Item
  attr_accessor :publish_date, :label, :author, :genre
  attr_reader :archived, :id

  def initialize(publish_date, id = Random.rand(1..1000))
    @id = id
    @publish_date = publish_date
    @archived = false
    @genre = nil
    @author = author
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    time = Time.now
    formatted_date = "#{time.year - 10}-#{time.month}-#{time.day}"

    @publish_date < formatted_date
  end
end

# date = Item.new('1900-01-01')
# # p date
# # p date.can_be_archived?

# # new_item = Item.can_be_archived?
# # p new_item

# author = Author.new('Bobby', 'Shmurda')
# # item = Item.new('1999-01-01')
# puts date.add_author(author)
