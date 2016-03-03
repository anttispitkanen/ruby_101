# lib/mastermind/board.rb

module Mastermind
  class Board
    attr_reader :computers_row, :guess, :guesses_left, :previous_hits,
                :previous_guess

    def initialize
      @guesses_left = 12
      @computers_row = Row.new
      @guess = Row.new
      @previous_hits = 0
      @previous_guess = []
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
          print "\ncorrect answer was ", @computers_row.row_numbers, "\n\n"
          puts "GAME OVER"
          print "\n\n\n\n\n"
        end
      end
      @previous_guess = Array.new(@guess.row_numbers)
      number_of_total_hits
    end

    def create_manual_row
      @computers_row.clear_row
      @computers_row.choose_numbers_manually
    end

    def create_computers_row
      @computers_row.clear_row
      @computers_row.choose_numbers_randomly
    end

    def manual_guess
      @guess.clear_row
      @guess.choose_numbers_manually
    end

    def computers_first_guess
      @guess.choose_numbers_randomly
      print @guess.row_numbers, "\n"
      @previous_guess = Array.new(@guess.row_numbers)
      number_of_total_hits
    end

    def computers_other_guess
      @guess.clear_row
      heads_or_tails = Random.rand(2)

      if heads_or_tails == 0
        while @guess.row_numbers.size < @previous_hits do
          while true
            i = Random.rand(4)
            if @previous_guess[i] != nil
              @guess.add_number(@previous_guess[i])
              @previous_guess[i] = nil
              break
            end
          end
        end
        add_amount_of_randoms(4-@previous_hits, @previous_guess)

      else
      while @guess.row_numbers.size < @previous_hits do
        while true
          i = Random.rand(4)
          if @previous_guess[i] != nil
            @guess.add_number(@previous_guess[i])
            @previous_guess[i] = nil
            break
          end
        end
      end
      add_amount_of_randoms(4-@previous_hits, @previous_guess)

      end

      print @guess.row_numbers, "\n"
    end

    def guesses_left?
      @guesses_left > 0 ? true : false
    end

    def victory?
      check_absolute_corrects == 4 ? true : false
    end



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

    def number_of_total_hits
      @previous_hits = check_absolute_corrects + check_semi_corrects
    end

    def add_amount_of_randoms(amount, what_to_avoid)
      amount.times do
        while true
          random_number = Random.rand(6)+1
          if !what_to_avoid.include?(random_number)
            @guess.add_number(random_number)
            break
          end
        end
      end
    end

  end
end
