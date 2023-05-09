=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider 
the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:


3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

Input:a string
Output: total points after lookink up the score of each letter and summing them

Data structure: a working array for the string chars
Algorithm:
upcase the string and split it into an array of characters
Create a constant Hash where the key is the numeric value and the values are the letters
initialize score to zero
iterate each char from the array of characters
 add the hash value to score if the hash keys array include? the iterated char
return score
=end

class Scrabble
VALUES = {
  'AEIOULNRST' =>	1,
  'DG'	=> 2,
  'BCMP'	=> 3,
  'FHVWY'	=> 4,
  'K'	=> 5,
  'JX'	=> 8,
  'QZ'	=> 10
          }
  def initialize(string)
    @string = string
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  def score
    score = 0
    return score if @string == nil || @string.match?(/[^a-z]+/i)
    @string.upcase.chars.each do |char|
      VALUES.each {|letters, value| score += value if letters.include?(char)}
    end
    score
  end
end



require 'minitest/autorun'
# require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    # skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    # skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    # skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    # skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    # skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    # skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    # skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    # skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end