# lib/tic_tac_toe/player.rb

module TicTacToe
  class Player
    attr_reader :symbol, :name
    def initialize(input)
      @symbol = input.fetch(:symbol)
      @name = input.fetch(:name)
    end

  end
end
