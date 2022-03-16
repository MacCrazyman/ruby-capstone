require_relative './IO/user_inputs'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/game'
require_relative './classes/author'

class App
  attr_accessor :methods

  include UserInput

  def initialize(state)
    @state = state
    @methods = {
      1 => -> { list_all_books },
      2 => -> { nothing_to_show },
      3 => -> { list_of_games },
      4 => -> { nothing_to_show },
      5 => -> { list_all_labels },
      6 => -> { list_all_authors },
      7 => -> { add_book },
      8 => -> { nothing_to_show },
      9 => -> { add_a_game }
    }
  end

  def list_of_games
    game_list = @state[:game_list]
    if game_list && game_list.empty?
      puts 'No Games Added Yet ):'
    else
      game_list.each { |game| puts "Multiplayer: #{game.multiplayer}, Last Seen: #{game.last_played_at}, Publish Date: #{game.publish_date}" }
    end
  end

  def list_all_authors
    author_list = @state[:author_list]
    if author_list.count.zero?
      puts 'No Games Added Yet ):'
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
end
