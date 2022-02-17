# rubocop: disable Metrics
# frozen_string_literal: true

require_relative './colors_utils'
require_relative './data_storage'

# class listing
class Listing
  def self.list(option)
    case option
    when 'Books'
      BookListing.list
    when 'MusicAlbum'
      MusicAlbumListing.list
    when 'Movies'
      MoviesListing.list
    when 'Games'
      GamesListing.list
    when 'Genres'
      GenresListing.list
    when 'Labels'
      LabelsListing.list
    when 'Authors'
      AuthorsListing.list
    when 'Sources'
      SourcesListing.list
    else
      puts 'Nothing to list'
    end
  end
end

# booklisting class
class BookListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n".brown.bold
    books = App.class_variable_get(:@@books)
    if books.empty?
      puts "\n\t\t #{' There are no books yet! Please add some books. '.on_red} \n\n"
    end
    books.each do |book|
      archived_text = 'No'
      archived_text = 'Yes' if book.can_be_archived?
      first_name_capitalized = book.author.first_name.split(' ').map(&:capitalize).join(' ')
      last_name_capitalized = book.author.last_name.split(' ').map(&:capitalize).join(' ')

      puts "\n\t #{'ID:'.bub}  #{book.id}  #{'Title:'.bub}  #{book.label.title}    #{'Author:'.bub}  #{first_name_capitalized} #{last_name_capitalized} #{}  #{'Genre:'.bub}  #{book.genre.name} \n"
      puts "\t #{'Publisher:'.bub}  #{book.publisher}  #{'Publish Date:'.bub}  #{book.publish_date.to_s}   #{'Cover State:'.bub}  #{book.cover_state} \n"
      puts "\t #{'Source:'.bub}  #{book.source.name}  #{'Color:'.bub}  #{book.label.color}  #{'Archived:'.bub}  #{archived_text} \n\n\n"
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu\n"
    gets.chomp
  end
end

# music album listing class
class MusicAlbumListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MUSIC ALBUMS \n\n\n"
    albums = App.class_variable_get(:@@albums)
    albums.each do |album|
      puts "name: #{album.name}, genre: #{album.genre},
      Publish Date: #{album.publish_date}, on spotify: #{album.on_spotify}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# movielisting class
class MoviesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MOVIES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# games listing class
class GamesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GAMES \n\n\n"
    games = App.class_variable_get(:@@games)
    games.each do |game|
      puts "Multiplayer: #{game.multiplayer}, Last Played At: #{game.last_played_at},
      Publish Date: #{game.publish_date}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# genre listing class
class GenresListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GENRES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# label listing class
class LabelsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE LABELS \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# author listing class
class AuthorsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE AUTHORS \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# sourcelisting class
class SourcesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE SOURCES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
# rubocop: enable Metrics
