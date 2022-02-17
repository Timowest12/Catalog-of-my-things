# rubocop: disable Metrics
# frozen_string_literal: true

require_relative '../classes/musicAlbum'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/source'
require_relative '../classes/game'
require_relative '../classes/book'
require_relative './colors_utils'
require_relative './data_storage'
require 'date'

# creator class
class Creator
  include DataStorage
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
  include DataStorage
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n".brown.bold
    print "\t\t #{" Book's Title: ".bold.red.on_brown}  "
    title = gets.chomp.capitalize
    print "\n\t\t #{" Book's Genre: ".bold.red.on_brown}  "
    genre = gets.chomp.capitalize
    print "\n\t\t #{" Author's First Name: ".bold.red.on_brown}  "
    auth_first_name = gets.chomp.capitalize
    print "\t\t #{" Author's Last Name: ".bold.red.on_brown}  "
    auth_last_name = gets.chomp.capitalize
    print "\n\t\t #{" Book's Publisher: ".bold.red.on_brown}  "
    publisher = gets.chomp.capitalize
    print "\n\t\t #{' Publish Date (yyyy-mm-dd): '.bold.red.on_brown}  "
    publish_date = gets.chomp
    print "\n\t\t #{" Book's Color: ".bold.red.on_brown}  "
    b_color = gets.chomp.capitalize
    print "\n\t\t #{" Book's Cover State: ".bold.red.on_brown}  "
    cover_state = gets.chomp.capitalize
    print "\n\t\t #{" Book's Source: ".bold.red.on_brown}  "
    source = gets.chomp.capitalize
    print "\n\t\t #{' Is This Book Archived? (y/n): '.bold.red.on_brown}  "
    archived = gets.chomp
    archived = archived == 'y'
    puts "\n\n"

    label = Label.new(title, b_color)
    author = Author.new(auth_first_name, auth_last_name)
    genre = Genre.new(genre)
    source = Source.new(source)
    book = Book.new(Date.parse(publish_date), publisher, cover_state, archived)

    author.add_item(book) unless Author.class_variable_get(:@@items).include?(book)
    genre.add_item(book) unless Genre.class_variable_get(:@@items).include?(book)
    source.add_item(book) unless Source.class_variable_get(:@@items).include?(book)
    label.add_item(book) unless Label.class_variable_get(:@@items).include?(book)

    App.class_variable_get(:@@books) << book

    puts "\n\n\t\t #{' Book added successfully '.bold.on_green}"

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# music album creator class
class MusicAlbumCreator
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

    print 'Do you want multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y' || false

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp

    print 'Last played at date [Enter date in format (yyyy-mm-dd)]: '
    last_played_at = gets.chomp

    game = Game.new(multiplayer, last_played_at, publish_date)
    App.class_variable_get(:@@games) << game
    puts 'Game created successfully'
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end
# rubocop: enable Metrics
