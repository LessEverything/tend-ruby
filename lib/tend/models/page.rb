
class Tend::Page < Tend::Garden
  include Tend::Util::NoPost
  include Tend::Util::NoUpdate
  include Tend::Util::NoDelete

  ATTRIBUTES = [:page, :visits]
  attr_accessor :attributes, *ATTRIBUTES


end

