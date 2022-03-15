require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  before :each do
    @book = Book.new('Oxford University Press', 'good', '2020-10-25')
  end
  it 'creates an instance of a Book' do
    expect(@book).to be_a Book
  end
  it 'creates an instance of an Item' do
    expect(@book).to be_a Item
  end
  describe '#can_be_archived?' do
    it 'should return true if cover_state equals to "bad"' do
      bad_cover_book = Book.new('Oxford', 'bad', '2020-10-09')
      expect(bad_cover_book.can_be_archived?).to be true
    end
    it 'should return true if parents method returns true' do
      old_book = Book.new('Oxford', 'good', '1985-10-09')
      expect(old_book.can_be_archived?).to be true
    end
    it 'otherwise should return false' do
      expect(@book.can_be_archived?).to be false
    end
  end
end
