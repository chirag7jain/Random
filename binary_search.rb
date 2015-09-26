# Binary Search - Divide & Conquer
# Get the highest no from array - log(n) complexity
def highest(a)
  length = a.length
  sub1, sub2 = [],[]
  if length == 1
    return a[0]
  elsif length == 2
    if a[0] > a[1]
      return a[0]
    else
      return a[1]
    end
  elsif length % 2 == 0
    slice = length/2 - 1
  else
    slice = (length-1)/2
  end
  sub1 = a.take(slice)
  sub2 = a - sub1

  if sub1.last > sub2.first
    highest(sub1)
  else
    highest(sub2)
  end
end
