require './music_album/music_album_module'
require './genre/genre_module'
require './input/input_module'
require './book/book_module'
require './book/book'
require './label/label'
require './label/label_module'

class Application
  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
  end

  include INPUT
  include MUSICALBUM
  include GENRE
  include BookModule
  include LabelModule

  def user_input
    puts 'Select an option: '
    puts '1. Add a Book'
    puts '2. List all books'
    puts '3. Add a Label'
    puts '4. List all labels'
    puts '5. Add a music album'
    puts '6. List all music albums'
    puts '7. Add a genre'
    puts '8. List all genres'
    puts '9. Exit application'
    print 'Your input: '
    gets.chomp.to_i
  end

  def process1(input)
    case input
    when 1
      add_book
    when 2
      list_all_books
    when 3
      add_label
    when 4
      list_all_labels
    when 5
      add_music_album
    when 6
      list_music_albums
    end
  end

  def process2(input)
    case input
    when 7
      add_genre
    when 8
      list_all_genre
    end
  end

  def invalid_option
    puts
    puts 'Please enter a valid option!'
  end

  def load_data
    load_books
    load_music_albums
    load_genre
  end

  def run
    load_data
    loop do
      input = user_input
      puts 'Thanks for using the app, goodbye!' if input == 9
      break if input == 9

      process1(input) if (1..6).to_a.include?(input)
      process2(input) if (7..8).to_a.include?(input)
      invalid_option unless (1..8).to_a.include?(input)

      puts 'Press [Enter] to continue....'
      gets
    end
  end
end
