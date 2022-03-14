class App
  attr_accessor :methods

  def initialize
    @methods = {
      1 => -> { list_all_books }
    }
  end

  def list_all_books
    p 'nothing to show'
  end
end
