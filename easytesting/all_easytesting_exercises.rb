require 'minitest/autorun'

class MyClassTest < Minitest::Test
  # Write a minitest assertion that will fail if the value.odd? is not true.
    def test_boolean_assertions
      value = true
      assert(value) # for truthy values
      assert_equal(true, value) # for true values
    end

  # Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
  def test_equality_assertions
    value = "XYZ"
    assert_equal("xyz", value.downcase)
  end

  # Write a minitest assertion that will fail if value is not nil.
  def test_nil
    value = nil
    assert_nil(value)
  end

  # Write a minitest assertion that will fail if the Array list is not empty.
  def test_empty_object
    list = []
    assert_empty(list) # it gives a better failure message
    assert_equal(true, list.empty?)
  end

  # Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
  def test_included_objects
    list = ["abc", "xyz"]
    assert_includes(list, "xyz") # it gives a better failure message
    assert_equal(true, list.include?("xyz"))
  end

  # Write a minitest assertion that will fail unless employee.hire raises a 
  # NoExperienceError exception.
  class NoExperienceError < StandardError; end

  class Employee
    def hire
      raise NoExperienceError
    end
  end

  def test_exception_assertions
    employee = Employee.new
    assert_raises(NoExperienceError) {employee.hire}
  end

  # Write a minitest assertion that will fail if value is not an instance of the Numeric class 
  # exactly. value may not be an instance of one of Numeric's superclasses.
  def test_type_assertions
    obj = Numeric.new
    assert_instance_of(Numeric, obj)
  end

  # Write a minitest assertion that will fail if the class of value is not Numeric or one of 
  # Numeric's subclasses (e.g., Integer, Float, etc).
  def test_kind_assertions
    f = 1.2
    assert_kind_of(Numeric, f)
  end

  # Write a test that will fail if list and the return value of list.process are 
  # different objects.
  class List
    attr_accessor :process
  end

  def test_same_object_assertions
    list = List.new
    list.process = list
    assert_same(list, list.process)
  end

  # Write a test that will fail if 'xyz' is one of the elements in the Array list:
  def test_includes_refutation
    list = [1,2,3,4]
    refute_includes(list, "xyz")
  end
end