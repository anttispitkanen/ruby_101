# lib/mastermind_test.rb

#require_relative "mastermind.rb"

root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/mastermind.rb"

puts "Testing"
#test_row = Mastermind::Row.new
#test_row.choose_numbers_manually
#test_row.choose_numbers_randomly
#puts test_row.get_row_numbers

test_board = Mastermind::Board.new
#puts test_board.computers_row

while true
  test_board.make_a_guess
  break if !test_board.guesses_left?
end
