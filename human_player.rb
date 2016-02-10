class HumanPlayer < Player
  attr_reader :name
  def initialize (name = "Dave")
    @name = name
    super()
  end
end
