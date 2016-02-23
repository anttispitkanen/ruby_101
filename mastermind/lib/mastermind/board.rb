# lib/mastermind/board.rb

module Mastermind
  class Board
    attr_reader :computers_row, :guess, :guesses_left

    def initialize
      @guesses_left = 12
      @computers_row = Row.new.choose_numbers_randomly
      @guess = Row.new
    end

    def make_a_guess
      #@guess = Row.new.choose_numbers_manually
      @guess.clear_row
      @guess.choose_numbers_manually
      check_row
      #victory here
      @guesses_left-=1
      puts "\nYou have #{@guesses_left} guesses left.\n\n" if guesses_left?
    end

    def guesses_left?
      @guesses_left > 0 ? true : false
    end

    def check_row
      print "Corrects: ", check_absolute_corrects, "\n"
      #victory if four of these
      print "Semis: ", check_semi_corrects, "\n"
      print "computer: ", @computers_row, "\n"
      print "guess: ", @guess.row_numbers, "\n"
      #return number_of_absolute_corrects
      #print "corrects: ", number_of_absolute_corrects, "\n"
    end

    def check_absolute_corrects
      number_of_absolute_corrects = 0
      #print "\n\nGreetings from check_absolute_corrects, computers_row here is: "
      (0...@computers_row.size).each do |i|
        #print @computers_row[i]
        if @computers_row[i] == @guess.row_numbers[i]
          number_of_absolute_corrects+=1
        end
      end
      #print "\n\n"
      return number_of_absolute_corrects
    end

    def check_semi_corrects
      mock_computers_row = Array.new(@computers_row)
      mock_guess = Array.new(@guess.row_numbers)
      number_of_semi_corrects = 0

      (0...mock_computers_row.size).each do |i|
        if mock_computers_row[i] == mock_guess[i]
          mock_computers_row[i] = nil
          mock_guess[i] = -1
        end
      end

      mock_computers_row.each do |num|
        if mock_guess.any? {|x| x == num}
          number_of_semi_corrects+=1
        end
      end
      return number_of_semi_corrects
    end


  end
end
