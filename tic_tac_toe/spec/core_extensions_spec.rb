# spec/core_extensions_spec.rb

require "spec_helper"

describe Array do

  context "#all_empty?" do
    it "returns true if all elements of the array are empty" do
      expect(["","",""].all_empty?).to eq true
    end

    it "returns false if some or all elements are not empty" do
      expect(["","2",""].all_empty?).to eq false
    end

    it "returns true for an empty array" do
      expect([].all_empty?).to eq true
    end
  end

  context "#all_same?" do
      it "returns true if all elements of array are equal" do
        expect(["A","A","A"].all_same?).to eq true
      end

      it "returns false if not all elements are the same" do
        expect(["","A","A"].all_same?).to eq false
      end

      it "returns true for empty array" do
        expect([].all_same?).to eq true
      end
  end

  context "#any_empty?" do
    it "returns true if any element is empty" do
      expect(["","A","A"].any_empty?).to eq true
    end

    it "returns false if no element is empty" do
      expect(["A","A","A"].any_empty?).to eq false
    end

    it "returns false for empty array" do
      expect([].any_empty?).to eq false
    end
  end

  context "#none_empty?" do
    it "returns false if any element is empty" do
      expect(["","A","A"].none_empty?).to eq false
    end

    it "returns true if no element is empty" do
      expect(["A","A","A"].none_empty?).to eq true
    end

    it "returns true for empty array" do
      expect([].none_empty?).to eq true
    end
  end


end
