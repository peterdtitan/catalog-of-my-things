require './music_album/music_album_module'
require './genre/genre_module'
require './input/input_module'

class Application
  def initialize
    @music_albums = []
    @all_genre = []
  end

  include INPUT
  include MUSICALBUM
  include GENRE

  def user_input
    puts 'Select an option: '
    puts '1. Add a music album'
    puts '2. List all music albums'
    puts '3. Add a genre'
    puts '4. List all genre'
    puts '7. Exit application'
    print 'Your input: '
    gets.chomp.to_i
  end

  def process_input(input)
    case input
    when 1
      add_music_album
    when 2
      list_music_albums
    when 3
      add_genre
    when 4
      list_all_genre
    end
  end

  def invalid_option
    puts
    puts 'Please enter a valid option!'
  end

  def load_data
    load_music_albums
    load_genre
  end

  def run
    load_data
    loop do
      input = user_input
      puts 'Goodbye' if input == 7
      break if input == 7

      process_input(input) if (1..6).to_a.include?(input)
      invalid_option unless (1..6).to_a.include?(input)

      puts 'Press [Enter] to continue...'
      gets
    end
  end
end

app = Application.new
app.run
