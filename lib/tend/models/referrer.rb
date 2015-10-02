
class Tend::Referrer < Tend::Garden
  include Tend::Util::NoPost
  include Tend::Util::NoUpdate
  include Tend::Util::NoDelete

  ATTRIBUTES = [:id, :name]
  attr_accessor :attributes, *ATTRIBUTES


  def visits options = {}
    collection "visits", Tend::Visit, options
  end

  def contacts options = {}
    collection "contacts", Tend::Contact, options
  end

end

