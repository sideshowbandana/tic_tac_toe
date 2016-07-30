class Board
  attr_reader :state

  def initialize(board_arr)
    @state = board_arr
  end

  def block?(position, player)
    neighbor?(position, player.other_player)
  end

  def double_block?(position, player)
    double_neighbor?(position, player.other_player)
  end

  def connect?(position, player)
    neighbor?(position, player)
  end

  def double_connect?(position, player)
    double_neighbor?(position, player)
  end

  def available_moves
    moves = []
    @state.each_with_index do |vals, y|
      vals.each_with_index do |val, x|
        moves << Position.new(x, y) if val == Player::NONE
      end
    end
    moves
  end

  private
  def value_at(position)
    @state[position.y][position.x] if (0..2).include?(position.x) && (0..2).include?(position.y)
  end

  def neighbor?(position, player)
    [-1, 0, 1].repeated_permutation(2).select{|x, y|
      value_at(Position.new(position.x + x, position.y + y)) == player.sign
    }
  end

  def double_neighbor?(position, player)
    neighbor?(position, player).any?{|x, y|
      value_at(Position.new(position.x + 2*x, position.y + 2*y)) == player.sign
    }
  end
end
