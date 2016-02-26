# lib/mastermind.rb

require_relative "mastermind/version"

module Mastermind
  # Your code goes here...
end

#require_relative "./mastermind/row.rb"

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/mastermind/**/*.rb"].each { |file| require file }
