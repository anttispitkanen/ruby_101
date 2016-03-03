# lib/mastermind/game.rb

module Mastermind
  class Game
    attr_reader :game_board

    def initialize
      @game_board = Board.new
    end

    def play_manually
      @game_board.create_computers_row
      while true
        @game_board.manual_guess
        @game_board.make_a_guess
        break if @game_board.victory?
        break if !@game_board.guesses_left?
      end
    end

    def play_automatically
      @game_board.create_manual_row
      while true
        if @game_board.guesses_left == 12
          @game_board.computers_first_guess
        else
          @game_board.computers_other_guess
          puts "hello from else!"
        end
        @game_board.make_a_guess
        break if @game_board.victory?
        break if !@game_board.guesses_left?
      end
    end

  end
end
