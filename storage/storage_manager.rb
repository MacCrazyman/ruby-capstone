require_relative 'output'
require_relative 'input'

class StorageManager
  def initialize
    @path = './data'
    @input = Input.new(@path)
    @output = Output.new(@path)
  end

  def do_fetch_work(state)
    @input.read_books(state)
    @input.read_labels(state)
    @input.read_music_albums(state)
    @input.read_genres(state)
  end

  def fetch_data(state)
    do_fetch_work(state) if Dir.exist?(@path)
  end

  def save_data(state)
    @output.create_files
    @output.save_books(state)
    @output.save_labels(state)
    @output.save_music_albums(state)
    @output.save_genres(state)
  end
end
