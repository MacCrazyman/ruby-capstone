require_relative './spec_helper'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new('2010-10-10')
  end

  it 'should be a MusicAlbum instance' do
    @album.should be_an_instance_of MusicAlbum
  end

  it 'should return the on_spotify property' do
    expect(@album.on_spotify).to be false
  end
  describe 'Test archive method' do
  it 'can not be archived' do
    @album.move_to_archive
    expect(@album.archived).to eq false
  end

  it 'can be archived when "on_spotify" is true' do
    @album.on_spotify = true
    @album.move_to_archive
    expect(@album.archived).to eq true
  end
end
end
