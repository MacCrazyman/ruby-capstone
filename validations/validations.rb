module Validate
  def validate_date(string)
    format_ok = string.match(/\d{4}-\d{2}-\d{2}/)
    parseable = begin
      Date.strptime(string, '%Y-%m-%d')
    rescue StandardError
      false
    end

    if string == 'never' || (format_ok && parseable)
      nil
    else
      puts 'date is not valid'
      print 'Enter the in (yyyy-mm-dd) format to continue: '
      string = gets.chomp
      validate_date(string)
    end
  end

  def validate_boolean(string)
    if string == 'Y' || string == 'y'
      true
    elsif string == 'N' || string == 'n'
      false
    else
      puts "Invalid input. Please enter Y for yes or N for no"
      string = gets.chomp
      validate_boolean(string)
    end
  end
end