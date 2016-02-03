#recreating some enumerable methods
#using while-looping here instead of eg #upto to be a little more manual

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
      arr << yield(self.to_a[i])
      i+=1
    end
    arr
  end

# "modify my_map to take a proc instead"
# takes a proc and a block
# if a block is given and no proc is given raises error (#call undefined)
  def my_map_modified(a_proc=nil)
    i=0
    arr=[]
    self if a_proc==nil
    my_each {|x| arr << a_proc.call(x)} if !block_given?
    my_each {|x| arr << a_proc.call(yield x)} if block_given?
    arr
  end


#can't figure out how to my_inject make it work taking a symbol
#so I cheated and took a look at Mauricio Linhares' ramblings:
#http://mauricio.github.io/2015/01/12/implementing-enumerable-in-ruby.html

#trying to make it look my own tho

  def my_inject(initial=nil, sym=nil, &block)
    if initial==nil && sym==nil && block==nil?
      raise ArgumentError, "you must provide an argument or a block"
    end

    if sym && block
      raise ArgumentError, "you must provide an operation symbol or a bloc, not both"
    end

    if sym==nil && block==nil
      sym = initial
      initial = nil
    end

    block = case sym
    when Symbol
      lambda {|x, y| x.send(sym, y)}
    when nil
      block
    else
      raise ArgumentError, "the operation provided must be a symbol"
    end

    if initial==nil
      ignore_first = true
      initial = self.first
    end

    i=0

    my_each do |element|
      unless ignore_first && i==0
        initial = block.call(initial, element)
      end
      i+=1
    end
    initial
  end



end


#some testing

a = ["koira","kissa","pupu",1,2,3,4,5]
b = {}
c = ["koira","kissa","pupu"]
d = [2,3,4,5]
#a = [false, nil]

ex_proc = Proc.new {|i| puts i if i > 2}
d.my_map_modified(ex_proc) {|i| i*2}
#puts "jep" if "koira".is_a?(String)
#a.my_each {|i| puts i}
#a.my_each_with_index { |item, index| b[item] = index }
#b.my_each {|key, value| puts key, value}
#b.my_each {|key, value| puts key, value}
#a.each {|x| puts x}
#puts a.my_map {|i| i.is_a?(Integer) }
#product = d.my_inject(2) {|product, i| product * i}
#product = d.my_inject {|sum,i| sum+i}
#def multiply_els(arr)
#  arr.my_inject {|product, x| product *= x}
#end
#puts multiply_els([2,4,5])

#product = d.my_inject(3,:+)
#product = c.my_inject {|memo, word| memo.length < word.length ? word : memo}
#puts product
#c = (1..4).my_map {|i| i+i}
#puts c
