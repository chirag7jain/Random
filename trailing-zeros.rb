# Given a number find the number of trailing zeroes in its factorial.

def find_trailing_zeros_factorial(number)
	zeros = factor = number / 5
	while zeros > 1
		zeros = zeros / 5
		factor = factor + zeros
	end
	factor
end

def get_trailing_zeros_factorial(number)
	return 0 if number < 5
	return 1 if number >= 5 and number < 10
	return find_trailing_zeros_factorial(number)
end

def get_number(input)
	return 0 if input == '0'
	number = input.to_i
	return number if number > 0
	false
end

input = $stdin.readline()
number = get_number(input)
$stdout.puts get_trailing_zeros_factorial(number) if number
