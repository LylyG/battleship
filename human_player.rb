class HumanPlayer < Player
  attr_reader :name

  def initialize(name = "Dave")
    @name = name
    super()
  end

  def place_ships(array = [2,3,3,4,5])
    array.each do |ship_length|
      puts "#{@name}, where would you like to place a ship of length #{ship_length}?"
      coordinates = get_user_input
      puts "Across or Down?"
      direction = get_user_input
      unless @grid.place_ship(Ship.new(ship_length), grid.x_of(coordinates), grid.y_of(coordinates), direction=="Across")
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
        redo
      end
    end
  end

  def call_shot
    puts "#{@name}, please enter the coordinates for your next shot (e.g. 'B10'):\n"
    shot = get_user_input
  end

end
