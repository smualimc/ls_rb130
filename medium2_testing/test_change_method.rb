require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_change_method
    register = CashRegister.new(200)
    transaction = Transaction.new(100)
    transaction.amount_paid = 110
    assert_equal 10, register.change(transaction)
  end
end