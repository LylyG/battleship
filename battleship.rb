require './player.rb'
require './human_player.rb'
require './computer_player.rb'
require './ship.rb'
require './position.rb'
require './grid.rb'
require './game.rb'

# def get_user_input
#   gets.chomp
# end
#
# def standard_placement
#   ["A1","Down","A3","Down","A5","Down","A7","Down","A9","Down"]
# end
#
#   human1 = HumanPlayer.new("Amy")
#   human2 = HumanPlayer.new("Beth")
#   game = Game.new(human1, human2)
#
#     game.place_ships
#
#
#     # $mock_inputs << "C3"     #Amy's hit
#     game.take_turn
#
#     # $mock_inputs << "B7"     #Beth's hit
#     game.take_turn
#
#     # $mock_inputs << "C4"     #Amy's miss
#     game.take_turn
#
#     # $mock_inputs << "B7"     #Beth's miss (she shot in the same spot as last time)
#     game.take_turn
#
#   # Now the visuals matter.  Should show Amy's shots up top and Amy's own ships below.
#   # assert_output(mid_game_status) do
#     game.display_status
