# Given this code

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output 
# shown in numbers 1-4 listed below:

# 1)

gather(items) do |*food , wheat|
  puts food.join(", ")
  puts wheat
end


# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do | apples,*food , wheat |
  puts apples
  puts food.join(", ")
  puts wheat
end


# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do | apples, *food|
  puts apples
  puts food.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do | apples,corn ,cabbage ,wheat |
  puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# Hint
# When calling a method that takes a block, its block parameters can affect how information 
# is referenced in that method call. Here are the number of lines of code each numbered 
# problem (1-4) potentially requires:

# 4 lines
# 5 lines
# 4 lines
# 3 lines
# Make sure to use what you've learned from the previous two exercises about the splat 
# operator. That information will be key here.