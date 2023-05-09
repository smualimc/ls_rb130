=begin
Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds 
of years. They invented concrete and straight roads and even bikinis. One thing they never 
discovered though was the number zero. This made writing and dating extensive histories of 
their exploits slightly more challenging, but the system of numbers they came up with is 
still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters 
have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII
 
There is no need to be able to convert numbers larger than about 3000. (The Romans 
  themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately 
starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC
2008 is written as MMVIII:

2000=MM
8=VIII
=end

class RomanNumeral
  UNITS = %w(I II III IV V VI VII VIII IX)
  TENS = %w(X XX XXX XL L LX LXX LXXX XC)
  HUNDREDS = %w(C CC CCC CD D DC DCC DCCC CM)
  THOUSANDS = %w(M MM MMM)
  
  def initialize(int)
    @int = int
    @ary = @int.digits.reverse
  end
  
  def to_roman
    roman = ''
    len = @ary.size
    @ary.each_with_index do |digit, index|
      next if digit == 0
      order = (len - index) 
      case order
      when 4 then roman += THOUSANDS[digit - 1]
      when 3 then roman += HUNDREDS[digit-1]
      when 2 then roman += TENS[digit-1]
      else   roman += UNITS[digit-1]
      end 
    end
    roman
  end
end

require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    number = RomanNumeral.new(1)
    assert_equal 'I', number.to_roman
  end

  def test_2
    # skip
    number = RomanNumeral.new(2)
    assert_equal 'II', number.to_roman
  end

  def test_3
    # skip
    number = RomanNumeral.new(3)
    assert_equal 'III', number.to_roman
  end

  def test_4
    # skip
    number = RomanNumeral.new(4)
    assert_equal 'IV', number.to_roman
  end

  def test_5
    # skip
    number = RomanNumeral.new(5)
    assert_equal 'V', number.to_roman
  end

  def test_6
    # skip
    number = RomanNumeral.new(6)
    assert_equal 'VI', number.to_roman
  end

  def test_9
    # skip
    number = RomanNumeral.new(9)
    assert_equal 'IX', number.to_roman
  end

  def test_27
    # skip
    number = RomanNumeral.new(27)
    assert_equal 'XXVII', number.to_roman
  end

  def test_48
    # skip
    number = RomanNumeral.new(48)
    assert_equal 'XLVIII', number.to_roman
  end

  def test_59
    # skip
    number = RomanNumeral.new(59)
    assert_equal 'LIX', number.to_roman
  end

  def test_93
    # skip
    number = RomanNumeral.new(93)
    assert_equal 'XCIII', number.to_roman
  end

  def test_141
    # skip
    number = RomanNumeral.new(141)
    assert_equal 'CXLI', number.to_roman
  end

  def test_163
    # skip
    number = RomanNumeral.new(163)
    assert_equal 'CLXIII', number.to_roman
  end

  def test_402
    # skip
    number = RomanNumeral.new(402)
    assert_equal 'CDII', number.to_roman
  end

  def test_575
    # skip
    number = RomanNumeral.new(575)
    assert_equal 'DLXXV', number.to_roman
  end

  def test_911
    # skip
    number = RomanNumeral.new(911)
    assert_equal 'CMXI', number.to_roman
  end

  def test_1024
    # skip
    number = RomanNumeral.new(1024)
    assert_equal 'MXXIV', number.to_roman
  end

  def test_3000
    # skip
    number = RomanNumeral.new(3000)
    assert_equal 'MMM', number.to_roman
  end
end