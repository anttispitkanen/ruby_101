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
    i=0
    not_true_count=0
    if !block_given?
      while i < self.size do
        not_true_count+=1 if self.to_a[i]==nil || self.to_a[i]==false
        i+=1
      end
    else
      while i < self.length do
        not_true_count+=1 if yield(self.to_a[i]) == false
        i+=1
      end
    end
    not_true_count==0 ? true : false
  end


  def my_any?
    i=0
    true_count=0
    if !block_given?
      while i < self.size do
        true_count+=1 if self.to_a[i]!=nil && self.to_a[i]!=false
        i+=1
      end
    else
      while i < self.size do
        true_count+=1 if yield(self.to_a[i])==true
        i+=1
      end
    end
    true_count==0 ? false : true
  end


  def my_none?
    i=0
    true_count=0
    if !block_given?
      while i < self.size do
        true_count+=1 if self.to_a[i]!=nil && self.to_a[i]!=false
        i+=1
      end
    else
      while i < self.size do
        true_count+=1 if yield(self.to_a[i])==true
        i+=1
      end
    end
    true_count==0 ? true : false
  end


  def my_count(item=nil)
    i=0
    count=0
    my_each {|x| count+=1} if item==nil && !block_given?
    if item!=nil
      $stderr.puts "warning: given block was not used" if block_given?
      my_each {|x| count+=1 if x==item}
    end
    if block_given? && item==nil
      while i < self.size do
        count +=1 if yield(self.to_a[i])==true
        i+=1
      end
    end
    count
  end


  def my_map
    i=0
    arr=[]
    self if !block_given?
    while i < self.size
      arr << yield(self.to_a[i])# if yield(self.to_a[i])!=false
      i+=1
    end
    arr
  end


  def my_inject

  end


end


#some testing

a = ["koira","kissa","pupu",1,2,3,4,5]
#a = [false, nil]
b = {}
#a.my_each {|i| puts i}
#a.my_each_with_index { |item, index| b[item] = index }
#b.my_each {|key, value| puts key, value}
#b.my_each {|key, value| puts key, value}
#a.each {|x| puts x}
puts a.my_map {|i| i.is_a?(Integer) }

#c = (1..4).my_map {|i| i+i}
#puts c
