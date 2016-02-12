# spec/player_spec.rb

require "spec_helper"

module TicTacToe
  describe Player do
    context "#initialize" do

      it "raises an exception when initialized with {}" do
        expect {Player.new({}) }.to raise_error
      end

      it "does not raise error when initialized with a valid input hash" do
        input = {symbol: "X", name: "Someone"}
        expect { Player.new(input) }.to_not raise_error
      end

    end

    context "#symbol" do
      it "returns the symbol" do
        input = {symbol: "X", name: "Someone"}
        player = Player.new(input)
        expect(player.symbol).to eq "X"
      end
    end

    context "#name" do
      it "returns the player's name" do
        input = {symbol: "X", name: "Someone"}
        player = Player.new(input)
        expect(player.name).to eq "Someone"
      end
    end


  end
end
