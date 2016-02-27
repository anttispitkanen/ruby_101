# lib/mastermind_test.rb

root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/mastermind.rb"

puts "Welcome to Mastermind!" #{}" Try to guess the code in 12 turns. \n\n"
puts "Do you want to guess the code yourself? (y/n)"
ans = gets.chomp.upcase

game = Mastermind::Game.new

if ans == "Y"
  game.play_manually
elsif ans == "N"
  game.play_automatically
else
  puts "Try again! y/n"
end
