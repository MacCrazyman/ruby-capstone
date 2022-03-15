require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before :each do
    @label = Label.new('title 1', 'red')
  end

  it 'creates an instance of Label' do
    expect(@label).to be_a Label
  end

  describe '#add_item' do
    it 'can just take an instance of the item class' do
      expect { @label.add_item('hdcn') }.to raise_error(ArgumentError, 'item must be of Item class')
    end

    it 'should add the input item to the collection of items' do
      item = Item.new('2020-10-19')
      @label.add_item(item)
      expect(@label.items.length).to eq 1
    end

    it 'should add self as a property of the item object' do
      item = Item.new('2020-10-19')
      @label.add_item(item)
      expect(item.label).to eq @label
    end
  end
end
