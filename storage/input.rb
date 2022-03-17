require 'json'
require_relative '../classes/item'
require_relative '../classes/game'

class Input
  def initialize(path)
    @path = path
  end

  def read_music_albums(state)
    music_albums_json = File.read("#{@path}/music_albums.json")
    JSON.parse(music_albums_json).each do |album|
      new_album = MusicAlbum.new(album['publish_date'], album['id'], on_spotify: album['on_spotify'])
      new_album.move_to_archive if album['archived']
      state[:music_albums_list] << new_album
    end
  end

  def read_genres(state)
    genres_json = File.read("#{@path}/genres.json")
    JSON.parse(genres_json).each do |genre|
      new_genre = Genre.new(genre['name'])
      genre['items'].each do |album_id|
        state[:music_albums_list].select { |album| album.id == album_id }[0].add_genre(new_genre)
      end
      state[:genres_list] << new_genre
    end
  end
  
  def read_games(state)
    games_json = File.read("#{@path}/games.json")
    games_hash = JSON.parse(games_json)
    games = games_hash.map do |game|
      Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['id'])
    end
    state[:game_list].concat(games)
  end

  def read_author(state)
    authors_json = File.read("#{@path}/authors.json")
    authors_hash = JSON.parse(authors_json)
    authors = authors_hash.map do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      author['items'].each do |item|
        new_author.add_item(state[:game_list].select { |game| game.id == item } [0])
      end
      new_author
    end
    state[:author_list].concat(authors)
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
