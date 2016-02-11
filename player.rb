class Player
  attr_reader :grid, :call_shot

  def initialize
    @grid = Grid.new
    @call_shot = true
  end

  def ships
    @grid.ships
  end


end
