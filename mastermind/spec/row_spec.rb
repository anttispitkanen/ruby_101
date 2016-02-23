# spec/row_spec.rb

require "spec_helper"

module Mastermind
  describe Row do
    context "#initialize" do
      it "initializes an empty array with 4 empty items" do
        row = Row.new
        expect(row.row_numbers.size).to eq 4
      end
    end

    


  end
end
