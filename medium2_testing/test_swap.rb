=begin
For this exercise you'll be given a sample text file and a starter class. The sample text's 
contents will be saved as a String to an instance variable in the starter class.

The Text class includes a #swap method that can be used to replace all occurrences of one 
letter in the text with another letter. And for this exercise we will swap all occurrences 
of 'a' with 'e'.

Your task is to write a test suite for class Text. In that test suite write a test for the 
Text method swap. For this exercise, you are required to use the minitest methods #setup and 
#teardown. The #setup method contains code that will be executed before each test; #teardown 
contains code that will be executed after each test.

Hint
To complete this exercise, you'll need to read the text from the sample text file. Some of 
those file related operations are good candidates for execution in setup and teardown. 
We want to put code in setup and teardown that may not be directly related to our tests, 
but is necessary for them to run properly.
=end

require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open("sample_text.txt", "r")
  end

  def test_swap
    text_file = Text.new(@file.read)
    text = text_file.swap("a", "a")
    all_es = text_file.swap("a", "e")
    text_with_es = Text.new(all_es)
    all_as = text_with_es.swap("e", "a")
    assert_equal(text, all_as)
  end

  def teardown
    @file.close
  end
end

