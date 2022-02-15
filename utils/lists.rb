# require_relative '../classes/'

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

class BookListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE BOOKS \n\n\n"
    # Code goes here

    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

 class MusicAlbumListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MUSIC ALBUMS \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
 end

class MoviesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE MOVIES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class GamesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GAMES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class GenresListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE GENRES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class LabelsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE LABELS \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class AuthorsListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE AUTHORS \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end

class SourcesListing < Listing
  def self.list
    puts `clear`
    puts "\n\n\n\t\t     ALL AVAILABLE SOURCES \n\n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    gets.chomp
  end
end
end
