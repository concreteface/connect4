require_relative 'cell'
require_relative 'player'
require 'pry'
class Grid
  attr_reader :rows, :columns
  attr_accessor :board
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def create_board
    @board = Array.new(rows){Array.new(columns){Cell.new}}
  end

  def can_play?(slot)
    @board[0][slot].empty == true
  end

  def move(column, player)
    if can_play?(column)
      empty = find_first_open(column)
      board[empty][column].piece = player.piece
      board[empty][column].empty = false
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

  def display
    board.each do |x|
      y = x.map do |c|
        c.piece
      end
      puts "| #{y.join(" | ")} |"
    end
  end
end

grid = Grid.new(6,7)
grid.create_board
john = Player.new('John', 'J')
sandra = Player.new('Sandra', 'S')
grid.move(6, john)
grid.move(6, john)
grid.move(5, sandra)
grid.move(3, sandra)
grid.move(3, sandra)
grid.move(3, sandra)
grid.move(3, sandra)
# grid.move(2, john)
# grid.move(1, john)
# grid.move(6, john)
grid.display
# grid.board.each_with_index do |row, j|
#   puts "row: #{j + 1}"
#   row.each_with_index do |cell, i|
#     puts "column #{i + 1} empty: #{cell.empty}"
#   end
# end
