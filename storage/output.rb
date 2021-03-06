require 'fileutils'
require 'json'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    Dir.mkdir(@path) unless Dir.exist?(@path)
  end

  def save_games(state)
    games_hash = state[:game_list].map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        id: game.id }
    end
    games_json = JSON.pretty_generate(games_hash)
    File.write("#{@path}/games.json", games_json)
  end

  def save_authors(state)
    authors_hash = state[:author_list].map do |author|
      { first_name: author.first_name, last_name: author.last_name, items: author.items.map(&:id) }
    end
    authors_json = JSON.pretty_generate(authors_hash)
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

  def save_music_albums(state)
    music_albums = state[:music_albums_list].map(&:to_json)
    File.write("#{@path}/music_albums.json", JSON.pretty_generate(music_albums))
  end

  def save_genres(state)
    genres_list = state[:genres_list].map(&:to_json)
    File.write("#{@path}/genres.json", JSON.pretty_generate(genres_list))
  end
end
