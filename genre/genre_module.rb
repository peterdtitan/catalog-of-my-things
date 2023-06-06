require 'json'
require_relative './genre'

module GENRE
  def list_all_genre
    puts
    puts 'All genres:'
    @all_genre.each do |genre|
      puts genre.name
    end
  end

  def add_genre
    name = get_input('Enter genre name: ')
    genre = Genre.new(name)
    @all_genre << genre
    save_genre
    puts 'Genre saved!'
  end

  def save_genre
    all_genre = []
    @all_genre.each do |genre|
      all_genre << {
        id: genre.id,
        name: genre.name
      }
    end
    genre_json = JSON.generate(all_genre)
    File.write('./data/genre.json', genre_json)
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
    all_genre_data = read_genre_data
    return unless all_genre_data

    all_genre_data.each do |genre|
      id = genre['id']
      name = genre['name']
      new_genre = Genre.new(name, id: id)
      @all_genre << new_genre
    end
  end
end
