class Cell
attr_accessor :empty, :piece

  def initialize
    @empty = true
    @piece = '-'
  end

  def set_cell(piece)
    @piece = piece
    @empty = false
  end
end
