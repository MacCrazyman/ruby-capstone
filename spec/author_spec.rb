require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  context 'Testing Author class' do
    before :each do
      @author = Author.new('Jimmy', 'Neutron')
      @item = Item.new('2019-02-02')
    end

    it 'test if author is an instance of Author' do
      expect(@author).to be_a Author
    end

    it 'test add_item method' do
      @author.add_item(@item)
      expect(@author.items.length).to eq(1) 
    end

  end
end
