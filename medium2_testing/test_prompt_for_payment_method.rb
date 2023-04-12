require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(100)
    input = StringIO.new("120\n")
    transaction.prompt_for_payment(input: input)
    assert_equal 120, transaction.prompt_for_payment(input: input)
  end
end