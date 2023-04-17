=begin
The Enumerable#drop_while method begins by iterating over the members of a collection, passing each 
element to the associated block until it finds an element for which the block returns false or nil. 
It then converts the remaining elements of the collection (including the element that resulted in 
  a falsey return) to an Array, and returns the result.

Write a method called drop_while that behaves similarly for Arrays. It should take an Array as an 
argument, and a block. It should return all the elements of the Array, except those elements at 
the beginning of the Array that produce a truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element, drop_while should 
return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until 
to iterate through the Array passed in as an argument, but must not use any other methods that 
iterate through an Array or any other collection.
Pedac
Input: An array ary
Output: An array result whose first element is the first for which the block returns falsie

Data structure: An output array

Algorithm
initialize result to []
Iterate each index of ary
  if the block returns falsie assign ary[index..-1] to result
return result

=end

def drop_while(ary)
  result = []
  ary.each_with_index do |ele, index| 
    next if yield(ele)
    result = ary[index..-1]
    break
  end
  result
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# this line is not a typo
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]

# LS Solution
# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end

#   array[index..-1]
# end