require_relative 'plane'

class Airport

  attr_accessor :capacity

  def initialize
    @capacity = 20
    @planes = []

  end

  def receive_plane plane
    fail 'Airport is full' if full?
    fail 'Cannot land due to weather' if stormy?

    #plane.land_authorised
    plane.land
    @planes << plane
   
  end

  def release_plane(plane)
    plane.takeoff
    @planes.delete(plane)
  end


  def full?
    @planes.count >= capacity
  end

  def stormy?
    x = rand(6)
    return true  if x <= 1
    return false if x >  1
  end

end
