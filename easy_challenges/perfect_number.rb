=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers 
(1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, 
perfect, or deficient based on a comparison between the number and the sum of its positive 
divisors (the numbers that can be evenly divided into the target number with no remainder, 
  excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. 
  This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.
Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is 
less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 
1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
Write a program that can tell whether a number is perfect, abundant, or deficient.

Input: a positive integer
Output: a string deficient, perfect or abundant depending of the sum of the divisors 
from the given number.
If the Aliquout sum (sum of the divisors excluding the number itself) == given Integer => perfect
If the Aliquout sum (sum of the divisors excluding the number itself) > given Integer => abundant
If the Aliquout sum (sum of the divisors excluding the number itself) < given Integer => deficient


Algorithm:
if the given number is < 1 raise a StandardError
compute the given number Integer::sqrt
iterate from (2..square_root)
  get the divisors array
compare the Aliquot sum against the given number and return the corresponding string

=end

class PerfectNumber
  def self.classify(int)
    if int < 1
      raise(StandardError)
      return
    else
      aliquot = (divisors(int)).sum + 1 # to include 1 as divisor
      case 
      when aliquot == int then str ='perfect'
      when aliquot > int then str ='abundant'
      when aliquot < int then  str = 'deficient'
      end
    end
    str
  end

  private 

  def self.divisors(int)
    limit = Integer.sqrt(int)
    result = []
    2.upto(limit) do |number| # to exclude int as divisor
      if int % number == 0
        result << number
        result << int / number
      end
    end
    result.uniq
  end 
end

require 'minitest/autorun'
# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    # skip
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    # skip
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    # skip
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end