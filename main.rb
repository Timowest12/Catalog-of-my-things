require_relative './utils/lists'

class App
  def run
    puts 'Welcome!'
    loop do
      menu
      option = gets.chomp
      break if option == '13'

      get_num option
    end
    puts 'Thank you for using our Library!'
  end

  def menu
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  def get_num(option)
    case option
    when '1'
      Listing.list('Books')
    when '2'
      Listing.list('MusicAlbum')
    when '3'
      Listing.list('Movies')
    when '4'
      Listing.list('Games')
    when '5'
      Listing.list('Genres')
    when '6'
      Listing.list('Labels')
    when '7'
      Listing.list('Authors')
    when '8'
      Listing.list('Sources')
    else
      puts 'Enter a number between 1 and 13'
    end
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Kindly type 1 or 2'
    end
  end

def main
  app = App.new
  app.run
end
main
end