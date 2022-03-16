require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  # class: Music Album class.
  #
  # *args  - Arguments from `item` parent
  #
  # Examples
  #   album_1 = MusicAlbum.new('2022-04-04')
  #   # => {Musicalbum}
  def initialize(*args)
    super(*args)
    @on_spotify = false
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
