class Player
  NONE = "_"
  ONE = "X"
  TWO = "O"
  attr_reader :sign

  def initialize(sign)
    @sign = sign
  end

  def next_move(board)
    board.available_moves.map{|position|
      value = 0
      value += 1 if board.block?(position, self)
      value += 1 if board.connect?(position, self)
      value += 1 if board.double_block?(position, self)
      value += 1 if board.double_connect?(position, self)
      value += 1 if position == Position.new(1,1)
      [position, value]
    }.sort{|a,b| a[1] <=> b[1] }.last.first
  end

  def other_player
    case @sign
    when ONE then
      Player.new(TWO)
    when TWO then
      Player.new(ONE)
    end
  end
end
