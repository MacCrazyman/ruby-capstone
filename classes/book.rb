require_relative './item'

class Book < Item
  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
>>>>>>> 092754b114b9e445bda89e61712218058a2041b7
