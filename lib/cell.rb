class Cell
attr_accessor :empty
attr_reader :piece
  def initialize
    @empty = true
    @piece = 'X'
  end

  def set_cell(piece)
    @piece = piece
    @empty = false
  end
end
