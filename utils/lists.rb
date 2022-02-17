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

# music album listing class
class MusicAlbumListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MUSIC ALBUMS \n\n\n".brown.bold
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
    puts "\n\n\n\t\t     ALL AVAILABLE MOVIES \n\n\n".brown.bold
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# games listing class
class GamesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GAMES \n\n\n".brown.bold
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
    genres = App.class_variable_get(:@@genres)
    genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# label listing class
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

# author listing class
class AuthorsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE AUTHORS \n\n\n"
    authors = App.class_variable_get(:@@authors)
    authors.each do |author|
      puts "Author id: #{author.id}, First Name: #{author.first_name},
      Last Name: #{author.last_name}"
    end
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
