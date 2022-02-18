# rubocop: disable Metrics
# rubocop: disable Layout/LineLength

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
      first_name_capitalized = book.author.first_name.split.map(&:capitalize).join(' ')
      last_name_capitalized = book.author.last_name.split.map(&:capitalize).join(' ')

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
      first_name_capitalized = album.author.first_name.split.map(&:capitalize).join(' ')
      last_name_capitalized = album.author.last_name.split.map(&:capitalize).join(' ')

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
      first_name_capitalized = game.author.first_name.split.map(&:capitalize).join(' ')
      last_name_capitalized = game.author.last_name.split.map(&:capitalize).join(' ')

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

    print "\t #{' THIS OPTION IS NOT AVAILABLE. MIGHT BE AVAILABLE SOON. '.bold.red.on_brown}  "

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

      already_listed = []

      labels.each do |label|
        next if already_listed.include?(label.title)

        games_using_label = all_games.select { |game| game.label.title == label.title }
        albums_using_label = all_albums.select { |album| album.label.title == label.title }
        books_using_label = all_books.select { |book| book.label.title == label.title }

        items_using_label = games_using_label + albums_using_label + books_using_label

        colors_for_label = all_items.select { |item| item.label.color == label.color }
          .map(&:label)
          .map(&:color)

        puts "\n\t #{'ID:'.bub}  #{label.id}               #{'Name:'.bub}  #{label.title}"
        puts "\t #{'Total Colors For this Label:'.bub}  #{colors_for_label.length}  (#{colors_for_label.join(', ')}) \n"
        puts "\t #{'Items With This Label:'.bub}  #{items_using_label.length} Item(s) :  [#{games_using_label.length} Game(s), #{albums_using_label.length} Album(s), #{books_using_label.length} Book(s)]\n\n"

        already_listed << label.title
      end
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

# GenresListing class
class GenresListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GENRES \n\n\n".brown.bold

    all_games = App.class_variable_get(:@@games)
    all_albums = App.class_variable_get(:@@albums)
    all_books = App.class_variable_get(:@@books)

    all_items = all_games + all_albums + all_books

    genres = all_items
      .map(&:genre)
      .sort_by(&:name)
      .uniq

    if genres.empty?
      puts "\n\t\t #{' There are no genres yet! Please add some items. '.on_red} \n\n"
    else
      puts "\n\t Here are the #{genres.length} genre(s) found in alphabetical order \n\n"

      already_listed = []

      genres.each do |genre|
        next if already_listed.include?(genre.name)

        games_in_genre = all_games.select { |game| game.genre.name == genre.name }
        albums_in_genre = all_albums.select { |album| album.genre.name == genre.name }
        books_in_genre = all_books.select { |book| book.genre.name == genre.name }

        items_in_genre = games_in_genre + albums_in_genre + books_in_genre

        puts "\n\t #{'ID:'.bub}  #{genre.id}                #{'Name:'.bub}  #{genre.name}"
        puts "\t #{'Items In This Genre:'.bub}  #{items_in_genre.length} Item(s) :  [#{games_in_genre.length} Game(s), #{albums_in_genre.length} Album(s), #{books_in_genre.length} Book(s)]\n\n"

        already_listed << genre.name
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

    all_games = App.class_variable_get(:@@games)
    all_albums = App.class_variable_get(:@@albums)
    all_books = App.class_variable_get(:@@books)

    all_items = all_games + all_albums + all_books

    authors = all_items
      .map(&:author)
      .sort_by(&:first_name)
      .uniq

    if authors.empty?
      puts "\n\t\t #{' There are no authors yet! Please add some items. '.on_red} \n\n"
    else
      puts "\n\t Here are the #{authors.length} author(s) found in alphabetical order \n\n"

      already_listed = []

      authors.each do |author|
        next if already_listed.include?("#{author.first_name} #{author.last_name}")

        games_by_author = all_games.select do |game|
          game.author.first_name == author.first_name && game.author.last_name == author.last_name
        end
        albums_by_author = all_albums.select do |album|
          album.author.first_name == author.first_name && album.author.last_name == author.last_name
        end
        books_by_author = all_books.select do |book|
          book.author.first_name == author.first_name && book.author.last_name == author.last_name
        end

        items_by_author = games_by_author + albums_by_author + books_by_author

        puts "\n\t #{'ID:'.bub}  #{author.id}                #{'Name:'.bub}  #{author.first_name} #{author.last_name}"
        puts "\t #{'Items By This Author:'.bub}  #{items_by_author.length} Item(s) :  [#{games_by_author.length} Game(s), #{albums_by_author.length} Album(s), #{books_by_author.length} Book(s)]\n\n"

        already_listed << "#{author.first_name} #{author.last_name}"
      end
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

    all_games = App.class_variable_get(:@@games)
    all_albums = App.class_variable_get(:@@albums)
    all_books = App.class_variable_get(:@@books)

    all_items = all_games + all_albums + all_books

    sources = all_items
      .map(&:source)
      .sort_by(&:name)
      .uniq

    if sources.empty?
      puts "\n\t\t #{' No source could be found! Please add some items. '.on_red} \n\n"
    else
      puts "\n\t Here are the #{sources.length} source(s) found in alphabetical order \n\n"

      already_listed = []

      sources.each do |source|
        next if already_listed.include?(source.name)

        games_from_source = all_games.select { |game| game.source.name == source.name }
        albums_from_source = all_albums.select { |album| album.source.name == source.name }
        books_from_source = all_books.select { |book| book.source.name == source.name }

        items_from_source = games_from_source + albums_from_source + books_from_source

        puts "\n\t #{'ID:'.bub}  #{source.id}                #{'Name:'.bub}  #{source.name}"
        puts "\t #{'Items From This Source:'.bub}  #{items_from_source.length} Item(s) :  [#{games_from_source.length} Game(s), #{albums_from_source.length} Album(s), #{books_from_source.length} Book(s)]\n\n"

        already_listed << source.name
      end
    end

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
# rubocop: enable Layout/LineLength
# rubocop: enable Metrics
