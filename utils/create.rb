# rubocop: disable Metrics
require_relative '../classes/musicalbum'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/author'
require_relative '../classes/source'
require_relative '../classes/game'
require_relative '../classes/book'
require_relative './colors_utils'
require_relative './data_storage'
require 'date'

# Creator class
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

# BookCreator class
class BookCreator
  include DataStorage
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n".brown.bold
    print "\t\t #{" Book's Title: ".bold.red.on_brown}  "
    title = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{" Book's Genre: ".bold.red.on_brown}  "
    genre = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{" Author's First Name: ".bold.red.on_brown}  "
    auth_first_name = gets.chomp.split.map(&:capitalize).join(' ')
    print "\t\t #{" Author's Last Name: ".bold.red.on_brown}  "
    auth_last_name = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{" Book's Publisher: ".bold.red.on_brown}  "
    publisher = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{' Publish Date (yyyy-mm-dd): '.bold.red.on_brown}  "
    publish_date = gets.chomp
    print "\n\t\t #{" Book's Color: ".bold.red.on_brown}  "
    b_color = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{" Book's Cover State: ".bold.red.on_brown}  "
    cover_state = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{" Book's Source: ".bold.red.on_brown}  "
    source = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\t\t #{' Is This Book Archived? (y/n): '.bold.red.on_brown}  "
    archived = gets.chomp.downcase
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

    puts "\n\n\t\t #{' Book added successfully! '.bold.on_green}"

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# MusicAlbumCreator class
class MusicAlbumCreator
  include DataStorage
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  MUSIC ALBUM CREATION \n\n".brown.bold
    print "\t\t #{" Album's Title: ".bold.red.on_brown}  "
    title = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{" Singer's First Name: ".bold.red.on_brown}  "
    auth_first_name = gets.chomp.split.map(&:capitalize).join(' ')
    print "\t\t #{" Singer's Last Name: ".bold.red.on_brown}  "
    auth_last_name = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Publish Date (yyyy-mm-dd): '.bold.red.on_brown}  "
    publish_date = gets.chomp

    print "\n\t\t #{' Music Genre: '.bold.red.on_brown}  "
    genre = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Album Color: '.bold.red.on_brown}  "
    color = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{" Album's Source: ".bold.red.on_brown}  "
    source = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Is This Album Archived? (y/n): '.bold.red.on_brown}  "
    archived = gets.chomp.downcase
    archived = archived == 'y'

    print "\n\t\t #{' Is This Album On Spotify? (y/n): '.bold.red.on_brown}  "
    on_spotify = gets.chomp.downcase
    on_spotify = on_spotify == 'y'
    puts "\n\n"

    label = Label.new(title, color)
    author = Author.new(auth_first_name, auth_last_name)
    genre = Genre.new(genre)
    source = Source.new(source)

    album = MusicAlbum.new(Date.parse(publish_date), archived, on_spotify)

    author.add_item(album) unless Author.class_variable_get(:@@items).include?(album)
    genre.add_item(album) unless Genre.class_variable_get(:@@items).include?(album)
    source.add_item(album) unless Source.class_variable_get(:@@items).include?(album)
    label.add_item(album) unless Label.class_variable_get(:@@items).include?(album)

    App.class_variable_get(:@@albums) << album

    puts "\n\n\t\t #{' Album added successfully! '.bold.on_green}"

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# GameCreator class
class GameCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  GAME CREATION \n\n".brown.bold

    print "\t\t #{' Name of the Game: '.bold.red.on_brown}  "
    title = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Game Genre: '.bold.red.on_brown}  "
    genre = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Cover Color: '.bold.red.on_brown}  "
    color = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{" Editor's First Name: ".bold.red.on_brown}  "
    auth_first_name = gets.chomp.split.map(&:capitalize).join(' ')
    print "\t\t #{" Editor's Last Name: ".bold.red.on_brown}  "
    auth_last_name = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Publish Date (yyyy-mm-dd): '.bold.red.on_brown}  "
    publish_date = gets.chomp

    print "\n\t\t #{' Is this game multiplayer? (y/n): '.bold.red.on_brown}  "
    multiplayer = gets.chomp.downcase == 'y'

    print "\n\t\t #{" Game's Source: ".bold.red.on_brown}  "
    source = gets.chomp.split.map(&:capitalize).join(' ')

    print "\n\t\t #{' Last Played On (y/n): '.bold.red.on_brown}  "
    last_played_at = gets.chomp

    print "\n\t\t #{' Is this game archived? (y/n): '.bold.red.on_brown}  "
    archived = gets.chomp.downcase == 'y'

    label = Label.new(title, color)
    author = Author.new(auth_first_name, auth_last_name)
    genre = Genre.new(genre)
    source = Source.new(source)

    game = Game.new(Date.parse(publish_date), Date.parse(last_played_at), multiplayer, archived)

    author.add_item(game) unless Author.class_variable_get(:@@items).include?(game)
    genre.add_item(game) unless Genre.class_variable_get(:@@items).include?(game)
    source.add_item(game) unless Source.class_variable_get(:@@items).include?(game)
    label.add_item(game) unless Label.class_variable_get(:@@items).include?(game)

    App.class_variable_get(:@@games) << game

    puts "\n\n\t\t #{' Game added successfully! '.bold.on_green}"

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

# MovieCreator class
class MovieCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t      MOVIE CREATION \n\n".brown.bold

    print "\t #{' THIS OPTION IS NOT AVAILABLE. MIGHT BE AVAILABLE SOON. '.bold.red.on_brown}  "

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end
# rubocop: enable Metrics
