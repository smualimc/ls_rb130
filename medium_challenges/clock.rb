=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time represented by 
a given Clock object. Note that you should not mutate Clock objects when adding and 
subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

--Program requirements--
Create a clock independent of date
add and subtract minutes from a clock object, don't mutate it,, create a new Clock object
Two objects with the same time should be equal
Use just arithmetic operations

--Test/examples parse--
#at(hh, mm = 0) creates a Clock object
#to_s #=> '08:00' returns formatted time
#+ Adds `minutes`` to time on current object
  Convert the current time into `current_minutes`
  Create a new Clock instance
  assign `minutes` + `current_minutes` to total_minutes
  convert `total_minutes` into hours and minutes
  assign hours and minutes to the instance variables

#- Subtracts minutes to time on current object
  Similar to add but being aware of negative results.
#== enables objects time comparison


=end

class Clock
  attr_reader :hh, :mm
  def initialize(hours, minutes)
    @hh = hours
    @mm = minutes
  end

  def self.at(hh, mm = 0)
    Clock.new(hh, mm)
  end

  def to_s
    "#{sprintf("%02d", hh)}:#{sprintf("%02d", mm)}"
  end

  def +(minutes)
    total_minutes = hh * 60 + mm + minutes
    new_clock(total_minutes)
  end

  def -(minutes)
    total_minutes = hh * 60 + mm - minutes
    new_clock(total_minutes)
  end

  def ==(other_clock)
    self.hh == other_clock.hh && self.mm == other_clock.mm
  end

  def new_clock(minutes)
    gross_hh, new_mm = minutes.divmod(60)
    new_hh = gross_hh % 24
    Clock.new(new_hh, new_mm)
  end
end

require 'minitest/autorun'
require_relative 'clock'

class ClockTest < Minitest::Test
  def test_on_the_hour
    #skip
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    #skip
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    #skip
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_adding_does_not_mutate
    #skip
    old_clock = Clock.at(10)
    new_clock = old_clock + 3
    refute_same new_clock, old_clock
  end

  def test_subtract_fifty_minutes
    #skip
    clock = Clock.at(0) - 50
    assert_equal '23:10', clock.to_s
  end

  def test_subtracting_does_not_mutate
    #skip
    old_clock = Clock.at(10)
    new_clock = old_clock - 50
    refute_same new_clock, old_clock
  end

  def test_add_over_an_hour
    #skip
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    #skip
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_add_more_than_a_day
    #skip
    clock = Clock.at(10) + 3061
    assert_equal '13:01', clock.to_s
  end

  def test_subtract_a_few_minutes
    #skip
    clock = Clock.at(10, 30) - 5
    assert_equal '10:25', clock.to_s
  end

  def test_subtract_minutes
    #skip
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_wrap_around_at_negative_midnight
    #skip
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end

  def test_subtract_more_than_a_day
    #skip
    clock = Clock.at(10) - 3061
    assert_equal '06:59', clock.to_s
  end

  def test_equivalent_clocks
    #skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    #skip
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    #skip
    clock1 = Clock.at(0, 30) - 60
    clock2 = Clock.at(23, 30)
    assert_equal clock1, clock2
  end
end