require "tic_tac_toe/version"
require "tic_tac_toe/player"
require "tic_tac_toe/board"
require "tic_tac_toe/position"


module TicTacToe
  def run
    #If player is X, I'm the first player.
    #If player is O, I'm the second player.
    player = Player.new(gets.chomp)

    #Read the board now. The board is a 3x3 array filled with X, O or _.
    board = Board.new(Array.new(3) { gets.scan /\w/ })

    player.next_move(board)
  end
  module_function :run
end
