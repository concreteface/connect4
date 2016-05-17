require_relative 'cell'
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
    # binding.pry
  end

  def move(column)
    if can_play?(column)
      empty = nil
      board.each_with_index do |row, i|
        if row[column].empty == false
          empty =  i - 1
          break
        else empty = rows - 1
        end
      end
      board[empty][column].empty = false
    else puts "Please choose another column"
    end
  end

  def display
    board.each do |x|
      x.map! do |c|
       c.empty
      end
      puts x.join(" ")
    end
  end
end

grid = Grid.new(6,7)
grid.create_board

grid.move(6)
grid.move(6)
grid.move(6)
grid.move(3)
grid.move(2)
grid.move(1)
grid.move(6)
grid.move(6)
grid.display
# grid.move(6)
# grid.move(6)
# grid.move(1)
# grid.move(1)
# grid.board[5][0] = 'xxxxxxxxxxxxxxxxxxxxxxx'
# grid.board.each_with_index do |row, j|
#   puts "row: #{j + 1}"
#   row.each_with_index do |cell, i|
#     # puts cell.empty
#     puts "column #{i + 1} empty: #{cell.empty}"
#   end
# end
