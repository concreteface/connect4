require 'spec_helper'

describe 'Grid' do
  let(:grid) {Grid.new(7,6)}
  it 'has rows' do
    grid.create_board
    expect(grid.rows).to eq(7)
  end
  it 'has columns' do
    grid.create_board
    expect(grid.columns).to eq(6)

  end

  describe '#full' do
    it 'returns full is the column is full' do
      grid.create_board
      7.times {grid.move(1)}
      expect{grid.move(1)}.to output(/Column full/).to_stdout
    end
  end

  describe "#move" do

    it 'fills the bottom open cell with the players piece' do
      grid.create_board
      grid.move(1)
      expect(grid.board[6][0]).to eq('X')
    end
    # it 'alerts if the column is full' do
    #   7.times {grid.move(1)}
    #   expect{grid.move(1)}.to output(/Column full/).to_stdout
    # end



  end

  describe "#create_board" do
    it 'makes a board using rows and columns' do
      expect(grid.create_board).to be_a(Array)
    end
  end


end
