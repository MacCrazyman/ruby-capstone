require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  # class: Music Album class.
  #
  # *args  - Arguments from `item` parent
  # on_spotify - define if the album is on spotify, if nothing is passed, it is definet to false
  #
  # Examples
  #   album_1 = MusicAlbum.new('2022-04-04')
  #   # => {Musicalbum}
  def initialize(*args, on_spotify: false)
    super(*args)
    @on_spotify = on_spotify
  end

  def to_s
    "Album - publish date: #{@publish_date} | genre: #{@genre.name} | on spotify?: #{@on_spotify} | id: #{@id}"
  end

  def to_json(*_args)
    { publish_date: @publish_date.to_s, id: @id, on_spotify: @on_spotify, genre: @genre.name, archived: @archived }
  end

  private

  # private: return if the Album can be archived or not.
  #
  # no arguments
  # the method returns true if the parent's method `can_be_archived?` returns true
  # and also checks if the `on_spotify` property is true, otherwise, returns false
  #
  # Examples
  #   album_1 = MusicAlbum.new('2010-04-04', on_spotify: true)
  #   album_1.move_to_archive
  #   # => true
  #   album_1 = MusicAlbum.new('2010-04-04', on_spotify: false)
  #   album_1.move_to_archive
  #   # => false
  def can_be_archived?
    super && @on_spotify
  end
end
