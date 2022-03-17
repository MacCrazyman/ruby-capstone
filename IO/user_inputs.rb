require_relative '../validations/validations.rb'
module UserInput

  include Validate

  def book_input
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State(good/bad):'
    cover_state = gets.chomp
    print 'Publish Date(yyyy-mm-dd): '
    publish_date = gets.chomp
    validate_date(publish_date)
    print 'Do you want yo add a label? (press 1 for yes)'
    user_choice = gets.chomp
    label = label_input if user_choice.to_i == 1
    [publisher, cover_state, publish_date, label]
  end

  def label_input
    print 'Label title: '
    label_title = gets.chomp
    print 'Label color: '
    label_color = gets.chomp
    { title: label_title, color: label_color }
  end

  def music_album_input
    print 'Publish Date(yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Is this album on Spotify? [Y/N]'
    on_spotify = gets.chomp.downcase == 'y'
    print 'Genre: '
    genre = gets.chomp
    [publish_date, on_spotify, genre]
  end

  def game_input
    print 'Is this a multiplayer game? Enter [Y/N]: '
    multiplayer = gets.chomp
    validate_boolean(multiplayer)

    print 'Enter the date you last played(yyyy-mm-dd):'
    last_played_at = gets.chomp
    validate_date(last_played_at)

    print 'Publish Date(yyyy-mm-dd): '
    publish_date = gets.chomp
    validate_date(publish_date)

    print 'Do you want yo add an author? [Y/N]'
    user_choice = gets.chomp
    validate_boolean(user_choice)
    author = author_input if user_choice.to_i == 1
    [multiplayer, last_played_at, publish_date, author]
  end

  def author_input
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    { first_name: first_name, last_name: last_name }
  end
end
