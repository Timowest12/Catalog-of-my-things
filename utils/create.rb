# require_relative '../classes/'

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

class BookCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  BOOK CREATION \n\n"
   
    
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

class MusicAlbumCreator
  def self.create
    puts `clear`
    puts "\n\n\n\t\t  MUSIC ALBUM CREATION \n\n"
    # Code goes here
    puts "\n\n\n\t\t Press any key to go back to the main menu"
    print "\t\t  "
    gets.chomp
  end
end

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
end
