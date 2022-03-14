class Item
  attr_accessor :publish_date

  def intialize(publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre
  end

  def add_label
  end

  def add_author
  end

  def move_to_archive
  end

  private

  def can_be_archived?
  end
end
