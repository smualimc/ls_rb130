=begin
Write a program that will take a decimal number, and convert it to the appropriate sequence 
of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those who 
don't. You and your fellow cohort of those in the "know" when it comes to binary decide 
to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump
10000 = Reverse the order of the operations in the secret handshake.

handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]
The program should consider strings specifying an invalid binary as the value 0.

Pedac
Input: an Integer, or a non-integer value
Output: An array with the corresponding handshakes or 
        an empty array if the input is not Integer or
        an empty array if the input is = 0

Rules: 
the returning handshakes ara appended to the result array from right to left
if 10000 is present reverse the order of the result array

Data structure:
A working array to store the binary number from the given Integer
A result array

Algorithm:
Create a HANDSHAKES array ['wink', 'double blink', 'close your eyes', 'jump']
initialize result to an empty array
convert the given obj to integer
return result if the integer is < 1
in the #commands convert the integer into a binary number and to a reversed array
iterate each binary from 0..3 
  if the iterated binary is equal to one append to result the corresponding element from HANDSHAKES
if binarys array size == 5 reverse result
return result

=end

class SecretHandshake
  HANDSHAKES = ['wink', 'double blink', 'close your eyes', 'jump']
  def initialize(obj)
    @obj = obj
  end

  def commands
    result = []
    @integer = @obj.to_i
    return result if @integer < 1
    digits = @integer.to_s(2).to_i.digits
    digits.each_with_index do |digit, index| 
      result << HANDSHAKES[index] if digit == 1 && index < 4
    end
    digits.size > 3 ? result.reverse : result
  end
end

require 'minitest/autorun'
# require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_handshake_1_to_wink
    handshake = SecretHandshake.new(1)
    assert_equal ['wink'], handshake.commands
  end

  def test_handshake_10_to_double_blink
    # skip
    handshake = SecretHandshake.new(2)
    assert_equal ['double blink'], handshake.commands
  end

  def test_handshake_100_to_close_your_eyes
    # skip
    handshake = SecretHandshake.new(4)
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    # skip
    handshake = SecretHandshake.new(8)
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    # skip
    handshake = SecretHandshake.new(3)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    # skip
    handshake = SecretHandshake.new(19)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    # skip
    handshake = SecretHandshake.new(31)
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_valid_string_input
    # skip
    handshake = SecretHandshake.new('1')
    assert_equal ['wink'], handshake.commands
  end

  def test_invalid_handshake
    # skip
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end