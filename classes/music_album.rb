require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify
  def initialize(*args)
    super(*args)
    @on_spotify = false
  end
end