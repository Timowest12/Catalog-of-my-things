# rubocop: disable Metrics
# frozen_string_literal: true
require_relative '../classes/musicAlbum'
require './utils/musicController'
# require_relative '../classes/'

# creator class
class Creator
  
  

  def self.create(option)
    case option
    when 'Book'
      BookCreator.create
    when 'MusicAlbum'
      MusicAlbumCreator.create
    when 'Movie'
      MovieCreator.create
    when 'Game'
      GameCreator.create
    else
      puts 'Nothing to create'
    end
  end
end

# book creator class
class BookCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n"

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# music album creator class
class MusicAlbumCreator
  include MusicAlbumModule
  def initialize

    @albums = []
  end
  
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  MUSIC ALBUM CREATION \n\n"
    print 'type the name of the album:'
    name = gets.chomp
    print 'type date in format(yyyy-mm-dd)'
    publish_date = gets.chomp
    print 'genre:'
    genre = gets.chomp
    print 'is the album on spotify?'
    on_spotify = gets.chomp
    newalbum = MusicAlbum.new(name, genre, publish_date, on_spotify)
    App.class_variable_get(:@@albums) << newalbum
    puts 'album created succesfully'
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# moviecreator class
class MovieCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  MOVIE CREATION \n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# game creator class
class GameCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  GAME CREATION \n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end
# rubocop: enable Metrics
