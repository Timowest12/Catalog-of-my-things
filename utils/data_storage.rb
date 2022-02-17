# rubocop: disable Metrics
# frozen_string_literal: true

require 'json'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/source'
require_relative '../classes/item'
require_relative '../classes/game'
require_relative '../classes/musicAlbum'
require_relative '../classes/movie'
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
      if %w[Genre Source Author Label Item Book Date Movie MusicAlbum].include?(value.class.name)
        value = object_to_hash(value)
      end
      hash[key] = value
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Book'
      let book = Book.new(hash['title'], hash['author'], hash['rentals'])
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
end
# rubocop: enable Metrics
