require 'fileutils'
require 'json'
require 'pry'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    Dir.mkdir(@path) unless Dir.exist?(@path)
    FileUtils.touch("#{@path}/books.json") unless File.exist?("#{@path}/books.json")
    FileUtils.touch("#{@path}/labels.json") unless File.exist?("#{@path}/labels.json")
    FileUtils.touch("#{@path}/music_albums.json") unless File.exist?("#{@path}/music_albums.json")
    FileUtils.touch("#{@path}/genres.json") unless File.exist?("#{@path}/genres.json")
  end

  def save_books(state)
    books_hash = state[:book_list].map do |book|
      { publisher: book.publisher, cover_state: book.cover_state,
        publish_date: book.publish_date, archived: book.archived,
        id: book.id }
    end
    books_json = JSON.generate(books_hash)
    File.write("#{@path}/books.json", books_json)
  end

  def save_labels(state)
    labels_hash = state[:label_list].map do |label|
      { title: label.title, color: label.color, items: label.items.map(&:id) }
    end
    labels_json = JSON.generate(labels_hash)
    File.write("#{@path}/labels.json", labels_json)
  end

  def save_music_albums(state)
    music_albums = state[:music_albums_list].map(&:to_json)
    File.write("#{@path}/music_albums.json", JSON.pretty_generate(music_albums))
  end

  def save_genres(state)
    genres_list = state[:genres_list].map(&:to_json)
    File.write("#{@path}/genres.json", JSON.pretty_generate(genres_list))
  end
end
