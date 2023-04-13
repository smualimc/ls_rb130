=begin
You may have noticed something when running the test for the previous exercise. And that is 
that our minitest output wasn't that clean. We have some residual output from the 
Transaction#prompt_for_payment method.

Run options: --seed 52842

# Running:

You owe $30.
How much are you paying?
.

Finished in 0.001783s, 560.7402 runs/s, 560.7402 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
Transaction#prompt_for_payment has a call to Kernel#puts and that output is showing 
up when we run our test. Your task for this exercise is to make it so that we have 
"clean" output when running this test. We want to see something like this:

Run options: --seed 4957

# Running:

.

Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
Hint
The key to this exercise lies once again in the StringIO class. Similar to the previous 
exercise, this will involve using another mock object, but for output this time. The cool 
thing about StringIO objects is that they can both provide input to Ruby and consume output; 
for this problem, you need to consume the output of the puts.

You may make changes to the Transaction#prompt_for_payment method to fulfill the requirements 
of this exercise. Note that you should not remove the calls to puts.
=end

require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'


class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(100)
    input = StringIO.new("100")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 100, transaction.amount_paid
  end
end