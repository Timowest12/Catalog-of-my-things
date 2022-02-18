# rubocop: disable Metrics
# frozen_string_literal: true

require_relative './colors_utils'
require_relative './data_storage'

# class listing
class Listing
  def self.list(option)
    case option
    when 'Books'
      BooksListing.list
    when 'MusicAlbums'
      MusicAlbumsListing.list
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

# BooksListing class
class BooksListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n".brown.bold
    books = App.class_variable_get(:@@books)
    puts "\n\t\t #{' There are no books yet! Please add some books. '.on_red} \n\n" if books.empty?
    books.each do |book|
      archived_text = 'No'
      archived_text = 'Yes' if book.can_be_archived?
      first_name_capitalized = book.author.first_name.split(' ').map(&:capitalize).join(' ')
      last_name_capitalized = book.author.last_name.split(' ').map(&:capitalize).join(' ')

      puts "\n\t #{'ID:'.bub}  #{book.id}  #{'Title:'.bub}  #{book.label.title}    #{'Author:'.bub}  #{first_name_capitalized} #{last_name_capitalized}   #{'Genre:'.bub}  #{book.genre.name} \n"
      puts "\t #{'Publisher:'.bub}  #{book.publisher}  #{'Publish Date:'.bub}  #{book.publish_date}   #{'Cover State:'.bub}  #{book.cover_state} \n"
      puts "\t #{'Source:'.bub}  #{book.source.name}  #{'Color:'.bub}  #{book.label.color}  #{'Archived:'.bub}  #{archived_text} \n\n\n"
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu\n"
    gets.chomp
  end
end

# MusicAlbumsListing class
class MusicAlbumsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MUSIC ALBUMS \n\n\n".brown.bold
    albums = App.class_variable_get(:@@albums)
    puts "\n\t\t #{' There are no albums yet! Please add some music albums. '.on_red} \n\n" if albums.empty?

    albums.each do |album|
      archived_text = 'No'
      archived_text = 'Yes' if album.can_be_archived?
      on_spotify_text = 'No'
      on_spotify_text = 'Yes' if album.on_spotify
      first_name_capitalized = album.author.first_name.split(' ').map(&:capitalize).join(' ')
      last_name_capitalized = album.author.last_name.split(' ').map(&:capitalize).join(' ')

      puts "\n\t #{'ID:'.bub}  #{album.id}  #{'Title:'.bub}  #{album.label.title}    #{'Singer:'.bub}  #{first_name_capitalized} #{last_name_capitalized}   #{'Genre:'.bub}  #{album.genre.name} \n"
      puts "\t #{'Publish Date:'.bub}  #{album.publish_date}      #{'Source:'.bub}  #{album.source.name}      #{'Color:'.bub}  #{album.label.color} \n"
      puts "\t #{'Archived:'.bub}  #{archived_text}    #{'On Spotify:'.bub}  #{on_spotify_text}\n\n\n"
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# Gameslisting class
class GamesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GAMES \n\n\n".brown.bold
    
    games = App.class_variable_get(:@@games)
    puts "\n\t\t #{' There are no games yet! Please add some games. '.on_red} \n\n" if games.empty?

    games.each do |game|
      archived_text = 'No'
      archived_text = 'Yes' if game.can_be_archived?
      multiplayer_text = 'No'
      multiplayer_text = 'Yes' if game.multiplayer
      first_name_capitalized = game.author.first_name.split(' ').map(&:capitalize).join(' ')
      last_name_capitalized = game.author.last_name.split(' ').map(&:capitalize).join(' ')

      puts "\n\t #{'ID:'.bub}  #{game.id}  #{'Title:'.bub}  #{game.label.title}    #{'Editor:'.bub}  #{first_name_capitalized} #{last_name_capitalized}   #{'Genre:'.bub}  #{game.genre.name} \n"
      puts "\t #{'Publish Date:'.bub}  #{game.publish_date}      #{'Source:'.bub}  #{game.source.name}      #{'Color:'.bub}  #{game.label.color} \n"
      puts "\t #{'Multiplayer:'.bub}  #{multiplayer_text}       #{'Archived:'.bub}  #{archived_text}    #{'Last Played On:'.bub}  #{game.last_played_at}\n\n\n"
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# MovieListing class
class MoviesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t        ALL AVAILABLE MOVIES \n\n\n".brown.bold
    
    print "\t #{" THIS OPTION IS NOT AVAILABLE. MIGHT BE AVAILABLE SOON. ".bold.red.on_brown}  "

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# GenresListing class
class GenresListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GENRES \n\n\n".brown.bold
    genres = App.class_variable_get(:@@genres)
    genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# LabelsListing class
class LabelsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE LABELS \n\n\n".brown.bold

    all_games = App.class_variable_get(:@@games)
    all_albums = App.class_variable_get(:@@albums)
    all_books = App.class_variable_get(:@@books)

    all_items = all_games + all_albums + all_books
    labels = all_items
             .map(&:label)
             .sort_by(&:title)
             .uniq

    if labels.empty?
      puts "\n\t\t #{' There are no labels yet! Please add some items. '.on_red} \n\n"
    else
      puts "\n\t Here are the #{labels.length} label(s) found in alphabetical order \n\n"

      labels.each do |label|
        games_using_label = all_games.select { |game| game.label.title == label.title }
        albums_using_label = all_albums.select { |album| album.label.title == label.title }
        books_using_label = all_books.select { |book| book.label.title == label.title }

        items_using_label = games_using_label + albums_using_label + books_using_label

        colors_for_label = all_items.select { |item| item.label.color == label.color }
                                    .map(&:label)
                                    .map(&:color)

        puts "\n\t #{'ID:'.bub}  #{label.id}        #{'Name:'.bub}  #{label.title}"
        puts "\t #{'Total Colors For this Label:'.bub}  #{colors_for_label.length}  (#{colors_for_label.join(', ')}) \n"
        puts "\t #{'Items With This Label:'.bub}  #{items_using_label.length} Item(s) :  [#{games_using_label.length} Game(s), #{albums_using_label.length} Album(s), #{books_using_label.length} Book(s)]\n\n"
      end
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# AuthorsListing class
class AuthorsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE AUTHORS \n\n\n".brown.bold
    authors = App.class_variable_get(:@@authors)
    authors.each do |author|
      puts "Author id: #{author.id}, First Name: #{author.first_name},
      Last Name: #{author.last_name}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# SourcesListing class
class SourcesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE SOURCES \n\n\n".brown.bold
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
# rubocop: enable Metrics
