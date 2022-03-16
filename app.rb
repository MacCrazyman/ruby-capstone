require_relative './IO/user_inputs'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/game'
require_relative './classes/author'

class App
  attr_accessor :methods

  include UserInput

  def initialize(state)
    @state = state
    @methods = {
      1 => -> { list_all_books },
      2 => -> { list_all_music_albums },
      3 => -> { list_of_games },
      4 => -> { list_all_genres },
      5 => -> { list_all_labels },
      6 => -> { list_all_authors },
      7 => -> { add_book },
      8 => -> { add_music_album },
      9 => -> { add_a_game }
    }
  end

  def list_of_games
    game_list = @state[:game_list]
    if game_list.empty?
      puts 'No Games Added Yet ):'
    else
      game_list.each do |game|
        puts "Multiplayer: #{game.multiplayer}, Last Seen: #{game.last_played_at}, Publish Date: #{game.publish_date}"
      end
    end
  end

  def list_all_authors
    author_list = @state[:author_list]
    if author_list.count.zero?
      puts 'No Authors Added Yet ):'
    else
      author_list.map { |author| puts "First Name: #{author.first_name}, Last Name: #{author.last_name}" }
    end
  end

  def add_a_game
    multiplayer, last_played_at, publish_date, author = game_input
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    @state[:game_list] << new_game
    store_author(new_game, author) if author
    p('Game has been created')
  end

  def store_author(game, author)
    new_author = Author.new(author[:first_name], author[:last_name])
    game.add_author = (new_author)
    @state[:author_list] << new_author
  end

  def nothing_to_show
    p 'nothing to show'
  end

  def list_all_books
    book_list = @state[:book_list]
    if book_list.empty?
      p 'There are no books in the list, please create a book choosing option 4'
    else
      p 'Books:'
      book_list.each { |book| p "ID: '#{book.id}', Publisher: #{book.publisher} Cover State: #{book.cover_state}" }
    end
    puts ''
  end

  def list_all_labels
    label_list = @state[:label_list]
    if label_list.empty?
      p 'There are no books in the list, please create a book choosing option 4'
    else
      p 'Labels:'
      label_list.each { |label| p "ID: '#{label.id}', Title: #{label.title} " }
    end
    puts ''
  end

  def add_book
    publisher, cover_state, publish_date, label = book_input
    new_book = Book.new(publisher, cover_state, publish_date)
    @state[:book_list] << new_book
    store_label(new_book, label) if label
    p('Book has been created')
  end

  def store_label(book, label)
    new_label = Label.new(label[:title], label[:color])
    book.add_label = (new_label)
    @state[:label_list] << new_label
  end

  def list_all_music_albums
    music_albums = @state[:music_albums_list]
    return puts 'There are no albums yet' if music_albums.empty?

    music_albums.each_with_index { |album, index| p "#{index} -> #{album}" }
  end

  def list_all_genres
    genres_list = @state[:genres_list]
    return puts 'There are no genres to display' if genres_list.empty?

    genres_list.each_with_index { |genre, index| p "#{index} -> #{genre}" }
  end

  def add_music_album
    publish_date, on_spotify, genre = music_album_input
    new_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    @state[:music_albums_list] << new_album
    new_genre = @state[:genres_list].select { |item| item.name == genre }[0]
    unless new_genre
      new_genre = Genre.new(genre)
      @state[:genres_list] << new_genre
    end
    new_genre.add_item(new_album)
  end
end
