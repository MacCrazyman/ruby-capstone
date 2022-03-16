require 'time'
require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    time = Time.now
    formatted_date = "#{time.year - 2}-#{time.month}-#{time.day}"
    formatted_date_for_publish = "#{time.year - 10}-#{time.month}-#{time.day}"

    @last_played_at < formatted_date && publish_date < formatted_date_for_publish
  end
  private :can_be_archived?
end

game = Game.new('Yes', '1999-01-01', '2000-01-01')
p game