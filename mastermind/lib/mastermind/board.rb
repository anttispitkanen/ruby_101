# lib/mastermind/board.rb

module Mastermind
  class Board
    attr_reader :computers_row, :guess, :guesses_left, :computers_guesses

    def initialize
      @guesses_left = 12
      #@computers_row = Row.new.choose_numbers_randomly
      @computers_row = Row.new
      @guess = Row.new
      @computers_guesses = []
    end

    def make_a_guess
      check_row

      if victory?
        puts "Correct!"
        puts "YOU WON"
      else
        @guesses_left-=1
        if guesses_left?
          puts "#{@guesses_left} guesses left.\n\n"
        else
          puts "Still wrong!"
          puts "GAME OVER"
        end
      end
    end

    def create_manual_row
      @computers_row.clear_row
      @computers_row.choose_numbers_manually
    end

    def create_computers_row
      @computers_row.clear_row
      @computers_row.choose_numbers_randomly
      #print @computers_row.row_numbers, "\n"
    end

    def manual_guess
      @guess.clear_row
      @guess.choose_numbers_manually
    end

    def computers_guess
      @guess.clear_row
      @guess.choose_numbers_randomly
      print @guess.row_numbers, "\n"
    end

    def guesses_left?
      @guesses_left > 0 ? true : false
    end

    def victory?
      check_absolute_corrects == 4 ? true : false
    end


=begin
  Need to make it so that when computer makes a guess the result is evaluated
  and corrects+semis is returned. The sum is then used to include sum amount of
  numbers from the previous guess to the new one, and the rest randomly
  (and maybe excluding the ones from the previous guess).
=end


    private

    def check_row
      print "Corrects: ", check_absolute_corrects, ", "
      print "Semis: ", check_semi_corrects, ", "
    end

    def check_absolute_corrects
      number_of_absolute_corrects = 0
      (0...@computers_row.row_numbers.size).each do |i|
        if @computers_row.row_numbers[i] == @guess.row_numbers[i]
          number_of_absolute_corrects+=1
        end
      end
      return number_of_absolute_corrects
    end

    def check_semi_corrects
      mock_computers_row = Array.new(@computers_row.row_numbers)
      mock_guess = Array.new(@guess.row_numbers)
      number_of_semi_corrects = 0

      (0...mock_computers_row.size).each do |i|
        if mock_computers_row[i] == mock_guess[i]
          mock_computers_row[i] = nil
          mock_guess[i] = -1
        end
      end

      (0...mock_computers_row.size).each do |x|
        (0...mock_guess.size).each do |y|
          if mock_computers_row[x] == mock_guess[y]
            mock_computers_row[x] = nil
            mock_guess[y] = -1
            number_of_semi_corrects+=1
          end
        end
      end

      return number_of_semi_corrects
    end

  end
end
