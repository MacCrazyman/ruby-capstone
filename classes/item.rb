require 'time'

class Item
  attr_accessor :publish_date, :label
  attr_reader :archived, :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre; end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

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
