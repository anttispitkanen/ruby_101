#basic bubble sorting

def bubble_sort(arr)

  i = 0
  in_progress = true
  num_corrections = 0

  while in_progress do
    for i in 0...arr.length-1
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        num_corrections+=1
      end
    end

    if num_corrections == 0
      in_progress = false
    else
      num_corrections = 0
    end
  end
  arr
end

#puts bubble_sort([4,3,78,2,0,2])


def bubble_sort_by(arr)
  i = 0
  in_progress = true
  num_corrections = 0
  while in_progress do
    for i in 0...arr.length-1
      if yield(arr[i], arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        num_corrections+=1
      end
    end
    if num_corrections == 0
      in_progress = false
    else
      num_corrections = 0
    end
  end
  puts arr
end


#bubble_sort_by(["loooooong", "s", "sh", "shh", "shortish"]) { |left,right| left.length - right.length }
