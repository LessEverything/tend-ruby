
class Tend::Visit < Tend::Garden
  include Tend::Util::NoPost
  include Tend::Util::NoUpdate
  include Tend::Util::NoDelete
  include Tend::Util::NoFind

  ATTRIBUTES = [:id, :domain, :page, :query, :referrer, :campaign, :date]
  attr_accessor :attributes, *ATTRIBUTES


end

