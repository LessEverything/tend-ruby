
class Tend::Segment < Tend::Garden

  ATTRIBUTES = [:id, :name]
  attr_accessor :attributes, *ATTRIBUTES

  def self.assign email, segments = [], options = {}
    call_remote_method "assign", email, segments, options = {}
  end

  def self.detach email, segments = [], options = {}
    call_remote_method "detach", email, segments, options = {}
  end

  private

  def self.call_remote_method remote_method, email, segments = [], options = {}
    segs = segments.split(",").join(",")
    post( {email: email, segments: segs}, options.merge(collection: remote_method, no_pagination: true))
  end


end

