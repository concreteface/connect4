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
    @board = Array.new(rows){Array.new(columns, true)}
  end

  def move(column)
    empty = nil
    board.each_with_index do |row, i|
      if row[column] == false
        empty =  i - 1
        break
      else empty = rows - 1
      end
    end
    board[empty][column] = false
  end

  def display
    board.each {|x| puts x.join" "}
  end
end

grid = Grid.new(6,7)
grid.create_board


grid.move(0)
grid.move(0)
grid.move(0)
grid.move(2)
grid.move(2)
grid.move(0)
grid.move(5)


grid.display
# # puts grid.board[6][0]
