=begin
Below we have a listening device. It lets us record something that is said and store it for 
later use. In general, this is how the device should be used:

Listen for something, and if anything is said, record it for later use. If nothing is said, 
then do not record anything.

=end
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
   if block_given?
    recording = yield 
    record(recording)
   end
  end

  def play
    @recordings.last
  end
end

# Anything that is said is retrieved by this listening device via a block. If nothing is said, 
# then no block will be passed in. The listening device can also output the most recent 
# recording using a Device#play method.

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
p listener.play # Outputs "Hello World!"
# Finish the above program so that the specifications listed above are met.