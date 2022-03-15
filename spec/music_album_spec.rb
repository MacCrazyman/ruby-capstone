require_relative './spec_helper'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new('2010-10-10')
  end

  it 'should be a MusicAlbum instance' do
    @album.should be_an_instance_of MusicAlbum
  end
end
