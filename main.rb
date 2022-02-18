# rubocop: disable Metrics
# frozen_string_literal: true

require_relative './utils/lists'
require_relative './utils/create'
require_relative './utils/data_storage'

# App class
class App
  include DataStorage
  @@albums = []
  @@games = []
  @@books = []

  def initialize
    @games = load_games
    @albums = load_albums
    @books = load_books
    @genres = load_genres
    @authors = load_authors
  end

  def run
    puts 'Welcome!'
    loop do
      puts `clear`
      menu
      option = gets.chomp.to_i
      break if option == 13

      get_num(option)
    end
    puts `clear`
    puts "\n\n\n\t\t --------------------------- ".bold.red.on_brown
    puts "\t\t|  CATALOG OF MY THINGS    | ".bold.red.on_brown
    puts "\t\t --------------------------- ".bold.red.on_brown
    puts "\n\t #{'_'.brown * 53} \n\n"
    puts "\t\t #{' Thank you for using this app! '.bold.on_blue}\n\n"
    puts "\t #{' Now your data will be saved for next time, see you! '.red.on_brown}\n\n"
    puts "\n\t #{'_'.brown * 53} \n\n"
    save_games
    save_albums
    save_books
    sleep(2)
  end

  def menu
    puts `clear`
    puts "\n\n\n\t\t --------------------------- ".bold.red.on_brown
    puts "\t\t|  CATALOG OF MY THINGS    | ".bold.red.on_brown
    puts "\t\t --------------------------- ".bold.red.on_brown
    puts "\t____________________________________________________".brown
    puts "\n\t Please choose an option by entering a number"
    puts "\n\t\t #{' 1 '.red.on_brown} - List all books"
    puts "\n\t\t #{' 2 '.red.on_brown} - List all music albums "
    puts "\n\t\t #{' 3 '.red.on_brown} - List all movies"
    puts "\n\t\t #{' 4 '.red.on_brown} - List all games"
    puts "\n\t\t #{' 5 '.red.on_brown} - List all genres"
    puts "\n\t\t #{' 6 '.red.on_brown} - List all labels"
    puts "\n\t\t #{' 7 '.red.on_brown} - List all authors"
    puts "\n\t\t #{' 8 '.red.on_brown} - List all sources"
    puts "\n\t\t #{' 9 '.red.on_brown} - Add a book"
    puts "\n\t\t #{' 10 '.red.on_brown} - Add a music album"
    puts "\n\t\t #{' 11 '.red.on_brown} - Add a movie"
    puts "\n\t\t #{' 12 '.red.on_brown} - Add a game"
    puts "\n\t\t #{' 13 '.red.on_brown} - #{' Exit '.bold.on_red}\n\t #{'_'.brown * 53} \n\n"
    print "\t\t  "
  end

  def get_num(option)
    case option
    when 1
      Listing.list('Books')
    when 2
      Listing.list('MusicAlbum')
    when 3
      Listing.list('Movies')
    when 4
      Listing.list('Games')
    when 5
      Listing.list('Genres')
    when 6
      Listing.list('Labels')
    when 7
      Listing.list('Authors')
    when 8
      Listing.list('Sources')
    when 9
      Creator.create('Book')
    when 10
      Creator.create('MusicAlbum')
    when 11
      Creator.create('Movie')
    when 12
      Creator.create('Game')
    else
      puts 'Enter a number between 1 and 13'
    end
  end
end

def main
  app = App.new
  app.run
end

main
# rubocop: enable Metrics
