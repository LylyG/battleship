class Game
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def welcome
    puts "Welcome, #{@player_one.name} and #{@player_two.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @player_one.place_ships
    @player_two.place_ships
  end

  def display_status
    puts "SHOTS TAKEN:"
    puts Grid::EMPTYGRID
    puts "\nYOUR BOARD:"
    @player_one.grid.display
  end

end
