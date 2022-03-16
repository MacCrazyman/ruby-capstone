require 'json'
require_relative '../classes/item'

class Input
  def initialize(path)
    @path = path
  end

  def read_books(state)
    books_json = File.read("#{@path}/books.json")
    books_hash = JSON.parse(books_json)
    books = books_hash.map do |book|
      Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['id'])
    end
    state[:book_list].concat(books)
  end

  def read_labels(state)
    labels_json = File.read("#{@path}/labels.json")
    labels_hash = JSON.parse(labels_json)
    labels = labels_hash.map do |label|
      new_label = Label.new(label['title'], label['color'])
      label['items'].each do |item|
        new_label.add_item(state[:book_list].select { |book| book.id == item } [0])
      end
      new_label
    end
    state[:label_list].concat(labels)
  end
end
