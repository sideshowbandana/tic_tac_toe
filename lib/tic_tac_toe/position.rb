class Position < Struct.new(:x, :y)
  def to_s
    [y, x].join(" ")
  end
end
