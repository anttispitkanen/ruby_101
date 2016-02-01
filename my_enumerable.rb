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

  def my_select
    i=0
    arr = []
    self if self.size == 0 || !block_given?
    while i < self.size do
      if block_given?
        if yield(self.to_a[i]) == true
          arr << self.to_a[i]
        end
      end
      i+=1
    end
    arr
  end


  def my_all?

  end


  def my_any?

  end


  def my_none?

  end


  def my_count

  end


  def my_map

  end


  def my_inject

  end


end


a = ["koira","kissa","pupu", 1, 2,3,4,5]
b = {}
#a.my_each {|i| puts i}
#a.my_each_with_index { |item, index| b[item] = index }
#b.my_each {|key, value| puts key, value}
#b.my_each {|key, value| puts key, value}
#a.each {|x| puts x}
puts a.my_select {|i| i.to_i > 3 }
