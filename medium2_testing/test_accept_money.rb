require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(200)
    transaction.amount_paid = 220
    money = cash_register.total_money + transaction.amount_paid
    assert_equal money, cash_register.accept_money(transaction)
  end
end