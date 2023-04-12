=begin
Write a method that takes a sorted array of integers as an argument, and returns an array 
that includes all of the missing integers (in order) between the first and last elements 
of the argument.

Pedac
Input: a given sorted array of integers
Output: a sorted array of the missing numbers

Data structure: an output array

Algorithm:
initialize an empty output array
invoke Array#each_cons in the given array to return all the consecutives pairs
form a range with the first element of the pair + 1 up to the second element of the 
pair - 1, and convert the resulting range (if so) to an array 
concatenate the resulting array to the output array



=end

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []