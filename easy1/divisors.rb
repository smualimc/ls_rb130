=begin
Write a method that returns a list of all of the divisors of the positive integer passed in 
as an argument. The return value can be in any sequence you wish.

Pedac
Input: a given integer
Output: an array that includes all the divisors of the given number in any sequence

Data structure: an output array
Algorithm:
initialize an empty output array
compute the Integer square root of the given number
iterate from 1 to the square root
  if the given integer modulo of the current value of the iteration variable is == 0
    push the current value of the iteration variable
    push given integer / the current value of the iteration variable
  return just unique values from the output (sorted)
=end

def divisors(int)
  limit = Integer.sqrt(int)
  result = []
  1.upto(limit) do |number|
    if int % number == 0
      result << number
      result << int / number
    end
  end
  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute