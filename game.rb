class Game

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @players[0].place_ships
    @players[1].place_ships
  end

  def display_status
    puts "SHOTS TAKEN:"
    puts Grid::EMPTYGRID
    puts "\nYOUR BOARD:"
    @players[0].grid.display
  end

  def x_of(string)
    string[1..-1].to_i
  end

  def y_of(string)
    ("A".."J").each_with_index do |l, i|
      if string[0] == l
        return i + 1
      end
    end
  end

  def take_turn
    player_one = @players[0]
    player_two = @players[1]
    coordinates = player_one.call_shot
    if player_two.grid.fire_at(x_of(coordinates), y_of(coordinates) )
      puts "Hit!"
    else
      puts "Miss!"
    end
    @players.reverse!
  end
end
