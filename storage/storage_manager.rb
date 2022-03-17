require_relative 'output'
require_relative 'input'

class StorageManager
  def initialize
    @path = './data'
    @input = Input.new(@path)
    @output = Output.new(@path)
  end

  def do_fetch_work(state)
    @input.read_games(state) if File.exist?("#{@path}/games.json")
    @input.read_author(state) if File.exist?("#{@path}/authors.json")
    @input.read_books(state) if File.exist?("#{@path}/books.json")
    @input.read_labels(state) if File.exist?("#{@path}/labels.json")
    @input.read_music_albums(state) if File.exist?("#{@path}/music_albums.json")
    @input.read_genres(state) if File.exist?("#{@path}/genres.json")
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
    @output.save_games(state)
    @output.save_authors(state)
  end
end
