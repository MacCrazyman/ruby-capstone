require 'time'

class Item
  attr_accessor :publish_date, :genre
  attr_reader :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @genre = nil
  end

  def add_genre(genre)
    genre.add_item(self)
  end

  def add_label; end

  def add_author; end

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
