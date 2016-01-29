

def stock_picker(arr)

  pairs = []
#  i = 1
  biggest_difference = []
  difference = 0

  arr.each do |f|

    i = arr.index(f)+1
    arr[i..-1].each do |g|
      if g - f > difference
        difference = g-f
        biggest_difference = [arr.index(f),arr.index(g)]
        #puts "#{g}-#{f}=#{g-f}"
      end
    end
    #pairs << biggest_difference
    #i += 1
  end

biggest_difference

end

stock_picker [17,3,6,9,15,8,6,1,10] # => [1,4]
