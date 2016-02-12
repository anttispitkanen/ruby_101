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





  end
end
