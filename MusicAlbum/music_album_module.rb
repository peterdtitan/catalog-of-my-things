require 'json'

module MusicAlbum
  def get_input(msg)
    print msg
    gets.chomp
  end

  def list_music_albums
    @music_albums.each do |album|
      puts "Album id: #{album.id}, On spotify: #{album.on_spotify?}"
    end
  end

  def add_music_album
    publish_date = get_input('Enter album publish date [dd/mm/yyyy]: ')
    on_spotify = get_input('Is this album on spotify [y/n]: ')
    on_spotify = (on_spotify.downcase == 'y') ? true : false
    album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << album
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
end
