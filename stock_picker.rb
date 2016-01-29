

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
      end
    end

  end

puts "Best deal: [#{biggest_difference[0]},#{biggest_difference[1]}]"

end

stock_picker [17,3,6,9,15,8,6,1,10] # => [1,4]
