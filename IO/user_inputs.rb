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
end
