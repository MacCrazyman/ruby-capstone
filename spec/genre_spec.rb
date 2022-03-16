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

  # it 'can be archived' do
  #   archived_before = @genre.archived
  #   @genre.move_to_archive
  #   expect(@genre.archived).not_to be archived_before
  # end
end
