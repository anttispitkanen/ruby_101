# lib/mastermind/board.rb

module Mastermind
  class Board
    attr_reader :computers_row, :guess, :guesses_left

    def initialize
      @guesses_left = 12
      @computers_row = Row.new.choose_numbers_randomly
      @guess = Row.new
    end

#    def get_computers_row
#      return @computers_row
#    end

    def make_a_guess
      #@guess = Row.new.choose_numbers_manually
      @guess.clear_row
      @guess.choose_numbers_manually
      #puts @guess.row_numbers
      check_row
      #victory here
      @guesses_left-=1
      puts "You have #{@guesses_left} guesses left." if guesses_left?
    end

    def guesses_left?
      @guesses_left > 0 ? true : false
    end


    def check_row
      number_of_absolute_corrects = 0
      number_of_not_absolute_corrects = 0
      i=0
      while i < @computers_row.size do
        if @computers_row[i] == @guess.row_numbers[i]
          number_of_absolute_corrects+=1
        end
        #puts "testing #{i}"
        i+=1
      end
      print "computer: ", @computers_row, "\n"
      print "guess: ", @guess.row_numbers, "\n"
      #return number_of_absolute_corrects
      print "corrects: ", number_of_absolute_corrects, "\n"
    end

  end
end
