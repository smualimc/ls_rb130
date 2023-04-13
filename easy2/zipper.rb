=begin
Zipper
The Array#zip method takes two arrays, and combines them into a single array in which each 
element is a two-element array where the first element is a value from one array, and the 
second element is a value from the second array, in order. For example:

[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
Write your own version of zip that does the same type of operation. It should take two Arrays 
as arguments, and return a new Array (the original Arrays should not be changed). Do not use 
the built-in Array#zip method. You may assume that both input arrays have the same number of 
elements.
Pedac
Input: two arrays
Output: A new array containing subarrays with the elements from both given arrays at  
corresponding positions

Data structure: an output array

Algorithm:
map with index |ele,idx|
  return an array [ele, ary2[idx]]
end
=end

def zip(ary1, ary2)
  ary1.map.with_index {|ele, idx| [ele, ary2[idx]]}
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]