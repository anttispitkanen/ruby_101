#recreating some enumerable methods

module Enumerable
  def my_each
    i = 0
    self if self.size == 0 || !block_given?
    while i < self.size do
      yield(self.to_a[i]) if block_given?
      i+=1
    end
  end

  def my_each_with_index
    i = 0
    self if self.size == 0 || !block_given?
    while i < self.size do
      yield(self[i], i) if block_given?
      i+=1
    end
  end




end


a = ["koira","kissa","pupu"]
b = {}
a.my_each {|i| puts i}
a.my_each_with_index { |item, index| b[item] = index }
#b.my_each {|key, value| puts key, value}
b.my_each {|key, value| puts key, value}
#a.each {|x| puts x}
