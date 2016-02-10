require './player'

class ComputerPlayer < Player

  def initialize
    @y_coordinate_options = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    super()
  end

  def name
    @name = "HAL 9000"
  end

  def place_ships(array = [2,3,3,4,5])
      array.each do |ship_length|
        coordinates = "#{@y_coordinate_options.sample}#{rand(1..10)}"
        direction = rand(2) == 1
        unless @grid.place_ship(Ship.new(ship_length), grid.x_of(coordinates), grid.y_of(coordinates), direction)
          redo
        end
      end
      puts "HAL 9000 has placed its ships.\n"
    end

  def call_shot
    @shot = "#{@y_coordinate_options.sample}#{rand(1..10)}"
  end
end
