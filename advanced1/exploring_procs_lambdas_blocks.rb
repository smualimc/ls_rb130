=begin
For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and 
implicit blocks. Two groups of code also deal with the definition of a Proc and a Lambda, and the 
differences between the two. Run each group of code below: For your answer to this exercise, write 
down your observations for each group of code. After writing out those observations, write one final 
analysis that explains the differences between procs, blocks, and lambdas.
=end

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# my_proc2 = Proc.new { |thing| puts "This is a #{thing}." }
# puts my_proc # a proc object
# puts my_proc2
# puts my_proc.class # Proc
# my_proc.call # The proc Binding didn't include |thing|
# my_proc.call('cat', 'dog') # thing = 'cat'
# # For the Group 1, it's demonstrated that Procs have a lenient arity, it means it's no strict, so 
# the method can pass less or more arguments to the block than those defined as block parameters.

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }

# my_second_lambda = -> (thing) { puts "This is a #{thing}." }

# puts my_lambda # a Proc object
# puts my_second_lambda # a Proc object

# puts my_lambda.class # Proc
# my_lambda.call('dog') # The strict arity of lambdas is achieved because this lambda had defined one 
# block parameter, and the method is passing one argument to the block
# # my_lambda.call # raises an error

# # In the Group 2, We see that we can create a lambda using the keyword lambda or -> syntax. Besides, 
# lambdas do check for a strict arity, finally lambdas are Proc objects.

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # No argument is passed to the block
# block_method_1('seal') # It raises a LocalJumpError
# # Group 3 demonstrates that if an implicit block is not being passed into a method that expects a 
# block, the method needs a #block_given? otherwise Ruby would raise a LocalJumpError.

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # The method passes the `animal` 
# variable to the block
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end # illustrates the fact that blocks have a lenient arity, meaning the number of arguments being 
# passed to the block don't have to strictly match the number of block parameters defined. 
# # block_method_2('turtle') { puts "This is a #{animal}."} # The block didn't define an animal local 
# variable, so Ruby raises an error
# # Group 4, on one hand, demonstrates that blocks have a linient arity, so the method can pass less
#  or more arguments to the block, and on the other hand, if the keyword `yield` appears in the method 
#  and no block is passed to the method, a LocalJumpError will be raised, and to avoid that, we can 
#  use the Kernel#block_given? method in the method definition.