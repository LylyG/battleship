class Game
  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def welcome
    puts "Welcome, #{@human.name} and #{@computer.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @human.place_ships
    @computer.place_ships
  end
  
end
