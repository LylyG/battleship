class Position
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @hit = false
  end

  def hit?
    @hit
  end

  def hit!
    if @hit
      return false
    else
      @hit = true
    end
  end
end
