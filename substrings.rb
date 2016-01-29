#substrings takes a string and an array
#returns a hash with found sunbstrings as keys and quantities as values

def substrings (string, source)
  results = {}

  source.each do |f|
    if string.include?(f)
      results[f]||= 0   #create key-value-pair if there is no such
      results[f] += 1   #increment it by one (if it was just created above or if there already was one)
    end
  end

results

end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "lelow", "low", "elow", "below"]

puts substrings("below", dictionary)
