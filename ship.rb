require './position.rb'
require 'byebug'

class Ship
  attr_reader :length, :x_coordinate, :y_coordinate, :ship_pegs

  def initialize(length)
    @length = length
    @ship_pegs = []
    @direct_hits = []
    @correct_hits = []
  end

  def place(x, y, across = true)
    return false if @ship_pegs != []
    length.times do |i|
      @ship_pegs << (across ? Position.new(x + i, y) : Position.new(x, y + i))
    end
  end

  def covers?(x, y)
    @ship_pegs.each do |position|
      return position if position.x_coordinate == x && position.y_coordinate == y
    end
    false
  end

  def overlaps_with?(other)
    @ship_pegs.each do |position|
      return true if other.covers?(position.x_coordinate, position.y_coordinate)
    end
    false
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end

  def sunk?
    return false if @ship_pegs.empty?
    all_hit = true
    @ship_pegs.each do |p|
      all_hit = false if !p.hit?
    end
    all_hit
  end

end
