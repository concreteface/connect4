class Player
  attr_accessor :name, :piece

  def initialize(name = nil, piece = 'X')
    @name = name
    @piece = piece
  end
end
