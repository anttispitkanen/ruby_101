# lib/mastermind/row.rb

module Mastermind
  class Row
    attr_reader :row_numbers

    def initialize
      @row_numbers = Array.new
    end

    def choose_numbers_manually
      puts "Give 4 numbers range [1..6]:"

      while true
        numbers_to_add = gets.chomp
        nums_as_array = numbers_to_add.split("")

        if nums_as_array.size != 4
          puts "There must be 4 numbers!"
        elsif
          nums_as_array.all? {|i| i.to_i > 0 && i.to_i < 7 }
            nums_as_array.each do |num|
              @row_numbers << num.to_i
            end
          break
        else
          puts "Numbers must be between 1 and 6!"
        end
        return @row_numbers
      end


#      4.times do |i|
#        while true
#          puts "Give a number between 1 and 6: "
#          number_to_add = gets.chomp.to_i
#          if number_to_add > 0 && number_to_add < 7
#            @row_numbers << number_to_add
#            puts "#{i+1} given, #{3-i} to go!"
#            break
#          else
#            puts "That won't do!"
#          end
#        end
#      end
    end

    def choose_numbers_randomly
      #@row_numbers.clear
      4.times do
        random_number = Random.rand(6)+1
        @row_numbers << random_number
      end
      print "Computers numbers: "
      print @row_numbers, "\n"#for testing
      return @row_numbers
    end

    def get_row_numbers
      return @row_numbers
    end

    def clear_row
      @row_numbers.clear
    end
    
  end
end
