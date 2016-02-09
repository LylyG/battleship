class Grid
  attr_reader :ships

  def initialize
    @ships = []
  end

  def has_ship_on?(x,y)
    found = false
    @ships.each do |s|
      found = true if s.covers?(x,y)
    end
    found
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships.each do |s|
      return false if s.overlaps_with?(ship)
    end
    @ships << ship
  end


  def display
    table_header
    display_line
    ("A".."J").each_with_index do |l, i|
      row = "  |   |   |   |   |   |   |   |   |   |   |"
      y = i+1
      row[0] = l
      (1..10).each do |x|
        if has_ship_on?(x,y)
          row[x + (x * 3)] = "O"
        end
      end
      puts row
    end
    display_line
  end

  private def display_line
    puts "  -----------------------------------------"
  end

  private def table_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

end
