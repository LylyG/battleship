class Grid
  attr_reader :ships, :fired_at, :missed

  EMPTYGRID = %Q{    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------
}

  def initialize
    @ships = []
    @fired_at = []
    @missed = []
  end

  def has_ship_on?(x,y)
    @ships.each do |s|
      return s if s.covers?(x,y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    across = true if across == "Across"   #THIS MIGHT BE WEIRD
    across = false if across == "Down"
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
        if @fired_at.include?([x,y])
          row[x * 4] = "X"
        elsif has_ship_on?(x,y)
          row[x * 4] = "O"
        end
      end
      puts row
    end
    display_line
  end


  def display_shots
    table_header
    display_line
    ("A".."J").each_with_index do |l, i|
      row = "  |   |   |   |   |   |   |   |   |   |   |"
      y = i+1
      row[0] = l
      (1..10).each do |x|
        if @fired_at.include?([x,y])
          row[x + (x * 3)] = "+"
        elsif @missed.include?([x,y])
          row[x + (x * 3)] = "-"
        end
      end
      puts row
    end
    display_line
  end


  def fire_at(x,y)
    @ships.each do |s|
      position = s.fire_at(x,y)
      if s.covers?(x,y)
        @fired_at << [x,y]
        return position
      else
        @missed << [x,y]
      end
    end
    false
  end


  def sunk?
    return false if @ships.empty?
    @ships.all? {|s| s.sunk?}
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

  private def display_line
    puts "  -----------------------------------------"
  end

  private def table_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end

endEnt
