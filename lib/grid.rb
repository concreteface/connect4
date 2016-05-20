require_relative 'cell'
require_relative 'player'

class Grid
  attr_reader :rows, :columns
  attr_accessor :board, :last_move
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    create_board
    @last_move = []
  end

  def create_board
    @board = Array.new(rows){Array.new(columns){Cell.new}}
  end

  def can_play?(slot)
    @board[0][slot].empty == true
  end

  def board_full?
    board[0].all? {|x| x.empty == false}
  end

  def move(column, player)
    if can_play?(column - 1)
      empty = find_first_open(column - 1)
      board[empty][column - 1].set_cell(player.piece)
      last_move = [empty, column - 1]
    else puts "Column full."
    end
  end

  def find_first_open(column)
    empty = nil
    board.each_with_index do |row, i|
      if row[column].empty == false
        empty =  i - 1
        break
      else empty = rows - 1
      end
    end
    empty
  end

  def display
    board.unshift([*1..columns])
    board.each_with_index do |x, j|
      y = x.each_with_index.map do |c, i|
        if j > 0
          c.piece
        else c
        end
      end
      puts "| #{y.join(" | ")} |"
    end
    board.shift
  end
end
