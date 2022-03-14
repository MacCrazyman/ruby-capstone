require './app'

def main
  choice_array = ['1. List all books',
                  '2. List all music albums',
                  '3. List of games',
                  '4. List all genres',
                  '5. List all labels',
                  '6. List all authors',
                  '7. Add a book',
                  '8. Add a music album',
                  '9. Add a game',
                  '0. Exit']

  input = nil

  while input != 0
    puts 'Welcome To My Catalog. Pick An Option From The List Below'
    puts choice_array
    input = gets.chomp.to_i
  end
end

main
