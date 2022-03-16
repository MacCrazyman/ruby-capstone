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
    FileUtils.touch("#{@path}/games.json") unless File.exist?("#{@path}/books.json")
    FileUtils.touch("#{@path}/authors.json") unless File.exist?("#{@path}/labels.json")
  end

  def save_games(state)
    games_hash = state[:game_list].map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        id: game.id }
    end
    games_json = JSON.generate(games_hash)
    File.write("#{@path}/games.json", games_json)
  end

  def save_authors(state)
    authors_hash = state[:author_list].map do |author|
      { first_name: author.first_name, last_name: author.last_name, items: author.items.map(&:id) }
    end
    authors_json = JSON.generate(authors_hash)
    File.write("#{@path}/authors.json", authors_json)
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
