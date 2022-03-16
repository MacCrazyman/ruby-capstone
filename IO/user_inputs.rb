module UserInput
  def book_input
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State(good/bad):'
    cover_state = gets.chomp
    print 'Publish Date(yyyy-mm-dd): '
    publish_date = gets.chomp
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

  def game_input
    print 'Is this a multiplayer game? Enter Yes or No: '
    multiplayer = gets.chomp
    print 'Enter the date you last played:'
    last_played_at = gets.chomp
    print 'Publish Date(yyyy-mm-dd): '
    publish_date = gets.chomp
    print 'Do you want yo add an author? (press 1 for yes)'
    user_choice = gets.chomp
    author = author_input if user_choice.to_i == 1
    [multiplayer, last_played_at, publish_date, author]
  end

  def author_input
    print 'First Name: '
    first_name = gets.chomp
    print 'Label color: '
    last_name = gets.chomp
    { first_name: first_name, last_name: last_name }
  end

end
