require 'json'
require_relative './genre'

module GENRE
  def list_all_genres
    puts
    puts 'All genres:'
    @genres.each do |genre|
      puts genre.name
    end
  end

  def add_genre
    name = get_input('Enter genre name: ')
    genre = Genre.new(name)
    @all_genre << genre
    puts 'Genre saved!'
  end
end
