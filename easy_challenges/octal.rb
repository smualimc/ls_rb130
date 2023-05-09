=begin
Implement octal to decimal conversion. Given an octal input string, your program should 
produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library methods that 
perform the necessary conversions for you. In this exercise, the code necessary to perform 
the conversion is what we're looking for.

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood as a 
linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.
Thus:

  233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but they use a base-8 system. A number 233 in base 8 can be 
understood as a linear combination of powers of 8:

The rightmost digit gets multiplied by 80 = 1
The next digit gets multiplied by 81 = 8
The digit after that gets multiplied by 82 = 64
The digit after that gets multiplied by 83 = 512
...
The n*th* digit gets multiplied by 8n-1.
All of these values are then summed.
Thus:

  233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

Problem:
Input: an octal (if invalid outputs 0)
Output: a decimal

Data structure: a working array (reversed) to store the octal digits

Algorithm:
return zero if the given string doesn't match digits [0-8]
convert the given string into integer then to digits (will be the octal number reversed)
map each digits array with index
  item * 8 ** index
return the sum of the resulting array
  
=end

class Octal
  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 unless @string.match?(/^[0-7]+$/)
    @string.to_i.digits.map.with_index {|octal, index| octal * (8 ** index)}.sum
  end
end

require 'minitest/autorun'
require_relative 'octal'

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    # skip
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    # skip
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    # skip
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
    # skip
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
    # skip
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
    # skip
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
    # skip
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    # skip
    assert_equal 0, Octal.new('carrot').to_decimal
  end

  def test_8_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('8').to_decimal
  end

  def test_9_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('9').to_decimal
  end

  def test_6789_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('abc1z').to_decimal
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
    # skip
    assert_equal 9, Octal.new('011').to_decimal
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('234abc').to_decimal
  end
end