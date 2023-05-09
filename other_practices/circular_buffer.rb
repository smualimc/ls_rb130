=begin
A circular buffer, cyclic buffer or ring buffer is a data structure that uses a single, 
fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length. For example, this 
is an empty 7-element buffer:

```ruby
[ ][ ][ ][ ][ ][ ][ ]
```

Assume that a 1 is written into the middle of the buffer (exact starting location does 
  not matter in a circular buffer):

```ruby
[ ][ ][ ][1][ ][ ][ ]
```

Then assume that two more elements are added, or written to the buffer — 2 & 3 — which 
get appended after the 1:

```ruby
[ ][ ][ ][1][2][3][ ]
```

If two elements are then read, or removed from the buffer, the oldest values inside the 
buffer are removed. The two elements removed, in this case, are 1 & 2, leaving the buffer with just a 3:

```ruby
[ ][ ][ ][ ][ ][3][ ]
```

If the buffer has 7 elements then it is completely full:

```ruby
[6][7][8][9][3][4][5]
```

When the buffer is full an error will be raised, alerting the client that further writes are blocked until a 
slot becomes free.

The client can opt to overwrite the oldest data with a forced write. In this case, two more elements — A & B — 
  are added and they overwrite the 3 & 4:

```ruby
[6][7][8][9][A][B][5]
```

Finally, if two elements are now removed then what would be returned is not 3 & 4 but 5 & 6 because A & B 
overwrote the 3 & the 4 yielding the buffer with:

```ruby
[ ][7][8][9][A][B][ ]
```

If you need a refresher on how to raise an error, take the time to revisit Launch School's article on 
[Getting Started with Ruby Exceptions](https://launchschool.com/blog/getting-started-with-ruby-exceptions).

Test suite:
=end

require 'minitest/autorun'
# require_relative 'circular_buffer'
 
class CircularBuffer

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    @buffer.shift || raise(BufferEmptyException)
  end

  def write(value)
    if @buffer.size >= @size
      raise(BufferFullException)
    else
    @buffer.push(value) if value != nil
    end
  end

  def write!(value)
    if @buffer.size == @size && value != nil
      @buffer.shift
      @buffer.push(value)
    elsif @buffer.size < @size && value != nil
      @buffer.push(value)
    end

  end

  def clear
    @buffer.clear
  end


end

class CircularBufferTest < Minitest::Test
  def test_read_empty_buffer_throws_buffer_empty_exception
    buffer = CircularBuffer.new(1)
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_write_and_read_back_one_item
    # skip
    buffer = CircularBuffer.new(1)
    buffer.write '1'
    assert_equal '1', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_write_and_read_back_multiple_items
    # skip
    buffer = CircularBuffer.new(2)
    buffer.write '1'
    buffer.write '2'
    assert_equal '1', buffer.read
    assert_equal '2', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_clearing_buffer
    # skip
    buffer = CircularBuffer.new(3)
    ('1'..'3').each { |i| buffer.write i }
    buffer.clear
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
    buffer.write '1'
    buffer.write '2'
    assert_equal '1', buffer.read
    buffer.write '3'
    assert_equal '2', buffer.read
  end

  def test_alternate_write_and_read
    # skip
    buffer = CircularBuffer.new(2)
    buffer.write '1'
    assert_equal '1', buffer.read
    buffer.write '2'
    assert_equal '2', buffer.read
  end

  def test_reads_back_oldest_item
    # skip
    buffer = CircularBuffer.new(3)
    buffer.write '1'
    buffer.write '2'
    buffer.read
    buffer.write '3'
    assert_equal '2', buffer.read
    assert_equal '3', buffer.read
  end

  def test_writes_of_nil_should_not_occupy_buffer
    # skip
    buffer = CircularBuffer.new(5)
    buffer.write nil
    ('1'..'3').each { |i| buffer.write i }
    assert_equal '1', buffer.read
  end

  def test_writing_to_a_full_buffer_throws_an_exception
    # skip
    buffer = CircularBuffer.new(2)
    buffer.write '1'
    buffer.write '2'
    assert_raises(CircularBuffer::BufferFullException) { buffer.write 'A' }
  end

  def test_overwriting_oldest_item_in_a_full_buffer
    # skip
    buffer = CircularBuffer.new(2)
    buffer.write '1'
    buffer.write '2'
    buffer.write! 'A'
    assert_equal '2', buffer.read
    assert_equal 'A', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_forced_writes_of_nil_should_not_occupy_buffer
    # skip
    buffer = CircularBuffer.new(2)
    ('1'..'2').each { |i| buffer.write i }
    buffer.write! nil
    assert_equal '1', buffer.read
    assert_equal '2', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_forced_writes_to_non_full_buffer_should_behave_like_writes
    # skip
    buffer = CircularBuffer.new(2)
    buffer.write '1'
    buffer.write! '2'
    assert_equal '1', buffer.read
    assert_equal '2', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  # rubocop:disable Metrics/MethodLength
  def test_alternate_read_and_write_into_buffer_overflow
    # skip
    buffer = CircularBuffer.new(5)
    ('1'..'3').each { |i| buffer.write i }
    buffer.read
    buffer.read
    buffer.write '4'
    buffer.read
    ('5'..'8').each { |i| buffer.write i }
    buffer.write! 'A'
    buffer.write! 'B'
    ('6'..'8').each do |i|
      assert_equal i, buffer.read
    end
    assert_equal 'A', buffer.read
    assert_equal 'B', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end
  # rubocop:enable Metrics/MethodLength
end

