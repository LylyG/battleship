require 'byebug'

class Ship
  attr_reader :length, :x_coordinate, :y_coordinate, :ship_pegs
  def initialize(length)
    @length = length
  end

  def place (x_coordinate, y_coordinate, across=true)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    ship_pegs = {}
    ship_end = x_coordinate + @length - 1
    starting_x_coordinate = x_coordinate
    until ship_pegs.has_key?(ship_end)
    ship_pegs[starting_x_coordinate] = y_coordinate
    starting_x_coordinate +=1
    end
    @ship_pegs = ship_pegs
  end

  def covers?(x_coordinate, y_coordinate)
    ship_pegs.has_key?(x_coordinate) && ship_pegs[x_coordinate] == y_coordinate
  end
end
# 
# boat = Ship.new(4)
# puts boat.place(2,1)
# puts boat.covers?(1,1)
