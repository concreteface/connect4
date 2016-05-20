require_relative 'cell'
require_relative 'player'
require_relative 'grid'

class Game
  attr_reader :board

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @board = Grid.new(6,7)
  end

  def play_game
    welcome
    while !board.board_full?
      player_play(@player1)
      if won?(@player1)
        puts "#{@player1.name wins!}"
        break
      end
      player_play(@player2)
      if won?(player2)
        puts "#{@player2.name} wins!"
        break
      end
    end
    board.display
    puts 'No where left to go...it\'s a tie'
  end

  def player_play(player)
    while true do
        board.display
        puts "#{player.name} choose a column:"
        col = gets.chomp.to_i
        if board.can_play?(col - 1)
          board.move(col, player)
          break
        else puts "Column full"
        end
      end
    end

    def welcome
      puts "Welcome to connect 4! What's the first player's name?"
      @player1.name = gets.chomp
      puts "Choose a single character as a piece:"
      @player1.piece = gets.chomp
      puts "What's the second player's name?"
      @player2.name = gets.chomp
      puts "Choose a single character as a piece:"
      @player2.piece = gets.chomp
    end

    def won?(in_player)
      (four_in_a_row_h?(in_player.piece) || four_in_a_row_v?(in_player.piece))
    end

    def four_in_a_row_h?(in_piece)
      r = board.last_move[0]
      c = board.last_move[1]
      (board[r][(c - 3)..c].all? {|x| x.piece == in_piece} ||
       board[r][(c - 2)..(c + 1)].all? {|x| x.piece == in_piece} ||
       board[r][(c - 1)..(c + 2)].all? {|x| x.piece == in_piece} ||
       board[r][c..(c + 3)].all? {|x| x.piece == in_piece})
    end

    def four_in_a_row_v?(in_piece)
      r = board.last_move[0]
      c = board.last_move[1]
      (board[(r - 3)..r][c].all? {|x| x.piece == in_piece} ||
       board[(r - 2)..(r + 1)][c].all? {|x| x.piece == in_piece} ||
       board[(r - 1)..(r + 2)][c].all? {|x| x.piece == in_piece} ||
       board[r..(r + 3)][c].all? {|x| x.piece == in_piece})
    end


  end

  game = Game.new
  game.play_game
