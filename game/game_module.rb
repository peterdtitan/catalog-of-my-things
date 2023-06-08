require_relative './game'

module GAME
  def list_all_games
    puts 'No game available!' if @games.empty?
    return if @games.empty?
    puts
    puts 'All games:'
    @games.each do |game|
      puts "ID: #{game.id}, Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}, Publish date: #{game.publish_date}"
    end
  end

  def add_game
    multiplayer = get_input('Is this a multiplayer game? [y/n]: ')
    multiplayer = multiplayer.downcase == 'y'
    publish_date = get_input('Enter publish date [dd/mm/yyyy]: ')
    game = Game.new(multiplayer, publish_date)
    @games << game
    save_games
    puts 'New game added!'
  end

  def save_games
    all_games = []
    @games.each do |game|
      all_games << {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    games_json = JSON.generate(all_games)
    File.write('./data/games.json', games_json)
  end

  def read_games_data
    file_path = './data/games.json'
    games_data = nil
    if File.exist?(file_path)
      games_json = File.read(file_path)
      games_data = JSON.parse(games_json)
    end
    games_data
  end

  def load_games
    games = read_games_data
    return unless games

    games.each do |game|
      id = game['id']
      publish_date = game['publish_date']
      multiplayer = game['multiplayer']
      last_played_at = game['last_played_at']
      new_game = Game.new(multiplayer, publish_date, last_played_at: last_played_at, id: id)
      @games << new_game
    end
  end
end