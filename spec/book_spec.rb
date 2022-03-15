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
end
