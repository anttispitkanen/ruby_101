# lib/mastermind/game.rb

module Mastermind
  class Game
    attr_reader :game_board

    def initialize
      @game_board = Board.new
    end

    def play
      while true
        @game_board.make_a_guess
        break if @game_board.victory?
        break if !@game_board.guesses_left?
      end
    end
    
  end
end
