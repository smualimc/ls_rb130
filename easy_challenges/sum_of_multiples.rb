=begin
Write a program that, given a natural number and a set of 
one or more other numbers, can find the sum of all the 
multiples of the numbers in the set that are less than the 
first number. If the set of numbers is not given, use a 
default set of 3 and 5.

For instance, if we list all the natural numbers up to, 
but not including, 20 that are multiples of either 3 or 5, 
we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these 
multiples is 78.

Problem:
given an Integer number, and optionally a list of other 
integers, return the sum of the multiples of the other 
integers. If the other integers are not provided, use 3 
and 5.
The multiples can't include the Integer number.

Algorithm:
#initialize(*args)
assign *args to an array @args

#to(number)
select those num in the range 1...number that are  
multiples of one of the @args
return the sum of the new array

#is_multiple?(num)
it's true if num % any item from args == 0

::to(number)
Instantiate a new SumOfMultiples passing 3, 5 as arguments 
and chain it with #to(number)
=end



require 'minitest/autorun'
# require_relative 'sum_of_multiples'

class SumOfMultiples
  def initialize(*args)
    @args = args
  end

  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end

  def to(number)
    result = []
    (1...number).select {|num| is_multiple?(num)}.sum
  end

  def is_multiple?(num)
    @args.any? {|arg| num % arg == 0}
  end
end

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    # skip
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    # skip
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    # skip
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    # skip
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    # skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    # skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    # skip
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    # skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end