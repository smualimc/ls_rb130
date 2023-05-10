=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.
Examples

Diamond for letter 'A':

A # "A" have to be treated as an exception 
  # for "A" frame_size = 1 = letters.index("A") * 2 + 1

Diamond for letter 'C':

  A
 B B    # for "C" frame_size = 5 = letters.index(current_letter) * 2 + 1
C   C   # spaces_between_letters = letters.index(current_letter) * 2 - 1
 B B
  A

Diamond for letter 'E':

    A
   B B    # for "E" frame_size = 9 = letters.index(letter) * 2 + 1
  C   C
 D     D
E       E # letters = ["A", "B", "C", "D", "E", "D", "C", "B", "A"]
 D     D              ("A"..letter).to_a + ("A"...letter).to_a.reverse
  C   C   # 
   B B
    A
=end

class Diamond
  def self.make_diamond(letter)
    letters = ("A"..letter).to_a + ("A"...letter).to_a.reverse
    frame_size = (letters.index(letter) * 2) + 1
    letters.map do |current_letter|
      if current_letter == "A"
         "A".center(frame_size)
      else
        index = letters.index(current_letter)
        spaces_between_letters = (index * 2) - 1
        (current_letter + " " * spaces_between_letters + current_letter).center(frame_size)
      end
    end.join("\n") + "\n"
  end
end

require 'minitest/autorun'
# require_relative '10_diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    # skip
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    # skip
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    # skip
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    # skip
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end