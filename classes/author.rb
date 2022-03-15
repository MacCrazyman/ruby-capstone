class Author
  attr_accessor :first_name, :last_name

  def initialize(_first_name, _last_name)
    @id = Random.rand(1..1000)
    @items = []
  end
end
