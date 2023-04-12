=begin
Write a method that takes an array as an argument, and a block that returns true or false 
depending on the value of the array element passed to it. The method should return a count 
of the number of times the block returns true.

You may not use Array#count or Enumerable#count in your solution.

=end

def count(ary)
  counter = 0
  ary.each {|ele| counter += 1 if yield(ele) }
  counter
end

# Further Exploration
# Write a version of the count method that meets the conditions of this exercise, 
# but also does not use each, loop, while, or until.

def count(ary)
  counter = 0
  ary.each_index {|index| counter += 1 if yield(ary[index])}
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# User submitted solutions

def count(collection)
  collection.map { |value| yield(value) ? 1 : 0 }.sum
end

def count(arr)
  valid_arr = arr.select { |num| yield(num) }
  valid_arr.size
end