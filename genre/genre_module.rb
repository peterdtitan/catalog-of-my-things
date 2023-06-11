require 'json'
require_relative './genre'

module GENRE
  def list_all_genre
    puts
    puts 'All genres:'
    @genres.each do |genre|
      puts genre.name
    end
  end

  def add_genre
    name = get_input('Enter genre name: ')
    genre = Genre.new(name)
    @genres << genre
    save_genre
    puts 'Genre saved!'
  end

  def save_genre
    genres = []
    @genres.each do |genre|
      genres << {
        id: genre.id,
        name: genre.name
      }
    end
    genres_json = JSON.generate(genres)
    File.write('./data/genre.json', genres_json)
  end

  def read_genre_data
    file_path = './data/genre.json'
    genre_data = nil
    if File.exist?(file_path)
      genre_json = File.read(file_path)
      genre_data = JSON.parse(genre_json)
    end
    genre_data
  end

  def load_genre
    genres_data = read_genre_data
    return unless genres_data

    genres_data.each do |genre|
      id = genre['id']
      name = genre['name']
      new_genre = Genre.new(name, id: id)
      @genres << new_genre
    end
  end
end
