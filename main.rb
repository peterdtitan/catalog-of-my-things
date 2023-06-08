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

  def user_input
    puts 'Select an option: '
    puts '1. Add a Book'
    puts '2. List all books'
    puts '3. Add a Label'
    puts '4. List all labels'
    puts '4. Add a music album'
    puts '5. List all music albums'
    puts '6. Add a genre'
    puts '7. List all genres'
    puts '8. Exit application'
    print 'Your input: '
    gets.chomp.to_i
  end

  def process_input(input)
    case input
    when 1
      add_book
    when 2
      list_all_books
    when 3
      add_label
    when 4
      add_music_album
    when 5
      list_music_albums
    when 6
      add_genre
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
      puts 'Goodbye' if input == 7
      break if input == 8

      process_input(input) if (1..6).to_a.include?(input)
      invalid_option unless (1..6).to_a.include?(input)

      puts 'Press [Enter] to continue....'
      gets
    end
  end
end

app = Application.new
app.run
