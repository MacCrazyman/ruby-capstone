require_relative './IO/user_inputs'
require_relative './classes/book'
require_relative './classes/label'

class App
  attr_accessor :methods

  include UserInput

  def initialize(state)
    @state = state
    @methods = {
      1 => -> { list_all_books },
      2 => -> { list_all_music_albums },
      3 => -> { nothing_to_show },
      4 => -> { list_all_genres },
      5 => -> { list_all_labels },
      6 => -> { nothing_to_show },
      7 => -> { add_book },
      8 => -> { nothing_to_show },
      9 => -> { nothing_to_show }
    }
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
end
