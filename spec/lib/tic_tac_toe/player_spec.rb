require "spec_helper"

describe Player do
  let(:player){ Player.new(Player::ONE) }
  let(:board){
    Board.new(
      [
        [Player::ONE, Player::ONE, Player::NONE],
        [Player::NONE, Player::TWO, Player::NONE],
        [Player::TWO, Player::NONE, Player::NONE],
      ]
    )
  }
  it "should choose the best move" do
    expect(player.next_move(board)).to eq Position.new(2, 0)
  end
end
