class Player
  attr_reader :grid

  def initialize
    @grid = Grid.new
  end

  def place_ships(array)
    @grid.place_ship(Ship.new(array[0]), 1, 1, false)
    puts "#{@name}, where would you like to place a ship of length #{array[0]}?\nAcross or Down?\n"
    @grid.place_ship(Ship.new(array[1]), 4, 1, false)
    puts "#{@name}, where would you like to place a ship of length #{array[1]}?\nAcross or Down?\n"
  end

  def ships
    @grid.ships

  end
end
