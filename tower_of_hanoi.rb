# Tower Hanoi Problem
# No of moves for n is f(n) = 2^n - 1
def toh(n, source, destination, intermediate)
  if n == 1
    puts "#{source} to #{destination}"
  elsif n > 1
    toh(n-1, source, destination, intermediate)
    toh(1, source, intermediate, destination)
    toh(n-1, intermediate, destination, source)
  end
end
