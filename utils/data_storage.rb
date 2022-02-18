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
require_relative '../classes/musicalbum'
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
    when 'MusicAlbum'
      music_album = MusicAlbum.new(Date.parse(hash['publish_date']), hash['archived'], hash['on_spotify'], hash['id'])
      music_album.assign_label(Label.new(hash['label']['title'], hash['label']['color'], hash['label']['id']))
      music_album.assign_author(Author.new(hash['author']['first_name'], hash['author']['last_name'], hash['author']['id']))
      music_album.assign_genre(Genre.new(hash['genre']['name'], hash['genre']['id']))
      music_album.assign_source(Source.new(hash['source']['name'], hash['source']['id']))
      music_album

    when 'Game'
      game = Game.new(Date.parse(hash['publish_date']), hash['last_played_at'], hash['multiplayer'], hash['archived'], hash['id'])
      game.assign_label(Label.new(hash['label']['title'], hash['label']['color'], hash['label']['id']))
      game.assign_author(Author.new(hash['author']['first_name'], hash['author']['last_name'], hash['author']['id']))
      game.assign_genre(Genre.new(hash['genre']['name'], hash['genre']['id']))
      game.assign_source(Source.new(hash['source']['name'], hash['source']['id']))
      game
    end
  end

  def save_books
    books = App.class_variable_get(:@@books).map do |book|
      object_to_hash(book)
    end
    books_filename = 'books.json'
    save_data(books_filename, books)
  end

  def save_albums
    albums = App.class_variable_get(:@@albums).map do |album|
      object_to_hash(album)
    end 
    albums_filename = 'albums.json'
    save_data(albums_filename, albums)
  end

  def save_games
    games = App.class_variable_get(:@@games).map do |game|
      object_to_hash(game)
    end
    games_filename = 'games.json'
    save_data(games_filename, games)
  end


  def load_books
    books_filename = 'books.json'
    books = App.class_variable_get(:@@books)
    if File.exist? books_filename
      data = load_data(books_filename)
      data.map do |book|
        books << hash_to_object(book, 'Book')
      end
    else
      []
    end
  end

  def load_albums
    albums_filename = 'albums.json'
    albums = App.class_variable_get(:@@albums)
    if File.exist? albums_filename
      data = load_data(albums_filename)
      data.map do |album|
        albums << hash_to_object(album, 'MusicAlbum')
      end
    else
      []
    end
  end

  def load_games
    games_filename = 'games.json'
    games = App.class_variable_get(:@@games)
    if File.exist? games_filename
      data = load_data(games_filename)
      data.map do |game|
        games << hash_to_object(game, 'Game')
      end 
    else
      []
    end 
  end

  
end
# rubocop: enable Metrics
