# rubocop: disable Metrics
# frozen_string_literal: true

require 'json'
require_relative '../classes/game'
require_relative '../classes/musicAlbum'

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
      data << ({ name: album.name, genre: album.genre,
                 on_spotify: album.on_spotify })
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
