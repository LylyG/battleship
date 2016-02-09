require './position.rb'
require 'byebug'


class Ship
  attr_reader :length, :x_coordinate, :y_coordinate, :ship_pegs

  def initialize(length)
    @length = length
    @direct_hits = []
    @ship_pegs = []
  end

  def place(x, y, across)
    return false if @ship_pegs !=[]
    length.times do |i|
      @ship_pegs << (across ? Position.new(x+i, y) : Position.new(x,y+i))
    end
  end

  def covers?(x_coordinate, y_coordinate)#Is it here?
    @ship_pegs.each do |position|
      return position if position.x_coordinate == x_coordinate && position.y_coordinate == y_coordinate
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
    position = covers?(x,y)
    position && position.hit!
  end

  def sunk?
    return false if @ship_pegs.empty?
    all_hit = true
    @ship_pegs.each do |position|
      all_hit = false if !position.hit?
    end
    all_hit
  end
end
