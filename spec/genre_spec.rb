require_relative './spec_helper'

describe 'Genre' do
  before :each do
    @genre = Genre.new('rock')
  end

  it 'should be a Genre instance' do
    @genre.should be_an_instance_of Genre
  end

  it 'should return the name string' do
    expect(@genre.name).to eql 'rock'
  end
  
  it 'genre should be asociated to item' do
    item = Item.new('2020-10-10')
    @genre.add_item(item)
    expect(item.genre).to be @genre
  end
end
