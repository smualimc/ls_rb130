=begin
Write a program that takes a word and a list of possible anagrams and selects the correct 
sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", 
"inlets", and "banana", the program should return a list containing "inlets". Please 
read the test suite for the exact rules of anagrams.

An anagram is a word or phrase formed by rearranging the letters of a different word 
or phrase
Input: a word and a list of words can possibly match the given word as an Anagram
Output: an array with the words from the array that match as anagram with the given word
Data structure: an output array
Algorithm:
Create a Hash Object with the repetition of each letter
  create a new Hash object initialize to zero
  iterate the array incrementing the key counting

if the returned Hash object for the given word is equal to the Hash object of the iterated 
  words from the given array, append the iterated word to the ootput array

return the output array

=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(ary)
    result = []
    counting = counting_hash(@word)
    ary.each do |word|
      result << word if counting == counting_hash(word.downcase) && @word != word.downcase
    end
    result
  end

  def counting_hash(text)
    hash = Hash.new(0)
    text.chars.each {|char| hash[char] += 1}
    hash
  end
end

require 'minitest/autorun'
# require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants))
  end

  def test_detect_simple_anagram
    # skip
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams
  end

  def test_detect_multiple_anagrams
    # skip
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
  end

  def test_does_not_confuse_different_duplicates
    # skip
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle'])
  end

  def test_identical_word_is_not_anagram
    # skip
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
    # skip
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last'])
  end

  def test_eliminate_anagram_subsets
    # skip
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))
  end

  def test_detect_anagram
    # skip
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana)
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
    # skip
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort
  end

  def test_anagrams_are_case_insensitive
    # skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams
  end
end
