# rubocop: disable Metrics
# frozen_string_literal: true

require 'json'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/source'
require_relative '../classes/item'
require_relative '../classes/game'
require_relative '../classes/genre'
require_relative '../classes/musicAlbum'
require_relative '../classes/book'

# module DataStorage
module DataStorage
  def save_data(filename, data)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def load_data(filename)
    JSON.parse(File.read(filename))
  end

  def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      if %w[Genre Source Author Label Item Book Movie MusicAlbum].include?(value.class.name)
        value = object_to_hash(value)
      elsif %(Date).include?(value.class.name)
        value = value.to_s
      end
      hash[key] = value
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Book'
      book = Book.new(Date.parse(hash['publish_date']), hash['publisher'], hash['cover_state'], hash['archived'],
                      hash['id'])
      book.assign_label(Label.new(hash['label']['title'], hash['label']['color'], hash['label']['id']))
      book.assign_author(Author.new(hash['author']['first_name'], hash['author']['last_name'], hash['author']['id']))
      book.assign_genre(Genre.new(hash['genre']['name'], hash['genre']['id']))
      book.assign_source(Source.new(hash['source']['name'], hash['source']['id']))
      book
    end
  end

  def save_games
    data = []
    games = App.class_variable_get(:@@games)
    games.each do |game|
      data << ({ multiplayer: game.multiplayer, last_played_at: game.last_played_at,
                 publish_date: game.publish_date })
      save_data('game.json', data)
    end
  end

  def save_albums
    data = []
    albums = App.class_variable_get(:@@albums)
    albums.each do |album|
      data << ({ publish_date: album.publish_date,
                 on_spotify: album.on_spotify, name: album.name, genre: album.genre })
      save_data('album.json', data)
    end
  end

  def save_genres
    data = []
    genres = App.class_variable_get(:@@genres)
    genres.each do |genre|
      data << ({ name: genre.name })
      save_data('genre.json', data)
    end
  end

  def save_author
    data = []
    authors = App.class_variable_get(:@@authors)
    authors.each do |author|
      data << ({ first_name: author.first_name, last_name: author.last_name })
      save_data('author.json', data)
    end
  end

  def load_games
    filename = 'game.json'
    games = App.class_variable_get(:@@games)
    if File.exist? filename
      data = load_data(filename)
      data.map do |game|
        new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
        games << new_game
      end
    else
      []
    end
  end

  def load_albums
    filename = 'album.json'
    albums = App.class_variable_get(:@@albums)
    if File.exist? filename
      data = load_data(filename)
      data.map do |album|
        new_album = MusicAlbum.new(album['name'], album['genre'], album['publish_date'], album['on_spotify'])
        albums << new_album
      end
    else
      []
    end
  end

  def save_books
    books = App.class_variable_get(:@@books).map do |book|
      object_to_hash(book)
    end
    books_filename = 'books.json'
    save_data(books_filename, books)
  end

  def load_books
    books_filename = 'books.json'
    books = App.class_variable_get(:@@books)
    if File.exist? books_filename
      data = load_data(books_filename)
      books = data.map do |book|
        books << hash_to_object(book, 'Book')
      end
    else
      []
    end
  end

  def load_genres
    filename = 'genre.json'
    genres = App.class_variable_get(:@@genres)
    if File.exist? filename
      data = load_data(filename)
      data.map do |genre|
        new_genre = Genre.new(genre['name'])
        genres << new_genre
      end
    else 
      []
    end
  end
  
  def load_authors
    filename = 'author.json'
    authors = App.class_variable_get(:@@authors)
    if File.exist? filename
      data = load_data(filename)
      data.map do |author|
        new_author = Author.new(author['first_name'], author['last_name'])
        authors << new_author
      end
    else
      []
    end
  end
end
# rubocop: enable Metrics
