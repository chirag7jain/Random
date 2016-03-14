# Recently you invented a brand-new definition of prime numbers. For a given set of positive integers
# let's call X a prime if there are no elements in S which are divisors of X (except X itself).

# You are given a set S. Find elements in it which are prime numbers for this set.

def find_primes(numbers)
  numbers = numbers.sort_by{|number| -number}
  primes = []
  numbers.each_with_index do |number1, index|
    count = 0
    numbers.drop(index+1).each do |number2|
      if number1 % number2 == 0.0
        count += 1
        break
      end
    end
    primes << number1 if count == 0
  end
  primes
end

$stdin.readline()
numbers = $stdin.readline().split(' ').map(&:to_i)
$stdout.puts (numbers & find_primes(numbers)).join(' ')
