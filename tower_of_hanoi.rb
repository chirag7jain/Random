# Tower Hanoi Problem
# No of moves for n is f(n) = 2^n - 1
def toh(n, source, destination, intermediate, count = 1)
  if n == 1
    puts "(#{count} move) #{source} to #{destination}"
    count = count + 1
  elsif n > 1
    count = toh(n-1, source, destination, intermediate, count)
    count = toh(1, source, intermediate, destination, count)
    count = toh(n-1, intermediate, destination, source, count)
  end
end
