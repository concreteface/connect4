require_relative 'lib/cell'
require_relative 'lib/player'
require 'pry'

class Grid
  attr_reader :rows, :columns
  attr_accessor :board
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    create_board
  end

  def create_board
    @board = Array.new(rows){Array.new(columns){Cell.new}}
  end

  def can_play?(slot)
    @board[0][slot].empty == true
  end

  def move(column, player)
    if can_play?(column - 1)
      empty = find_first_open(column - 1)
      board[empty][column - 1].set_cell(player.piece)
    else puts "Please choose another column"
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

  def board_full?
    board[0].all? {|x| x.empty == false}
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

grid = Grid.new(6,7)
john = Player.new('John', 'J')
sandra = Player.new('Sandra', 'S')
grid.move(2, john)
grid.move(1, john)
grid.move(1, john)
grid.move(6, john)
grid.move(6, john)
grid.move(5, sandra)
grid.move(3, sandra)
grid.move(3, sandra)
grid.move(3, sandra)
grid.move(7, john)
grid.move(3, sandra)
grid.display

puts grid.board_full?
