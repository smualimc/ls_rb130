=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of 
the lengths of any two sides must be greater than the length of the third side.
=end

class Triangle
  attr_reader :sides
  def initialize(s1,s2,s3)
    @sides = [s1, s2, s3]
    raise(ArgumentError) unless valid_triangle?
  end

  def kind
    return "equilateral" if equilateral?
    return "isosceles" if isosceles?
    return "scalene" 
  end

  def equilateral?
    sides[0] == sides[1] && sides[1] == sides[2]
  end

  def isosceles?
    sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2]
  end

  def valid_triangle?
    return false unless sides.all?{|ele| ele > 0}
    return false unless valid_side_sums?
    true
  end

  def valid_side_sums?
    (sides[0] + sides[1]) > sides[2] && (sides[0] + sides[2]) > sides[1] && (sides[1] + sides[2]) > sides[0]
  end

end

require 'minitest/autorun'
# require_relative 'triangles'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    # skip
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    # skip
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    # skip
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    # skip
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    # skip
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    # skip
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    # skip
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    # skip
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    # skip
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    # skip
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_4
    # skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 2)
    end
  end
end