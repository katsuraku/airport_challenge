require_relative 'plane'

class Airport

attr_accessor :capacity

  def receive_plane plane
    plane.land
  end
  # how does this mesh with the land method
  # in the plane file?



end
