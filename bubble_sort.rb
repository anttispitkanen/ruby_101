#basic bubble sorting

def bubble_sort(arr)
  #new_arr = []
  temp = 0
  i = 0

  in_progress = true
  num_corrections = 0

  while in_progress do
    while i < arr.length-1 do
      #num_corrections = 0
      if arr[i] > arr[i+1]
        temp = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = temp
        num_corrections+=1

      end
      i+=1
    end

    if num_corrections == 0
      in_progress = false
    else
      num_corrections = 0
      i=0
    end
  end
  arr
end

puts bubble_sort([4,3,78,2,0,2])
