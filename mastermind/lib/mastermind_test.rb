# lib/mastermind_test.rb

root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/mastermind.rb"

puts "Welcome to Mastermind! Try to guess the code in 12 turns. \n\n"

game = Mastermind::Game.new

game.play
