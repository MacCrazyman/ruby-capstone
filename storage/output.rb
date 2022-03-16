require 'fileutils'
require 'json'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    Dir.mkdir(@path) unless Dir.exist?(@path)
    FileUtils.touch("#{@path}/books.json") unless File.exist?("#{@path}/books.json")
    FileUtils.touch("#{@path}/labels.json") unless File.exist?("#{@path}/labels.json")
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
end
