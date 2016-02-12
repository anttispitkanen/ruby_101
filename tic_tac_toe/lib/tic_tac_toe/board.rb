# lib/tic_tac_toe/board.rb

#Differing from the tutorial in making a traditional battleship-style coordinate
#system where the origin is in the upper left corner and the vertical coordinate
#is given first (think "A1" or "C2").

module TicTacToe
  class Board
    attr_reader :grid
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(y,x)
      grid[y][x]      #going against the instructions and making a A-1/B-2-style coordinate system
    end

    def set_cell(y,x,value)
      get_cell(y,x).value = value
    end

    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw?
      grid.flatten.map { |cell| cell.value }.none_empty?
      #none_empty? defined in core_extensions.rb as an extension to class Array
    end

    def winning_positions
      grid + # rows
      grid.transpose + #columns
      diagonals #two diagonals
    end

    def diagonals
      [
        [get_cell(0,0), get_cell(1,1), get_cell(2,2)],
        [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
      ]
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        #all_empty? defined in core_extensions.rb
        return true if winning_position_values(winning_position).all_same?
        #all_same? defined in core_extensions.rb
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map { |cell| cell.value }
    end

  end
end
