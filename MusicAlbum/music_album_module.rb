require 'json'
require_relative './music_album'

module MUSICALBUM
  def get_input(msg)
    print msg
    gets.chomp
  end

  def list_music_albums
    puts
    puts 'All music albums: '
    @music_albums.each do |album|
      puts "Album id: #{album.id}, On spotify: #{album.on_spotify}"
    end
  end

  def add_music_album
    publish_date = get_input('Enter album publish date [dd/mm/yyyy]: ')
    on_spotify = get_input('Is this album on spotify [y/n]: ')
    on_spotify = on_spotify.downcase == 'y'
    album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << album
    save_music_albums
    puts 'Music album added!'
  end

  def save_music_albums
    all_music_albums = []
    @music_albums.each do |album|
      all_music_albums << {
        id: album.id,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify
      }
    end
    music_albums_json = JSON.generate(all_music_albums)
    File.write('./data/music_albums.json', music_albums_json)
  end

  def read_music_albums_data
    file_path = './data/music_albums.json'
    music_albums_data = nil
    if File.exist?(file_path)
      music_albums_json = File.read(file_path)
      music_albums_data = JSON.parse(music_albums_json)
    end
    music_albums_data
  end

  def load_music_albums
    music_albums = read_music_albums_data
    return unless music_albums

    music_albums.each do |album|
      id = album['id']
      publish_date = album['publish_date']
      on_spotify = album['on_spotify']
      new_music_album = MusicAlbum.new(publish_date, on_spotify, id: id)
      @music_albums << new_music_album
    end
  end
end
