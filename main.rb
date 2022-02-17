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
    puts 'Thank you using our Library!'
    save_games
    save_albums
    save_books
  end

  def menu
    puts `clear`
    puts "\n\n\n\t\t ---------------------------".bold.on_magenta
    puts "\t\t|  CATALOG OF MY THINGS  |".bold.on_magenta
    puts "\t\t ---------------------------".bold.on_magenta
    puts "\t____________________________________________________".magenta
    puts "\n\t Please choose an option by entering a number"
    puts "\n\t\t #{' 1 '.brown.on_magenta} - List all books\n"
    puts "\n\t\t #{' 2 '.brown.on_magenta} - List all music albums \n"
    puts "\n\t\t #{' 3 '.brown.on_magenta} - List all movies\n"
    puts "\n\t\t #{' 4 '.brown.on_magenta} - List all games\n"
    puts "\n\t\t #{' 5 '.brown.on_magenta} - List all genres\n"
    puts "\n\t\t #{' 6 '.brown.on_magenta} - List all labels\n"
    puts "\n\t\t #{' 7 '.brown.on_magenta} - List all authors\n"
    puts "\n\t\t #{' 8 '.brown.on_magenta} - List all sources\n"
    puts "\n\t\t #{' 9 '.brown.on_magenta} - Add a book\n"
    puts "\n\t\t #{' 10 '.brown.on_magenta} - Add a music album\n"
    puts "\n\t\t #{' 11 '.brown.on_magenta} - Add a movie\n"
    puts "\n\t\t #{' 12 '.brown.on_magenta} - Add a game\n"
    puts "\n\t\t #{' 13 '.brown.on_magenta} - #{' Exit '.bold.on_red}\n\t #{'_'.magenta * 53} \n\n"
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
